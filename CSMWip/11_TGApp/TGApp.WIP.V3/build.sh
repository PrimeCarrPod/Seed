#!/bin/bash
# No-Gradle APK Build Wrapper - Pure Bash (no Python)

set -e

# Signing credentials are supplied by the environment; never commit them.
: "${ANDROID_KEYSTORE_PASS:?Set ANDROID_KEYSTORE_PASS before building}"
export ANDROID_KEYSTORE_PASS
export ANDROID_KEY_PASS="${ANDROID_KEY_PASS:-$ANDROID_KEYSTORE_PASS}"

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

# Load environment
if [ -f ".env" ]; then
    source .env
fi

# Defaults - use system-installed Android SDK from apt
export ANDROID_SDK="${ANDROID_SDK:-/usr/lib/android-sdk}"
export ANDROID_JAR="${ANDROID_JAR:-$ANDROID_SDK/platforms/android-34/android.jar}"
export BUILD_TOOLS="${BUILD_TOOLS:-$ANDROID_SDK/build-tools/debian}"

AAPT2="$BUILD_TOOLS/aapt2"
JAVAC="javac"
D8="$BUILD_TOOLS/d8"
ZIPALIGN="$BUILD_TOOLS/zipalign"
APKSIGNER="$BUILD_TOOLS/apksigner"
KEYSTORE="$PROJECT_ROOT/debug.keystore"

KEYSTORE_PASS="$ANDROID_KEYSTORE_PASS"
KEY_ALIAS="androiddebugkey"
KEY_PASS="$ANDROID_KEY_PASS"

BUILD_DIR="$PROJECT_ROOT/build"
SRC_DIR="$PROJECT_ROOT/src"
RES_DIR="$PROJECT_ROOT/res"
MANIFEST="$PROJECT_ROOT/AndroidManifest.xml"
OUTPUT_APK="$PROJECT_ROOT/tgapp_electron_v3.apk"

run_cmd() {
    echo "$ $*"
    "$@"
}

clean() {
    echo "=== Cleaning ==="
    rm -rf "$BUILD_DIR"
    rm -f "$PROJECT_ROOT"/*.apk
    rm -f "$PROJECT_ROOT"/*.idsig
    echo "Cleaned build artifacts"
}

ensure_keystore() {
    if [ ! -f "$KEYSTORE" ]; then
        echo "Generating debug.keystore..."
        keytool -genkey -v \
            -keystore "$KEYSTORE" \
            -alias "$KEY_ALIAS" \
            -keyalg RSA -keysize 2048 \
            -validity 10000 \
            -storepass "$KEYSTORE_PASS" \
            -keypass "$KEY_PASS" \
            -dname "CN=Android Debug,O=Android,C=US"
    fi
}

compile_resources() {
    echo "=== Compiling Resources ==="
    mkdir -p "$BUILD_DIR"
    
    run_cmd "$AAPT2" compile --dir "$RES_DIR" -o "$BUILD_DIR/res.zip"
    
    mkdir -p "$BUILD_DIR/generated"
    run_cmd "$AAPT2" link \
        -o "$BUILD_DIR/base.apk" \
        -I "$ANDROID_JAR" \
        "$BUILD_DIR/res.zip" \
        --manifest "$MANIFEST" \
        --java "$BUILD_DIR/generated"
}

compile_java() {
    echo "=== Compiling Java ==="
    mkdir -p "$BUILD_DIR/classes"
    
    JAVA_FILES=$(find "$SRC_DIR" -name "*.java")
    if [ -z "$JAVA_FILES" ]; then
        echo "No Java sources found"
        return
    fi
    
    GEN_JAVA=$(find "$BUILD_DIR/generated" -name "*.java" 2>/dev/null || true)
    
    ALL_JAVA="$JAVA_FILES"
    if [ -n "$GEN_JAVA" ]; then
        ALL_JAVA="$ALL_JAVA $GEN_JAVA"
    fi
    
    run_cmd "$JAVAC" \
        -source 1.8 -target 1.8 \
        -bootclasspath "$ANDROID_JAR" \
        -d "$BUILD_DIR/classes" \
        $ALL_JAVA
}

dex() {
    echo "=== Dexing ==="
    mkdir -p "$BUILD_DIR/dex"
    
    CLASS_FILES=$(find "$BUILD_DIR/classes" -name "*.class" 2>/dev/null || true)
    if [ -z "$CLASS_FILES" ]; then
        echo "No class files to dex"
        return
    fi
    
    run_cmd "$D8" \
        --output "$BUILD_DIR/dex" \
        --lib "$ANDROID_JAR" \
        $CLASS_FILES
}

package_apk() {
    echo "=== Packaging Base APK (no assets) ==="
    UNALIGNED="$PROJECT_ROOT/tgapp_electron_v3-unaligned.apk"
    
    run_cmd "$AAPT2" link \
        -o "$UNALIGNED" \
        -I "$ANDROID_JAR" \
        "$BUILD_DIR/res.zip" \
        --manifest "$MANIFEST"
    
    # Add classes.dex
    DEX_FILE="$BUILD_DIR/dex/classes.dex"
    if [ -f "$DEX_FILE" ]; then
        run_cmd zip -u "$UNALIGNED" -j "$DEX_FILE"
    else
        echo "WARNING: classes.dex not found"
    fi
    
    echo "$UNALIGNED"
}

add_assets() {
    local unaligned="$1"
    echo "=== Adding Assets to APK ==="
    ASSETS_DIR="$PROJECT_ROOT/assets"
    if [ ! -d "$ASSETS_DIR" ]; then
        echo "No assets directory found"
        echo "$unaligned"
        return
    fi
    
    TEMP_APK="$PROJECT_ROOT/tgapp_electron_v3-temp.apk"
    cp "$unaligned" "$TEMP_APK"
    
    # Add ALL files in assets directory
    ASSET_FILES=$(find "$ASSETS_DIR" -type f)
    if [ -z "$ASSET_FILES" ]; then
        echo "$unaligned"
        return
    fi
    
    # Change to project root and add files with assets/ prefix
    cd "$PROJECT_ROOT"
    for f in $ASSET_FILES; do
        REL="${f#$PROJECT_ROOT/}"
        run_cmd zip -u "$TEMP_APK" "$REL"
    done
    
    rm -f "$unaligned"
    echo "$TEMP_APK"
}

align_and_sign() {
    local unaligned_with_assets="$1"
    echo "=== Aligning & Signing ==="
    ALIGNED="$PROJECT_ROOT/tgapp_electron_v3-aligned.apk"
    
    run_cmd "$ZIPALIGN" -f 4 "$unaligned_with_assets" "$ALIGNED"
    run_cmd "$APKSIGNER" sign \
        --ks "$KEYSTORE" \
        --ks-pass env:ANDROID_KEYSTORE_PASS \
        --key-pass env:ANDROID_KEY_PASS \
        "$ALIGNED"
    
    mv "$ALIGNED" "$OUTPUT_APK"
    rm -f "$unaligned_with_assets"
    echo "Built $OUTPUT_APK"
}

build() {
    ensure_keystore
    compile_resources
    compile_java
    dex
    UNALIGNED=$(package_apk)
    UNALIGNED_WITH_ASSETS=$(add_assets "$UNALIGNED")
    align_and_sign "$UNALIGNED_WITH_ASSETS"
}

install() {
    build
    run_cmd adb install -r "$OUTPUT_APK"
}

CMD="${1:-build}"

case "$CMD" in
    build)
        build
        ;;
    clean)
        clean
        ;;
    install)
        install
        ;;
    *)
        echo "Usage: $0 [build|clean|install]"
        exit 1
        ;;
esac