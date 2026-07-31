package com.carrpod.bounce.wifi;

/**
 * Hidden Markov Model (HMM) for discrete zone classification.
 * Uses Viterbi algorithm for stable, jitter-free zone classification
 * from continuous distance estimates.
 */
public class ZoneHMM {

    /**
     * Zone states.
     */
    public enum Zone {
        IMMEDIATE(0, 0, 2.0),
        NEAR(1, 2.0, 10.0),
        FAR(2, 10.0, 50.0),
        UNKNOWN(3, 50.0, Double.MAX_VALUE);

        public final int index;
        public final double minDist;
        public final double maxDist;

        Zone(int index, double minDist, double maxDist) {
            this.index = index;
            this.minDist = minDist;
            this.maxDist = maxDist;
        }

        public boolean contains(double distance) {
            return distance >= minDist && distance < maxDist;
        }

        public static Zone fromDistance(double distance) {
            for (Zone z : values()) {
                if (z.contains(distance)) return z;
            }
            return UNKNOWN;
        }
    }

    // Number of states
    private static final int N_STATES = 3; // IMMEDIATE, NEAR, FAR

    // Transition probability matrix A[i][j] = P(state_j | state_i)
    // High self-transition probabilities for hysteresis
    private static final double[][] TRANSITION_MATRIX = {
        // IMMEDIATE  NEAR      FAR
        {0.90,      0.10,     0.00},  // IMMEDIATE -> 
        {0.05,      0.90,     0.05},  // NEAR      ->
        {0.00,      0.10,     0.90}   // FAR       ->
    };

    // Emission probability parameters (Gaussian for each state)
    // Mean and variance of distance for each zone
    private static final double[] EMISSION_MEAN = {
        1.0,    // IMMEDIATE: mean ~1m
        5.0,    // NEAR: mean ~5m
        20.0    // FAR: mean ~20m
    };

    private static final double[] EMISSION_VAR = {
        0.5,    // IMMEDIATE variance
        4.0,    // NEAR variance
        100.0   // FAR variance
    };

    // Viterbi algorithm state
    private double[][] viterbi;      // [time][state] - log probability
    private int[][] backpointer;     // [time][state] - previous state
    private int timeStep = 0;
    private int maxHistory = 50;

    // Current belief state (forward algorithm)
    private double[] alpha = new double[3];
    private int currentState = Zone.NEAR.index;

    public ZoneHMM() {
        reset();
    }

    /**
     * Reset HMM to initial state.
     */
    public void reset() {
        timeStep = 0;
        viterbi = new double[maxHistory][3];
        backpointer = new int[maxHistory][3];
        
        // Initialize with uniform prior
        for (int i = 0; i < 3; i++) {
            alpha[i] = 1.0 / 3.0;
        }
        currentState = Zone.NEAR.index;
    }

    /**
     * Forward algorithm step - update belief state with new observation.
     * @param distance measured distance in meters
     * @return most likely current zone
     */
    public Zone step(double distance) {
        // Emission probabilities (log space)
        double[] logEmission = new double[3];
        for (int i = 0; i < 3; i++) {
            double diff = distance - EMISSION_MEAN[i];
            double var = EMISSION_VAR[i];
            // log Gaussian
            logEmission[i] = -0.5 * Math.log(2 * Math.PI * EMISSION_VAR[i]) 
                           - 0.5 * (distance - EMISSION_MEAN[i]) * (distance - EMISSION_MEAN[i]) / var;
        }

        // Forward step: alpha_t = normalize(emission * (alpha * A))
        double[] alphaNew = new double[3];
        for (int j = 0; j < 3; j++) {
            double sum = 0;
            for (int i = 0; i < 3; i++) {
                sum += alpha[i] * TRANSITION_MATRIX[i][j];
            }
            alphaNew[j] = sum * Math.exp(logEmission[j]);
        }

        // Normalize
        double sum = alphaNew[0] + alphaNew[1] + alphaNew[2];
        if (sum > 0) {
            alpha[0] = alphaNew[0] / sum;
            alpha[1] = alphaNew[1] / sum;
            alpha[2] = alphaNew[2] / sum;
        }

        // Viterbi algorithm for most likely path
        if (timeStep < maxHistory) {
            for (int j = 0; j < 3; j++) {
                double maxProb = Double.NEGATIVE_INFINITY;
                int bestPrev = 0;
                for (int i = 0; i < 3; i++) {
                    double prob = (timeStep == 0 ? 1.0/3.0 : viterbi[timeStep-1][i]) 
                                + Math.log(TRANSITION_MATRIX[i][j]) + logEmission[j];
                    if (prob > maxProb) {
                        maxProb = prob;
                        bestPrev = i;
                    }
                }
                viterbi[timeStep][j] = maxProb;
                backpointer[timeStep][j] = bestPrev;
            }
        }

        // Update current state (MAP estimate)
        int bestState = 0;
        double maxProb = alpha[0];
        for (int i = 1; i < 3; i++) {
            if (alpha[i] > maxProb) {
                maxProb = alpha[i];
                bestState = i;
            }
        }
        currentState = bestState;
        timeStep = (timeStep + 1) % maxHistory;

        return Zone.values()[currentState];
    }

    /**
     * Get current most likely zone.
     */
    public Zone getCurrentZone() {
        return Zone.values()[currentState];
    }

    /**
     * Get current belief distribution.
     */
    public double[] getBelief() {
        return alpha.clone();
    }

    /**
     * Get probability of being in a specific zone.
     */
    public double getZoneProbability(Zone zone) {
        return alpha[zone.index];
    }

    /**
     * Get most likely zone sequence (Viterbi path) up to current time.
     */
    public List<Integer> getViterbiPath() {
        List<Integer> path = new ArrayList<>();
        if (timeStep == 0) return path;

        // Find best final state
        int bestState = 0;
        double maxProb = viterbi[timeStep - 1][0];
        for (int i = 1; i < 3; i++) {
            if (viterbi[timeStep - 1][i] > maxProb) {
                maxProb = viterbi[timeStep - 1][i];
                bestState = i;
            }
        }

        // Backtrack
        int state = bestState;
        for (int t = timeStep - 1; t >= 0; t--) {
            path.add(0, state);
            state = backpointer[t][state];
        }

        return path;
    }

    /**
     * Get entropy of current belief (measure of uncertainty).
     * Higher entropy = more uncertain.
     */
    public double getEntropy() {
        double entropy = 0;
        for (int i = 0; i < 3; i++) {
            if (alpha[i] > 0) {
                entropy -= alpha[i] * Math.log(alpha[i]);
            }
        }
        return entropy;
    }

    /**
     * Get confidence in current classification (0-1).
     * 1 = certain, 1/3 = uncertain (uniform).
     */
    public double getConfidence() {
        double max = alpha[0];
        for (int i = 1; i < 3; i++) {
            if (alpha[i] > max) max = alpha[i];
        }
        // Normalize: 1 = certain, 1/3 = uniform
        return (max - 1.0/3.0) / (1.0 - 1.0/3.0);
    }

    /**
     * Process a batch of distance measurements.
     * Useful for batch processing scan results.
     */
    public Zone processBatch(double[] distances) {
        Zone lastZone = Zone.NEAR;
        for (double d : distances) {
            lastZone = step(d);
        }
        return lastZone;
    }

    /**
     * Reset to specific initial zone.
     */
    public void resetToZone(Zone zone) {
        reset();
        for (int i = 0; i < 3; i++) {
            alpha[i] = (i == zone.index) ? 1.0 : 0.0;
        }
        currentState = zone.index;
    }

    /**
     * Get stability metric - how long we've been in current state.
     * Returns number of consecutive steps in current state.
     */
    public int getStateStability() {
        int stability = 0;
        for (int t = timeStep - 1; t >= 0; t--) {
            int state = (t == timeStep - 1) ? currentState : backpointer[t + 1][stability > 0 ? stability : currentState];
            if (state == currentState) stability++;
            else break;
        }
        return stability;
    }

    /**
     * Force transition (e.g., when GPS provides ground truth).
     */
    public void forceTransition(Zone zone) {
        for (int i = 0; i < 3; i++) {
            alpha[i] = (i == zone.index) ? 1.0 : 0.0;
        }
        currentState = zone.index;
    }
}