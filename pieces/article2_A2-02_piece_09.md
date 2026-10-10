# Android_Main_Features_Radio_Positioning — Piece 09/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 09 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## REPEATED ERROR PATTERNS — BUILD ENVIRONMENT

### E001: JAVA_HOME Invalid (Every Session)
- **Error:** `JAVA_HOME is set to an invalid directory`
- **Frequency:** Every session (sandbox reset)
- **Root Cause:** Cloud environment resets wipe Java installation
- **Solution:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64` in every session
- **Time Lost:** High
- **Best Practice:** Always export before any build command

### E002: sdkmanager Not Found (Every Session)
- **Error:** `sdkmanager: command not found`
- **Frequency:** Every session
- **Root Cause:** cmdline-tools not at `latest/` subdirectory
- **Solution:** `mv cmdline-tools/cmdline-tools cmdline-tools/latest`
- **Time Lost:** High
- **Critical:** Hardcoded path requirement in build scripts

### E003: License Acceptance EPIPE (Every Session)
- **Error:** `yes | sdkmanager --licenses` fails with EPIPE
- **Frequency:** Every session
- **Root Cause:** sdkmanager closes stdin during license acceptance
- **Solution 1:** `printf 'y\ny\ny\ny\ny\ny\ny\ny\n' | sdkmanager --licenses`
- **Solution 2 (Faster):** License hash bypass
  ```bash
  echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > \
    $ANDROID_HOME/licenses/android-sdk-license
  ```

---

## REPEATED ERROR PATTERNS — GRADLE (v1.0.80-1.0.85)

### E004: AGP 8.2 Incompatibility
- **Error:** `Could not resolve all files for configuration — checkDebugAarMetadata`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** AGP 8.2 breaks with Gradle 8.4+
- **Solution:** Pin to AGP 8.1.0 + Gradle 8.4 (stable)
- **Time Lost:** High

### E005: Unresolved Reference: components
- **Error:** `Unresolved reference: components`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** Importing non-existent package
- **Solution:** Remove unused imports
- **Time Lost:** Low

### E006: Theme.Material.NoActionBar Crash
- **Error:** `Theme.Material.NoActionBar` crash on launch
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** AppCompatActivity without appcompat dependency
- **Solution:** Use plain `Activity()` with `@android:style/Theme.Material.NoActionBar`
- **Time Lost:** High

### E007: APK Installs But Immediately Closes
- **Error:** APK installs but crashes immediately
- **Versions:** 1.0.80-1.0.85
- **Root Causes (3):**
  1. Theme resource not found
  2. Missing adaptive icon
  3. Crash in onCreate before setContentView
- **Solution:** Use `@android:style/Theme.Material.NoActionBar` + create adaptive icon XML + call setContentView first
- **Time Lost:** High

### E008: Manifest Merger Failed — Icon Not Found
- **Error:** `Manifest merger failed — android:icon not found`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** `@mipmap/ic_launcher` referenced but no icon files
- **Solution:** Create adaptive icon XML in `res/mipmap-anydpi-v26/ic_launcher.xml`
- **Time Lost:** Medium

---

## REPEATED ERROR PATTERNS — RUNTIME (v1.0.80-1.0.85)

### E009: Wi-Fi Scan Returns No Results (API33+)
- **Error:** `WifiManager startScan() returns no results`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** API33 NEARBY_WIFI_DEVICES permission missing
- **Solution:** Add NEARBY_WIFI_DEVICES with neverForLocation flag
- **Time Lost:** High
- **Best Practice:** BP006 (revert to v1.0.3 pattern)

---

## PIECE 09 SUMMARY
This piece documents the top repeated error patterns: Build environment (JAVA_HOME, sdkmanager path, license EPIPE — every session), Gradle/AGP issues (v1.0.80-1.0.85, fixed by pinning AGP 8.1.0), Theme/icon crashes (fixed by using plain Activity + adaptive icons), and API33 Wi-Fi permission (NEARBY_WIFI_DEVICES). These errors consumed significant time and their solutions are now codified in best practices.

**Next Piece (10):** Runtime Errors — BT Scan Death, EKF Bug, OOM, Trail Noise