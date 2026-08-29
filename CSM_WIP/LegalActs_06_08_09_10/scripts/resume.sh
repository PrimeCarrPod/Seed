#!/bin/bash
# Resume Script — Legal Acts 06, 08, 09, 10
# Author: Jason Isaac Brodsky (California 1976) — Conducier
# Usage: ./resume.sh [act_num] [section_idx]

set -e

PROJECT_DIR="CSM_WIP/LegalActs_06_08_09_10"
LOG_DIR="${PROJECT_DIR}/logs"
HANDLER="${PROJECT_DIR}/scripts/legal_acts_handler.sh"
HEARTBEAT="${PROJECT_DIR}/scripts/heartbeat.sh"

echo "============================================================"
echo "  RESUME — Legal Acts 06, 08, 09, 10"
echo "  Author: Jason Isaac Brodsky (California 1976)"
echo "  Conducier — Full Throttle Mode"
echo "============================================================"
echo ""

# Quick verification
echo "[STEP 1] Git verification..."
git checkout session/agent_b501c6a4-d0e5-4c38-b40d-2cf60e363c94 2>/dev/null || true
git log --oneline -3
git status
echo ""

# Read progress logs
echo "[STEP 2] Reading progress logs..."
if [[ -f "${LOG_DIR}/WIP_LOG_"*.md ]]; then
    LATEST_LOG=$(ls -t ${LOG_DIR}/WIP_LOG_*.md 2>/dev/null | head -1)
    if [[ -n "$LATEST_LOG" ]]; then
        echo "Latest WIP log: $LATEST_LOG"
        cat "$LATEST_LOG" | tail -30
    fi
else
    echo "No WIP logs found — starting fresh"
fi
echo ""

# Read Master Todo
echo "[STEP 3] Reading Master Todo List..."
if [[ -f "${PROJECT_DIR}/master_todo/MASTER_TODO_LIST.md" ]]; then
    grep -A 5 "ACT STATUS OVERVIEW" "${PROJECT_DIR}/master_todo/MASTER_TODO_LIST.md" | head -10
fi
echo ""

# Start heartbeat
echo "[STEP 4] Starting heartbeat..."
bash "$HEARTBEAT" init
bash "$HEARTBEAT" log "Resume session started — Legal Acts 06-10"
echo ""

# Check current state
echo "[STEP 5] Checking current state..."
bash "$HANDLER" list 2>/dev/null | head -20 || echo "No pieces found yet"
echo ""

# Determine next action
ACT_NUM="${1:-06}"
SECTION_IDX="${2:-00}"

echo "============================================================"
echo "  RESUME COMPLETE"
echo "  Next: Act $ACT_NUM, Section $SECTION_IDX"
echo "============================================================"
echo ""
echo "  COMMANDS:"
echo "  bash $HANDLER create-act $ACT_NUM"
echo "  bash $HANDLER full-section $ACT_NUM $SECTION_IDX"
echo "  bash $HANDLER full-act $ACT_NUM"
echo ""
echo "============================================================"
echo "  Full throttle. 🚂"
echo "============================================================"
