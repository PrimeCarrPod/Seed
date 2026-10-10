# SDK_Tools_Methods_Build_Pipeline — Piece 10/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 10 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## BEST PRACTICES (from Section 5)

### BP001: No-Gradle aapt2 Pipeline
- Use aapt2/d8/zipalign/apksigner directly
- 4-second builds vs minutes with Gradle
- Transparent, reproducible, no AGP version hell

### BP002: Pin SDK Versions
- compileSdk 33, build-tools 33.0.1, platform android-33
- Match build-tools to compileSdk major version
- Stable builds across sessions/environments

### BP003: Auto-Generate Debug Keystore
- build.sh checks and creates if missing
- Build never fails on missing keystore
- `keytool -genkey -alias androiddebugkey ...`

### BP004: Inject Assets via Zip
- aapt2 link doesn't include assets/
- `zip -r base.apk assets/` after link
- HTML/JS/CSS included in APK

### BP005: javac -source 11 -target 11
- Works on JDK 17, targets Android compatibility
- Don't use newer source levels

---

## ANTI-PATTERNS (from Section 5)

### CP001: Using Gradle for Simple App
- v1.0.80-1.0.85: Slow builds, AGP version hell
- Fix: Use no-Gradle aapt2 instead

### CP002: Hardcoding SDK Paths
- Breaks on different machines/environments
- Fix: Use ANDROID_HOME detection in build.sh

### CP003: Not Matching build-tools to compileSdk
- Causes build failures
- Fix: Always match versions (33.0.1 for compileSdk 33)

### CP004: API33 NEARBY_WIFI_DEVICES without neverForLocation
- v1.0.80-1.0.85: Permission denied, scan fails
- Fix: Add flag or revert to v1.0.3 pattern

---

## TOOL-SPECIFIC BEST PRACTICES

### aapt2
- Use `--auto-add-overlay` for resource merging
- Compile resources first, then link
- Keep resources in res/ (not assets/)

### d8
- Always specify `--min-api` matching minSdk (24)
- Use `--lib android.jar` for compilation
- Output to separate directory (`--output obj`)

### zipalign
- Always use `-p -f 4` (page-align, force, 4-byte)
- Run AFTER d8, BEFORE apksigner
- Required for Play Store

### apksigner
- Auto-gen debug keystore if missing (BP003)
- Use `--ks-pass pass:android --key-pass pass:android` for automation
- Verify with `apksigner verify`

### sdkmanager
- Always use license hash bypass (not interactive)
- Install cmdline-tools at `latest/` subdirectory
- Pin versions: `platforms;android-33` not `platforms;android-34`

---

## PIECE 10 SUMMARY
This piece summarizes the SDK/Tools related best practices (BP001-BP005: no-Gradle pipeline, pinned versions, auto keystore, asset zip injection, javac compatibility) and anti-patterns (CP001-CP004: Gradle for simple app, hardcoded paths, mismatched build-tools, API33 permission flag). Tool-specific practices for aapt2, d8, zipalign, apksigner, and sdkmanager ensure reliable, fast builds.

**Next Piece (11):** Error Patterns Specific to SDK/Tools