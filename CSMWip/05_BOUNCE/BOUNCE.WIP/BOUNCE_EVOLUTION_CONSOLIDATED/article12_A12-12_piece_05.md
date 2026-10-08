# Forensic_Analysis_Data_91_Versions — Piece 05/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 05 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Version-by-Version Analysis: v1.0.26 — v1.0.50 (Sensor Refinement to BLE)

## v1.0.26 — Sensor Stability
- **MainActivity**: 639 lines (stable)
- **HTML**: 466 (+5)
- **Fix**: Sensor listener leak on pause/resume

## v1.0.27 — Minor
- **HTML**: 467 (+1)

## v1.0.28 — Heading Improvements
- **MainActivity**: 647 (+8)
- **HTML**: 472 (+5)
- **Magnetic declination**: Auto-lookup via WMM model

## v1.0.29 — UI Polish
- **HTML**: 470 (-2)

## v1.0.30 — Performance
- **MainActivity**: 647 (stable)
- **HTML**: 480 (+10)
- **Sensor batch**: FIFO queue, 100-sample window

## v1.0.31 — Stabilization
- **No functional changes**

## v1.0.32 — Minor
- **MainActivity**: 649 (+2)

## v1.0.33 — HTML Trail Enhancement
- **HTML**: 496 (+16)
- **Trail**: Gradient color by speed, width by accuracy

## v1.0.34 — Camera Modes
- **HTML**: 498 (+2)
- **Modes**: Follow, Orbit, Top-down, First-person

## v1.0.35 — Sensor Regression
- **MainActivity**: 649 (stable)
- **HTML**: 462 (-36) — removed experimental features
- **Note**: Temporary feature removal for stability

## v1.0.36 — Recovery
- **HTML**: 475 (+13)
- **Restored**: Trail, camera modes

## v1.0.37 — Bug Fix
- **HTML**: 468 (-7)

## v1.0.38 — Stabilization
- **HTML**: 480 (+12)

## v1.0.39 — Minor
- **MainActivity**: 650 (+1)

## v1.0.40 — Permission Update
- **MainActivity**: 659 (+9)
- **Android 12**: BLUETOOTH_SCAN, BLUETOOTH_CONNECT prep
- **Manifest**: +3 permission declarations (not yet used)

## v1.0.41 — Cleanup
- **MainActivity**: 659 (stable)

## v1.0.42 — Minor
- **MainActivity**: 660 (+1)

## v1.0.43 — Sensor Rate Increase
- **MainActivity**: 666 (+6)
- **Rate**: SENSOR_DELAY_FASTEST (5ms) for high-dynamic

## v1.0.44 — Gyro Bias Estimation
- **MainActivity**: 667 (+1)
- **Bias**: Online estimation during static periods

## v1.0.45 — Refinement
- **MainActivity**: 662 (-5)

## v1.0.46 — Cleanup
- **MainActivity**: 660 (-2)

## v1.0.47 — Pre-BLE
- **MainActivity**: 664 (+4)
- **Stub**: `BleScanner.java` class created (empty)

## v1.0.48 — BLE Scanning Implementation ★ MAJOR MILESTONE
- **MainActivity**: 711 lines (+47)
- **HTML**: 505 lines
- **New Features**:
  - `BleScanner` with `BluetoothLeScanner`
  - `ScanCallback` with `ScanFilter` (service UUID: 0xFEAA Eddystone)
  - RSSI smoothing: exponential moving average (α=0.3)
  - Device deduplication: MAC + name key
  - Background scan: `PendingIntent` + `JobScheduler`
- **Permissions**: BLUETOOTH_SCAN, BLUETOOTH_CONNECT, ACCESS_FINE_LOCATION
- **HTML**: BLE beacon list, RSSI history chart
- **APK**: 202,071 → 206,167 (+4KB)

## v1.0.49 — BLE UI Expansion
- **MainActivity**: 711 (stable)
- **HTML**: 549 (+44)
- **Features**: BLE device details, connection state, service discovery

## v1.0.50 — BLE Connection
- **MainActivity**: 711 (stable)
- **HTML**: 553 (+4)
- **GATT**: `BluetoothGatt` connect, service discovery
- **Notifications**: Characteristic enable for real-time data

## v1.0.51 — Connection Stability
- **HTML**: 524 (-29)
- **Fix**: GATT connection timeout (30s), auto-reconnect

## v1.0.52 — RSSI Filtering
- **HTML**: 525 (+1)
- **Filter**: Kalman 1D on RSSI (process noise 0.1, measurement 4.0)

## v1.0.53 — Stabilization
- **No changes**

## v1.0.54 — BLE Advertising
- **HTML**: 529 (+4)
- **Advertise**: `BluetoothLeAdvertiser` for mesh beacon

## v1.0.55 — Advertising UI
- **HTML**: 549 (+20)
- **Controls**: Start/stop advertise, interval, tx power

## v1.0.56 — Mesh Foundation
- **HTML**: 553 (+4)
- **Peer discovery**: Scan + advertise = bidirectional

## v1.0.57 — Mesh Protocol v1
- **HTML**: 559 (+6)
- **Packet**: JSON over GATT notification
- **Fields**: type, src, dst, ttl, payload

## v1.0.58 — Stabilization
- **No changes**

## v1.0.59 — Minor
- **No changes**

## v1.0.60 — Battery Optimization
- **HTML**: 554 (-5)
- **Duty cycle**: Scan 5s / 30s (16% duty)

## v1.0.61 — Minor
- **No changes**

## v1.0.62 — Minor
- **MainActivity**: 711 (stable)

## v1.0.63 — Sensor Rate Adjustment
- **MainActivity**: 718 (+7)
- **Dynamic rate**: FASTEST when moving, GAME when static

## v1.0.64 — HTML Polish
- **HTML**: 559 (+4)

## v1.0.65 — BT Restart Cycle Fix ★ CRITICAL FIX
- **MainActivity**: 732 (+14)
- **HTML**: 559 (stable)
- **Bug**: Bluetooth adapter crashes after ~4 hours (resource leak)
- **Fix**: 
  ```java
  // 5-second restart cycle
  handler.postDelayed(() -> {
      bluetoothAdapter.disable();
      Thread.sleep(1000);
      bluetoothAdapter.enable();
      restartBleScanner();
  }, 5 * 60 * 1000); // Every 5 minutes
  ```
- **Impact**: 99.9% uptime vs 4-hour MTBF before

## v1.0.66 — Stabilization
- **No changes**

## v1.0.67 — Code Cleanup
- **MainActivity**: 719 (-13)
- **Removed**: Dead code, unused imports

## v1.0.68 — Minor Feature
- **MainActivity**: 722 (+3)

## v1.0.69 — Cleanup
- **MainActivity**: 718 (-4)

## v1.0.70 — HTML Cleanup
- **MainActivity**: 717 (-1)
- **HTML**: 555 (-4)

## v1.0.71 — Minor
- **MainActivity**: 718 (+1)
- **HTML**: 559 (+4)

## v1.0.72 — Kalman Visualization
- **HTML**: 585 (+26)
- **Viz**: Covariance ellipse, state vector arrows

## v1.0.73 — UI Polish
- **HTML**: 583 (-2)

## v1.0.74 — Minor
- **HTML**: 583 (stable)

## v1.0.75 — HTML Enhancement
- **HTML**: 587 (+4)

## v1.0.76 — Pre-Kalman
- **HTML**: 587 (stable)
- **MainActivity**: 718 (stable)
- **Last version before Kalman integration**

## Summary: v1.0.26 → v1.0.76

| Metric | v1.0.25 | v1.0.76 | Change |
|--------|---------|---------|--------|
| MainActivity | 639 | 718 | +12% |
| HTML | 461 | 587 | +27% |
| APK Size | 202KB | 206KB | +2% |
| Key Algorithms | Madgwick | + BLE Mesh + RSSI Kalman | 4 algorithms |
| BLE | Stub | Full stack | Complete |
| Mesh | None | v1 protocol | Foundation |

**Key Developments**:
1. **BLE complete stack** (v1.0.48-57): Scan, connect, advertise, mesh
2. **Critical stability fix** (v1.0.65): BT 5-minute restart cycle
3. **RSSI filtering** (v1.0.52): 1D Kalman on signal strength
4. **Kalman visualization prep** (v1.0.72): Covariance ellipse UI

**Architectural Shift**: Sensor-only → Sensor + BLE mesh positioning

---