#!/bin/bash
# /workspace/app/CSMWip/05_BOUNCE/TGAPP.WIP/build.sh
set -e

APP_NAME="TGAPP"
PACKAGE_NAME="com.bounce.tgapp"
VERSION="1.0.0"

APP_DIR="app/src/main"
ANDROID_HOME="/opt/android-sdk"
KOTLIN_HOME="/opt/kotlin/kotlinc"

AAPT2="$ANDROID_HOME/build-tools/34.0.0/aapt2"
D8="$ANDROID_HOME/build-tools/34.0.0/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/34.0.0/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/34.0.0/apksigner"
KOTLINC="$KOTLIN_HOME/bin/kotlinc"

PLATFORM_JAR="$ANDROID_HOME/platforms/android-36/android.jar"

KEYSTORE_PATH="keystore/release.keystore"
KEY_ALIAS="release-key"
KEYSTORE_PASS="${KEYSTORE_PASS:-android}"
KEY_PASS="${KEY_PASS:-android}"

echo "=== Building ${APP_NAME} v${VERSION} ==="
echo "Using Android SDK: $ANDROID_HOME"
echo "Using Kotlin: $KOTLIN_HOME"
echo "Using Platform: $PLATFORM_JAR"

# Clean previous build
rm -rf gen compiled_res.zip base.apk classes.jar classes.dex unsigned.apk aligned.apk ${APP_NAME}-v${VERSION}.apk

# 1. Compile resources
echo "Compiling resources..."
$AAPT2 compile --dir $APP_DIR/res -o compiled_res.zip

# 2. Link resources and generate R.java (creates base.apk with resources + manifest)
echo "Generating R.java and base APK..."
$AAPT2 link -o base.apk -I $PLATFORM_JAR \
  --manifest $APP_DIR/AndroidManifest.xml -R compiled_res.zip \
  --java gen --auto-add-overlay

# 3. Compile Kotlin (with generated R.java)
echo "Compiling Kotlin..."
$KOTLINC -d classes.jar -cp $PLATFORM_JAR \
  -Xjava-source-roots=gen \
  $APP_DIR/java/com/bounce/tgapp/*.kt

# 4. Dex
echo "Dexing..."
$D8 --lib $PLATFORM_JAR \
  --output . classes.jar

# 5. Add classes.dex to base.apk
echo "Adding DEX to APK..."
cp base.apk unsigned.apk
zip -u unsigned.apk classes.dex

# 6. Align & Sign
echo "Aligning and signing..."
$ZIPALIGN -f -p 4 unsigned.apk aligned.apk
$APKSIGNER sign --ks $KEYSTORE_PATH --ks-key-alias $KEY_ALIAS \
  --ks-pass pass:$KEYSTORE_PASS --key-pass pass:$KEY_PASS \
  --out ${APP_NAME}-v${VERSION}.apk aligned.apk

# 7. Verify
echo "Verifying..."
$APKSIGNER verify ${APP_NAME}-v${VERSION}.apk

# 8. Move to out/
mv ${APP_NAME}-v${VERSION}.apk out/
echo "=== Build complete: out/${APP_NAME}-v${VERSION}.apk ==="