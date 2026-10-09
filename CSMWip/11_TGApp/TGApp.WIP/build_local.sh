#!/bin/bash
# TGApp Local Build Script
# Usage: ./build_local.sh [debug|release|clean]

set -e

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$APP_DIR"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_step() { echo -e "${BLUE}[STEP]${NC} $1"; }

# Load local.properties if exists
if [ -f "local.properties" ]; then
    export $(grep -v '^#' local.properties | xargs)
fi

# Set defaults
export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk}
export ANDROID_HOME=${ANDROID_HOME:-$HOME/Android/Sdk}
export ANDROID_SDK_ROOT=$ANDROID_HOME

# Check prerequisites
check_prereqs() {
    log_step "Checking prerequisites..."
    
    if ! command -v java &> /dev/null; then
        log_error "Java not found. Install JDK 17+"
        exit 1
    fi
    
    if [ ! -d "$ANDROID_HOME" ]; then
        log_error "Android SDK not found at $ANDROID_HOME"
        log_info "Set ANDROID_HOME in local.properties or environment"
        exit 1
    fi
    
    if [ ! -f "$ANDROID_HOME/platforms/android-34/android.jar" ]; then
        log_warn "Android 34 platform not installed. Run: sdkmanager 'platforms;android-34'"
    fi
    
    if [ ! -f "$ANDROID_HOME/build-tools/34.0.0/aapt2" ]; then
        log_warn "Build tools 34.0.0 not installed. Run: sdkmanager 'build-tools;34.0.0'"
    fi
    
    log_info "Prerequisites OK"
}

# Build with Gradle (recommended)
build_gradle() {
    local variant=${1:-release}
    log_step "Building with Gradle ($variant)..."
    
    if [ ! -f "gradlew" ]; then
        log_error "gradlew not found. Run: gradle wrapper"
        exit 1
    fi
    
    ./gradlew "assemble${variant^}" --stacktrace
    
    # Copy APK to APK directory
    mkdir -p APK
    find . -name "*-${variant}.apk" -path "*/build/outputs/*" -exec cp {} "APK/TGApp-v1.0.1-${variant}.apk" \;
    
    log_info "Gradle build complete: APK/TGApp-v1.0.1-${variant}.apk"
}

# Build with command-line tools (fallback)
build_cli() {
    log_step "Building with command-line tools..."
    
    # This would use the build_v101.sh script
    if [ -f "build_v101.sh" ]; then
        ./build_v101.sh all
    else
        log_error "build_v101.sh not found"
        exit 1
    fi
}

# Clean
clean_build() {
    log_step "Cleaning build artifacts..."
    ./gradlew clean 2>/dev/null || true
    rm -rf build out gen classes compiled_res.zip *.apk
    log_info "Clean complete"
}

# Main
case "${1:-release}" in
    debug)
        check_prereqs
        build_gradle debug
        ;;
    release)
        check_prereqs
        build_gradle release
        ;;
    cli)
        check_prereqs
        build_cli
        ;;
    clean)
        clean_build
        ;;
    *)
        echo "Usage: $0 [debug|release|cli|clean]"
        echo "  debug   - Build debug APK with Gradle"
        echo "  release - Build release APK with Gradle (default)"
        echo "  cli     - Build with command-line tools (build_v101.sh)"
        echo "  clean   - Clean build artifacts"
        exit 1
        ;;
esac