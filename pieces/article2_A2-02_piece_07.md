# Android_Main_Features_Radio_Positioning — Piece 07/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 07 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## SSID BROADCAST — 4-SLOT ROTATING (v1.0.22 → v1.0.91)

### SSID Broadcast (4-Slot Rotating)
- **First Version:** 1.0.22 | **Last Version:** 1.0.91
- **Key Method:** refreshBroadcastSSID() + duty cycle
- **Timing:** 5.1s/slot (2.5s ON + 2.6s OFF) + 5GHz + Bonjour fallback
- **Permissions:** CHANGE_WIFI_STATE + CHANGE_NETWORK_STATE
- **Connects to HTML via:** JS bridge: broadcastStatus (C006)
- **Feature:** Vehicle identification via rotating SSID
- **Worked Well:** Clear identification, 4 vehicles max
- **Issues:** Slot timing drift in early versions (E017)
- **Solution:** Fixed 5.1s duty cycle with single timer (v1.0.20, BP012)

### Slot Structure
```
Slot 0: 0.0s  → 5.1s   | SSID: "BOUNCE_00_<PLATE>"
Slot 1: 5.1s  → 10.2s  | SSID: "BOUNCE_01_<PLATE>"
Slot 2: 10.2s → 15.3s  | SSID: "BOUNCE_02_<PLATE>" (METAR data in v1.0.64+)
Slot 3: 15.3s → 20.4s  | SSID: "BOUNCE_03_<PLATE>"
Cycle repeats every 20.4s
```

### Bonjour Fallback (v1.0.90+)
- **Purpose:** Service discovery when Wi-Fi Direct fails
- **Implementation:** NSD (Network Service Discovery)
- **Service Type:** `_bounce._tcp.local.`

---

## FAA METAR CODES — REFERENCE DATA (v1.0.64 → v1.0.91)

### FAA METAR Codes
- **First Version:** 1.0.64 | **Last Version:** 1.0.91
- **Implementation:** Static code tables in HTML (Legend panel)
- **Categories:** Precipitation / Obscuration / Hazard / Modifiers / Wind / Sky
- **Permission:** None
- **Connects to HTML via:** Legend panel (static)
- **Worked Well:** Complete aviation weather reference
- **Issues:** None
- **Solution:** Static reference data (no computation needed)

### METAR Categories (Slot 3 Broadcast)
| Category | Codes | Example |
|----------|-------|---------|
| Precipitation | RA, SN, DZ, GR, GS, PL, UP | RA = Rain |
| Obscuration | FG, BR, HZ, VA, DU, SA, PY | FG = Fog |
| Hazard | TS, FC, SS, DS, PO, SQ | TS = Thunderstorm |
| Modifiers | MI, BC, PR, DR, BL, SH, TS, FZ | SH = Showers |
| Wind | VRB, KT, MPS, KMH | VRB = Variable |
| Sky | FEW, SCT, BKN, OVC, VV | OVC = Overcast |

---

## RUNTIME PERMISSIONS — COMPREHENSIVE (v1.0.3 → v1.0.91)

### Runtime Permissions (API23+)
- **First Version:** 1.0.3 | **Last Version:** 1.0.91
- **Pattern:** checkSelfPermission + requestPermissions
- **Callback:** PERM_REQ=1001 (onRequestPermissionsResult)
- **Total Permissions:** 15 dangerous permissions
- **Connects to HTML via:** JS bridge: permissionResult (C023)
- **Worked Well:** Comprehensive handling across API levels
- **Issues:** API33 NEARBY_WIFI_DEVICES permission denied (E009)
- **Solution:** Revert to proven v1.0.3 pattern + neverForLocation flag (BP006, BP007, BP013)

### 15 Permissions by API Level
| Permission | API Added | Use Case |
|------------|-----------|----------|
| ACCESS_FINE_LOCATION | 23 | GPS, Wi-Fi scan, RTT |
| ACCESS_COARSE_LOCATION | 23 | Wi-Fi scan fallback |
| ACCESS_BACKGROUND_LOCATION | 29 | Background GPS trail |
| ACCESS_WIFI_STATE | 23 | Wi-Fi scan results |
| CHANGE_WIFI_STATE | 23 | Wi-Fi Direct broadcast |
| NEARBY_WIFI_DEVICES | 33 | Wi-Fi scan (API33+) |
| BLUETOOTH_SCAN | 31 | BLE scanning |
| BLUETOOTH_CONNECT | 31 | BT device connect |
| BLUETOOTH_ADVERTISE | 31 | BT advertising |
| WAKE_LOCK | 23 | Background trail |
| INTERNET | 1 | Update check, GitHub API |
| ACCESS_NETWORK_STATE | 1 | Network awareness |
| CHANGE_NETWORK_STATE | 23 | Wi-Fi Direct |
| CAMERA | 33 | Future AR (planned) |
| RECORD_AUDIO | 33 | Future voice (planned) |

### Proven v1.0.3 Pattern (BP006)
```java
// Delayed request to avoid startup dialog
handler.postDelayed(() -> {
    if (checkSelfPermission(perm) != GRANTED) {
        requestPermissions(new String[]{perm}, PERM_REQ);
    }
}, 100);  // BP007: 100ms delay
```

---

## PIECE 07 SUMMARY
This piece covers SSID Broadcast (4-slot rotating, fixed 5.1s duty cycle with Bonjour fallback), FAA METAR Codes (static aviation weather reference in Slot 3 and Legend panel), and Runtime Permissions (15 permissions, proven v1.0.3 pattern with delayed request, API33 NEARBY_WIFI_DEVICES fix). The permission system is comprehensive and handles all API levels 23-33+.

**Next Piece (08):** Positioning Algorithm Integration — Multi-Algo Fusion