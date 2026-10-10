# Connection_Pathways_Bidirectional — Piece 01/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 01 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## CONNECTION ARCHITECTURE OVERVIEW

### Bidirectional Android ↔ HTML Bridge (30 Connections)
- **Core Mechanism:** WebView `addJavascriptInterface` + `evaluateJavascript`
- **Android → HTML (Push):** 13 connections — data flows from sensors/scanners to UI
- **HTML → Android (Call):** 12 connections — user actions trigger Android methods
- **Bidirectional (Core):** 2 connections — bridge initialization + asset loading
- **Reliability:** High (stable since v1.0.0, stabilized with try/catch v1.0.52)

### Bridge Initialization (C025, C030)
| ID | Direction | Android Method | HTML Function | Trigger |
|----|-----------|----------------|---------------|---------|
| C025 | Bidirectional | `WebView.evaluateJavascript()` | `Bounce.*` callbacks | Continuous |
| C030 | Bidirectional | `WebView.loadUrl()` | HTML loads | App startup |

```java
// MainActivity.onCreate()
webView.addJavascriptInterface(new BounceBridge(), "Bounce");
webView.loadUrl("file:///android_asset/bounce.html");  // C030
```

---

## ANDROID → HTML: RADIO DATA FEEDS (C001-C007)

### C001: Wi-Fi Scan Results
- **Android Method:** `onWifiResult(scanResults)`
- **HTML Function:** `UI.updateWifiList(data)`
- **Data Format:** JSON array — SSID, BSSID, RSSI, freq, distance, zone, persistence, reliability
- **Trigger:** Wi-Fi scan complete (~2-5s)
- **First Version:** 1.0.3 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Primary scanner feed
- **Issues Fixed:** HTML catch wrapper (v1.0.52)

### C002: Bluetooth LE Results (2D)
- **Android Method:** `onBtResult(devices)`
- **HTML Function:** `UI.updateBtList(data)`
- **Data Format:** JSON array — name, address, rssi, distance
- **Trigger:** Bluetooth LE scan
- **First Version:** 1.0.48 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Legacy 2D list view

### C003: Bluetooth 3D Results
- **Android Method:** `onBtResult3D(devices)`
- **HTML Function:** `UI.updateBt3D(data)`
- **Data Format:** JSON array — address, x, y, z, brightness, trajectory[]
- **Trigger:** Bluetooth 3D scan
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** 3D spatial tracking with trajectories

---

## ANDROID → HTML: POSITIONING DATA (C004-C005, C026-C028)

### C004: GPS Location
- **Android Method:** `onLocationResult(loc)`
- **HTML Function:** `UI.updateLocation(data)`
- **Data Format:** JSON — lat, lng, altitude, heading, speed, mph, timestamp
- **Trigger:** GPS update (1s interval)
- **First Version:** 1.0.4 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Real GPS data, speed threshold for trail (v1.0.27)

### C005: Sensor Fusion Orientation
- **Android Method:** `onOrientationResult(orient)`
- **HTML Function:** `UI.updateOrientation(data)`
- **Data Format:** JSON — azimuth, pitch, roll
- **Trigger:** Sensor fusion update
- **First Version:** 1.0.25 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Low-pass filtered (α=0.15), azimuth wrap fix (v1.0.25)

### C026: Trail Updates
- **Android Method:** `onTrailUpdate(points)`
- **HTML Function:** `UI.updateTrail(data)`
- **Data Format:** JSON array — trail points
- **Trigger:** Trail recording (every 5 frames)
- **First Version:** 1.0.62 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** CatmullRom rebuild, GPU-safe disposal (v1.0.54)

---

## PIECE 01 SUMMARY
This piece covers the connection architecture overview (30 total connections: 13 Android→HTML, 12 HTML→Android, 2 bidirectional) and the first 6 Android→HTML radio/positioning data feeds: Wi-Fi scans, Bluetooth LE (2D and 3D), GPS location, sensor fusion orientation, and trail updates. These are the primary data pipelines feeding the HTML visualization layer.

**Next Piece (02):** Android → HTML — Broadcast, Update, Permission, Error, AP Position, Zone