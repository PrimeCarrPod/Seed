# Android_Main_Features_Radio_Positioning — Piece 08/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 08 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## MULTI-ALGORITHM FUSION — 6 ALGOS PARALLEL (v1.0.90 → v1.0.91)

### Multi-Algorithm Fusion
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** MainActivity (positioning engine)
- **Algorithms (6 total):**
  1. RSSI Kalman Filter (1D) — per-AP/device smoothing
  2. Trilateration (WLS) — multi-AP position + GDOP
  3. EKF (2D CV) — position + velocity + prediction
  4. Particle Filter (SIR) — non-Gaussian, multimodal
  5. Zone HMM (Viterbi) — discrete zone classification
  6. RTT Ranging (stub) — sub-meter (when implemented)
- **Execution:** Parallel in positioning loop
- **Output:** Best available position per algorithm
- **Fusion:** No weighted fusion yet (planned RF030)
- **Worked Well:** Redundancy — if one fails, others work
- **Issues:** No adaptive weighting by algorithm confidence
- **Solution:** Adaptive weighting by GDOP, particle variance, EKF covariance (RF030)

### Positioning Loop (Simplified)
```java
// Every scan cycle (~2-5s)
void runPositioning() {
    // 1. Get fresh RSSI scans (Wi-Fi + BT)
    // 2. Update RSSI Kalman filters (per source)
    // 3. Run Trilateration (if 3+ APs known)
    // 4. Run EKF predict/update (if Trilateration available)
    // 5. Run Particle Filter (if AP params known)
    // 6. Run Zone HMM (always)
    // 7. Push ALL results to HTML via JS bridge
    // 8. HTML selects/displays best available
}
```

### Algorithm Outputs to HTML
| Algorithm | JS Bridge | HTML Display |
|-----------|-----------|--------------|
| RSSI Kalman | onBtResult3D (filtered) | Smoothed BT positions |
| Trilateration | onApPositionUpdate | AP + vehicle position |
| EKF | onApPositionUpdate | Predicted position + velocity |
| Particle Filter | onApPositionUpdate | Non-Gaussian position |
| Zone HMM | onZoneUpdate | IMMEDIATE/NEAR/FAR |
| RTT | (stub) | Sub-meter when ready |

---

## AP POSITION ESTIMATION — SELF-CALIBRATION (v1.0.81 → v1.0.91)

### AP Position Estimation
- **First Version:** 1.0.81 | **Last Version:** 1.0.91
- **Status:** PARTIAL — random init → refined
- **Class:** MainActivity + Trilateration
- **Problem:** AP positions unknown initially (chicken-egg)
- **v1.0.81:** Random initialization
- **v1.0.90:** Refinement via movement + trilateration
- **Connects to HTML via:** onApPositionUpdate (C027)
- **Worked Well:** Positions converge with movement
- **Issues:** Random initial positions cause poor early trilateration
- **Solution:** Self-calibration learning (P0-03, FP002, RF005)

### Self-Calibration Approach (Planned)
```
1. Start with GPS position (when available)
2. For each new AP seen:
   - Record RSSI at known GPS positions
   - Solve for AP position via multilateration
3. Use refined AP positions for future trilateration
4. Continuously update with new observations
5. GDOP weighting for quality
```

---

## ANDROID ARCHITECTURE — GOD CLASS (v1.0.0 → v1.0.91)

### MainActivity.java — God Class (1416 lines)
- **First Version:** 1.0.0 (160 lines) | **Last Version:** 1.0.91 (1416 lines)
- **Growth:** 8.8x over 91 versions
- **Responsibilities:**
  - All radio scanning (Wi-Fi, BT, Wi-Fi Direct)
  - GPS + sensor fusion
  - All 6 positioning algorithms
  - Wake lock management
  - SSID broadcast duty cycle
  - Permission handling (15 perms)
  - JS bridge (30+ methods)
  - Build integration
- **Anti-Pattern:** CP015 — God class, hard to maintain/test
- **Refinement:** RF001 — Split into Services (P1-03, target v1.0.95)

### Proposed Split (RF001)
```
MainActivity (UI controller only)
├── ScanningService          # Wi-Fi, BT, Wi-Fi Direct
├── PositioningEngine        # All 6 algorithms
├── BroadcastService         # SSID 4-slot + Bonjour
├── TrailService             # GPS trail + wake lock
└── BridgeController         # JS bridge methods
```

---

## PIECE 08 SUMMARY
This piece covers the 6-algorithm multi-algo fusion (parallel execution, no weighted fusion yet — RF030), AP Position Estimation (partial, random init → refined, self-calibration P0-03), and the MainActivity God Class (1416 lines, CP015, split planned RF001). The architecture needs refactoring but the algorithm redundancy provides robustness.

**Next Piece (09):** Error Patterns — JAVA_HOME, sdkmanager, License EPIPE