#!/bin/bash
# No-Gradle APK Build Wrapper

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

# Load environment
if [ -f ".env" ]; then
    source .env
fi

# Defaults
export ANDROID_SDK="${ANDROID_SDK:-/opt/android-sdk}"
export ANDROID_JAR="${ANDROID_JAR:-$ANDROID_SDK/platforms/android-34/android.jar}"
export BUILD_TOOLS="${BUILD_TOOLS:-$ANDROID_SDK/build-tools/34.0.0}"

CMD="${1:-build}"

case "$CMD" in
    build)
        python3 build.py build
        ;;
    clean)
        python3 build.py clean
        ;;
    install)
        python3 build.py install
        ;;
    *)
        echo "Usage: $0 [build|clean|install]"
        exit 1
        ;;
esac