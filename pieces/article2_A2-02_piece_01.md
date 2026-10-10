# Android_Main_Features_Radio_Positioning — Piece 01/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 01 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## WIFI SCANNING — FOUNDATION (v1.0.3 → v1.0.91)

### Wi-Fi Scanning (WifiManager)
- **First Version:** 1.0.3 | **Last Version:** 1.0.91
- **Key Classes:** WifiManager + BroadcastReceiver
- **Key Methods:** startScan() + SCAN_RESULTS_AVAILABLE_ACTION
- **Permissions:** ACCESS_FINE_LOCATION + ACCESS_WIFI_STATE + NEARBY_WIFI_DEVICES (API33+)
- **Connects to HTML via:** JS bridge: onWifiResult (C001)
- **Output:** Real dBm + distance + zone (IMMEDIATE/NEAR/FAR)
- **Worked Well:** Core scanner feed, reliable across versions
- **Issues:** API33 permission changes broke scanning in v1.0.80-1.0.85
- **Solution:** Runtime permission handler with delayed request (BP006, BP007)
- **Best Practice:** Delayed permission request with Handler.postDelayed(100ms) (BP007)

### Evolution Timeline
| Version | Change |
|---------|--------|
| 1.0.3 | Basic scan implementation |
| 1.0.30 | Real dBm + distance calculation |
| 1.0.79 | Kalman filter on RSSI (RssiKalmanFilter) |
| 1.0.90 | 6-algo stack integration (EKF, Particle, HMM) |
| 1.0.91 | Current — stable with proven v1.0.3 pattern |

---

## WIFI DIRECT GROUP OWNER — 5GHZ BROADCAST (v1.0.13 → v1.0.91)

### Wi-Fi Direct Group Owner
- **First Version:** 1.0.13 | **Last Version:** 1.0.91
- **Key Classes:** WifiP2pManager + WifiP2pConfig.Builder
- **Key Methods:** createGroup() + setDeviceName() + GROUP_OWNER_BAND_5GHZ
- **Permissions:** CHANGE_WIFI_STATE + ACCESS_WIFI_STATE
- **Connects to HTML via:** JS bridge: onBroadcastStatus (C006)
- **Feature:** 5GHz 4-slot rotating broadcast
- **Worked Well:** Vehicle identification via SSID rotation
- **Issues:** Legacy API reflection needed for older devices
- **Solution:** Multi-method fallback — Builder → Reflection → Bonjour (BP011)

### Multi-Method Fallback Chain (Priority Order)
1. **Builder API** (modern, API19+) — `WifiP2pConfig.Builder`
2. **Reflection** (legacy) — `WifiP2pConfig` class reflection
3. **Bonjour/mDNS** (fallback) — Service discovery

---

## BLUETOOTH LE SCANNING — CONTINUOUS + 3D (v1.0.48 → v1.0.91)

### Bluetooth LE Scanning
- **First Version:** 1.0.48 | **Last Version:** 1.0.91
- **Key Classes:** BluetoothLeScanner + ScanCallback
- **Key Methods:** startScan(LOW_LATENCY) + 5s restart cycle
- **Permissions:** BLUETOOTH_SCAN + BLUETOOTH_CONNECT (API31+)
- **Connects to HTML via:** JS bridge: onBtResult + onBtResult3D (C002, C003)
- **Output:** Continuous scanning + 3D positioning
- **Worked Well:** Reliable device discovery with 3D spatial data
- **Issues:** Scan dies after ~10 seconds (Android kills continuous scan)
- **Solution:** Restart scan every 5s with Handler.postDelayed (BP008, E010 fixed in v1.0.65)

### Scan Configuration (Optimized)
```java
ScanSettings settings = new ScanSettings.Builder()
    .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)  // BP009
    .setReportDelay(0)  // Immediate reporting
    .build();

List<ScanFilter> filters = new ArrayList<>(); // No filters = all devices

// 5s restart cycle (mandatory)
handler.postDelayed(restartScanRunnable, 5000);  // BP008
```

---

## PIECE 01 SUMMARY
This piece covers the three radio scanning foundations: Wi-Fi Scanning (v1.0.3, proven pattern with API33 fixes), Wi-Fi Direct Group Owner with 5GHz 4-slot broadcast (v1.0.13, multi-method fallback), and Bluetooth LE Scanning (v1.0.48, mandatory 5s restart cycle + LOW_LATENCY mode). These form the radio layer feeding all positioning algorithms.

**Next Piece (02):** GPS Tracking + Sensor Fusion + Wake Lock