#!/bin/bash
# TGE_E4 Build Script - Wrapper for No-Gradle Build Pipeline
# Builds the TGE E4 Android app with Prime Electron Worldline Emulation v4

set -e

PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E4"
FRAMEWORK_DIR="$PROJECT_DIR/framework"
PIECES_DIR="$PROJECT_DIR/pieces"
LOGS_DIR="$PROJECT_DIR/logs"
APK_DIR="$PROJECT_DIR/apk"
OUT_DIR="$PROJECT_DIR/out"

mkdir -p "$LOGS_DIR" "$APK_DIR"

TS=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
echo "=== TGE_E4 BUILD STARTED: $TS ==="
echo "Project: $PROJECT_DIR"

cd "$PROJECT_DIR"

# Run no-Gradle build
echo "Building with no-Gradle pipeline..."
bash "$FRAMEWORK_DIR/build_nogradle.sh" 2>&1 | tee "$LOGS_DIR/build_$(date -u +%Y%m%d_%H%M%S).log"

# Check if APK was created
APK_PATH="$OUT_DIR/TGE_E4-v4.0.0-E4.apk"
if [ -f "$APK_PATH" ]; then
    cp "$APK_PATH" "$APK_DIR/TGE_E4_$(date -u +%Y%m%d_%H%M%S).apk"
    echo "✅ APK created: $APK_DIR/TGE_E4_$(date -u +%Y%m%d_%H%M%S).apk"
    ls -lh "$APK_DIR"/TGE_E4_*.apk
else
    echo "❌ Build failed - APK not found at $APK_PATH"
    exit 1
fi

# Verify pieces
echo "Verifying piece reassembly..."
if [ -f "$PIECES_DIR/ALL_PIECES_manifest.json" ]; then
    echo "✅ Manifest found"
    python3 -c "
import json
with open('$PIECES_DIR/ALL_PIECES_manifest.json') as f:
    m = json.load(f)
print(f'Total pieces: {m[\"total_pieces\"]}')
for file in m['pieces']:
    print(f'  {file[\"name\"]}: {file[\"section\"]}')
"
else
    echo "⚠️ Manifest not found"
fi

# Run verification script
if [ -f "$FRAMEWORK_DIR/verify_reassembly.sh" ]; then
    echo "Running reassembly verification..."
    bash "$FRAMEWORK_DIR/verify_reassembly.sh" || echo "Verification completed with warnings"
fi

echo "=== TGE_E4 BUILD COMPLETE: $(date -u +"%Y-%m-%d %H:%M:%S UTC") ==="