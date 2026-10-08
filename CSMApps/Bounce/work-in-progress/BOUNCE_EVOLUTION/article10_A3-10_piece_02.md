# Refinement_Existing_Parts_Prioritized — Piece 02/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 02 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Positioning Algorithms Core (RF003–RF005, RF013–RF014)

## 2.1 RF003 — Wi-Fi RTT Ranging Implementation (P0, High Effort)

**Component:** `WifiRttRanging.java` (currently stub only)  
**Issue:** Missing 802.11mc FTM (Fine Timing Measurement) ranging implementation  
**Current State:** Placeholder class with no functional ranging code  
**Proposed Refinement:** Implement full FTM ranging using `WifiRttManager` API (requires API 28+ and hardware support)  

### Technical Specification:
```java
// Required capabilities:
- WifiRttManager.requestRttRanging() with RttManager.RttParams
- Callback handling: onRttResults(), onRttFailure()
- Distance calculation from RTT measurements (round-trip time × c / 2)
- Multi-AP concurrent ranging for trilateration fusion
- Hardware capability check: PackageManager.FEATURE_WIFI_RTT
```

### Dependencies:
- Android 9+ (API 28) device with Wi-Fi RTT hardware
- Location permissions (ACCESS_FINE_LOCATION)
- Wi-Fi enabled and scanning

### Target: v1.0.93 | Status: Planned | Master List Ref: P0-02

---

## 2.2 RF004 — Particle Filter Adaptive Parameters (P1, High Effort)

**Component:** `ParticleFilter.java`  
**Issue:** AP parameters (RSSI mean, variance, path loss exponent) hardcoded — non-adaptive to environment  
**Current State:** Static constants for all access points regardless of physical characteristics  
**Proposed Refinement:** Implement per-AP adaptive parameter estimation from scan history  

### Algorithm:
```java
// Per-AP learning:
- Maintain sliding window of RSSI samples per BSSID
- Estimate mean (μ) and variance (σ²) online using Welford's algorithm
- Estimate path loss exponent (n) via linear regression: RSSI = RSSI_0 - 10n log10(d)
- Update particle weight calculation: w ∝ exp(-(rssi - μ)² / 2σ²)
- Forgetting factor λ = 0.95 for non-stationary environments
```

### Impact:
- Handles non-Gaussian RSSI distributions (multi-path, occlusion)
- Improves indoor accuracy 30–50% in heterogeneous AP environments
- Enables Particle Filter to compete with EKF in complex indoor spaces

### Dependencies: Scan history buffer, RSSI time-series per BSSID
### Target: v1.0.94 | Status: Planned | Master List Ref: P1-01

---

## 2.3 RF005 — Trilateration AP Self-Calibration (P0, High Effort)

**Component:** `Trilateration.java`  
**Issue:** AP positions initialized randomly — poor convergence, wrong positions  
**Current State:** Random AP coordinate assignment on first scan  
**Proposed Refinement:** Implement AP position self-calibration from user movement  

### Algorithm (Gauss-Newton Optimization):
```
1. Collect (position, RSSI) tuples during user movement
2. Formulate: minimize Σ (measured_rssi - predicted_rssi(x_ap, y_ap))²
3. Predicted RSSI = RSSI_0 - 10n log10(||user_pos - ap_pos||)
4. Solve for AP positions (x_ap, y_ap) using Levenberg-Marquardt
5. Constrain: AP positions within building bounds, minimum separation
6. Fuse with RTT ranges when available (RF003)
```

### Convergence Requirements:
- Minimum 10 distinct user positions with ≥3 APs visible
- User movement spanning >5m for geometric diversity
- Re-calibrate weekly or when RMS error >3m

### Dependencies: Movement data (RF014 zone history), RTT ranges (RF003)
### Target: v1.0.93 | Status: Planned | Master List Ref: P0-03

---

## 2.4 RF013 — EKF Adaptive Process Noise (P1, Medium Effort)

**Component:** `PositionEKF.java` (Kalman filter core)  
**Issue:** Fixed Q (process noise covariance) matrix — non-adaptive to signal conditions  
**Current State:** Diagonal Q with constant values for position/velocity states  
**Proposed Refinement:** Adaptive Q based on real-time RSSI variance  

### Adaptive Q Algorithm:
```java
// Per-update step:
// 1. Compute RSSI variance across visible APs: σ²_rssi = Var(RSSI_i)
// 2. Map to position uncertainty: σ²_pos = k × σ²_rssi / (10n/ln(10))²
// 3. Update Q matrix diagonal:
//    Q[0,0] = Q[1,1] = σ²_pos (position)
//    Q[2,2] = Q[3,3] = σ²_pos / Δt² (velocity)
// 4. Clamp: Q_min ≤ Q ≤ Q_max (prevent divergence/collapse)
```

### Benefits:
- Tightens filter during stable RSSI (low variance → low Q)
- Opens filter during multipath/occlusion (high variance → high Q)
- Prevents EKF divergence in dynamic RF environments

### Dependencies: RSSI variance computation (shared with RF004)
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 2.5 RF014 — Zone HMM Adaptive Transitions (P1, Medium Effort)

**Component:** `ZoneHMM.java` (Hidden Markov Model for zone classification)  
**Issue:** Fixed hysteresis thresholds — may not fit all environments  
**Current State:** Hardcoded transition probabilities and dwell-time hysteresis  
**Proposed Refinement:** Learn transition matrix from zone visit history  

### Learning Algorithm (Baum-Welch / EM):
```
E-step: Compute γ_t(i) = P(state_i at t | observations, λ)
M-step: Update transition matrix A[i][j] = Σ ξ_t(i,j) / Σ γ_t(i)
        where ξ_t(i,j) = P(state_i at t, state_j at t+1 | observations)
Regularization: Add Dirichlet prior (α=1) for unseen transitions
Online update: Exponential moving average with α=0.01
```

### Adaptive Hysteresis:
- Dwell time threshold = percentile_75(historical_dwell_times[zone])
- Exit confidence = 1 - P(stay | recent_observations)
- Zone merge/split detection via transition entropy

### Dependencies: Zone history database, RSSI fingerprints per zone
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

*End of Piece 02/13*