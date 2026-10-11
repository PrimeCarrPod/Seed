#!/bin/bash
# TGE_E1 Build Script - Adapted from AegisOutfitFabricator process_document.sh
# Builds the TGE E1 Android app with prime electron worldline emulation

set -e

PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E1"
APP_DIR="$PROJECT_DIR/app"
BUILD_DIR="$PROJECT_DIR/out"
APK_DIR="$PROJECT_DIR/apk"
LOGS_DIR="$PROJECT_DIR/logs"
PIECES_DIR="$PROJECT_DIR/pieces"
FRAMEWORK_DIR="$PROJECT_DIR/framework"

mkdir -p "$BUILD_DIR" "$APK_DIR" "$LOGS_DIR" "$FRAMEWORK_DIR" "$PIECES_DIR"

TS=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
echo "=== TGE_E1 BUILD STARTED: $TS ==="
echo "Project: $PROJECT_DIR"

cd "$PROJECT_DIR"

# Check for gradlew
if [ ! -f "gradlew" ]; then
    echo "Generating gradle wrapper..."
    gradle wrapper --gradle-version 8.5
fi

chmod +x gradlew

# Build debug APK
echo "Building debug APK..."
./gradlew :app:assembleDebug --no-daemon 2>&1 | tee "$LOGS_DIR/build_$(date -u +%Y%m%d_%H%M%S).log"

# Check if APK was created
APK_PATH="$APP_DIR/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK_PATH" ]; then
    cp "$APK_PATH" "$APK_DIR/TGE_E1_$(date -u +%Y%m%d_%H%M%S).apk"
    echo "✅ APK created: $APK_DIR/TGE_E1_$(date -u +%Y%m%d_%H%M%S).apk"
    ls -lh "$APK_DIR"/TGE_E1_*.apk
else
    echo "❌ Build failed - APK not found at $APK_PATH"
    exit 1
fi

# Verify pieces
echo "Verifying 27-piece reassembly..."
if [ -f "$PIECES_DIR/ALL_PIECES_manifest.json" ]; then
    echo "✅ Manifest found"
    python3 -c "
import json
with open('$PIECES_DIR/ALL_PIECES_manifest.json') as f:
    m = json.load(f)
print(f'Total pieces: {m[\"total_pieces\"]}')
for file in m['files']:
    print(f'  {file[\"name\"]}: {file[\"pieces\"]} pieces')
"
else
    echo "⚠️ Manifest not found"
fi

echo "=== TGE_E1 BUILD COMPLETE: $(date -u +"%Y-%m-%d %H:%M:%S UTC") ==="