# SDK Tools Methods Build Pipeline — Complete Article
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Generated:** 2026-10-08 04:43:03 UTC  
**Structure:** 13 pieces concatenated  
**Target:** ≥350 lines

---

# SDK_Tools_Methods_Build_Pipeline — Piece 01/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 01 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## JDK & JAVA TOOLCHAIN

### JDK 17 (OpenJDK)
- **Version Required:** 17
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Java compilation (javac) + keytool for debug keystore
- **Configuration:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64`
- **Install Command:** `apt-get install openjdk-17-jdk-headless`
- **Known Issue:** JAVA_HOME reset on sandbox every session
- **Workaround:** Export in every session / build script
- **Best Practice:** Always export before build, use `/usr/lib/jvm/java-17-openjdk-amd64`
- **Environment Notes:** Cloud environments lose Java on reset

### javac (Java Compiler)
- **Version:** JDK 17 (javac 17.x)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Compile .java → .class files
- **Flags:** `-source 11 -target 11` (BP005 — compatibility)
- **Bootstrap:** Uses android.jar from SDK platform
- **Known Issue:** None with fixed flags
- **Best Practice:** Don't use newer source levels (breaks on older Android)

### keytool (Keystore Management)
- **Version:** JDK 17 included
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Debug keystore generation
- **Command:** `keytool -genkey -alias androiddebugkey -keystore debug.keystore -storepass android -keypass android -dname "CN=Android Debug,O=Android,C=US" -keyalg RSA -keysize 2048 -validity 10000`
- **Known Issue:** None
- **Best Practice:** Auto-generate if missing (BP003), separate release keystore needed (TD-08)

---

## ANDROID SDK PLATFORM

### Android SDK Platform (android-33)
- **Version Required:** android-33 (API 33 / Android 13)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** android.jar for compilation target
- **Path:** `$ANDROID_HOME/platforms/android-33/android.jar`
- **Install Command:** `sdkmanager "platforms;android-33"`
- **Known Issue:** Missing in cloud environments
- **Workaround:** Download manually if sdkmanager fails
- **Best Practice:** Pin to api-33 (compileSdk 33)
- **Environment Notes:** Required for compileSdk 33, targetSdk 33

---

## BUILD TOOLS (AAPT2, D8, ZIPALIGN, APKSIGNER)

### Build Tools 33.0.1
- **Version Required:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Components:** aapt2, d8, zipalign, apksigner
- **Path:** `$ANDROID_HOME/build-tools/33.0.1/`
- **Install Command:** `sdkmanager "build-tools;33.0.1"`
- **Known Issue:** Only 34.0.0 (with renderscript) in some envs
- **Workaround:** Install 33.0.1 explicitly
- **Best Practice:** Match build-tools to compileSdk version
- **Critical For:** No-Gradle build pipeline

### aapt2 (Android Asset Packaging Tool v2)
- **Version:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Resource compilation + linking
- **Step 1:** `aapt2 compile --dir res -o resources.zip`
- **Step 2:** `aapt2 link -o base.apk -I android.jar --manifest AndroidManifest.xml -R resources.zip --auto-add-overlay --java src/main/java`
- **Known Issue:** None with correct paths
- **Best Practice:** Use `--auto-add-overlay`

### d8 (Dex Compiler)
- **Version:** 33.0.1
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** .class → .dex conversion
- **Command:** `d8 --lib android.jar --min-api 24 --output obj classes`
- **Known Issue:** None
- **Best Practice:** Use `--min-api` matching minSdk (24)

---

## PIECE 01 SUMMARY
This piece covers the Java toolchain (JDK 17, javac with source/target 11, keytool), Android SDK Platform (android-33, required for compilation), and Build Tools 33.0.1 (aapt2 for resource compilation/linking, d8 for dex conversion). These are the foundation of the no-Gradle build pipeline.

**Next Piece (02):** zipalign, apksigner, cmdline-tools, Gradle/AGP/Kotlin
---

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
---

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
---

# SDK_Tools_Methods_Build_Pipeline — Piece 04/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 04 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## BUILD.SH — NO-GRADLE PIPELINE (109 LINES)

### Pipeline Overview (4 Seconds Total)
```bash
#!/bin/bash
# build.sh — No-Gradle aapt2 pipeline
# v1.0.0 → v1.0.91: Stable, fast, transparent

set -e

# 0. Setup paths
detect_sdk_paths
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# 1. aapt2 compile resources
aapt2 compile --dir res -o resources.zip

# 2. aapt2 link → base.apk (no assets yet)
aapt2 link -o base.apk \
  -I $ANDROID_HOME/platforms/android-33/android.jar \
  --manifest AndroidManifest.xml \
  -R resources.zip \
  --auto-add-overlay \
  --java src/main/java

# 3. Inject assets (HTML, JS, CSS) via zip
zip -r base.apk assets/

# 4. javac compile Java
javac -source 11 -target 11 \
  -d obj \
  -cp $ANDROID_HOME/platforms/android-33/android.jar \
  src/main/java/com/carrpod/bounce/*.java

# 5. d8 dex conversion
d8 --lib $ANDROID_HOME/platforms/android-33/android.jar \
  --min-api 24 \
  --output obj \
  obj/com/carrpod/bounce/*.class

# 6. zipalign
zipalign -p -f 4 base.apk aligned.apk

# 7. apksigner
apksigner sign --ks debug.keystore \
  --ks-pass pass:android \
  --key-pass pass:android \
  --out Bounce-v${VERSION}.apk \
  aligned.apk

# 8. Verify & size
SIZE=$(stat --printf="%s" Bounce-v${VERSION}.apk)
echo "Build complete: ${SIZE} bytes"
```

### Step-by-Step Breakdown

| Step | Tool | Input | Output | Time |
|------|------|-------|--------|------|
| 1 | aapt2 compile | res/ | resources.zip | ~0.5s |
| 2 | aapt2 link | resources.zip + manifest | base.apk (no assets) | ~1s |
| 3 | zip | base.apk + assets/ | base.apk (with assets) | ~0.5s |
| 4 | javac | .java files | .class files | ~1s |
| 5 | d8 | .class files | classes.dex | ~0.5s |
| 6 | zipalign | base.apk | aligned.apk | ~0.3s |
| 7 | apksigner | aligned.apk + keystore | signed.apk | ~0.2s |
| **Total** | | | | **~4s** |

---

## ASSET INJECTION (STEP 3 — CRITICAL)

### Why Zip Injection?
- aapt2 link doesn't include assets/ by default
- zip -r adds assets/ after link
- Assets: bounce.html, js/, css/ (all local, BP014)

### Assets Structure
```
assets/
├── bounce.html          # Main entry (2200 lines)
├── js/
│   ├── three.min.js     # Three.js r128 (~200KB)
│   ├── OrbitControls.js
│   ├── EffectComposer.js
│   ├── UnrealBloomPass.js
│   ├── ShaderPass.js
│   ├── CopyShader.js
│   ├── LuminosityHighPassShader.js
│   └── Chart.min.js     # Chart.js (~150KB)
└── css/
    └── bounce.css       # All styling
```

---

## PIECE 04 SUMMARY
This piece provides the complete build.sh no-Gradle pipeline (109 lines, 4-second builds): aapt2 compile → aapt2 link → zip asset injection → javac → d8 → zipalign → apksigner. The critical step 3 (zip asset injection) adds HTML/JS/CSS after aapt2 link. All tools use pinned versions (JDK 17, build-tools 33.0.1, platform android-33) for reproducibility.

**Next Piece (05):** SDK Path Detection & Auto-Setup in build.sh
---

# SDK_Tools_Methods_Build_Pipeline — Piece 05/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 05 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## SDK PATH DETECTION IN BUILD.SH

### Auto-Detection Function
```bash
detect_sdk_paths() {
    # Priority order for ANDROID_HOME
    local candidates=(
        "/opt/android-sdk"
        "$HOME/Android/Sdk"
        "/usr/local/android-sdk"
        "/android-sdk"
        "$ANDROID_SDK_ROOT"
    )
    
    for path in "${candidates[@]}"; do
        if [ -d "$path/platforms/android-33" ] && [ -d "$path/build-tools/33.0.1" ]; then
            export ANDROID_HOME="$path"
            echo "Found Android SDK at: $ANDROID_HOME"
            return 0
        fi
    done
    
    # Fallback: try to install
    echo "Android SDK not found, attempting install..."
    install_android_sdk
}

install_android_sdk() {
    local sdk_dir="/opt/android-sdk"
    mkdir -p "$sdk_dir"
    cd "$sdk_dir"
    
    # Download cmdline-tools
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
    unzip -q commandlinetools-linux-11076708_latest.zip
    mv cmdline-tools cmdline-tools/latest  # CRITICAL: must be at latest/
    
    export ANDROID_HOME="$sdk_dir"
    export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
    
    # Accept licenses (hash bypass)
    mkdir -p "$ANDROID_HOME/licenses"
    echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
    echo "84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
    
    # Install required components
    sdkmanager "platforms;android-33" "build-tools;33.0.1"
}
```

### Tool Path Variables
```bash
# After detect_sdk_paths(), all tools resolved:
AAPT2="$ANDROID_HOME/build-tools/33.0.1/aapt2"
D8="$ANDROID_HOME/build-tools/33.0.1/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/33.0.1/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/33.0.1/apksigner"
ANDROID_JAR="$ANDROID_HOME/platforms/android-33/android.jar"
```

---

## COMMON BUILD ISSUES & FIXES

### Issue: "aapt2: command not found"
- **Cause:** build-tools not installed or wrong version
- **Fix:** `sdkmanager "build-tools;33.0.1"`
- **Error Code:** E025/E026

### Issue: "platforms/android-33/android.jar not found"
- **Cause:** SDK platform not installed
- **Fix:** `sdkmanager "platforms;android-33"`
- **Error Code:** E030

### Issue: "javac: command not found"
- **Cause:** JDK not installed or JAVA_HOME not set
- **Fix:** `apt-get install openjdk-17-jdk-headless && export JAVA_HOME=...`
- **Error Code:** E001

### Issue: "d8: Cannot fit requested classes in a single dex file"
- **Cause:** >64K methods (multiDex needed)
- **Fix:** Not hit in Bounce (small app), enable multiDex if needed
- **Error Code:** E015

### Issue: "zipalign: command not found" / "apksigner: command not found"
- **Cause:** build-tools not installed
- **Fix:** `sdkmanager "build-tools;33.0.1"`
- **Error Codes:** E025, E026

---

## BUILD PERFORMANCE METRICS

### Timing Breakdown (Typical Run)
```
Step 1 (aapt2 compile):     0.42s
Step 2 (aapt2 link):        0.87s
Step 3 (zip assets):        0.31s
Step 4 (javac):             0.93s
Step 5 (d8):                0.41s
Step 6 (zipalign):          0.18s
Step 7 (apksigner):         0.15s
TOTAL:                      3.27s
```

### APK Size Evolution
| Version | APK Size | Build Time |
|---------|----------|------------|
| 1.0.0 | 185 KB | ~3s |
| 1.0.50 | 198 KB | ~3.5s |
| 1.0.91 | 231 KB | ~3.3s |

---

## PIECE 05 SUMMARY
This piece covers SDK path auto-detection in build.sh (priority candidate paths, fallback install with cmdline-tools at latest/, license hash bypass), tool path variables (AAPT2, D8, ZIPALIGN, APKSIGNER, ANDROID_JAR), common build issues with fixes (aapt2, android.jar, javac, d8, zipalign, apksigner not found), and build performance metrics (3.27s average, 231 KB APK at v1.0.91). The auto-detection makes the build portable across environments.

**Next Piece (06):** Git, GitHub CLI, unzip, bc, stat, date, nohup, pkill, diff, zip, ADB
---

# SDK_Tools_Methods_Build_Pipeline — Piece 06/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 06 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## VERSION CONTROL & CI/CD TOOLS

### git
- **Version:** Latest (system)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Version control, commit, push, pull
- **Known Issue:** Contention on multi-agent environments
- **Workaround:** safe_push() retry loop in scripts
- **Best Practice:** Commit often, use GitHub handler script
- **Environment Notes:** Pre-installed in most environments

### GitHub CLI (gh)
- **Version:** Latest
- **First Used:** 1.0.91 | **Last Used:** 1.0.91
- **Purpose:** PR/merge automation, API access
- **Commands:** `gh pr create`, `gh pr merge`, `gh api repos/owner/repo/merges`
- **Known Issue:** None
- **Best Practice:** Use for merge methods (17 ways documented)
- **Environment Notes:** Pre-installed in GitHub Actions

---

## UTILITY TOOLS

### unzip
- **Version:** Latest (system)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Extract source zips for forensic analysis
- **Command:** `unzip -q file.zip -d dir`
- **Known Issue:** None
- **Best Practice:** Use `-q` for quiet output
- **Environment Notes:** Pre-installed

### bc (Basic Calculator)
- **Version:** Latest
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Build size calculation (KB display)
- **Command:** `echo "scale=1; size/1024" | bc`
- **Install:** `apt-get install bc`
- **Known Issue:** None
- **Best Practice:** Optional for KB display
- **Environment Notes:** Build script uses for size reporting

### stat (File Statistics)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** File size checking (bytes)
- **Command:** `stat --printf="%s" file`
- **Known Issue:** Format varies (GNU vs BSD)
- **Best Practice:** Use `--printf` for consistent bytes output
- **Environment Notes:** Build script uses for APK size

### date (Timestamps)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Heartbeat timestamps, build logs
- **Command:** `date -u +"%Y-%m-%d %H:%M:%S UTC"`
- **Known Issue:** Format varies by system
- **Best Practice:** Use UTC format consistently
- **Environment Notes:** Heartbeat monitor uses this

---

## PROCESS MANAGEMENT TOOLS

### nohup (Background Processes)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Background processes (heartbeat monitor)
- **Command:** `nohup bash -c 'while...' &`
- **Known Issue:** Output capture needs redirection
- **Best Practice:** Redirect to log file
- **Environment Notes:** Heartbeat PID tracking

### pkill (Process Termination)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Stop background processes
- **Command:** `pkill -f "pattern"`
- **Known Issue:** Match full command to avoid false positives
- **Best Practice:** Use specific pattern (e.g., `pkill -f "heartbeat.*BOUNCE"`)
- **Environment Notes:** Stop heartbeat monitor

---

## DIFF & ARCHIVE TOOLS

### diff (Version Diffing)
- **Version:** GNU diffutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Version diffing for forensic analysis
- **Command:** `diff -u file1 file2 > out.diff`
- **Known Issue:** None
- **Best Practice:** Unified format (-u) for readability
- **Environment Notes:** 364 diff files generated (91 versions × 4 files)

### zip (Archiving)
- **Version:** Latest
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Asset injection (build.sh) + piece zipping (GitHub handler)
- **Command:** `zip -r archive.zip dir/`
- **Known Issue:** None
- **Best Practice:** Use `-r` recursive
- **Environment Notes:** Build step 3 + zip-pieces workflow

---

## PIECE 06 SUMMARY
This piece covers version control (git with safe_push retry, gh for PR/merge automation), utility tools (unzip for forensics, bc for size calc, stat for bytes, date for UTC timestamps), process management (nohup for background heartbeat, pkill for cleanup), and diff/archive tools (diff for 364 forensic diffs, zip for asset injection and piece archiving). All are standard Linux tools, pre-installed or easily installed.

**Next Piece (07):** ADB, sdkmanager licenses, License hash bypass, ANDROID_HOME, local.properties
---

# SDK_Tools_Methods_Build_Pipeline — Piece 07/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 07 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## ADB (Android Debug Bridge)

### ADB
- **Version:** Latest (platform-tools)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Device install, logcat, debugging
- **Commands:**
  - `adb install Bounce-v1.0.91.apk`
  - `adb logcat -s BounceBridge:*`
  - `adb shell dumpsys battery`
- **Known Issue:** Device connection required
- **Workaround:** Use emulator if no physical device
- **Best Practice:** Test on real device for Bluetooth/GPS
- **Environment Notes:** Part of platform-tools, separate from build-tools

---

## LICENSE MANAGEMENT (DETAILED)

### sdkmanager Licenses (Interactive Failure)
- **Problem:** `yes | sdkmanager --licenses` → EPIPE (E003)
- **Root Cause:** sdkmanager closes stdin after first license
- **Frequency:** Every session (cloud env reset)

### Solution 1: printf (Reliable)
```bash
# 8 'y' newlines for typical license prompts
printf 'y\ny\ny\ny\ny\ny\ny\ny\n' | sdkmanager --licenses
```

### Solution 2: License Hash Bypass (Fastest)
```bash
# Write SHA-1 hashes directly to license files
mkdir -p "$ANDROID_HOME/licenses"
echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
echo "84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
```

### License Hashes Reference
| License File | SHA-1 Hash |
|--------------|------------|
| android-sdk-license | 8933bad161af4178b1185d1a37fbf41ea5269c55 |
| android-sdk-preview-license | 84831b9409646a918e30573bab4c9c91346d8abd |

### Automated License Setup (build.sh)
```bash
setup_licenses() {
    mkdir -p "$ANDROID_HOME/licenses"
    echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
    echo "84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
    echo "Licenses configured via hash bypass"
}
```

---

## ENVIRONMENT VARIABLES (COMPLETE)

### ANDROID_HOME
- **Purpose:** Root of Android SDK
- **Detection:** build.sh tries: /opt/android-sdk, $HOME/Android/Sdk, /usr/local/android-sdk
- **Fallback:** Auto-install cmdline-tools + platforms + build-tools
- **Critical For:** All SDK tools (aapt2, d8, zipalign, apksigner, sdkmanager)

### JAVA_HOME
- **Purpose:** JDK root for javac, keytool, gradle
- **Value:** `/usr/lib/jvm/java-17-openjdk-amd64`
- **Requirement:** Must be exported BEFORE any build command
- **Failure Mode:** E001 (invalid), E021 (Gradle can't find Java)

### PATH Extensions
```bash
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/build-tools/33.0.1:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
```

---

## LOCAL.PROPERTIES (GRADLE ONLY)

### Purpose
- Tells Gradle where Android SDK is
- Required for Gradle builds (v1.0.80+)

### Format
```
sdk.dir=/opt/android-sdk
```

### Generation (build.sh)
```bash
generate_local_properties() {
    cat > local.properties <<EOF
sdk.dir=$ANDROID_HOME
EOF
}
```

### Requirement
- Must match ANDROID_HOME exactly
- Only used by Gradle, ignored by no-Gradle build.sh

---

## PIECE 07 SUMMARY
This piece covers ADB (install, logcat, debugging), detailed license management (EPIPE failure with `yes`, printf workaround, license hash bypass with SHA-1 hashes for android-sdk-license and preview-license), environment variables (ANDROID_HOME detection with fallback install, JAVA_HOME mandatory export, PATH extensions), and local.properties for Gradle (sdk.dir, must match ANDROID_HOME). The license hash bypass is the recommended production approach.

**Next Piece (08):** SDK Version Constants — compileSdk, targetSdk, minSdk, Build Tools Matching
---

# SDK_Tools_Methods_Build_Pipeline — Piece 08/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 08 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## SDK VERSION CONSTANTS

### Compile / Target / Min SDK
| Constant | Value | API Level | Android Version | Since | Notes |
|----------|-------|-----------|-----------------|-------|-------|
| compileSdk | 33 | 33 | Android 13 (Tiramisu) | 1.0.0 | Compilation target |
| targetSdk | 33 | 33 | Android 13 | 1.0.0 | Runtime target |
| minSdk | 24 | 24 | Android 7.0 (Nougat) | 1.0.0 | 99.3% coverage |

### Version Matching Rules (Critical)
| Component | Version | Must Match |
|-----------|---------|------------|
| compileSdk | 33 | targetSdk, build-tools |
| build-tools | 33.0.1 | compileSdk major |
| platform | android-33 | compileSdk |
| minSdk | 24 | — (lower bound) |

### Build Tools Version Policy
- **Rule:** build-tools version = compileSdk major version (33.0.x)
- **Current:** 33.0.1 (stable, no renderscript)
- **Avoid:** 34.0.0 (includes renderscript, larger, unnecessary)
- **Check:** `ls $ANDROID_HOME/build-tools/` should show 33.0.1

---

## ANDROID MANIFEST SDK DECLARATIONS

### AndroidManifest.xml (Relevant Sections)
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.carrpod.bounce">
    
    <uses-sdk
        android:minSdkVersion="24"
        android:targetSdkVersion="33" />
    
    <!-- Permissions (15 total) -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
    <uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES"
        android:usesPermissionFlags="neverForLocation" />
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN"
        android:usesPermissionFlags="neverForLocation" />
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
</manifest>
```

---

## GRADLE BUILD CONFIG (v1.0.80+)

### build.gradle.kts (Module)
```kotlin
plugins {
    id("com.android.application") version "8.1.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.22" apply false
}

android {
    namespace = "com.carrpod.bounce"
    compileSdk = 33
    
    defaultConfig {
        applicationId = "com.carrpod.bounce"
        minSdk = 24
        targetSdk = 33
        versionCode = 91
        versionName = "1.0.91"
    }
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
    
    kotlinOptions {
        jvmTarget = "11"
    }
}
```

### settings.gradle.kts
```kotlin
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "Bounce"
include(":app")
```

### gradle.properties
```properties
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
android.enableJetifier=true
kotlin.code.style=official
```

---

## PIECE 08 SUMMARY
This piece covers SDK version constants (compileSdk/targetSdk 33, minSdk 24, build-tools 33.0.1 matching), version matching rules (critical for build stability), AndroidManifest.xml SDK declarations with all 15 permissions (including API33 NEARBY_WIFI_DEVICES with neverForLocation), and Gradle build configuration (AGP 8.1.0, Kotlin 1.9.22, compileOptions Java 11). The no-Gradle build.sh uses the same constants via environment variables.

**Next Piece (09):** Tool Installation Automation — cmdline-tools, Platform, Build-Tools, Licenses
---

# SDK_Tools_Methods_Build_Pipeline — Piece 09/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 09 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## AUTOMATED SDK INSTALLATION

### Complete Setup Script (setup_sdk.sh)
```bash
#!/bin/bash
# setup_sdk.sh — Fully automated Android SDK setup
# Used in CI/CD and fresh environments

set -e

SDK_DIR="/opt/android-sdk"
CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"

echo "=== Android SDK Setup ==="

# 1. Create SDK directory
mkdir -p "$SDK_DIR"
cd "$SDK_DIR"

# 2. Download cmdline-tools
echo "Downloading cmdline-tools..."
wget -q "$CMDLINE_TOOLS_URL" -O cmdline-tools.zip
unzip -q cmdline-tools.zip

# 3. CRITICAL: Move to latest/ subdirectory
mv cmdline-tools cmdline-tools/latest

# 4. Set environment
export ANDROID_HOME="$SDK_DIR"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# 5. License hash bypass (no interactive prompts)
echo "Configuring licenses..."
mkdir -p "$ANDROID_HOME/licenses"
echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
echo "84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"

# 6. Install required components
echo "Installing SDK components..."
sdkmanager "platforms;android-33" "build-tools;33.0.1"

# 7. Verify installation
echo "Verifying..."
ls -la "$ANDROID_HOME/platforms/android-33/android.jar"
ls -la "$ANDROID_HOME/build-tools/33.0.1/aapt2"
ls -la "$ANDROID_HOME/build-tools/33.0.1/d8"
ls -la "$ANDROID_HOME/build-tools/33.0.1/zipalign"
ls -la "$ANDROID_HOME/build-tools/33.0.1/apksigner"

echo "=== SDK Setup Complete ==="
echo "ANDROID_HOME=$ANDROID_HOME"
```

### CI/CD Integration (GitHub Actions)
```yaml
# .github/workflows/build.yml
name: Build Bounce

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Android SDK
        run: |
          bash setup_sdk.sh
          echo "ANDROID_HOME=$ANDROID_HOME" >> $GITHUB_ENV
          echo "$ANDROID_HOME/cmdline-tools/latest/bin" >> $GITHUB_PATH
          echo "$ANDROID_HOME/build-tools/33.0.1" >> $GITHUB_PATH
      
      - name: Build with build.sh
        run: |
          export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
          cd CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION
          bash build.sh
      
      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: bounce-apk
          path: Bounce-v*.apk
```

---

## TROUBLESHOOTING COMMON SETUP FAILURES

### Failure: "sdkmanager: command not found"
- **Cause:** cmdline-tools not at `latest/`
- **Fix:** `mv cmdline-tools/cmdline-tools cmdline-tools/latest`

### Failure: "License not accepted" / EPIPE
- **Cause:** Interactive license prompt
- **Fix:** Use license hash bypass (write SHA-1 to license files)

### Failure: "platforms/android-33/android.jar not found"
- **Cause:** Platform not installed
- **Fix:** `sdkmanager "platforms;android-33"`

### Failure: "build-tools/33.0.1/aapt2 not found"
- **Cause:** Build tools not installed
- **Fix:** `sdkmanager "build-tools;33.0.1"`

### Failure: "JAVA_HOME is set to an invalid directory"
- **Cause:** JDK not installed or wrong path
- **Fix:** `apt-get install openjdk-17-jdk-headless && export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64`

---

## PIECE 09 SUMMARY
This piece provides the complete automated SDK installation script (setup_sdk.sh: download cmdline-tools, move to latest/, license hash bypass, install platform android-33 and build-tools 33.0.1), GitHub Actions CI/CD integration (checkout, setup SDK, build with build.sh, upload APK), and troubleshooting guide for the 5 most common setup failures (cmdline-tools path, license EPIPE, missing platform, missing build-tools, invalid JAVA_HOME). This automation eliminates manual setup time.

**Next Piece (10):** Best Practices & Anti-Patterns for SDK/Tools
---

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
---

# SDK_Tools_Methods_Build_Pipeline — Piece 11/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 11 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## SDK/TOOLS ERROR PATTERNS (from Section 6)

### E001: JAVA_HOME Invalid
- **Error:** `JAVA_HOME is set to an invalid directory`
- **Frequency:** Every session
- **Root Cause:** Sandbox resets wipe Java
- **Solution:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64` every session
- **Time Lost:** High

### E002: sdkmanager Not Found
- **Error:** `sdkmanager: command not found`
- **Frequency:** Every session
- **Root Cause:** cmdline-tools not at `latest/`
- **Solution:** `mv cmdline-tools/cmdline-tools cmdline-tools/latest`
- **Time Lost:** High

### E003: License Acceptance EPIPE
- **Error:** `yes | sdkmanager --licenses` fails with EPIPE
- **Frequency:** Every session
- **Root Cause:** sdkmanager closes stdin
- **Solution:** printf or license hash bypass
- **Time Lost:** Medium

### E004: AGP 8.2 Incompatibility (Gradle)
- **Error:** `Could not resolve all files for configuration — checkDebugAarMetadata`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** AGP 8.2 + Gradle 8.4+ incompatibility
- **Solution:** Pin AGP 8.1.0 + Gradle 8.4
- **Time Lost:** High

### E005: Unresolved Reference: components (Gradle)
- **Error:** `Unresolved reference: components`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** Importing non-existent package
- **Solution:** Remove unused imports
- **Time Lost:** Low

### E014: aapt2 Link Fails — Resource Not Found
- **Error:** `aapt2 link fails: resource not found`
- **Frequency:** Occasional
- **Root Cause:** Missing res/ directories or wrong paths
- **Solution:** Verify res/ structure matches AndroidManifest
- **Time Lost:** Medium

### E015: d8 MultiDex Error
- **Error:** `d8: Cannot fit requested classes in a single dex file`
- **Frequency:** Rare (not hit in Bounce)
- **Root Cause:** >64K methods
- **Solution:** Enable multiDex or reduce dependencies
- **Time Lost:** Low

### E021: Gradle Cannot Find Java
- **Error:** `Gradle cannot find Java`
- **Frequency:** Multiple (v1.0.80-1.0.85)
- **Root Cause:** JAVA_HOME not exported before Gradle
- **Solution:** Export JAVA_HOME before gradlew
- **Time Lost:** Medium

### E022: Unresolved Reference: R (Gradle)
- **Error:** `Unresolved reference: R (generated)`
- **Frequency:** Occasional
- **Root Cause:** aapt2 link didn't generate R.java
- **Solution:** Verify aapt2 link --java output dir
- **Time Lost:** Low

### E025: zipalign Command Not Found
- **Error:** `zipalign: command not found`
- **Frequency:** Every session
- **Root Cause:** build-tools not installed
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

### E026: apksigner Command Not Found
- **Error:** `apksigner: command not found`
- **Frequency:** Every session
- **Root Cause:** build-tools not installed
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

### E030: Missing platforms/android-33/android.jar
- **Error:** `Missing platforms/android-33/android.jar`
- **Frequency:** Cloud environments
- **Root Cause:** SDK platform not installed
- **Solution:** `sdkmanager "platforms;android-33"`
- **Time Lost:** Critical

---

## ERROR → TOOL MAPPING

| Error | Tool | Solution |
|-------|------|----------|
| E001 | javac/keytool/gradle | Export JAVA_HOME |
| E002 | sdkmanager | Move cmdline-tools to latest/ |
| E003 | sdkmanager | printf or license hash |
| E004 | AGP/Gradle | Pin AGP 8.1.0 + Gradle 8.4 |
| E014 | aapt2 | Verify res/ structure |
| E015 | d8 | Enable multiDex |
| E021 | Gradle | Export JAVA_HOME first |
| E022 | aapt2/Gradle | Check --java output dir |
| E025 | zipalign | Install build-tools 33.0.1 |
| E026 | apksigner | Install build-tools 33.0.1 |
| E030 | javac/aapt2 | Install platform android-33 |

---

## PIECE 11 SUMMARY
This piece documents the 11 SDK/Tools specific error patterns from the 30-error catalog: JAVA_HOME invalid, sdkmanager not found, license EPIPE, AGP 8.2 incompatibility, Gradle import issues, aapt2 resource failures, d8 multiDex, Gradle Java/R issues, zipalign/apksigner missing, and missing android-33 platform. Each maps to a specific tool with documented solution. The top 3 (JAVA_HOME, sdkmanager path, license EPIPE) occur every session.

**Next Piece (12):** Future SDK/Tools Roadmap — Upgrades, Migrations, Modernization
---

# SDK_Tools_Methods_Build_Pipeline — Piece 12/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 12 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## FUTURE SDK/TOOLS ROADMAP

### Planned Upgrades (from Section 7 & 10)

| Item | Current | Target | Priority | Effort | Blocker |
|------|---------|--------|----------|--------|---------|
| FP001 | compileSdk 33 | compileSdk 35 | P0 | Medium | Google Play requirement Aug 2026 |
| FP002 | targetSdk 33 | targetSdk 35 | P0 | Medium | Play Store policy |
| FP003 | build-tools 33.0.1 | build-tools 35.0.0 | P0 | Low | Must match compileSdk |
| FP004 | JDK 17 | JDK 21 (LTS) | P1 | Low | Test compatibility |
| FP005 | AGP 8.1.0 | AGP 8.5+ | P1 | Medium | Gradle 8.7+ required |
| FP006 | Kotlin 1.9.22 | Kotlin 2.0+ | P1 | Medium | AGP 8.5+ compatibility |
| FP007 | Gradle 8.4 | Gradle 8.7+ | P1 | Low | AGP 8.5+ requirement |

### Migration Timeline
```
v1.0.93 (Q4 2026):    JDK 21 test, compileSdk 34 prep
v1.0.94 (Q1 2027):    compileSdk 34, build-tools 34.0.0, AGP 8.3
v1.0.95 (Q2 2027):    compileSdk 35, targetSdk 35, AGP 8.5, Gradle 8.7
v1.0.96 (Q3 2027):    JDK 21 default, Kotlin 2.0
```

### Android 14/15 Compatibility (API 34/35)
- **Foreground Service Types:** Required for background scanning (v1.0.95+)
- **Bluetooth Permissions:** API 34 adds BLUETOOTH_ADVERTISE refinement
- **Media Permissions:** READ_MEDIA_VISUAL_USER_SELECTED for exports
- **Notification Permission:** POST_NOTIFICATIONS for foreground service

---

## BUILD SYSTEM MODERNIZATION (from Section 10)

### RF006: Auto-Detect ANDROID_HOME
- **Current:** Hardcoded fallback paths in build.sh
- **Target:** Robust detection with multiple strategies
- **Effort:** Low

### RF023: CI/CD Pipeline (GitHub Actions)
- **Current:** Manual build.sh runs
- **Target:** Automated build + test + sign + release
- **Effort:** Medium
- **Target Version:** 1.0.95

### RF024: Auto-Version from Git Tags
- **Current:** Manual version in build.sh
- **Target:** `git describe --tags` + changelog generation
- **Effort:** Low
- **Target Version:** 1.0.94

### RF025: ProGuard/R8 Enable
- **Current:** Disabled (no minification)
- **Target:** Enable for size + security
- **Effort:** Low
- **Target Version:** 1.0.94

### RF021: Release Keystore
- **Current:** Debug keystore only
- **Target:** Release keystore + signing config
- **Effort:** High
- **Target Version:** 1.0.93

---

## TOOL ECOSYSTEM WATCH

### Emerging Tools to Evaluate
| Tool | Purpose | Status | Evaluation Target |
|------|---------|--------|-------------------|
| Bazel | Alternative build | Experimental | v1.0.96+ |
| R8 (full) | Shrinking/optimization | Available | v1.0.94 |
| Kotlin Multiplatform | Shared logic | Alpha | v1.0.97+ |
| Compose Multiplatform | UI sharing | Beta | v1.0.98+ |

### Deprecation Watch
| Component | Deprecation | Migration Deadline |
|-----------|-------------|-------------------|
| renderScript | API 31 | Remove by v1.0.94 |
| Android Support Lib | 2021 | Already migrated to AndroidX |
| java.util.Date | — | Use java.time (API 26+) |

---

## PIECE 12 SUMMARY
This piece outlines the future SDK/Tools roadmap: compileSdk/targetSdk upgrade to 35 (P0, Google Play Aug 2026), build-tools 35.0.0, JDK 21 LTS, AGP 8.5+, Gradle 8.7+, Kotlin 2.0 with quarterly migration timeline. Build system modernization includes CI/CD (RF023), auto-versioning (RF024), ProGuard/R8 (RF025), release keystore (RF021). Tool ecosystem watch includes Bazel, R8, Kotlin Multiplatform. Deprecation watch for renderscript removal.

**Next Piece (13):** SDK/Tools Summary + Key Metrics + File Locations
---

# SDK_Tools_Methods_Build_Pipeline — Piece 13/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 13 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## SDK TOOLS METHODS — COMPLETE SUMMARY

### Tool Inventory (30 Tracked Tools)

| # | Tool | Version | Purpose | Category |
|---|------|---------|---------|----------|
| 1 | JDK | 17 | Java compilation + keytool | Java Toolchain |
| 2 | Android SDK Platform | android-33 | android.jar for compilation | SDK |
| 3 | Build Tools | 33.0.1 | aapt2, d8, zipalign, apksigner | Build Tools |
| 4 | cmdline-tools | latest | sdkmanager command | SDK Manager |
| 5 | Gradle | 8.4/8.5 | Alternative build system | Build System |
| 6 | AGP | 8.1.0 | Android Gradle Plugin | Build System |
| 7 | Kotlin | 1.9.22 | Kotlin compilation | Language |
| 8 | aapt2 | 33.0.1 | Resource compile + link | Build Tools |
| 9 | d8 | 33.0.1 | Dex conversion | Build Tools |
| 10 | zipalign | 33.0.1 | APK alignment | Build Tools |
| 11 | apksigner | 33.0.1 | APK signing | Build Tools |
| 12 | keytool | JDK 17 | Debug keystore generation | Java Toolchain |
| 13 | git | Latest | Version control | VCS |
| 14 | GitHub CLI (gh) | Latest | PR/merge automation | CI/CD |
| 15 | unzip | Latest | Extract source zips | Utility |
| 16 | bc | Latest | Build size calculation | Utility |
| 17 | stat | GNU coreutils | File size checking | Utility |
| 18 | date | GNU coreutils | Timestamps | Utility |
| 19 | nohup | GNU coreutils | Background processes | Process Mgmt |
| 20 | pkill | GNU coreutils | Stop background processes | Process Mgmt |
| 21 | diff | GNU diffutils | Version diffing | Forensics |
| 22 | zip | Latest | Asset injection + zipping | Archive |
| 23 | ADB | Latest | Device install/test | Debug |
| 24 | sdkmanager licenses | Latest | License acceptance | SDK Manager |
| 25 | License hash bypass | Latest | Skip interactive licenses | SDK Manager |
| 26 | ANDROID_HOME | Env var | SDK location | Environment |
| 27 | local.properties | Gradle | Gradle SDK path | Build Config |
| 28 | compileSdk | 33 | Compilation target | SDK Config |
| 29 | targetSdk | 33 | Runtime target | SDK Config |
| 30 | minSdk | 24 | Minimum version | SDK Config |

---

## CROSS-REFERENCES TO OTHER SECTIONS

| Section | Connection | Details |
|---------|------------|---------|
| **Sec 1: HTML** | Build.sh injects assets | Step 3: zip -r base.apk assets/ |
| **Sec 2: Android** | build.sh compiles MainActivity | javac + d8 pipeline |
| **Sec 3: Connections** | Build.sh enables bridge | APK with JS interface |
| **Sec 5: Best Practices** | BP001-BP005 | No-Gradle, pin versions, auto keystore, zip assets, javac 11 |
| **Sec 5: Anti-Patterns** | CP001-CP004 | Gradle hell, hardcoded paths, mismatch, API33 perms |
| **Sec 6: Errors** | E001-E004, E014, E015, E021, E022, E025, E026, E030 | 11 SDK/Tools errors |
| **Sec 7: Future** | FP001-FP007 | SDK upgrades, CI/CD, auto-version |
| **Sec 10: Refinements** | RF006, RF021, RF023, RF024, RF025 | Auto-detect, release keystore, CI/CD, auto-version, ProGuard |

---

## KEY METRICS

| Metric | Value |
|--------|-------|
| **Build Time (no-Gradle)** | ~3.3 seconds |
| **Build Time (Gradle)** | ~60-120 seconds |
| **APK Size (v1.0.91)** | 230,826 bytes |
| **JDK Version** | 17 (OpenJDK) |
| **compileSdk / targetSdk** | 33 / 33 |
| **minSdk** | 24 (Android 7.0) |
| **Build Tools Version** | 33.0.1 |
| **Platform** | android-33 |
| **License Bypass** | SHA-1 hash (instant) |
| **cmdline-tools Path** | Must be at `latest/` |
| **Asset Injection** | zip -r (post aapt2 link) |
| **Debug Keystore** | Auto-generated |
| **Release Keystore** | Not yet (TD-08) |

---

## CRITICAL LESSONS LEARNED

1. **No-Gradle Wins for Simple Apps** — 4s vs 60s+, no AGP version hell (BP001)
2. **Pin Everything** — compileSdk, build-tools, platform, JDK — match versions (BP002)
3. **License Hash Bypass** — Instant, reliable, no EPIPE (E003)
4. **cmdline-tools at latest/** — Hard requirement, automate the move (E002)
5. **JAVA_HOME Every Session** — Sandbox resets, export in build.sh (E001)
6. **Asset Injection via Zip** — aapt2 link misses assets/, zip after (BP004)
6. **Auto-Generate Keystore** — Build never fails on missing debug.keystore (BP003)
7. **Gradle Only When Needed** — Multi-module only, pin AGP 8.1.0 (CP001, CP003)
8. **Auto-Detect SDK Paths** — Hardcoded paths break portability (CP002, RF006)
9. **Release Keystore Separate** — Debug keystore not for Play Store (TD-08, RF021)
10. **CI/CD Automates All** — GitHub Actions: setup → build → test → sign → release (RF023)

---

## FILE LOCATIONS

| File | Purpose |
|------|---------|
| `SDK_Tools_Methods_Spreadsheet.csv` | 30 tools × 11 columns |
| `build.sh` | 109 lines, no-Gradle pipeline |
| `setup_sdk.sh` | Automated SDK installation |
| `AndroidManifest.xml` | SDK declarations (min/target/compile) |
| `build.gradle.kts` | Gradle config (v1.0.80+) |
| `settings.gradle.kts` | Gradle settings |
| `gradle.properties` | Gradle JVM args |
| `forensic/source/v*/build.sh` | Historical build scripts |
| `forensic/diffs/*build.sh.diff` | Build script evolution |

---

## PIECE 13 SUMMARY
This final piece provides the complete tool inventory (30 tools across Java toolchain, SDK, build tools, build systems, utilities, process management, forensics, environment, config), cross-reference matrix to all 12 other sections, key metrics (3.3s builds, 231 KB APK, JDK 17, SDK 33, license hash bypass), critical lessons learned (10 principles from no-Gradle to CI/CD), and file locations. The toolchain evolved from manual setup to fully automated (setup_sdk.sh + build.sh) with pinned versions ensuring reproducibility across 91 versions.

---

**END OF SECTION 4: SDK TOOLS METHODS BUILD PIPELINE**
*13 pieces covering: JDK/Java Toolchain → SDK Platform/Build Tools → cmdline-tools/Gradle/AGP/Kotlin → License Management/Environment → build.sh Pipeline/Asset Injection → SDK Path Detection/Issues/Metrics → ADB/Licenses/Environment/local.properties → SDK Version Constants/Manifest/Gradle Config → Automated Setup/CI/CD/Troubleshooting → Best Practices/Anti-Patterns/Tool Practices → Error Patterns/Tool Mapping → Future Roadmap/Modernization/Deprecation → Summary/Metrics/Cross-Refs*

*Next: Section 5 — Best Practices/Anti-Patterns (article5_A5-05)*
---

