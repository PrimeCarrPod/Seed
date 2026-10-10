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