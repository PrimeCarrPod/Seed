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