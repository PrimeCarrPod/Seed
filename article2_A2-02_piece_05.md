# Android_Main_Features_Radio_Positioning — Piece 05/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 05 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## EXTENDED KALMAN FILTER — 2D CONSTANT VELOCITY (v1.0.90 → v1.0.91)

### Extended Kalman Filter (2D CV)
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** PositionEKF.java
- **State:** [x, y, vx, vy] — position + velocity
- **Measurement:** RSSI-derived distance from Trilateration
- **Permission:** None
- **Connects to HTML via:** JS bridge: EKF position (C027)
- **Output:** Smoothed position + velocity tracking
- **Worked Well:** Velocity estimation enables prediction
- **Critical Bug (E011):** vy initialization typo — `x[2]=0; x[2]=0;` should be `x[3]=0`
- **Fix:** v1.0.92 — `x[2]=0; x[3]=0;` (P0-01, RF002, FP026)
- **Best Practice:** ALWAYS verify array indices (CP008)

### EKF State & Matrices
```java
// State: x = [x, y, vx, vy]^T
// Process model: Constant Velocity
F = [1, 0, dt, 0;
     0, 1, 0, dt;
     0, 0, 1,  0;
     0, 0, 0,  1];

// Measurement: RSSI distance to known APs
// h(x) = sqrt((x - ap_x)^2 + (y - ap_y)^2)
// H = Jacobian of h wrt x

// Process noise Q, Measurement noise R
```

### Bug Details (PositionEKF.java:38)
```java
// BROKEN (v1.0.90-1.0.91):
x[0] = 0;  // x
x[1] = 0;  // y
x[2] = 0;  // vx
x[2] = 0;  // BUG: should be x[3] for vy!

// FIXED (v1.0.92+):
x[0] = 0;  // x
x[1] = 0;  // y
x[2] = 0;  // vx
x[3] = 0;  // vy ← CORRECT
```

---

## PARTICLE FILTER — SIR, 200 PARTICLES (v1.0.90 → v1.0.91)

### Particle Filter (SIR, 200 Particles)
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** ParticleFilter.java
- **Algorithm:** Sequential Importance Resampling (SIR)
- **Particles:** 200
- **Likelihood:** Gaussian Mixture Model (RSSI mean/variance per AP)
- **Permission:** None
- **Connects to HTML via:** JS bridge: particle position (C027)
- **Output:** Non-Gaussian position estimate (handles multimodal)
- **Worked Well:** Handles RSSI multipath, non-line-of-sight
- **Issues:** AP parameters hardcoded (mean, variance, pathloss)
- **Solution:** Adaptive parameter learning needed (P1-01, FP003, RF004)

### Particle Filter Flow
```java
// 1. Initialize 200 particles uniformly in area
// 2. For each scan:
//    a. Predict: particles += velocity * dt + noise
//    b. Weight: likelihood = GaussianMixture(RSSI | particle_pos)
//    c. Resample: systematic resampling by weights
//    d. Estimate: weighted mean of particles
```

---

## ZONE HMM — VITERBI CLASSIFICATION (v1.0.90 → v1.0.91)

### Zone HMM (Viterbi)
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** ZoneHMM.java
- **States:** 3 (IMMEDIATE, NEAR, FAR)
- **Transitions:** Hysteresis matrix (prevents flutter)
- **Algorithm:** Viterbi path decoding
- **Permission:** None
- **Connects to HTML via:** JS bridge: zone classification (C028)
- **Output:** Stable zone classification (IMMEDIATE/NEAR/FAR)
- **Worked Well:** Zone stability, no flickering
- **Issues:** Hysteresis thresholds need tuning per environment
- **Solution:** Learn transition matrix from history (RF014)

### HMM Structure
```
States: {IMMEDIATE, NEAR, FAR}
Observations: RSSI zone (from scan)
Transition Matrix (with hysteresis):
    IMMEDIATE  NEAR    FAR
IMMEDIATE  0.90    0.10    0.00
NEAR       0.05    0.90    0.05
FAR        0.00    0.10    0.90

Emission: P(observed_zone | true_state)
Viterbi: Most likely state sequence
```

---

## PIECE 05 SUMMARY
This piece covers the 6-algorithm positioning stack introduced in v1.0.90: Extended Kalman Filter (2D CV with velocity, bug fixed in v1.0.92), Particle Filter (SIR 200 particles, Gaussian Mixture likelihood, needs adaptive params), and Zone HMM (Viterbi with hysteresis, stable zone classification). These three join RSSI Kalman (1D) and Trilateration (WLS) for the complete 6-algo fusion.

**Next Piece (06):** Wi-Fi RTT Ranging + Bluetooth 3D Spatial + Trail Recording