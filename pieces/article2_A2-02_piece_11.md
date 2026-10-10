# Android_Main_Features_Radio_Positioning — Piece 11/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 11 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## REPEATED ERROR PATTERNS — GPS & SENSORS

### E019: GPS Speed Zero When Stationary (Zero-Fix)
- **Error:** `GPS speed shows 0 when stationary (zero-fix)`
- **Versions:** 1.0.4-1.0.26
- **Frequency:** Every run
- **Root Cause:** GPS provider returns 0 speed when stationary
- **Solution:** Speed threshold > 1mph for trail recording (v1.0.27)
- **Time Lost:** Low
- **Note:** Expected GPS behavior, not a bug — filter it

### E020: Azimuth Wrap-Around at 0/360 Boundary
- **Error:** `Azimuth wrap-around at 0/360 boundary`
- **Versions:** 1.0.25-1.0.91
- **Frequency:** Every run
- **Root Cause:** Sensor orientation jumps 359→0 degrees
- **Solution:** Add wrap handling: if diff > 180, adjust by 360 (v1.0.25)
- **Time Lost:** Medium
- **Best Practice:** BP007 — Standard sensor fusion fix

---

## REPEATED ERROR PATTERNS — GRADLE JAVA & R CLASS

### E021: Gradle Cannot Find Java
- **Error:** `Gradle cannot find Java`
- **Versions:** 1.0.80-1.0.85
- **Frequency:** Multiple
- **Root Cause:** JAVA_HOME not exported before Gradle
- **Solution:** `export JAVA_HOME` before `gradlew`
- **Time Lost:** Medium

### E022: Unresolved Reference: R (Generated)
- **Error:** `Unresolved reference: R (generated)`
- **Versions:** 1.0.80-1.0.85
- **Frequency:** Occasional
- **Root Cause:** aapt2 link didn't generate R.java
- **Solution:** Verify aapt2 link --java output dir
- **Time Lost:** Low

---

## REPEATED ERROR PATTERNS — PERMISSIONS (API31+)

### E023: Bluetooth Permissions Denied (API31+)
- **Error:** `Bluetooth permissions denied on API31+`
- **Versions:** 1.0.48-1.0.91
- **Frequency:** Every run
- **Root Cause:** Missing BLUETOOTH_SCAN/CONNECT/ADVERTISE
- **Solution:** Add all three modern BT permissions
- **Time Lost:** High
- **Best Practice:** BP013 — Comprehensive permissions (15 total)

### E024: Background Location Permission Denied
- **Error:** `Background location permission denied`
- **Versions:** 1.0.29-1.0.91
- **Frequency:** Every run
- **Root Cause:** Missing ACCESS_BACKGROUND_LOCATION
- **Solution:** Add permission for API29+
- **Time Lost:** High

---

## REPEATED ERROR PATTERNS — BUILD TOOLS MISSING

### E025: zipalign Command Not Found
- **Error:** `zipalign: command not found`
- **Versions:** 1.0.0-1.0.91
- **Frequency:** Every session
- **Root Cause:** build-tools not installed or wrong version
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

### E026: apksigner Command Not Found
- **Error:** `apksigner: command not found`
- **Versions:** 1.0.0-1.0.91
- **Frequency:** Every session
- **Root Cause:** build-tools not installed
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

---

## PIECE 11 SUMMARY
This piece covers GPS zero-fix (expected behavior, filter with speed threshold), azimuth wrap-around (standard sensor fusion fix), Gradle Java/R class issues (export JAVA_HOME first), Bluetooth permissions (API31+ requires 3 new perms), background location (API29+), and build tools missing (zipalign/apksigner — install build-tools;33.0.1). The permission patterns are now comprehensive (15 total, BP013).

**Next Piece (12):** Minor Errors — BT Name, CatmullRom Points, Bloom Mobile, Platform Jar