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