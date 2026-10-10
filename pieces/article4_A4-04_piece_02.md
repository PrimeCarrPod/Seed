# SDK_Tools_Methods_Build_Pipeline — Piece 02/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 02 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## ZIPALIGN & APKSIGNER

### zipalign (APK Alignment)
- **Version:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** 4-byte align APK for mmap performance
- **Command:** `zipalign -p -f 4 input.apk output.apk`
- **Flags:** `-p` (page-align), `-f` (force overwrite), `4` (4-byte alignment)
- **Known Issue:** None
- **Best Practice:** 4-byte alignment mandatory for Play Store

### apksigner (APK Signing)
- **Version:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Sign APK with debug/release keystore
- **Command:** `apksigner sign --ks debug.keystore --ks-pass pass:android --key-pass pass:android --out signed.apk aligned.apk`
- **Known Issue:** None
- **Best Practice:** Auto-gen debug keystore (BP003), release keystore separate (TD-08)

---

## CMDLINE-TOOLS (SDK MANAGER)

### cmdline-tools (latest)
- **Version Required:** latest
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** sdkmanager command for SDK installation
- **Path:** `$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager`
- **Critical Setup:** MUST be at `latest/` subdirectory
- **Fix:** `mv cmdline-tools/cmdline-tools cmdline-tools/latest`
- **Known Issue:** Hardcoded path requirement, breaks if not at latest/
- **Workaround:** Always verify/move after unzip
- **Best Practice:** Hardcoded path requirement — automate in setup

---

## GRADLE & ANDROID GRADLE PLUGIN (v1.0.80+)

### Gradle
- **Version:** 8.4 / 8.5
- **First Used:** 1.0.80 | **Last Used:** 1.0.91
- **Purpose:** Alternative build system (multi-module)
- **Install:** `wget https://services.gradle.org/distributions/gradle-8.5-bin.zip`
- **Known Issue:** AGP 8.2 incompatibility
- **Workaround:** Use AGP 8.1.0 + Gradle 8.4
- **Best Practice:** AGP 8.1.0 + Gradle 8.4/8.5 stable
- **Environment Notes:** Only for multi-module projects

### Android Gradle Plugin (AGP)
- **Version:** 8.1.0
- **First Used:** 1.0.80 | **Last Used:** 1.0.91
- **Purpose:** Gradle-based Android builds
- **Config:** `id("com.android.application") version "8.1.0" apply false` in settings.gradle.kts
- **Known Issue:** AGP 8.2 breaks `checkDebugAarMetadata` (E004)
- **Workaround:** Pin to 8.1.0
- **Best Practice:** Only for Gradle builds, not needed for no-Gradle

### Kotlin
- **Version:** 1.9.22
- **First Used:** 1.0.80 | **Last Used:** 1.0.91
- **Purpose:** Kotlin compilation (if using Kotlin modules)
- **Config:** `id("org.jetbrains.kotlin.android") version "1.9.22" apply false`
- **Known Issue:** None with AGP 8.1.0
- **Best Practice:** Match AGP version

---

## PIECE 02 SUMMARY
This piece covers zipalign (4-byte alignment), apksigner (debug/release signing), cmdline-tools (critical: must be at latest/ subdirectory), and the Gradle ecosystem (Gradle 8.4/8.5, AGP 8.1.0, Kotlin 1.9.22) used only in v1.0.80+ for multi-module experiments. The no-Gradle pipeline (aapt2/d8/zipalign/apksigner) remains primary.

**Next Piece (03):** License Management — Acceptance, Hash Bypass, Environment Variables