# Android_Main_Features_Radio_Positioning — Piece 10/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 10 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## REPEATED ERROR PATTERNS — BLUETOOTH & POSITIONING

### E010: Bluetooth LE Scan Dies (~10 Seconds)
- **Error:** `Bluetooth LE scan dies after ~10 seconds`
- **Versions:** 1.0.48-1.0.64
- **Frequency:** Every run
- **Root Cause:** Android kills continuous BLE scan to save battery
- **Solution:** Restart scan every 5s with Handler.postDelayed (v1.0.65)
- **Time Lost:** High
- **Best Practice:** BP008 — 5s restart cycle mandatory
- **Anti-Pattern:** CP005 — Scan without restart cycle

### E011: EKF Velocity vy Not Initialized
- **Error:** `EkF velocity vy not initialized (x[2]=0; x[2]=0;)`
- **Versions:** 1.0.90-1.0.91
- **Frequency:** Every run
- **Root Cause:** Copy-paste typo in PositionEKF.java:38
- **Solution:** Change second `x[2]=0` to `x[3]=0` (v1.0.92)
- **Time Lost:** Medium
- **Critical:** P0-01 — ALWAYS verify array indices
- **Anti-Pattern:** CP008 — Array index typo

### E012: OutOfMemoryError — WebGL Context Lost
- **Error:** `OutOfMemoryError: WebGL context lost`
- **Versions:** 1.0.49-1.0.53 (trail recording)
- **Root Cause:** Three.js geometry/material not disposed on rebuild
- **Solution:** Add `geometry.dispose() + material.dispose()` on rebuild (v1.0.54)
- **Time Lost:** High
- **Best Practice:** BP016 — GPU-safe disposal
- **Anti-Pattern:** CP009 — Not disposing Three.js objects

### E013: Trail Recording Creates Noisy Path
- **Error:** `Trail recording creates noisy path when stationary`
- **Versions:** 1.0.49-1.0.55
- **Frequency:** Every run
- **Root Cause:** GPS records 0-speed points (zero-fix)
- **Solution:** Only record when speed > 1mph (v1.0.56)
- **Time Lost:** Medium
- **Best Practice:** BP010 — Speed threshold filter
- **Anti-Pattern:** CP010 — Trail without speed threshold

---

## REPEATED ERROR PATTERNS — BUILD & BRIDGE

### E014: aapt2 Link Fails — Resource Not Found
- **Error:** `aapt2 link fails: resource not found`
- **Versions:** 1.0.0-1.0.91 (occasional)
- **Root Cause:** Missing res/ directories or wrong paths
- **Solution:** Verify res/ structure matches AndroidManifest
- **Time Lost:** Medium

### E016: WebView JavaScript Bridge Silent Failures
- **Error:** `WebView JavaScript bridge silent failures`
- **Versions:** 1.0.0-1.0.51
- **Frequency:** Frequent
- **Root Cause:** No try/catch on evaluateJavascript
- **Solution:** Add try/catch + window.onerror handler (v1.0.52)
- **Time Lost:** High
- **Best Practice:** BP015 — HTML try/catch wrapper mandatory
- **Anti-Pattern:** CP012 — No error handling on JS bridge calls

---

## REPEATED ERROR PATTERNS — TIMING & WI-FI DIRECT

### E017: SSID Broadcast Timing Drift
- **Error:** `SSID broadcast timing drift`
- **Versions:** 1.0.13-1.0.19
- **Frequency:** Every run
- **Root Cause:** Handler.postDelayed accumulation
- **Solution:** Fixed 5.1s duty cycle with single timer (v1.0.20)
- **Time Lost:** Medium
- **Best Practice:** BP012 — Fixed duty cycle

### E018: Wi-Fi Direct Group Owner Creation Fails
- **Error:** `Wi-Fi Direct Group Owner creation fails`
- **Versions:** 1.0.13
- **Frequency:** Few
- **Root Cause:** Single method (WifiP2pConfig.Builder)
- **Solution:** Multi-method fallback: Builder → Reflection → Bonjour (v1.0.14)
- **Time Lost:** Medium
- **Best Practice:** BP011 — Multi-method fallback
- **Anti-Pattern:** CP007 — Single-method Wi-Fi Direct

---

## PIECE 10 SUMMARY
This piece covers runtime errors: BT scan death (fixed by 5s restart cycle BP008), EKF vy bug (copy-paste typo, fixed v1.0.92 P0-01), OOM from Three.js (fixed by GPU disposal BP016), noisy GPS trail (fixed by speed > 1mph BP010), aapt2 resource issues, WebView bridge silent failures (fixed by try/catch BP015), SSID timing drift (fixed by fixed cycle BP012), and Wi-Fi Direct failures (fixed by multi-method fallback BP011). Each error has a documented solution now in the codebase.

**Next Piece (11):** GPS Zero-Fix, Azimuth Wrap, Gradle Java, Permissions Denied