# Working_Features_Versions_History — Piece 08/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 08 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Positioning Algorithms Part 2: Particle Filter, Zone HMM, RTT, Multi-Algorithm Fusion

## 8.1 WF014 — Particle Filter (SIR, 200 Particles) (Positioning)

**Category:** Positioning | **First Working:** v1.0.90 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~322 | **Key Files:** `ParticleFilter.java` | **Dependencies:** AP RSSI history, path loss model

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.90 | SIR particle filter + Gaussian Mixture Model for multimodal posterior | +322 |

### Particle Filter Implementation (ParticleFilter.java)
```java
// ParticleFilter.java - Sequential Importance Resampling (SIR)
public class ParticleFilter {
    private static final int NUM_PARTICLES = 200;
    private final Particle[] particles = new Particle[NUM_PARTICLES];
    private final double[] weights = new double[NUM_PARTICLES];
    
    // Gaussian Mixture for multimodal posterior (e.g., symmetric AP layouts)
    private static class GaussianComponent {
        double meanX, meanY, covXX, covXY, covYY, weight;
    }
    
    public void initialize(double x, double y, double uncertainty) {
        for (int i = 0; i < NUM_PARTICLES; i++) {
            particles[i] = new Particle(
                x + randomGaussian(0, uncertainty),
                y + randomGaussian(0, uncertainty),
                1.0 / NUM_PARTICLES
            );
        }
    }
    
    public void predict(double dt, double motionNoise) {
        for (Particle p : particles) {
            // Constant velocity motion model with noise
            p.x += p.vx * dt + randomGaussian(0, motionNoise);
            p.y += p.vy * dt + randomGaussian(0, motionNoise);
            p.vx += randomGaussian(0, motionNoise * 0.1);
            p.vy += randomGaussian(0, motionNoise * 0.1);
        }
    }
    
    public void update(List<AP> aps, List<Double> rssiMeasurements) {
        // Likelihood: p(z|x) = Π N(rssi_i; pathLoss(x, ap_i), σ²)
        for (int i = 0; i < NUM_PARTICLES; i++) {
            double logLikelihood = 0;
            for (int j = 0; j < aps.size(); j++) {
                double dist = distance(particles[i], aps.get(j));
                double expectedRssi = pathLossModel(dist);
                double measuredRssi = rssiMeasurements.get(j);
                logLikelihood += gaussianLogPdf(measuredRssi, expectedRssi, 6.0); // σ=6dB
            }
            weights[i] = Math.exp(logLikelihood);
        }
        normalize(weights);
        resample();  // Systematic resampling
    }
    
    private void resample() {
        // Systematic resampling O(N)
        double[] cumWeights = new double[NUM_PARTICLES];
        cumWeights[0] = weights[0];
        for (int i = 1; i < NUM_PARTICLES; i++) cumWeights[i] = cumWeights[i-1] + weights[i];
        
        double step = 1.0 / NUM_PARTICLES;
        double u = Math.random() * step;
        Particle[] newParticles = new Particle[NUM_PARTICLES];
        int j = 0;
        for (int i = 0; i < NUM_PARTICLES; i++) {
            while (u > cumWeights[j]) j++;
            newParticles[i] = particles[j].copy();
            newParticles[i].weight = 1.0 / NUM_PARTICLES;
            u += step;
        }
        System.arraycopy(newParticles, 0, particles, 0, NUM_PARTICLES);
    }
    
    // Gaussian Mixture Model fit for multimodal visualization
    public List<GaussianComponent> fitGMM(int k) {
        // EM algorithm on particle cloud
        // Returns k components for bounce.html visualization
    }
    
    public PositionResult getEstimate() {
        double meanX = 0, meanY = 0, meanVX = 0, meanVY = 0;
        for (Particle p : particles) {
            meanX += p.x * p.weight;
            meanY += p.y * p.weight;
            meanVX += p.vx * p.weight;
            meanVY += p.vy * p.weight;
        }
        // Covariance computation...
        return new PositionResult(meanX, meanY, meanVX, meanVY, cov);
    }
}
```

### Known Limitations
- **AP params hardcoded**: Path loss exponent (n=2.0) and reference RSSI (-40dB at 1m) not adaptive
- 200 particles sufficient for 2D but marginal for 3D
- No Rao-Blackwellization for linear substate

### Next Planned Enhancement
**Adaptive Params (P1-01)** — Online path loss exponent estimation per AP

---

## 8.2 WF015 — Zone HMM (Viterbi) (Positioning)

**Category:** Positioning | **First Working:** v1.0.90 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~287 | **Key Files:** `ZoneHMM.java` | **Dependencies:** 3 zones + hysteresis, RSSI observations

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.90 | Hidden Markov Model with Viterbi path decoding | +287 |

### Zone HMM Implementation (ZoneHMM.java)
```java
// ZoneHMM.java - Discrete zone tracking with Viterbi
public class ZoneHMM {
    // Zones: 0=Zone A, 1=Zone B, 2=Zone C (defined by AP proximity)
    private static final int NUM_ZONES = 3;
    
    // Transition matrix: A[i][j] = P(zone_j | zone_i)
    // Hysteresis: high self-transition, low cross-zone
    private final double[][] A = {
        {0.95, 0.03, 0.02},  // From Zone A
        {0.03, 0.94, 0.03},  // From Zone B
        {0.02, 0.03, 0.95}   // From Zone C
    };
    
    // Emission: B[zone][ap] = expected RSSI in this zone from this AP
    private final double[][] B = new double[NUM_ZONES][MAX_APS];
    
    // Viterbi path
    private int[] viterbiPath = new int[100];  // Last 100 steps
    private int pathLen = 0;
    
    public void initialize(double[][] zoneApRssi) {
        for (int z = 0; z < NUM_ZONES; z++) {
            System.arraycopy(zoneApRssi[z], 0, B[z], 0, MAX_APS);
        }
    }
    
    public int step(double[] observedRssi) {
        // Forward algorithm for filtering
        double[] alpha = new double[NUM_ZONES];
        for (int z = 0; z < NUM_ZONES; z++) {
            double logProb = 0;
            for (int ap = 0; ap < observedRssi.length; ap++) {
                if (observedRssi[ap] > -120) {
                    logProb += gaussianLogPdf(observedRssi[ap], B[z][ap], 8.0);
                }
            }
            alpha[z] = Math.exp(logProb);
        }
        
        // Viterbi: track most likely path
        double[] delta = new double[NUM_ZONES];
        int[] psi = new int[NUM_ZONES];
        for (int z = 0; z < NUM_ZONES; z++) {
            double max = -1;
            int argmax = 0;
            for (int zp = 0; zp < NUM_ZONES; zp++) {
                double val = (pathLen == 0 ? 1.0 : viterbiProb[zp]) * A[zp][z];
                if (val > max) { max = val; argmax = zp; }
            }
            delta[z] = max * alpha[z];
            psi[z] = argmax;
        }
        
        // Backtrack
        int bestZ = argmax(delta);
        viterbiPath[pathLen] = bestZ;
        if (pathLen > 0) {
            for (int t = pathLen; t > 0; t--) {
                viterbiPath[t-1] = psi[viterbiPath[t]];
            }
        }
        pathLen = Math.min(pathLen + 1, 100);
        viterbiProb = delta;
        
        return bestZ;  // Current zone estimate
    }
    
    public int[] getPath() { return Arrays.copyOf(viterbiPath, pathLen); }
    public double getConfidence() { return max(viterbiProb); }
}
```

### Known Limitations
- **Threshold tuning**: Zone boundaries defined by RSSI thresholds (hand-tuned)
- Fixed 3 zones; no dynamic zone discovery
- Transition matrix assumes known topology

### Next Planned Enhancement
**Auto-Threshold Learning** — Unsupervised zone discovery from RSSI clusters

---

## 8.3 WF016 — Wi-Fi RTT Ranging (802.11mc) (Positioning)

**Category:** Positioning | **First Working:** v1.0.81 | **Last Enhanced:** v1.0.91 | **Status:** Stub Only
**Lines Added:** ~119 | **Key Files:** `WifiRttRanging.java` | **Dependencies:** API 28+, Wi-Fi RTT hardware support

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.81 | Stub class created with ranging request boilerplate | +119 |

### RTT Stub Implementation
```java
// WifiRttRanging.java - STUB ONLY (not functional)
public class WifiRttRanging {
    private WifiRttManager rttManager;
    private List<RangingRequest> pendingRequests = new ArrayList<>();
    
    public WifiRttRanging(Context context) {
        rttManager = (WifiRttManager) context.getSystemService(Context.WIFI_RTT_RANGING_SERVICE);
    }
    
    public void startRanging(List<ScanResult> aps, RangingCallback callback) {
        // Check device support
        if (!rttManager.isAvailable()) {
            callback.onFailure("RTT not available on this device");
            return;
        }
        
        // Build ranging requests
        List<RangingRequest> requests = new ArrayList<>();
        for (ScanResult ap : aps) {
            if (ap.is80211mcResponder()) {
                requests.add(new RangingRequest.Builder()
                    .addAccessPoint(new RangingRequest.AccessPoint(ap.BSSID))
                    .build());
            }
        }
        
        if (requests.isEmpty()) {
            callback.onFailure("No 802.11mc responders found");
            return;
        }
        
        // Start ranging (requires ACCESS_FINE_LOCATION + NEARBY_WIFI_DEVICES)
        rttManager.startRanging(requests, executor, new RangingResultCallback() {
            @Override
            public void onRangingResults(List<RangingResult> results) {
                List<RangeMeasurement> measurements = new ArrayList<>();
                for (RangingResult r : results) {
                    if (r.getStatus() == RangingResult.STATUS_SUCCESS) {
                        measurements.add(new RangeMeasurement(
                            r.getMacAddress(),
                            r.getDistanceMm() / 1000.0,  // mm → meters
                            r.getDistanceStdDevMm() / 1000.0
                        ));
                    }
                }
                callback.onSuccess(measurements);
            }
            
            @Override
            public void onRangingFailure(int code) {
                callback.onFailure("RTT ranging failed: " + code);
            }
        });
    }
    
    // NOT IMPLEMENTED: Integration with fusion engine (WF030)
    // NOT IMPLEMENTED: RTT-based AP position calibration
}
```

### Known Limitations
- **Not implemented**: Stub only; no integration with positioning stack
- Requires hardware support (Pixel 3+, some Samsung, limited device coverage)
- Requires AP firmware support for 802.11mc responder role

### Next Planned Enhancement
**P0-02 Priority** — Full RTT integration: ranging → distance → trilateration → fusion

---

## 8.4 WF029 — AP Position Estimation (Positioning)

**Category:** Positioning | **First Working:** v1.0.81 | **Last Enhanced:** v1.0.91 | **Status:** Partial
**Lines Added:** ~100 | **Key Files:** `MainActivity.java` | **Dependencies:** Trilateration (WF012)

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.81 | Random initial AP positions | +40 |
| v1.0.90 | Gradient descent refinement on trilateration residuals | +60 |

### AP Position Refinement
```java
// MainActivity.java - AP position refinement
private void refineApPositions(List<TrilaterationResult> history) {
    // Joint optimization: minimize Σ ||measuredDist - ||userPos - apPos|| ||
    // Variables: AP positions (2N unknowns for N APs)
    // Uses Levenberg-Marquardt on accumulated history
    
    for (int iter = 0; iter < 50; iter++) {
        double totalError = 0;
        for (TrilaterationResult r : history) {
            for (AP ap : r.aps) {
                double predicted = distance(r.userPos, ap.position);
                double error = r.measuredDist.get(ap.bssid) - predicted;
                totalError += error * error;
                // Gradient w.r.t AP position
                if (predicted > 0.1) {
                    double gx = (ap.position.x - r.userPos.x) / predicted;
                    double gy = (ap.position.y - r.userPos.y) / predicted;
                    ap.position.x += 0.01 * error * gx;
                    ap.position.y += 0.01 * error * gy;
                }
            }
        }
        if (totalError < 1.0) break;
    }
}
```

### Known Limitations
- **Random initial**: Poor initialization causes local minima
- No simultaneous user+AP estimation (SLAM-style)
- Requires user movement for observability

### Next Planned Enhancement
**Self-Calibration (P0-03)** — Joint user position + AP position estimation (SLAM)

---

## 8.5 WF030 — Multi-Algorithm Fusion (Positioning)

**Category:** Positioning | **First Working:** v1.0.90 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~150 | **Key Files:** `MainActivity.java` | **Dependencies:** All 6 algorithms

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.90 | Parallel execution of all 6 algorithms | +150 |

### Fusion Architecture
```java
// MainActivity.java - Algorithm orchestrator
public class PositionFusionEngine {
    private final Trilateration trilateration = new Trilateration();
    private final PositionEKF ekf = new PositionEKF(1.0, 0.5);
    private final ParticleFilter particleFilter = new ParticleFilter();
    private final ZoneHMM zoneHMM = new ZoneHMM();
    private final WifiRttRanging rtt = new WifiRttRanging(this);  // stub
    private final RssiKalmanFilter rssiKalman = new RssiKalmanFilter();
    
    public FusedResult fuse(SensorData data) {
        // Run all algorithms in parallel
        PositionResult tri = trilateration.solve(data.aps, data.distances, data.weights, data.lastPos);
        PositionResult ekf = ekf.update(data.trilaterationPos);
        PositionResult pf = particleFilter.update(data.aps, data.rssi);
        int zone = zoneHMM.step(data.rssi);
        
        // Current: Simple average (equal weights)
        double x = (tri.x + ekf.x + pf.x) / 3.0;
        double y = (tri.y + ekf.y + pf.y) / 3.0;
        
        // TODO: Adaptive weighting based on GDOP, ESS, innovation
        return new FusedResult(x, y, tri, ekf, pf, zone);
    }
}
```

### Known Limitations
- **No weighted fusion**: Equal weights regardless of algorithm confidence
- GDOP, ESS (Effective Sample Size), innovation not used for weighting
- RTT stub excluded from fusion

### Next Planned Enhancement
**Adaptive Weighting** — Covariance intersection or CI fusion with confidence weights

---

*End of Piece 08 — Continue to Piece 09 for Enhancement Timeline Analysis*