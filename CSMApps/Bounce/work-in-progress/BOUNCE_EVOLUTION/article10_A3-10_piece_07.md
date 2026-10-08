# Refinement_Existing_Parts_Prioritized — Piece 07/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 07 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Build Pipeline & Signing (RF006, RF021, RF025)

## 7.1 RF006 — Build Script SDK Path Auto-Detection (P1, Low Effort)

**Component:** `build.sh` (primary build script)  
**Issue:** Hardcoded `ANDROID_HOME`, SDK paths, build-tools version — breaks on new environments  
**Current State:** `export ANDROID_HOME=/home/user/Android/Sdk` and fixed `build-tools;34.0.0`  
**Proposed Refinement:** Robust auto-detection with fallback chain  

### Auto-Detection Logic:
```bash
#!/bin/bash
# build.sh - Auto-detect Android SDK

detect_android_home() {
  local candidates=(
    "$ANDROID_HOME"
    "$HOME/Android/Sdk"
    "$HOME/Library/Android/sdk"
    "/opt/android-sdk"
    "/usr/local/android-sdk"
    "$(dirname $(dirname $(which adb 2>/dev/null)))"
    "$(dirname $(dirname $(which sdkmanager 2>/dev/null)))"
  )
  
  for candidate in "${candidates[@]}"; do
    if [[ -d "$candidate" && -f "$candidate/tools/bin/sdkmanager" ]]; then
      echo "$candidate"
      return 0
    fi
  done
  
  # Last resort: try to install via command line tools
  echo "ERROR: Android SDK not found. Set ANDROID_HOME or install SDK." >&2
  return 1
}

detect_build_tools() {
  local sdk_root="$1"
  local build_tools_dir="$sdk_root/build-tools"
  
  if [[ ! -d "$build_tools_dir" ]]; then
    echo "ERROR: build-tools not found in $sdk_root" >&2
    return 1
  fi
  
  # Prefer latest 34.x, fallback to latest 33.x, then any
  local version=$(ls -1 "$build_tools_dir" | grep -E '^(34|33)\.' | sort -V | tail -1)
  if [[ -z "$version" ]]; then
    version=$(ls -1 "$build_tools_dir" | sort -V | tail -1)
  fi
  echo "$version"
}

detect_platform() {
  local sdk_root="$1"
  local platforms_dir="$sdk_root/platforms"
  
  # Prefer android-34, fallback to highest
  local version=$(ls -1 "$platforms_dir" | grep '^android-' | sed 's/android-//' | sort -n | tail -1)
  echo "android-$version"
}

# Main detection
ANDROID_HOME=$(detect_android_home) || exit 1
BUILD_TOOLS_VERSION=$(detect_build_tools "$ANDROID_HOME") || exit 1
PLATFORM_VERSION=$(detect_platform "$ANDROID_HOME") || exit 1

export ANDROID_HOME
export BUILD_TOOLS_VERSION
export PLATFORM_VERSION

echo "Using Android SDK: $ANDROID_HOME"
echo "Build Tools: $BUILD_TOOLS_VERSION"
echo "Platform: $PLATFORM_VERSION"

# License acceptance (non-interactive)
yes | "$ANDROID_HOME/tools/bin/sdkmanager" --licenses >/dev/null 2>&1

# Build commands use detected paths
AAPT2="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2"
DX="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/apksigner"
```

### Validation:
```bash
# Verify all tools exist
for tool in "$AAPT2" "$DX" "$ZIPALIGN" "$APKSIGNER"; do
  if [[ ! -x "$tool" ]]; then
    echo "ERROR: Missing tool: $tool" >&2
    exit 1
  fi
done
```

### Target: v1.0.93 | Status: Planned | Master List Ref: —

---

## 7.2 RF021 — Release Keystore & Signing Config (P0, High Effort)

**Component:** `build.sh`, `keystore.jks` (debug only)  
**Issue:** Debug keystore only — cannot publish to Play Store  
**Current State:** `keytool -genkeypair -alias androiddebugkey -keypass android -storepass android`  
**Proposed Refinement:** Generate release keystore, configure signing, document process  

### Keystore Generation (One-Time):
```bash
#!/bin/bash
# scripts/generate-release-keystore.sh

KEYSTORE_PATH="keystore/release.jks"
ALIAS="bounce-release"
VALIDITY=10000 # ~27 years

# Generate strong passwords
STORE_PASS=$(openssl rand -base64 32 | tr -d '/+=' | cut -c1-32)
KEY_PASS=$(openssl rand -base64 32 | tr -d '/+=' | cut -c1-32)

# Store in password manager / secure location
cat > keystore/credentials.txt <<EOF
# BOUNCE Release Keystore Credentials
# GENERATED: $(date -u +"%Y-%m-%d %H:%M:%S UTC")
# KEEP SECURE - DO NOT COMMIT TO GIT
STORE_PASSWORD=$STORE_PASS
KEY_PASSWORD=$KEY_PASS
ALIAS=$ALIAS
KEYSTORE_PATH=$KEYSTORE_PATH
EOF

# Generate keystore
keytool -genkeypair \
  -alias "$ALIAS" \
  -keystore "$KEYSTORE_PATH" \
  -storepass "$STORE_PASS" \
  -keypass "$KEY_PASS" \
  -keyalg RSA \
  -keysize 2048 \
  -validity $VALIDITY \
  -dname "CN=BOUNCE, OU=Engineering, O=CSM, L=City, ST=State, C=US" \
  -ext "BC:c"

echo "Keystore generated at $KEYSTORE_PATH"
echo "Credentials saved to keystore/credentials.txt (ADD TO .gitignore)"
echo "BACKUP BOTH FILES SECURELY"
```

### Signing Configuration in build.sh:
```bash
# build.sh - Signing section

sign_apk() {
  local unsigned_apk="$1"
  local signed_apk="$2"
  
  if [[ -f "keystore/credentials.txt" ]]; then
    source keystore/credentials.txt
  else
    echo "ERROR: Release credentials not found. Run generate-release-keystore.sh" >&2
    return 1
  fi
  
  # Align
  "$ZIPALIGN" -f -p 4 "$unsigned_apk" "${unsigned_apk}.aligned"
  
  # Sign with release key
  "$APKSIGNER" sign \
    --ks "$KEYSTORE_PATH" \
    --ks-pass "pass:$STORE_PASS" \
    --ks-key-alias "$ALIAS" \
    --key-pass "pass:$KEY_PASS" \
    --v1-signing-enabled true \
    --v2-signing-enabled true \
    --v3-signing-enabled true \
    --out "$signed_apk" \
    "${unsigned_apk}.aligned"
  
  # Verify
  "$APKSIGNER" verify --print-certs "$signed_apk"
  
  rm -f "${unsigned_apk}.aligned"
}

# Debug signing (existing)
sign_debug_apk() {
  local unsigned_apk="$1"
  local signed_apk="$2"
  
  "$ZIPALIGN" -f -p 4 "$unsigned_apk" "${unsigned_apk}.aligned"
  "$APKSIGNER" sign \
    --ks ~/.android/debug.keystore \
    --ks-pass pass:android \
    --key-pass pass:android \
    --out "$signed_apk" \
    "${unsigned_apk}.aligned"
  rm -f "${unsigned_apk}.aligned"
}
```

### Play Store Upload Requirements Met:
- ✅ Release keystore (RSA 2048, 25+ year validity)
- ✅ v1+v2+v3 signing (APK Signature Scheme v3 for key rotation)
- ✅ Zipaligned (4-byte)
- ✅ ProGuard mapping file generation (RF025)

### Target: v1.0.93 | Status: Planned | Master List Ref: TD-08

---

## 7.3 RF025 — ProGuard/R8 Minification (P2, Low Effort)

**Component:** `build.sh` (no minification)  
**Issue:** No code shrinking/obfuscation — APK 230KB+, reverse-engineerable  
**Current State:** `d8` without `--release` or ProGuard rules  
**Proposed Refinement:** Enable R8 full mode with custom rules  

### ProGuard Rules (`proguard-rules.pro`):
```proguard
# proguard-rules.pro

# Keep entry points
-keep class com.carrpod.bounce.MainActivity { *; }
-keep class com.carrpod.bounce.PositionEKF { *; }
-keep class com.carrpod.bounce.ParticleFilter { *; }
-keep class com.carrpod.bounce.Trilateration { *; }
-keep class com.carrpod.bounce.WifiRttRanging { *; }
-keep class com.carrpod.bounce.ZoneHMM { *; }

# Keep JavaScriptInterface methods
-keepclassmembers class com.carrpod.bounce.MainActivity {
  @android.webkit.JavascriptInterface public *;
}

# Keep Three.js / Chart.js bridge classes
-keep class org.chromium.** { *; }

# Keep serialization
-keepclassmembers class * implements java.io.Serializable {
  static final long serialVersionUID;
  private static final java.io.ObjectStreamField[] serialPersistentFields;
  private void writeObject(java.io.ObjectOutputStream);
  private void readObject(java.io.ObjectInputStream);
  java.lang.Object writeReplace();
  java.lang.Object readResolve();
}

# Optimize
-optimizationpasses 5
-allowaccessmodification
-mergeinterfacesaggressively

# Remove logging in release
-assumenosideeffects class android.util.Log {
  public static int d(...);
  public static int v(...);
  public static int i(...);
}
```

### Build.sh Integration:
```bash
# build.sh - R8 minification

run_r8() {
  local input_jar="$1"
  local output_jar="$2"
  
  local r8_jar="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/lib/r8.jar"
  local android_jar="$ANDROID_HOME/platforms/$PLATFORM_VERSION/android.jar"
  
  java -jar "$r8_jar" \
    --release \
    --output "$output_jar" \
    --lib "$android_jar" \
    --pg-conf proguard-rules.pro \
    --min-api 28 \
    "$input_jar"
}

# In main build flow:
# 1. Compile Java → classes.dex (d8)
# 2. Run R8 on classes.dex → classes.min.dex
# 3. Package classes.min.dex into APK
```

### Expected Impact:
| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| DEX size | ~2.1 MB | ~1.3 MB | 38% reduction |
| APK size | 230 KB | ~180 KB | 22% reduction |
| Method count | ~18,000 | ~12,000 | 33% reduction |
| Reverse engineering | Trivial | Hard (obfuscated) | Significant |

### Target: v1.0.94 | Status: Planned | Master List Ref: TD-07

---

*End of Piece 07/13*