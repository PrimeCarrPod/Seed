# Best_Practices_AntiPatterns_Catalog — Piece 08/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 08 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Architecture Anti-Patterns (CP015-CP020)

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 08 of 13  
**Generated:** 2026-10-08 05:10:05 UTC

---

# CP015: God Class MainActivity (1416 Lines)
**Category:** Architecture | **Type:** Anti-Pattern
**Observed:** v1.0.0-v1.0.91 | **Evidence:** Hard to maintain
**Impact:** Technical debt | **Versions Affected:** All versions
**Fix:** Split into services (P1-03)

### Current State (v1.0.91)
```
MainActivity.java: 1,416 lines
  - BLE scanning & callbacks: ~300 lines
  - Wi-Fi Direct & RTT: ~250 lines
  - Permissions handling: ~150 lines
  - EKF/Particle filter: ~200 lines
  - Trilateration: ~150 lines
  - WebView/JS bridge: ~100 lines
  - Trail recording: ~100 lines
  - UI/Menu: ~80 lines
  - Lifecycle/Service mgmt: ~86 lines
```

### Recommended Decomposition
| Service | Responsibility | Est. Lines |
|---------|----------------|------------|
| BleScanService | BLE scanning, restart cycle, callbacks | 300 |
| WifiDirectService | P2P, RTT ranging, SSID broadcast | 250 |
| PositioningEngine | EKF, Particle, Trilateration, Calibration | 400 |
| TrailRecorder | Trail points, speed threshold, persistence | 150 |
| WebViewBridge | JS communication, Three.js management | 150 |
| PermissionManager | All 15 permissions, API version handling | 100 |

---

# CP016: No Unit Tests for Positioning Algorithms
**Category:** Architecture | **Type:** Anti-Pattern
**Observed:** v1.0.0-v1.0.91 | **Evidence:** Unverified math
**Impact:** Bugs in production | **Versions Affected:** All versions
**Fix:** Add JUnit tests (P1-02)

### Critical Algorithms Needing Tests
1. **Extended Kalman Filter** - state prediction, update, covariance
2. **Particle Filter** - resampling, weight calculation, AP likelihood
3. **Trilateration** - linear least squares, non-linear optimization
4. **RTT Ranging** - distance calculation from RTT measurements
5. **Self-Calibration** - AP position optimization

### Test Strategy
```java
@Test
public void testEKFVelocityInitialization() {
    PositionEKF ekf = new PositionEKF();
    ekf.initialize(0, 0); // x=0, y=0
    // vx should be 0, vy should be 0
    assertEquals(0, ekf.getState()[2], 0.001); // vx
    assertEquals(0, ekf.getState()[3], 0.001); // vy - THIS FAILS IN v1.0.91
}
```

---

# CP017: RTT Ranging Stub Not Implemented
**Category:** Architecture | **Type:** Anti-Pattern
**Observed:** v1.0.81-v1.0.91 | **Evidence:** Missing 802.11mc
**Impact:** Accuracy gap | **Versions Affected:** 1.0.81+
**Fix:** Complete WifiRttRanging (P0-02)

### Current State
```java
// WifiRttManager.java - STUB
public class WifiRttRanging {
    public void startRanging() {
        // TODO: Implement 802.11mc RTT
        Log.w(TAG, "RTT ranging not implemented");
    }
}
```

### Required Implementation
- WifiRttManager API (API 29+)
- Responder configuration on APs
- Request/response handling
- Distance calculation: distance = c * (t4-t1 - t2+t3) / 2

---

# CP018: AP Positions Initialized Randomly
**Category:** Architecture | **Type:** Anti-Pattern
**Observed:** v1.0.90-v1.0.91 | **Evidence:** Poor trilateration
**Impact:** Wrong positions | **Versions Affected:** 1.0.90+
**Fix:** Self-calibration needed (P0-03)

### Current State
```java
// Random initialization - BAD
apPositions[0] = new double[]{Math.random()*10, Math.random()*10};
apPositions[1] = new double[]{Math.random()*10, Math.random()*10};
// Trilateration with random AP positions = garbage output
```

### Solution: Self-Calibration
1. Collect RSSI/RTT measurements at known positions
2. Optimize AP positions to minimize position error
3. Use particle filter or gradient descent
4. Persist calibrated positions

---

# CP019: Particle Filter AP Parameters Hardcoded
**Category:** Architecture | **Type:** Anti-Pattern
**Observed:** v1.0.90-v1.0.91 | **Evidence:** Non-adaptive
**Impact:** Poor fit | **Versions Affected:** 1.0.90+
**Fix:** Parameter learning (P1-01)

### Current State
```java
// Hardcoded - doesn't adapt to environment
private static final double PATH_LOSS_EXPONENT = 2.7;
private static final double RSSI_AT_1M = -45;
private static final double MEASUREMENT_NOISE = 4.0;
```

### Solution: Online Parameter Estimation
- Estimate path loss exponent from measurements
- Calibrate RSSI@1m per AP
- Adapt measurement noise to environment

---

# CP020: Single Debug Keystore Only
**Category:** Architecture | **Type:** Anti-Pattern
**Observed:** v1.0.0-v1.0.91 | **Evidence:** No release signing
**Impact:** Play Store blocked | **Versions Affected:** All versions
**Fix:** Add release keystore (TD-08)

### Current State
- Only `debug.keystore` (auto-generated)
- No `release.keystore` for Play Store signing
- Cannot publish to Play Store

### Fix
```bash
# Generate release keystore
keytool -genkey -v -keystore release.keystore -alias release \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -storepass $RELEASE_STORE_PASS -keypass $RELEASE_KEY_PASS \
  -dname "CN=Bounce,O=Carrpod,C=US"
```

---

*Next Piece: Cross-Cutting Patterns & Lessons Learned*
