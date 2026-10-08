# Working_Features_Versions_History — Piece 02/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 02 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Radio Features: Wi-Fi Scanning, Bluetooth LE, Wi-Fi Direct, SSID Broadcast

## 2.1 WF001 — Wi-Fi Scanning (Radio)

**Category:** Radio | **First Working:** v1.0.3 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~200 | **Key Files:** `MainActivity.java` | **Dependencies:** `WifiManager`, `ACCESS_FINE_LOCATION`, `ACCESS_WIFI_STATE`, `CHANGE_WIFI_STATE`

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.3 | Basic Wi-Fi scan with `WifiManager.startScan()` | +80 |
| v1.0.30 | Real dBm values extracted from `ScanResult.level` | +40 |
| v1.0.45 | Proven permission request pattern (runtime + rationale) | +30 |
| v1.0.79 | RSSI Kalman filter integration (1D per-AP smoothing) | +64 |
| v1.0.90 | 6-algorithm fusion stack: Trilateration + EKF + Particle + HMM + RTT | +150 |

### Known Limitations
- API 33+ requires `NEARBY_WIFI_DEVICES` permission for scan results
- Scan interval throttled by Android (min 30s background, 2s foreground)
- RSSI variance ±5-10 dBm in multipath environments

### Next Planned Enhancement
**RTT Ranging (P0-02)** — IEEE 802.11mc fine-time measurement for meter-level accuracy

---

## 2.2 WF002 — Bluetooth LE Scanning (Radio)

**Category:** Radio | **First Working:** v1.0.48 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~150 | **Key Files:** `MainActivity.java` | **Dependencies:** `BluetoothLeScanner`, `BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, `ACCESS_FINE_LOCATION`

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.48 | Basic BLE scan with `BluetoothLeScanner.startScan()` | +70 |
| v1.0.65 | **Critical fix**: 5-second scan restart cycle (scan death recovery) | +40 |
| v1.0.79 | Per-device RSSI Kalman filter (1D) | +64 |
| v1.0.86 | Full 3D spatial tracking: azimuth/elevation/distance + Theory mode | +400 |

### Known Limitations
- **Scan death**: BLE scanner stops delivering callbacks after ~30-60s without restart (fixed v1.0.65)
- Android 12+ requires `BLUETOOTH_SCAN` + `BLUETOOTH_CONNECT` (not just location)
- Background scanning restricted; foreground service required for continuous operation

### Next Planned Enhancement
**BT Mesh (P3-01)** — Bluetooth Mesh provisioning for device-to-device relay

---

## 2.3 WF003 — Wi-Fi Direct Broadcast (Radio)

**Category:** Radio | **First Working:** v1.0.13 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~100 | **Key Files:** `MainActivity.java` | **Dependencies:** `WifiP2pManager`, `ACCESS_WIFI_STATE`, `CHANGE_WIFI_STATE`, `ACCESS_FINE_LOCATION`

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.13 | Group Owner mode: create persistent Wi-Fi Direct group | +40 |
| v1.0.20 | Duty-cycle broadcast: periodic SSID announcement | +30 |
| v1.0.22 | **4-slot rotation**: rotating SSID with encryption key per slot | +50 |
| v1.0.64 | METAR codes integrated into Slot 3 broadcast | +20 |
| v1.0.90 | Bonjour/mDNS fallback for cross-platform discovery | +40 |

### Known Limitations
- **Timing drift**: Slot rotation accumulates ~200ms drift/hour (fixed v1.0.90 with `SystemClock.elapsedRealtime()`)
- Group Owner mode prevents simultaneous AP connection
- Max 8 clients per group; no mesh relay capability

### Next Planned Enhancement
**Mesh Relay (P1-05)** — Multi-hop Wi-Fi Direct mesh for extended range

---

## 2.4 WF025 — SSID Broadcast 4-Slot Rotating (Radio)

**Category:** Radio | **First Working:** v1.0.22 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~80 | **Key Files:** `MainActivity.java` | **Dependencies:** `WifiP2pManager`, AES encryption for slot keys

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.22 | 4-slot rotation with per-slot AES key derivation | +50 |
| v1.0.64 | Slot 3 dedicated to FAA METAR weather codes | +20 |
| v1.0.90 | Live re-code: SSID payload updated without reconnection | +30 |

### Known Limitations
- Fixed 4-slot cycle; no dynamic slot count
- Encryption key derivation uses static salt (needs rotation P1-04)
- Slot timing tied to `Handler.postDelayed` — not wakelock-protected

### Next Planned Enhancement
**Live Re-code Expansion (H11)** — Full payload scripting via broadcast slots

---

## 2.5 Radio Features Cross-Cutting Concerns

### Permission Evolution (WF026 overlap)
- v1.0.3: Basic `ACCESS_FINE_LOCATION` + `ACCESS_WIFI_STATE`
- v1.0.45: Proven runtime pattern with rationale dialog
- v1.0.48: Added `BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT` (Android 12+)
- v1.0.91: `NEARBY_WIFI_DEVICES` for Wi-Fi scan without location (API 33+)

### Scan Scheduling Architecture
All radio scanners use a unified `ScanScheduler` (introduced v1.0.79):
```java
// Pseudo-pattern from MainActivity.java
scanScheduler.schedule(WiFiScanner.class, 2000);      // 2s foreground
scanScheduler.schedule(BLEScanner.class, 5000);       // 5s with restart
scanScheduler.schedule(WiFiDirectBroadcaster.class, 10000); // 10s slots
```

### Data Flow to Visualization
Radio → Positioning Algorithms → Three.js Visualization:
```
Wi-Fi RSSI + BLE RSSI + GPS + Sensors
        ↓
[Trilateration] [EKF] [Particle Filter] [Zone HMM] [RTT stub]
        ↓
    Fusion Engine (WF030) → Weighted position estimate
        ↓
    bounce.html: Vehicle position + beacon spheres + trails
```

---

*End of Piece 02 — Continue to Piece 03 for Positioning Features Part 1*