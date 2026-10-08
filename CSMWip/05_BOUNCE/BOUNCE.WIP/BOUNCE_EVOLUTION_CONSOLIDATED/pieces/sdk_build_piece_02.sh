
SDK_DIR="${ANDROID_HOME:-/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_f0b16629-907e-42f1-85f2-46087d2fb3cb/.sdk/android-sdk}"
BUILD_TOOLS="$SDK_DIR/build-tools/33.0.1"
PLATFORM="$SDK_DIR/platforms/android-33"
ANDROID_JAR="$PLATFORM/android.jar"

# JDK detection
if [ -d "/usr/lib/jvm/java-17-openjdk-amd64" ]; then
    export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
    export PATH="$JAVA_HOME/bin:$PATH"
fi

AAPT2="$BUILD_TOOLS/aapt2"
D8="$BUILD_TOOLS/d8"
ZIPALIGN="$BUILD_TOOLS/zipalign"
APKSIGNER="$BUILD_TOOLS/apksigner"

echo "============================================================"
echo "  Bounce v1 — No-Gradle aapt2 Build"
echo "  Package: $PACKAGE  |  Version: $VERSION_NAME"
echo "  JDK: $JAVA_HOME"
echo "============================================================"
