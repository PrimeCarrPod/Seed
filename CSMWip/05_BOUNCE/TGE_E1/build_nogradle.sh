#!/bin/bash
# ============================================================
# build.sh — No-Gradle APK Build for TGE E1
# Prime Electron Worldline Emulator
# Pipeline: aapt2 compile → aapt2 link → javac → d8 → zipalign → apksigner
# Adapted from Bounce v1.0.79 and LandOLil v7b build methodology
# ============================================================
set -e

PACKAGE="com.tge.e1"
APP_NAME="TGE_E1"
VERSION_CODE=1
VERSION_NAME="1.0.0-E1"
COMPILE_SDK=33
TARGET_SDK=33
MIN_SDK=24
BUILD_TOOLS_VERSION="33.0.1"

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$PROJECT_DIR/app/src/main"
GEN_DIR="$PROJECT_DIR/gen"
OBJ_DIR="$PROJECT_DIR/obj"
OUT_DIR="$PROJECT_DIR/out"
APK_DIR="$PROJECT_DIR/apk"

# Use the SDK set up by setup-sdk.sh
SDK_DIR="${ANDROID_HOME:-/workspace/app/CSMScripts/.sdk/android-sdk}"
BUILD_TOOLS="$SDK_DIR/build-tools/$BUILD_TOOLS_VERSION"
PLATFORM="$SDK_DIR/platforms/android-$COMPILE_SDK"
ANDROID_JAR="$PLATFORM/android.jar"

AAPT2="$BUILD_TOOLS/aapt2"
D8="$BUILD_TOOLS/d8"
ZIPALIGN="$BUILD_TOOLS/zipalign"
APKSIGNER="$BUILD_TOOLS/apksigner"

echo "============================================================"
echo "  TGE E1 — No-Gradle aapt2 Build"
echo "  Package: $PACKAGE  |  Version: $VERSION_NAME"
echo "  Prime Electron Worldline Emulator"
echo "  JDK: $(java -version 2>&1 | head -1)"
echo "============================================================"

if [ ! -f "$ANDROID_JAR" ]; then echo "ERROR: android.jar not found at $ANDROID_JAR"; exit 1; fi
if [ ! -f "$AAPT2" ]; then echo "ERROR: aapt2 not found at $AAPT2"; exit 1; fi

rm -rf "$GEN_DIR" "$OBJ_DIR"
mkdir -p "$GEN_DIR" "$OBJ_DIR" "$OUT_DIR" "$APK_DIR"

echo "[1/7] aapt2 compile — Processing resources..."
"$AAPT2" compile --dir "$SRC_DIR/res" -o "$OBJ_DIR/resources.zip" 2>/dev/null

echo "[2/7] aapt2 link — Generating base APK + R.java..."
"$AAPT2" link \
    -o "$OUT_DIR/$APP_NAME-base.apk" \
    -I "$ANDROID_JAR" \
    --manifest "$SRC_DIR/AndroidManifest.xml" \
    --java "$GEN_DIR" \
    --min-sdk-version $MIN_SDK \
    --target-sdk-version $TARGET_SDK \
    --version-code $VERSION_CODE \
    --version-name "$VERSION_NAME" \
    --auto-add-overlay \
    -v \
    "$OBJ_DIR/resources.zip" \
     2>&1 | grep -v "note:" | head -5

echo "[2b] Assets — Copying PrimeBookOne tiles + HTML..."
mkdir -p "$SRC_DIR/assets"
cp /workspace/app/PrimeBookOne/Tile00.prime "$SRC_DIR/assets/"
cp /workspace/app/PrimeBookOne/Tile01.prime "$SRC_DIR/assets/"
if [ -d "$SRC_DIR/assets" ]; then
    ATMP="$OBJ_DIR/atmp"; mkdir -p "$ATMP"
    cp "$OUT_DIR/$APP_NAME-base.apk" "$ATMP/base.apk"
    (cd "$SRC_DIR" && zip -r "$ATMP/base.apk" assets/ 2>/dev/null)
    mv "$ATMP/base.apk" "$OUT_DIR/$APP_NAME-base.apk"; rm -rf "$ATMP"
    echo "  Assets injected: Tile00.prime, Tile01.prime, tge_e1.html"
fi

echo "[3/7] javac — Compiling Java sources..."
ALL_SOURCES=$(find "$SRC_DIR/java" "$GEN_DIR" -name "*.java" 2>/dev/null)
echo "  Found $(echo "$ALL_SOURCES" | wc -l) source files"

javac \
    -source 11 -target 11 \
    -classpath "$ANDROID_JAR" \
    -d "$OBJ_DIR" \
    -sourcepath "$SRC_DIR/java:$GEN_DIR" \
    -Xlint:-options \
    $ALL_SOURCES \
    2>&1 | grep -v "warning:" || true

CLASS_COUNT=$(find "$OBJ_DIR" -name "*.class" | wc -l)
echo "  Compiled $CLASS_COUNT class files"

echo "[4/7] d8 — Converting to dex bytecode..."
if [ "$CLASS_COUNT" -gt 0 ]; then
    "$D8" \
        --lib "$ANDROID_JAR" \
        --min-api $MIN_SDK \
        --output "$OBJ_DIR" \
        $(find "$OBJ_DIR" -name "*.class") \
        2>&1 | tail -1 || {
            find "$OBJ_DIR" -name "*.class" | xargs "$D8" --lib "$ANDROID_JAR" --min-api $MIN_SDK --output "$OBJ_DIR"
        }

    if [ -f "$OBJ_DIR/classes.dex" ]; then
        DEX_SIZE=$(stat --printf="%s" "$OBJ_DIR/classes.dex" 2>/dev/null || echo "0")
        echo "  classes.dex: $DEX_SIZE bytes"
    else
        echo "ERROR: d8 did not produce classes.dex"
        exit 1
    fi
else
    echo "ERROR: No classes compiled"
    exit 1
fi

echo "[5/7] Packaging — Injecting dex into APK..."
cp "$OUT_DIR/$APP_NAME-base.apk" "$OUT_DIR/$APP_NAME-dexed.apk"
if [ -f "$OBJ_DIR/classes.dex" ]; then
    cp "$OBJ_DIR/classes.dex" /tmp/classes.dex
    (cd /tmp && zip -q "$OUT_DIR/$APP_NAME-dexed.apk" classes.dex)
fi

echo "[6/7] zipalign — Aligning APK..."
"$ZIPALIGN" -p -f 4 \
    "$OUT_DIR/$APP_NAME-dexed.apk" \
    "$OUT_DIR/$APP_NAME-aligned.apk"

echo "[7/7] apksigner — Signing APK..."
KEYSTORE="$PROJECT_DIR/keystore/debug.keystore"
if [ ! -f "$KEYSTORE" ]; then
    mkdir -p "$PROJECT_DIR/keystore"
    keytool -genkey -v \
        -keystore "$KEYSTORE" \
        -alias androiddebugkey \
        -keyalg RSA -keysize 2048 \
        -validity 10000 \
        -storepass android \
        -keypass android \
        -dname "CN=TGE E1 Debug, OU=PrimeElectron, O=CSM, L=Lab, ST=Dev, C=US" \
        2>/dev/null
    echo "  Generated debug.keystore"
fi

"$APKSIGNER" sign \
    --ks "$KEYSTORE" \
    --ks-pass pass:android \
    --key-pass pass:android \
    --out "$OUT_DIR/$APP_NAME-v$VERSION_NAME.apk" \
    "$OUT_DIR/$APP_NAME-aligned.apk"

# Copy to apk directory with timestamp
TIMESTAMP=$(date -u +%Y%m%d_%H%M%S)
FINAL_APK="$APK_DIR/$APP_NAME-v$VERSION_NAME-$TIMESTAMP.apk"
cp "$OUT_DIR/$APP_NAME-v$VERSION_NAME.apk" "$FINAL_APK"

SIZE=$(stat --printf="%s" "$FINAL_APK" 2>/dev/null || echo "0")
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "  BUILD COMPLETE — TGE E1 v$VERSION_NAME"
echo "  APK: $FINAL_APK"
echo "  Size: $SIZE bytes ($(echo "scale=1; $SIZE/1024" | bc 2>/dev/null || echo "?") KB)"
echo "═══════════════════════════════════════════════════════════"

"$AAPT2" dump badging "$FINAL_APK" 2>/dev/null | head -5 || true

# Also copy to CSMDropBox and repo root
cp "$FINAL_APK" "/workspace/app/CSMDropBox/$APP_NAME-v$VERSION_NAME.apk" 2>/dev/null && echo "  CSMDropBox copy OK" || true
cp "$FINAL_APK" "/workspace/app/$APP_NAME-v$VERSION_NAME.apk" 2>/dev/null && echo "  Repo root copy OK" || true

exit 0