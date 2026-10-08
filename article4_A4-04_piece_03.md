# SDK_Tools_Methods_Build_Pipeline — Piece 03/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 03 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## LICENSE MANAGEMENT

### sdkmanager Licenses (Interactive)
- **Tool:** sdkmanager --licenses
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Problem:** `yes | sdkmanager --licenses` fails with EPIPE (E003)
- **Root Cause:** sdkmanager closes stdin during license acceptance
- **Solution 1 (printf):**
  ```bash
  printf 'y\ny\ny\ny\ny\ny\ny\ny\n' | sdkmanager --licenses
  ```
- **Solution 2 (License Hash Bypass):**
  ```bash
  echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > \
    $ANDROID_HOME/licenses/android-sdk-license
  echo "84831b9409646a918e30573bab4c9c91346d8abd" > \
    $ANDROID_HOME/licenses/android-sdk-preview-license
  ```
- **SHA-1 Hash:** `8933bad161af4178b1185d1a37fbf41ea5269c55` (android-sdk-license)
- **Best Practice:** License hash bypass faster than interactive

### License Hash Bypass (Automated)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Skip interactive license acceptance
- **Method:** Write SHA-1 to license files in `$ANDROID_HOME/licenses/`
- **Files:**
  - `android-sdk-license` → `8933bad161af4178b1185d1a37fbf41ea5269c55`
  - `android-sdk-preview-license` → `84831b9409646a918e30573bab4c9c91346d8abd`
- **Known Issue:** None
- **Best Practice:** Faster than interactive, works in CI/CD

---

## ENVIRONMENT VARIABLES

### ANDROID_HOME
- **Purpose:** SDK location for all tools
- **Format:** `export ANDROID_HOME=/path/to/android-sdk`
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Detection:** build.sh auto-detects common paths
- **Common Paths:**
  - `/opt/android-sdk`
  - `$HOME/Android/Sdk`
  - `/usr/local/android-sdk`
- **Known Issue:** Path varies per environment
- **Best Practice:** Set in build.sh with fallback detection

### JAVA_HOME
- **Purpose:** JDK location for javac, keytool, gradle
- **Format:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64`
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Known Issue:** Reset every session (sandbox)
- **Workaround:** Export in every session, add to build.sh
- **Best Practice:** Always export before any build command

### local.properties (Gradle Only)
- **Purpose:** Gradle SDK path
- **Format:** `sdk.dir=/path/to/android-sdk`
- **First Used:** 1.0.80 | **Last Used:** 1.0.91
- **Known Issue:** Must match ANDROID_HOME
- **Workaround:** Generate in build script
- **Best Practice:** Only for Gradle builds

---

## SDK VERSION CONSTANTS

### compileSdk / targetSdk / minSdk
| Constant | Value | Since | Purpose |
|----------|-------|-------|---------|
| compileSdk | 33 | 1.0.0 | Compilation target API |
| targetSdk | 33 | 1.0.0 | Runtime target API |
| minSdk | 24 | 1.0.0 | Minimum Android version (7.0) |

### Version Policy
- **compileSdk = targetSdk = 33** (Android 13)
- **minSdk = 24** (99.3% device coverage)
- **Build Tools = 33.0.1** (must match compileSdk)
- **Google Play:** targetSdk 35 required Aug 2026 (update needed)

---

## PIECE 03 SUMMARY
This piece covers license management (interactive EPIPE failure, printf workaround, license hash bypass with SHA-1), environment variables (ANDROID_HOME auto-detection, JAVA_HOME mandatory export, local.properties for Gradle), and SDK version constants (compileSdk/targetSdk 33, minSdk 24, build-tools 33.0.1). The license hash bypass is the recommended approach for automation.

**Next Piece (04):** Build Script (build.sh) — No-Gradle Pipeline Deep Dive