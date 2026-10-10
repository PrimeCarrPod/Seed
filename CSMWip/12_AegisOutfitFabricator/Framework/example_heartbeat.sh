#!/bin/bash
# TGApp Heartbeat Script
# Logs session progress and system status
# Usage: ./heartbeat.sh [note]

set -e

WIP_DIR="/workspace/app/CSMWip/11_TGApp/TGApp.WIP"
HEARTBEAT_LOG="$WIP_DIR/logs/heartbeat.log"
SESSION_LOG="$WIP_DIR/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md"

mkdir -p "$(dirname "$HEARTBEAT_LOG")"
mkdir -p "$(dirname "$SESSION_LOG")"

# Timestamp
TS=$(date -u +"%Y-%m-%d %H:%M:%S UTC")

# Git info
cd "$WIP_DIR"
GIT_BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "none")
GIT_STATUS=$(git status --porcelain 2>/dev/null | wc -l)

# Build status
BUILD_EXISTS="no"
if [ -f "out/TGApp-v1.0.0.apk" ]; then
    BUILD_EXISTS="yes"
    APK_SIZE=$(ls -lh out/TGApp-v1.0.0.apk | awk '{print $5}')
fi

# Note from argument
NOTE="${1:-"Periodic heartbeat"}"

# Write to heartbeat log
{
    echo "=== HEARTBEAT $TS ==="
    echo "Branch: $GIT_BRANCH"
    echo "Commit: $GIT_COMMIT"
    echo "Uncommitted changes: $GIT_STATUS"
    echo "APK exists: $BUILD_EXISTS"
    [ "$BUILD_EXISTS" = "yes" ] && echo "APK size: $APK_SIZE"
    echo "Note: $NOTE"
    echo ""
} >> "$HEARTBEAT_LOG"

# Also create/update session log
{
    echo "# TGApp Session Log - $TS"
    echo ""
    echo "## Heartbeat Entry"
    echo ""
    echo "- **Branch:** $GIT_BRANCH"
    echo "- **Commit:** $GIT_COMMIT"
    echo "- **Uncommitted files:** $GIT_STATUS"
    echo "- **APK built:** $BUILD_EXISTS"
    [ "$BUILD_EXISTS" = "yes" ] && echo "- **APK size:** $APK_SIZE"
    echo "- **Note:** $NOTE"
    echo ""
    echo "---"
    echo ""
} > "$SESSION_LOG"

# Keep only last 1000 lines of heartbeat log
tail -1000 "$HEARTBEAT_LOG" > "$HEARTBEAT_LOG.tmp" && mv "$HEARTBEAT_LOG.tmp" "$HEARTBEAT_LOG"

echo "✅ Heartbeat logged: $TS"
echo "📝 Session log: $SESSION_LOG"
echo "📊 Heartbeat log: $HEARTBEAT_LOG"