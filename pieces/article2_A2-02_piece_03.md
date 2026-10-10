# Android_Main_Features_Radio_Positioning — Piece 03/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 03 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## WEBVIEW + JAVASCRIPT BRIDGE — CORE ARCHITECTURE (v1.0.0 → v1.0.91)

### WebView + JavaScript Bridge
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Key Classes:** WebView + @JavascriptInterface
- **Key Method:** addJavascriptInterface(Bounce, "Bounce")
- **Permission:** INTERNET
- **Connects to HTML via:** Bidirectional JS↔Android (C025)
- **Worked Well:** Stable bridge since v1.0.0
- **Issues:** Silent failures on JS errors (E016)
- **Solution:** HTML try/catch wrapper + window.onerror (BP015, fixed v1.0.52)

### Bridge Architecture
```java
// Android side - MainActivity
public class Bounce {
    @JavascriptInterface
    public void setVehicleData(String json) { ... }
    
    @JavascriptInterface
    public String getTrajectory(String addr) { ... }
    
    @JavascriptInterface
    public void toggleBroadcast() { ... }
}

// HTML side - bounce.html
// window.Bounce injected automatically
Bounce.setVehicleData(json);
const trajectory = Bounce.getTrajectory(addr);
```

### Android → HTML (Push)
```java
webView.evaluateJavascript(
    "javascript:UI.updateWifiList(" + json + ")", 
    null
);
```

### HTML → Android (Call)
```javascript
Bounce.setCameraMode('fly');  // Direct @JavascriptInterface call
```

---

## AUTO-UPDATE SYSTEM — MANUAL TRIGGER (v1.0.91 → v1.0.93)

### Auto-Update System
- **First Version:** 1.0.91 | **Last Version:** 1.0.93 (moved to TGAPP)
- **Key Classes:** GitHub API version check
- **Key Methods:** onUpdateAvailable() + UI.showUpdateMenu()
- **Permission:** INTERNET
- **Connects to HTML via:** JS bridge: Bounce.onUpdateAvailable() (C007)
- **Feature:** Manual update button + version display
- **Worked Well:** User control over updates
- **Issues:** Auto-check on startup caused permission prompts
- **Solution:** Manual trigger only (moved to TGAPP in v1.0.93)

### Update Flow
```
User clicks "CHECK UPDATE"
  → Android: GitHub API GET /repos/owner/repo/releases/latest
  → Compare versionName with current
  → If newer: JS bridge → UI.showUpdateMenu(version, url)
  → User clicks "DOWNLOAD" → TGAPP handles download/install
  → User clicks "IGNORE" → Dismiss until next check
```

---

## DEBUG KEYSTORE AUTO-GENERATION (v1.0.0 → v1.0.91)

### Debug Keystore Auto-Gen
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Tool:** keytool (JDK 17)
- **Key Method:** genkey -alias androiddebugkey -keystore debug.keystore
- **Permission:** None
- **Connects to Build via:** Build script auto-generation
- **Feature:** Auto-signs APK if keystore missing
- **Worked Well:** Build never fails on missing keystore
- **Issues:** Single debug keystore only (no release signing)
- **Solution:** Separate release keystore needed (TD-08, RF021)

### Build.sh Keystore Logic
```bash
if [ ! -f debug.keystore ]; then
    keytool -genkey -v -keystore debug.keystore \
        -alias androiddebugkey \
        -keyalg RSA -keysize 2048 \
        -validity 10000 \
        -dname "CN=Android Debug,O=Android,C=US" \
        -storepass android -keypass android
fi
```

---

## PIECE 03 SUMMARY
This piece covers the core WebView+JS Bridge architecture (stable since v1.0.0, stabilized with try/catch in v1.0.52), Auto-Update System (v1.0.91 manual trigger, moved to TGAPP), and Debug Keystore Auto-Generation (v1.0.0, auto-signs APKs). The bridge is the critical communication layer — 30 connections mapped in Section 3.

**Next Piece (04):** No-Gradle Build Pipeline (aapt2) + RSSI Kalman Filter