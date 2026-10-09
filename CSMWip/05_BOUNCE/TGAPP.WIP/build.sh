#!/bin/bash
# /workspace/app/CSMWip/05_BOUNCE/TGAPP.WIP/build.sh
set -e

APP_NAME="TGAPP"
PACKAGE_NAME="com.bounce.tgapp"
VERSION="1.0.0"

APP_DIR="app/src/main"
AAPT2="$ANDROID_HOME/build-tools/34.0.0/aapt2"
D8="$ANDROID_HOME/build-tools/34.0.0/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/34.0.0/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/34.0.0/apksigner"

KEYSTORE_PATH="keystore/release.keystore"
KEY_ALIAS="release-key"
KEYSTORE_PASS="${KEYSTORE_PASS:-android}"
KEY_PASS="${KEY_PASS:-android}"

echo "=== Building ${APP_NAME} v${VERSION} ==="

# 1. Compile resources
echo "Compiling resources..."
$AAPT2 compile --dir $APP_DIR/res -o compiled_res.zip
$AAPT2 link -o base.apk -I $ANDROID_HOME/platforms/android-34/android.jar \
  --manifest $APP_DIR/AndroidManifest.xml -R compiled_res.zip \
  --java gen --auto-add-overlay

# 2. Compile Kotlin/Java
echo "Compiling Kotlin..."
kotlinc -d classes.jar -cp $ANDROID_HOME/platforms/android-34/android.jar \
  $APP_DIR/java/**/*.kt $APP_DIR/java/**/*.java

# 3. Dex
echo "Dexing..."
$D8 --lib $ANDROID_HOME/platforms/android-34/android.jar \
  --output . classes.jar

# 4. Package APK
echo "Packaging APK..."
$AAPT2 link -o unsigned.apk -I $ANDROID_HOME/platforms/android-34/android.jar \
  --manifest $APP_DIR/AndroidManifest.xml -R compiled_res.zip \
  --dex classes.dex --java gen

# 5. Align & Sign
echo "Aligning and signing..."
$ZIPALIGN -f -p 4 unsigned.apk aligned.apk
$APKSIGNER sign --ks $KEYSTORE_PATH --ks-key-alias $KEY_ALIAS \
  --ks-pass pass:$KEYSTORE_PASS --key-pass pass:$KEY_PASS \
  -o ${APP_NAME}-v${VERSION}.apk aligned.apk

# 6. Verify
echo "Verifying..."
$APKSIGNER verify ${APP_NAME}-v${VERSION}.apk

# 7. Move to out/
mv ${APP_NAME}-v${VERSION}.apk out/
echo "=== Build complete: out/${APP_NAME}-v${VERSION}.apk ==="