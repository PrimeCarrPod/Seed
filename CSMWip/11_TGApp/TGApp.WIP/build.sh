#!/bin/bash
# TGApp Build Script - Command Line Build (Non-Gradle)
# Based on BOUNCE Evolution build.sh pattern
# Usage: ./build.sh [clean|build|sign|verify|all]

set -e

# Configuration
APP_NAME="TGApp"
PACKAGE_NAME="com.TGApp.mynewapp"
VERSION_CODE=1
VERSION_NAME="1.0.0"
MIN_SDK=28
TARGET_SDK=34
COMPILE_SDK=34

# Android SDK paths (adjust as needed)
export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk}
export ANDROID_HOME=${ANDROID_HOME:-$HOME/Android/Sdk}
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0

# Build tools
AAPT2="$ANDROID_HOME/build-tools/34.0.0/aapt2"
D8="$ANDROID_HOME/build-tools/34.0.0/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/34.0.0/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/34.0.0/apksigner"

# Paths
APP_DIR="src/main"
BUILD_DIR="build"
OUT_DIR="out"
KEYSTORE_DIR="keystore"
GEN_DIR="gen"
CLASSES_DIR="classes"

# Keystore passwords (set via environment variables)
KEYSTORE_PASS=${KEYSTORE_PASS:-"changeit"}
KEY_PASS=${KEY_PASS:-"changeit"}
KEY_ALIAS="release-key"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Clean build artifacts
clean_build() {
    log_info "Cleaning build directories..."
    rm -rf "$BUILD_DIR" "$OUT_DIR" "$GEN_DIR" "$CLASSES_DIR" compiled_res.zip base.apk unsigned.apk aligned.apk classes.jar classes.dex
    log_info "Clean complete"
}

# Compile resources with AAPT2
compile_resources() {
    log_info "Compiling resources with AAPT2..."
    mkdir -p "$BUILD_DIR"
    
    $AAPT2 compile --dir "$APP_DIR/res" -o "$BUILD_DIR/compiled_res.zip"
    
    $AAPT2 link \
        -o "$BUILD_DIR/base.apk" \
        -I "$ANDROID_HOME/platforms/android-$COMPILE_SDK/android.jar" \
        --manifest "$APP_DIR/AndroidManifest.xml" \
        -R "$BUILD_DIR/compiled_res.zip" \
        --java "$BUILD_DIR/gen" \
        --auto-add-overlay \
        --no-version-vectors
    
    log_info "Resources compiled successfully"
}

# Compile Kotlin/Java sources
compile_kotlin() {
    log_info "Compiling Kotlin sources..."
    
    # Find all .kt and .java files
    SOURCE_FILES=$(find "$APP_DIR/java" -name "*.kt" -o -name "*.java" | tr '\n' ' ')
    
    if [ -z "$SOURCE_FILES" ]; then
        log_warn "No Kotlin/Java source files found"
        return
    fi
    
    mkdir -p "$BUILD_DIR/$CLASSES_DIR"
    
    # Compile with kotlinc (requires kotlin-compiler in PATH)
    if command -v kotlinc &> /dev/null; then
        kotlinc -d "$BUILD_DIR/classes.jar" \
            -cp "$ANDROID_HOME/platforms/android-$COMPILE_SDK/android.jar" \
            $SOURCE_FILES
        log_info "Kotlin compilation successful"
    else
        log_error "kotlinc not found in PATH. Install Kotlin compiler or use Gradle."
        log_warn "Skipping Kotlin compilation - using placeholder"
        # Create empty classes.jar for packaging
        jar cf "$BUILD_DIR/classes.jar" -C "$BUILD_DIR/gen" . 2>/dev/null || \
            echo "Manifest-Version: 1.0" > "$BUILD_DIR/classes.jar"
    fi
}

# Dex compilation with D8
compile_dex() {
    log_info "Compiling DEX with D8..."
    
    $D8 \
        --lib "$ANDROID_HOME/platforms/android-$COMPILE_SDK/android.jar" \
        --min-api "$MIN_SDK" \
        --output "$BUILD_DIR" \
        "$BUILD_DIR/classes.jar"
    
    log_info "DEX compilation successful"
}

# Package APK
package_apk() {
    log_info "Packaging APK..."
    
    $AAPT2 link \
        -o "$BUILD_DIR/unsigned.apk" \
        -I "$ANDROID_HOME/platforms/android-$COMPILE_SDK/android.jar" \
        --manifest "$APP_DIR/AndroidManifest.xml" \
        -R "$BUILD_DIR/compiled_res.zip" \
        --dex "$BUILD_DIR/classes.dex" \
        --java "$BUILD_DIR/gen" \
        --no-version-vectors
    
    log_info "APK packaged: $BUILD_DIR/unsigned.apk"
}

# Align APK
align_apk() {
    log_info "Aligning APK with zipalign..."
    
    $ZIPALIGN -f -p 4 "$BUILD_DIR/unsigned.apk" "$BUILD_DIR/aligned.apk"
    
    log_info "APK aligned: $BUILD_DIR/aligned.apk"
}

# Sign APK
sign_apk() {
    log_info "Signing APK..."
    
    mkdir -p "$OUT_DIR"
    
    local keystore_file="$KEYSTORE_DIR/release.keystore"
    
    if [ ! -f "$keystore_file" ]; then
        log_warn "Keystore not found at $keystore_file"
        log_warn "Creating debug keystore for testing..."
        create_debug_keystore
        keystore_file="$KEYSTORE_DIR/debug.keystore"
        KEY_ALIAS="androiddebugkey"
        KEYSTORE_PASS="android"
        KEY_PASS="android"
    fi
    
    $APKSIGNER sign \
        --ks "$keystore_file" \
        --ks-key-alias "$KEY_ALIAS" \
        --ks-pass "pass:$KEYSTORE_PASS" \
        --key-pass "pass:$KEY_PASS" \
        --out "$OUT_DIR/${APP_NAME}-v${VERSION_NAME}.apk" \
        "$BUILD_DIR/aligned.apk"
    
    log_info "APK signed: $OUT_DIR/${APP_NAME}-v${VERSION_NAME}.apk"
}

# Create debug keystore for testing
create_debug_keystore() {
    mkdir -p "$KEYSTORE_DIR"
    keytool -genkeypair \
        -alias androiddebugkey \
        -keypass android \
        -keystore "$KEYSTORE_DIR/debug.keystore" \
        -storepass android \
        -dname "CN=Android Debug,O=Android,C=US" \
        -keyalg RSA \
        -keysize 2048 \
        -validity 10000 \
        -noprompt 2>/dev/null || true
}

# Verify APK signature
verify_apk() {
    log_info "Verifying APK signature..."
    
    $APKSIGNER verify "$OUT_DIR/${APP_NAME}-v${VERSION_NAME}.apk"
    
    # Also print certificate info
    $APKSIGNER verify --print-certs "$OUT_DIR/${APP_NAME}-v${VERSION_NAME}.apk"
    
    log_info "APK verification successful"
}

# Full build pipeline
build_all() {
    log_info "Starting full build for $APP_NAME v$VERSION_NAME"
    log_info "Package: $PACKAGE_NAME"
    log_info "Min SDK: $MIN_SDK, Target SDK: $TARGET_SDK"
    
    clean_build
    compile_resources
    compile_kotlin
    compile_dex
    package_apk
    align_apk
    sign_apk
    verify_apk
    
    log_info "=========================================="
    log_info "BUILD SUCCESSFUL!"
    log_info "Output: $OUT_DIR/${APP_NAME}-v${VERSION_NAME}.apk"
    log_info "=========================================="
}

# Print usage
usage() {
    echo "Usage: $0 [clean|resources|kotlin|dex|package|align|sign|verify|all]"
    echo ""
    echo "Commands:"
    echo "  clean      - Clean build artifacts"
    echo "  resources  - Compile resources only"
    echo "  kotlin     - Compile Kotlin sources only"
    echo "  dex        - Compile DEX only"
    echo "  package    - Package APK only"
    echo "  align      - Align APK only"
    echo "  sign       - Sign APK only"
    echo "  verify     - Verify APK signature only"
    echo "  all        - Full build pipeline (default)"
    echo ""
    echo "Environment variables:"
    echo "  JAVA_HOME       - JDK 17+ path"
    echo "  ANDROID_HOME    - Android SDK path"
    echo "  KEYSTORE_PASS   - Keystore password"
    echo "  KEY_PASS        - Key password"
}

# Main
case "${1:-all}" in
    clean)
        clean_build
        ;;
    resources)
        compile_resources
        ;;
    kotlin)
        compile_kotlin
        ;;
    dex)
        compile_dex
        ;;
    package)
        package_apk
        ;;
    align)
        align_apk
        ;;
    sign)
        sign_apk
        ;;
    verify)
        verify_apk
        ;;
    all)
        build_all
        ;;
    *)
        usage
        exit 1
        ;;
esac