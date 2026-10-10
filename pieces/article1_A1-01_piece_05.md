# HTML_Aspects_ThreeJS_Visualization — Piece 05/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 05 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## WI-FI SCANNER PANEL (v1.0.38 → v1.0.91)

### Wi-Fi Scanner Panel
- **First Version:** 1.0.38 | **Last Version:** 1.0.91
- **Features:** Real-time AP list with live zone classification
- **Zones:** IMMEDIATE (< -55 dBm) / NEAR (-55 to -70) / FAR (> -70)
- **Connects to Android via:** MainActivity→JS: AP list (onWifiResult)
- **Update Frequency:** Every Wi-Fi scan (~2-5 seconds)
- **Performance:** Accurate zone colors, smooth list updates
- **Worked Well:** Clear visual hierarchy, actionable info
- **Issues:** None
- **Solution:** Direct data binding from scan results

### Zone Classification Colors
- **IMMEDIATE:** Red (#ff4444) — within ~10m
- **NEAR:** Yellow (#ffaa00) — within ~30m
- **FAR:** Green (#44ff44) — beyond ~30m

---

## BROADCAST STATUS BAR (v1.0.20 → v1.0.91)

### Broadcast Status Bar
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Display:** 4-slot rotating SSID display (shows current TX SSID)
- **Slots:** SLOT 0, 1, 2, 3 — each 5.1s duty cycle
- **Connects to Android via:** MainActivity→JS: broadcastStatus (onBroadcastStatus)
- **Update Frequency:** Every slot change (5.1s)
- **Performance:** Clear feedback on what's broadcasting
- **Worked Well:** Users know exactly what's being transmitted
- **Issues:** Slot timing drift in early versions
- **Solution:** Fixed 5.1s duty cycle (2.5s ON + 2.6s OFF) in v1.0.20

---

## UPDATE NOTIFICATION PANEL (v1.0.91 → v1.0.91)

### Update Notification Panel
- **First Version:** 1.0.91 | **Last Version:** 1.0.91
- **Features:** CHECK UPDATE button + version display
- **Connects to Android via:** MainActivity→JS: updateAvailable (onUpdateAvailable)
- **Trigger:** Manual user action (auto-check removed in v1.0.93)
- **Worked Well:** User control over updates
- **Issues:** Auto-check on startup caused permission prompts
- **Solution:** Manual trigger only (moved to TGAPP in v1.0.93+)

---

## PIECE 05 SUMMARY
This piece covers the data-display panels: Wi-Fi Scanner (real-time AP list with zone classification), Broadcast Status Bar (4-slot SSID rotation with fixed 5.1s duty cycle), and Update Notification Panel (manual update check, moved to TGAPP). These panels surface Android-side data to the user through the JS bridge.

**Next Piece (06):** Chart.js Metrics + GLSL Shaders + Post-Processing Pipeline