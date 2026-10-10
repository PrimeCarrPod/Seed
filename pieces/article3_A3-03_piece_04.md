# Connection_Pathways_Bidirectional — Piece 04/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 04 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## HTML → ANDROID: UPDATE ACTIONS (C021-C022)

### C021: Download Update
- **HTML Call:** `Bounce.downloadUpdate()`
- **Android Method:** `MainActivity.downloadUpdate()`
- **Data Format:** Void
- **Trigger:** Download APK button
- **First Version:** 1.0.93 | **Last Version:** 1.0.93
- **Reliability:** High
- **Notes:** Direct APK download, restored in v1.0.93

### C022: Ignore Update
- **HTML Call:** `Bounce.ignoreUpdate()`
- **Android Method:** `MainActivity.ignoreUpdate()`
- **Data Format:** Void
- **Trigger:** Ignore button
- **First Version:** 1.0.93 | **Last Version:** 1.0.93
- **Reliability:** High
- **Notes:** Dismiss update notification, restored in v1.0.93

### C029: Refresh Broadcast SSID
- **HTML Call:** `Bounce.refreshBroadcastSSID()`
- **Android Method:** `MainActivity.refreshBroadcastSSID()`
- **Data Format:** Void
- **Trigger:** Live re-code SSID
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Reliability:** High
- **Notes:** Dynamic SSID update without restart

---

## CONNECTION RELIABILITY ANALYSIS

### Reliability by Category
| Category | Count | Avg Reliability | Key Issues |
|----------|-------|-----------------|------------|
| Android→HTML (Radio) | 3 | High | HTML catch wrapper needed (v1.0.52) |
| Android→HTML (Position) | 3 | High | Speed threshold, azimuth wrap |
| Android→HTML (System) | 3 | Medium | Slot drift, AP learning |
| Android→HTML (Algorithm) | 2 | Medium | Zone hysteresis, AP positions |
| HTML→Android (Control) | 5 | High | Stable since v1.0.0 |
| HTML→Android (Camera) | 3 | High | Three modes |
| HTML→Android (Beacon) | 2 | High | Physics reset delay |
| HTML→Android (Radio) | 2 | Medium | Broadcast fallback |
| HTML→Android (Data) | 4 | High | Trail, theory, queries |
| HTML→Android (Update) | 2 | High | Restored v1.0.93 |
| Bidirectional (Core) | 2 | High | Bridge init + load |

### Failure Modes & Mitigations
| Failure Mode | Connections Affected | Mitigation |
|--------------|---------------------|------------|
| JS Bridge silent failure | All HTML→Android | try/catch wrapper (v1.0.52, BP015) |
| WebView crash on error | All Android→HTML | window.onerror + UI.showError (v1.0.52) |
| Broadcast timing drift | C006, C015 | Fixed 5.1s duty cycle (v1.0.20, BP012) |
| BT scan death | C002, C003 | 5s restart cycle (v1.0.65, BP008) |
| Permission denied | C023 | Proven v1.0.3 pattern (BP006) |

---

## DATA FORMAT STANDARDS

### JSON Conventions (All Connections)
```json
// Standard envelope
{
  "type": "wifi|bt|gps|orientation|trail|broadcast|zone|ap|error|update",
  "timestamp": 1700000000000,
  "data": { ... }
}

// Android → HTML: pushed via evaluateJavascript
webView.evaluateJavascript("UI.updateWifiList(" + json + ")", null);

// HTML → Android: direct @JavascriptInterface call
Bounce.setVehicleData(jsonString);
```

### Type Safety
- **Android side:** Gson for JSON serialization
- **HTML side:** JSON.parse() with try/catch
- **Versioning:** Implicit — new fields added, never removed

---

## PIECE 04 SUMMARY
This piece covers the update action connections (download/ignore, restored in v1.0.93), dynamic SSID refresh, connection reliability analysis (10 categories, 30 connections, failure modes), and JSON data format standards. The bridge has evolved from fragile (silent failures pre-v1.0.52) to robust (try/catch, error handling, proven patterns).

**Next Piece (05):** Bridge Implementation Details — Android Side (BounceBridge Class)