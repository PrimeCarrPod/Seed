#!/bin/bash
# ============================================================
# NEXT_RUNNER.sh — TGE_E2 Session Continuity Runner
# Prime Voxel vX8 / kilo/prime-voxel-vx8
# ============================================================
# This script captures session state and provides quick resume
# for the next development session.
# ============================================================

set -e

PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E2"
FRAMEWORK_DIR="$PROJECT_DIR/framework"
LOGS_DIR="$PROJECT_DIR/logs"

mkdir -p "$LOGS_DIR"

TS=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
SESSION_LOG="$LOGS_DIR/session_$(date -u +%Y%m%d_%H%M%S).log"

echo "============================================================"
echo "  NEXT_RUNNER.sh — TGE_E2 Session Resume"
echo "  Timestamp: $TS"
echo "  Branch: kilo/prime-voxel-vx8"
echo "============================================================" | tee "$SESSION_LOG"

cd "$PROJECT_DIR"

# ─────────────────────────────────────────────────────────────
# GIT STATE
# ─────────────────────────────────────────────────────────────
echo ""
echo "📍 GIT STATE" | tee -a "$SESSION_LOG"
echo "  Branch: $(git branch --show-current)" | tee -a "$SESSION_LOG"
echo "  Commit: $(git rev-parse --short HEAD)" | tee -a "$SESSION_LOG"
echo "  Status:" | tee -a "$SESSION_LOG"
git status --short CSMWip/05_BOUNCE/TGE_E2/ | head -20 | tee -a "$SESSION_LOG"

# ─────────────────────────────────────────────────────────────
# VERIFICATION STATE
# ─────────────────────────────────────────────────────────────
echo ""
echo "🔍 VERIFICATION STATE" | tee -a "$SESSION_LOG"
if [ -f "$FRAMEWORK_DIR/VERIFY_39_WAYS.sh" ]; then
    echo "  Running 39-way verification..." | tee -a "$SESSION_LOG"
    bash "$FRAMEWORK_DIR/VERIFY_39_WAYS.sh" 2>&1 | tail -10 | tee -a "$SESSION_LOG"
else
    echo "  ❌ VERIFY_39_WAYS.sh not found" | tee -a "$SESSION_LOG"
fi

# ─────────────────────────────────────────────────────────────
# BUILD STATE
# ─────────────────────────────────────────────────────────────
echo ""
echo "🏗️ BUILD STATE" | tee -a "$SESSION_LOG"
if [ -f "$PROJECT_DIR/out/TGE_E2-v2.0.0-E2.apk" ]; then
    SIZE=$(stat --printf="%s" "$PROJECT_DIR/out/TGE_E2-v2.0.0-E2.apk" 2>/dev/null || echo "0")
    echo "  ✅ APK exists: $SIZE bytes" | tee -a "$SESSION_LOG"
    echo "  Path: $PROJECT_DIR/out/TGE_E2-v2.0.0-E2.apk" | tee -a "$SESSION_LOG"
else
    echo "  ❌ APK not found — needs build" | tee -a "$SESSION_LOG"
fi

# ─────────────────────────────────────────────────────────────
# PIECE STATE
# ─────────────────────────────────────────────────────────────
echo ""
echo "🧩 PIECE STATE" | tee -a "$SESSION_LOG"
JAVA_PIECES=$(find "$PROJECT_DIR/pieces" -name "MainActivity_piece_*.java" | wc -l)
HTML_PIECES=$(find "$PROJECT_DIR/pieces" -name "tge_e2_piece_*.html" | wc -l)
echo "  Java pieces: $JAVA_PIECES (expected 27)" | tee -a "$SESSION_LOG"
echo "  HTML pieces: $HTML_PIECES (expected 12)" | tee -a "$SESSION_LOG"
echo "  Total: $((JAVA_PIECES + HTML_PIECES)) (expected 39)" | tee -a "$SESSION_LOG"

if [ -f "$PROJECT_DIR/pieces/ALL_PIECES_manifest.json" ]; then
    echo "  ✅ Manifest exists" | tee -a "$SESSION_LOG"
else
    echo "  ❌ Manifest missing" | tee -a "$SESSION_LOG"
fi

# ─────────────────────────────────────────────────────────────
# WORLDLINE STATE
# ─────────────────────────────────────────────────────────────
echo ""
echo "⚡ WORLDLINE STATE" | tee -a "$SESSION_LOG"
if [ -f "$FRAMEWORK_DIR/WORLD_LINE_STEPS.sh" ]; then
    echo "  ✅ WORLD_LINE_STEPS.sh exists and executable" | tee -a "$SESSION_LOG"
else
    echo "  ❌ WORLD_LINE_STEPS.sh missing" | tee -a "$SESSION_LOG"
fi

# ─────────────────────────────────────────────────────────────
# QUICK COMMANDS FOR NEXT SESSION
# ─────────────────────────────────────────────────────────────
echo ""
echo "🚀 QUICK COMMANDS FOR NEXT SESSION" | tee -a "$SESSION_LOG"
cat << 'EOF' | tee -a "$SESSION_LOG"

# Full worldline (recommended):
source CSMWip/05_BOUNCE/TGE_E2/framework/WORLD_LINE_STEPS.sh
worldline_complete

# Step by step:
worldline_init && worldline_split && worldline_verify && worldline_package

# Quick verification only:
bash CSMWip/05_BOUNCE/TGE_E2/framework/VERIFY_39_WAYS.sh

# Build APK only:
bash CSMWip/05_BOUNCE/TGE_E2/build.sh

# Device test:
adb install -r CSMWip/05_BOUNCE/TGE_E2/out/TGE_E2-v2.0.0-E2.apk
adb shell am start -n com.tge.e2/.MainActivity

EOF

# ─────────────────────────────────────────────────────────────
# HEARTBEAT
# ─────────────────────────────────────────────────────────────
if [ -f "$FRAMEWORK_DIR/heartbeat.sh" ]; then
    bash "$FRAMEWORK_DIR/heartbeat.sh" "NEXT_RUNNER session state captured"
fi

echo ""
echo "============================================================"
echo "  Session log saved: $SESSION_LOG"
echo "============================================================" | tee -a "$SESSION_LOG"