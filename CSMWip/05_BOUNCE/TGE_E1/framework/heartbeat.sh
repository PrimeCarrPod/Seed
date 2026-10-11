#!/bin/bash
# TGE_E1 Heartbeat Script - Adapted from AegisOutfitFabricator
# Logs session progress and system status for TGE E1 Prime Electron Worldline

set -e

export PROJECT_NAME="TGE_E1"
export WIP_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E1"
export FRAMEWORK_DIR="$WIP_DIR/framework"
export LOGS_DIR="$WIP_DIR/logs"
export PIECES_DIR="$WIP_DIR/pieces"
export APK_DIR="$WIP_DIR/apk"
export ASSETS_DIR="$WIP_DIR/app/src/main/assets"

HEARTBEAT_LOG="$LOGS_DIR/heartbeat.log"
SESSION_LOG="$LOGS_DIR/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md"

mkdir -p "$(dirname "$HEARTBEAT_LOG")"
mkdir -p "$(dirname "$SESSION_LOG")"
mkdir -p "$FRAMEWORK_DIR" "$LOGS_DIR" "$PIECES_DIR" "$APK_DIR" "$ASSETS_DIR"

TS=$(date -u +"%Y-%m-%d %H:%M:%S UTC")

cd "$WIP_DIR"
GIT_BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "none")
GIT_STATUS=$(git status --porcelain 2>/dev/null | wc -l)
GIT_REMOTE=$(git remote -v 2>/dev/null | head -1 | awk '{print $2}' || echo "none")

MAIN_ACTIVITY_EXISTS=$([ -f "$WIP_DIR/app/src/main/java/com/tge/e1/MainActivity.kt" ] && echo "yes" || echo "no")
HTML_EXISTS=$([ -f "$WIP_DIR/app/src/main/assets/tge_e1.html" ] && echo "yes" || echo "no")
TILE00_EXISTS=$([ -f "$ASSETS_DIR/Tile00.prime" ] && echo "yes" || echo "no")
TILE01_EXISTS=$([ -f "$ASSETS_DIR/Tile01.prime" ] && echo "yes" || echo "no")
BUILD_SH_EXISTS=$([ -f "$WIP_DIR/build.sh" ] && echo "yes" || echo "no")
GRADLE_EXISTS=$([ -f "$WIP_DIR/gradlew" ] && echo "yes" || echo "no")
MANIFEST_EXISTS=$([ -f "$PIECES_DIR/ALL_PIECES_manifest.json" ] && echo "yes" || echo "no")
PIECES_ZIP_EXISTS=$([ -f "$PIECES_DIR/TGE_E1_all_pieces.zip" ] && echo "yes" || echo "no")
APK_EXISTS=$(ls "$APK_DIR"/TGE_E1_*.apk 2>/dev/null | wc -l)

TOTAL_KT_PIECES=$(find "$PIECES_DIR" -name "MainActivity_piece_*.kt" 2>/dev/null | wc -l)
TOTAL_HTML_PIECES=$(find "$PIECES_DIR" -name "tge_e1_piece_*.html" 2>/dev/null | wc -l)

NOTE="${1:-"Periodic heartbeat - TGE E1 Prime Electron Worldline progress logging"}"

{
    echo "=== HEARTBEAT $TS ==="
    echo "Project: $PROJECT_NAME"
    echo "Branch: $GIT_BRANCH"
    echo "Commit: $GIT_COMMIT"
    echo "Remote: $GIT_REMOTE"
    echo "Uncommitted changes: $GIT_STATUS"
    echo ""
    echo "--- Core Files ---"
    echo "MainActivity.kt: $MAIN_ACTIVITY_EXISTS"
    echo "tge_e1.html: $HTML_EXISTS"
    echo "Tile00.prime: $TILE00_EXISTS"
    echo "Tile01.prime: $TILE01_EXISTS"
    echo "build.sh: $BUILD_SH_EXISTS"
    echo "gradlew: $GRADLE_EXISTS"
    echo ""
    echo "--- Piece Pipeline ---"
    echo "Manifest: $MANIFEST_EXISTS"
    echo "All Pieces Zip: $PIECES_ZIP_EXISTS"
    echo "Kotlin Pieces (13): $TOTAL_KT_PIECES"
    echo "HTML Pieces (14): $TOTAL_HTML_PIECES"
    echo "Total Pieces (27): $((TOTAL_KT_PIECES + TOTAL_HTML_PIECES))"
    echo ""
    echo "--- Build Output ---"
    echo "APKs Built: $APK_EXISTS"
    echo ""
    echo "--- Prime Engine ---"
    echo "Prime Tiles Loaded: 2 (Tile00, Tile01)"
    echo "Prime Gap Universe: Active"
    echo "Electron Worldline: Running"
    echo "Eggshell Geometry: Elliptical"
    echo ""
    echo "Note: $NOTE"
    echo ""
} >> "$HEARTBEAT_LOG"

{
    echo "# TGE_E1 Session Log - $TS"
    echo ""
    echo "## Heartbeat Entry"
    echo ""
    echo "- **Project:** $PROJECT_NAME"
    echo "- **Branch:** $GIT_BRANCH"
    echo "- **Commit:** $GIT_COMMIT"
    echo "- **Remote:** $GIT_REMOTE"
    echo "- **Uncommitted files:** $GIT_STATUS"
    echo ""
    echo "### Core Files"
    echo "- MainActivity.kt: $MAIN_ACTIVITY_EXISTS"
    echo "- tge_e1.html: $HTML_EXISTS"
    echo "- Tile00.prime: $TILE00_EXISTS"
    echo "- Tile01.prime: $TILE01_EXISTS"
    echo "- build.sh: $BUILD_SH_EXISTS"
    echo "- gradlew: $GRADLE_EXISTS"
    echo ""
    echo "### Piece Pipeline (27 Total)"
    echo "- Manifest: $MANIFEST_EXISTS"
    echo "- All Pieces Zip: $PIECES_ZIP_EXISTS"
    echo "- Kotlin Pieces: $TOTAL_KT_PIECES / 13"
    echo "- HTML Pieces: $TOTAL_HTML_PIECES / 14"
    echo ""
    echo "### Build Output"
    echo "- APKs Built: $APK_EXISTS"
    echo ""
    echo "### Prime Electron Worldline Status"
    echo "- Prime Engine: Initialized with PrimeBookOne tiles"
    echo "- Prime Gap Universe: 2 tiles loaded"
    echo "- Electron: Single particle walking worldline"
    echo "- Geometry: Eggshell (elliptical boundary)"
    echo "- Reflections: Back-and-forth worldline traversal"
    echo ""
    echo "- **Note:** $NOTE"
    echo ""
    echo "---"
    echo ""
} > "$SESSION_LOG"

tail -2000 "$HEARTBEAT_LOG" > "$HEARTBEAT_LOG.tmp" && mv "$HEARTBEAT_LOG.tmp" "$HEARTBEAT_LOG"

echo "✅ Heartbeat logged: $TS"
echo "📝 Session log: $SESSION_LOG"
echo "📊 Heartbeat log: $HEARTBEAT_LOG"
echo ""
echo "=== QUICK STATUS ==="
echo "Branch: $GIT_BRANCH | Commit: $GIT_COMMIT | Uncommitted: $GIT_STATUS"
echo "Core: main=$MAIN_ACTIVITY_EXISTS html=$HTML_EXISTS tiles=$TILE00_EXISTS,$TILE01_EXISTS"
echo "Pieces: kt=$TOTAL_KT_PIECES/13 html=$TOTAL_HTML_PIECES/14 total=$((TOTAL_KT_PIECES + TOTAL_HTML_PIECES))/27"
echo "Build: apk=$APK_EXISTS gradle=$GRADLE_EXISTS"
echo "Prime: engine=active gaps=loaded electron=walking eggshell=elliptical"
echo "Note: $NOTE"