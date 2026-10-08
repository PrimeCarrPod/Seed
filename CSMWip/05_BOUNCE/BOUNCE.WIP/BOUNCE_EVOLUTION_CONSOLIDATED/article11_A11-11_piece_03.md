# Future_Thoughts_Evaluations_Vision — Piece 03/13
## Article A11: A11-11 — Future Thoughts Evaluations Vision
**Piece:** 03 of 13  
**Generated:** 2026-10-08 22:03:13 UTC

---

# Network: Satellite Backup & Positioning: Factor Graph / VIO

## FT015 — Satellite Messenger Integration (Network)

**Hypothesis:** Works anywhere on Earth  
**Feasibility:** Low | **Potential Impact:** Very High - coverage  
**Risks:** Cost + latency | **Related Work:** Satellite APIs  
**Validation Approach:** Partnership talks | **Timeline:** 2+ years | **Status:** Future  

Mesh networks fail when node density drops below percolation threshold (~3 nodes/km²). In rural highways, oceans, deserts, disaster zones—no mesh. Satellite messenger (Starlink Direct-to-Cell, Globalstar, Iridium) provides global fallback.

**Integration Architecture:**
- Bounce Mesh detects partition: `neighborCount == 0` for >5 min
- Activates satellite modem (via USB/Bluetooth accessory or built-in on supported phones: Pixel 9+, iPhone 14+)
- Compresses critical state: `{fleetId, nodeId, lat, lon, speed, heading, hazardFlags}` → 64 bytes
- Sends via satellite API (Starlink: `SpaceX API`; Globalstar: `SPOT API`; Iridium: `Short Burst Data`)
- Receives fleet broadcast: regional hazard alerts, traffic, weather
- Latency: 2-30s (vs mesh 100ms). Acceptable for non-safety-critical sync.

**Cost Model:** Starlink Direct-to-Cell: ~$10/mo per device (estimated). Globalstar SPOT: $15/mo + $0.10/msg. Target: enterprise fleets only.

---

## FT004 — Sensor Fusion with Factor Graph (Positioning)

**Hypothesis:** Unifies all sensors; optimal estimation  
**Feasibility:** Medium | **Potential Impact:** High - best accuracy  
**Risks:** Complex dependency (GTSAM) | **Related Work:** GTSAM library  
**Validation Approach:** Benchmark vs EKF | **Timeline:** 6-12 months | **Status:** Research  

Current v1.0.91 uses cascaded EKF (PositionEKF + VelocityEKF) + Particle Filter fallback. Problems: linearization errors, manual tuning, difficult to add new sensor types (UWB, visual, barometer).

**Factor Graph Approach (GTSAM):**
- Represent each measurement as factor: `GPSFactor`, `WiFiFactor`, `BLEFactor`, `IMUFactor`, `UWBFactor`, `VisualFactor`
- Graph nodes: `Pose3` (position + orientation) at each timestep
- Optimize: `argmin Σ ||factor.error(x)||²_Σ` using Levenberg-Marquardt
- Advantages: 
  - Naturally handles asynchronous, multi-rate sensors
  - Re-linearization at each iteration → better non-linear handling
  - Marginalization for sliding window (fixed compute)
  - Loop closure via visual/place recognition factors
  - Covariance recovery: `marginalCovariance(key)`

**GTSAM on Android:**
- Cross-compile GTSAM (C++) for arm64-v8a, armeabi-v7a via NDK
- JNI wrapper: `FactorGraphNative.addGPSFactor(timestamp, lat, lon, accuracy)`
- Incremental inference: `ISAM2` (iSAM2) for real-time updates
- Binary size: ~2MB (acceptable for Core APK)

**Benchmark Target (vs current EKF):**
| Scenario | EKF RMSE | Factor Graph RMSE | Improvement |
|----------|----------|-------------------|-------------|
| Urban canyon (GPS + WiFi) | 8.2m | 3.1m | 62% |
| Indoor (BLE + IMU) | 5.4m | 1.8m | 67% |
| Highway (GPS + IMU) | 2.1m | 1.2m | 43% |
| Tunnel (IMU only, 30s) | 45m drift | 12m drift | 73% |

---

## FT005 — Visual-Inertial Odometry (VIO) (Positioning)

**Hypothesis:** ARCore/VIO gives absolute position  
**Feasibility:** Low | **Potential Impact:** Very High - no infrastructure  
**Risks:** Compute heavy | **Related Work:** ARCore/VIO  
**Validation Approach:** Test ARCore on device | **Timeline:** 12+ months | **Status:** Future  

VIO fuses camera (visual features) + IMU (high-rate motion) → 6-DoF pose at 30-60Hz. No external infrastructure needed. Works indoors, tunnels, parking garages where GPS/WiFi/BLE fail.

**Integration Path:**
- ARCore `Session` + `Frame.getCamera().getPose()` → world-space pose
- Requires ARCore-supported device (most 2019+ flagships, some mid-range)
- Fallback: OpenVINS (open-source VIO) for non-ARCore devices
- Compute: ~30% CPU on Snapdragon 8 Gen 2 (acceptable for background service)
- Battery: ~15%/hr additional (camera + IMU + optimization)

**Hybrid Fusion:** Factor graph (FT004) + VIO factors = ultimate positioning stack. VIO provides high-frequency relative motion; GPS/WiFi/BLE provide absolute anchors. Loop closure corrects VIO drift.

**Minimum Viable Demo:** 
1. Enable ARCore in WebView (requires `android:hardwareAccelerated="true"` + ARCore dependency)
2. Extract pose from `ArFrame` → feed to PositionEKF as `VisualFactor`
3. Compare trajectory with/without VIO in 100m indoor loop

---