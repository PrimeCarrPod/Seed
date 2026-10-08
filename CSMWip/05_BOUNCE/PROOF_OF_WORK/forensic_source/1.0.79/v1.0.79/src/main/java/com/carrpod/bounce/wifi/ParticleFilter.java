package com.carrpod.bounce.wifi;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Particle Filter for non-Gaussian RSSI distributions.
 * Uses Sequential Importance Resampling (SIR) with Gaussian Mixture Model likelihood.
 * Handles multi-modal distributions (e.g., signal reflections).
 */
public class ParticleFilter {

    /**
     * Particle representing a hypothesis of position.
     */
    public static class Particle {
        public double x, y;      // position
        public double weight;     // particle weight
        
        public Particle(double x, double y) {
            this.x = x;
            this.y = y;
            this.weight = 1.0;
        }
        
        public Particle(double x, double y, double weight) {
            this.x = x;
            this.y = y;
            this.weight = weight;
        }
        
        public void copyFrom(Particle other) {
            this.x = other.x;
            this.y = other.y;
            this.weight = other.weight;
        }
    }

    /**
     * Access point with position and RSSI statistics.
     */
    public static class APInfo {
        public final String bssid;
        public final Trilateration.Point2D position;
        public final double rssiMean;
        public final double rssiVariance;
        public final double pathLossExponent;
        public final double rssiAt1m;

        public APInfo(String bssid, Trilateration.Point2D position, 
                      double rssiMean, double rssiVariance, 
                      double pathLossExponent, double rssiAt1m) {
            this.bssid = bssid;
            this.position = position;
            this.rssiMean = rssiMean;
            this.rssiVariance = rssiVariance;
            this.pathLossExponent = pathLossExponent;
            this.rssiAt1m = rssiAt1m;
        }
    }

    private final int numParticles;
    private final List<Particle> particles;
    private final List<Particle> particlesNew;
    private final Random random;
    private final double[][] apCovariance;  // measurement covariance per AP
    private final double processNoise;
    
    // AP reference positions and RSSI parameters
    private java.util.Map<String, Trilateration.Point2D> apPositions = new java.util.HashMap<>();
    private java.util.Map<String, Double> apRssiMean = new java.util.HashMap<>();
    private java.util.Map<String, Double> apRssiVar = new java.util.HashMap<>();
    private java.util.Map<String, Double> apPathLoss = new java.util.HashMap<>();
    private java.util.Map<String, Double> apRssi1m = new java.util.HashMap<>();

    public ParticleFilter(int numParticles) {
        this.numParticles = numParticles;
        this.particles = new ArrayList<>(numParticles);
        this.particlesNew = new ArrayList<>(numParticles);
        this.random = new Random();
        this.processNoise = 0.5;  // meters per step
        
        // Initialize particles uniformly in a reasonable area
        for (int i = 0; i < numParticles; i++) {
            particles.add(new Particle(0, 0, 1.0 / numParticles));
            particlesNew.add(new Particle(0, 0, 0));
        }
    }

    /**
     * Add known AP position and RSSI parameters.
     */
    public void addAccessPoint(String bssid, double x, double y, 
                               double rssiMean, double rssiVariance, 
                               double pathLossExponent, double rssiAt1m) {
        apPositions.put(bssid, new Trilateration.Point2D(x, y));
    }

    /**
     * Initialize particles around a known position.
     */
    public void initialize(double x, double y, double spread) {
        for (int i = 0; i < numParticles; i++) {
            double px = x + (random.nextGaussian() * spread);
            double py = y + (random.nextGaussian() * spread);
            particles.get(i).x = px;
            particles.get(i).y = py;
            particles.get(i).weight = 1.0 / numParticles;
        }
    }

    /**
     * Predict step - move particles based on motion model.
     */
    public void predict(double dx, double dy, double processNoise) {
        for (Particle p : particles) {
            // Add process noise to motion
            p.x += dx + random.nextGaussian() * processNoise;
            p.y += dy + random.nextGaussian() * processNoise;
        }
    }

    /**
     * Update particle weights based on RSSI measurements.
     * Uses Gaussian Mixture Model for likelihood to handle multi-modal RSSI.
     */
    public void updateWeights(java.util.Map<String, Double> measurements) {
        double maxWeight = 0;
        
        for (Particle p : particles) {
            double logWeight = 0;
            int validMeasurements = 0;
            
            for (java.util.Map.Entry<String, Double> entry : measurements.entrySet()) {
                String bssid = entry.getKey();
                double measuredRssi = entry.getValue();
                
                // Skip if we don't have reference for this AP
                Trilateration.Point2D apPos = getApPosition(bssid);
                if (apPos == null) continue;
                
                // Expected RSSI at this particle position
                double dx = p.x - apPositions.get(bssid).x;
                double dy = p.y - apPositions.get(bssid).y;
                double distance = Math.sqrt(dx * dx + dy * dy);
                
                if (distance < 0.5) distance = 0.5; // avoid singularity
                
                // Expected RSSI using log-distance model
                double expectedRssi = rssiAt1m(bssid) - 10 * pathLossExponent(bssid) * Math.log10(distance);
                
                // Likelihood using Gaussian Mixture Model
                // Main lobe + side lobes for multi-path
                double variance = rssiVariance(bssid);
                double mainWeight = 0.7;
                double sideWeight = 0.3;
                double sideVariance = variance * 4; // wider for multi-path
                
                double diff = measuredRssi - expectedRssi;
                double mainLikelihood = gaussianPdf(diff, 0, Math.sqrt(variance));
                double sideLikelihood = gaussianPdf(diff, 0, Math.sqrt(sideVariance));
                
                double likelihood = mainWeight * mainLikelihood + sideWeight * sideLikelihood;
                logWeight += Math.log(Math.max(likelihood, 1e-10));
                validMeasurements++;
            }
            
            if (validMeasurements > 0) {
                p.weight = Math.exp(logWeight / validMeasurements);
            } else {
                p.weight = 1e-10;
            }
            
            if (p.weight > maxWeight) maxWeight = p.weight;
        }
        
        // Normalize weights
        double sumWeights = 0;
        for (Particle p : particles) {
            sumWeights += p.weight;
        }
        
        if (sumWeights > 0) {
            for (Particle p : particles) {
                p.weight /= sumWeights;
            }
        }
    }

    /**
     * Resample particles using systematic resampling.
     */
    public void resample() {
        // Systematic resampling
        double[] cumulativeWeights = new double[numParticles];
        cumulativeWeights[0] = particles.get(0).weight;
        for (int i = 1; i < numParticles; i++) {
            cumulativeWeights[i] = cumulativeWeights[i-1] + particles.get(i).weight;
        }
        
        // Normalize
        double totalWeight = cumulativeWeights[numParticles - 1];
        for (int i = 0; i < numParticles; i++) {
            cumulativeWeights[i] /= totalWeight;
        }
        
        // Systematic resampling
        double step = 1.0 / numParticles;
        double start = Math.random() * step;
        
        int j = 0;
        for (int i = 0; i < numParticles; i++) {
            double target = start + i * step;
            while (j < numParticles - 1 && cumulativeWeights[j] < target) {
                j++;
            }
            
            particlesNew.get(i).copyFrom(particles.get(j));
            // Add small jitter to prevent particle collapse
            particlesNew.get(i).x += Math.random() * 0.1 - 0.05;
            particlesNew.get(i).y += Math.random() * 0.1 - 0.05;
        }
        
        // Swap arrays
        List<Particle> temp = particles;
        particles.clear();
        particles.addAll(particlesNew);
        particlesNew.clear();
        particlesNew.addAll(temp);
        
        // Reset weights
        for (Particle p : particles) {
            p.weight = 1.0 / numParticles;
        }
    }

    /**
     * Get effective sample size (ESS).
     * If ESS < threshold, resampling is needed.
     */
    public double effectiveSampleSize() {
        double sumW2 = 0;
        for (Particle p : particles) {
            sumW2 += p.weight * p.weight;
        }
        return (sumW2 > 0) ? (1.0 / sumW2) : 0;
    }

    /**
     * Get weighted mean position estimate.
     */
    public Trilateration.Point2D getMeanPosition() {
        double sumX = 0, sumY = 0, sumW = 0;
        for (Particle p : particles) {
            sumX += p.x * p.weight;
            sumY += p.y * p.weight;
            sumW += p.weight;
        }
        if (sumW == 0) return new Trilateration.Point2D(0, 0);
        return new Trilateration.Point2D(sumX / sumW, sumY / sumW);
    }

    /**
     * Get position covariance estimate.
     */
    public double[][] getCovariance() {
        Trilateration.Point2D mean = getMeanPosition();
        double varX = 0, varY = 0, covXY = 0;
        
        for (Particle p : particles) {
            double dx = p.x - mean.x;
            double dy = p.y - mean.y;
            varX += p.weight * dx * dx;
            varY += p.weight * dy * dy;
            covXY += p.weight * dx * dy;
        }
        
        return new double[][]{
            {varX, covXY},
            {covXY, varY}
        };
    }

    /**
     * Get best particle (highest weight).
     */
    public Particle getBestParticle() {
        Particle best = particles.get(0);
        for (Particle p : particles) {
            if (p.weight > best.weight) best = p;
        }
        return best;
    }

    // Helper methods for AP parameters (to be populated from scan data)
    private Trilateration.Point2D getApPosition(String bssid) {
        return apPositions.get(bssid);
    }
    
    private double rssiMean(String bssid) {
        return apPositions.containsKey(bssid) ? -50 : -70;  // default
    }
    
    private double rssiVariance(String bssid) {
        return 25.0;  // dBm^2
    }
    
    private double pathLossExponent(String bssid) {
        return 2.8;
    }
    
    private double rssiAt1m(String bssid) {
        return -40.0;
    }

    private double gaussianPdf(double x, double mean, double std) {
        double diff = x - mean;
        return Math.exp(-0.5 * diff * diff / (std * std)) / (std * Math.sqrt(2 * Math.PI));
    }
}