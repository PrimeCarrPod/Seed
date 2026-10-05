#!/usr/bin/env bash
# =============================================================================
# SubAtomicPrimeElectronCalderaPublish — Session Startup Script
# =============================================================================
# Run this at the start of any new session to quickly resume the publishing project.
# Usage: bash startup_publish_session.sh
# =============================================================================

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Project paths
WORKSPACE="/root/.openclaw/workspace"
PROJECT_DIR="$WORKSPACE/CSMWip/SubAtomicPrimeElectronCalderaPublish"
SOURCE_DIR="$WORKSPACE/CSMWip/SubAtomicPrimeElectronCaldera"
SCRIPTS_DIR="$WORKSPACE/CSMScripts"
LOGS_DIR="$WORKSPACE/csmlogs/aug26"

# GitHub
REPO="PrimeCarrPod/Seed"
BRANCH="main"

echo -e "${CYAN}╔════════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║  SubAtomicPrimeElectronCalderaPublish — Session Startup                  ║${NC}"
echo -e "${CYAN}║  Author: Jason Isaac Brodsky (California 1976) — Conducier               ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# =============================================================================
# STEP 1: Verify GitHub Authentication
# =============================================================================
echo -e "${BLUE}[1/8] Checking GitHub authentication...${NC}"
if gh auth status >/dev/null 2>&1; then
    GH_USER=$(gh api user --jq '.login')
    echo -e "${GREEN}  ✅ Authenticated as: $GH_USER${NC}"
else
    echo -e "${RED}  ❌ Not authenticated. Run: gh auth login${NC}"
    exit 1
fi

# =============================================================================
# STEP 2: Verify Repository Access
# =============================================================================
echo -e "${BLUE}[2/8] Verifying repository access...${NC}"
if gh api "repos/$REPO" --jq '.name' >/dev/null 2>&1; then
    echo -e "${GREEN}  ✅ Repository accessible: $REPO${NC}"
else
    echo -e "${RED}  ❌ Cannot access repository $REPO${NC}"
    exit 1
fi

# =============================================================================
# STEP 3: Check Project Structure
# =============================================================================
echo -e "${BLUE}[3/8] Checking project structure...${NC}"
for dir in Foundation CosmologyAstrophysics ExperimentalSignatures Particles CrossCutting; do
    if [[ -d "$PROJECT_DIR/$dir" ]]; then
        echo -e "${GREEN}  ✅ $PROJECT_DIR/$dir${NC}"
    else
        echo -e "${YELLOW}  ⚠️  Missing: $PROJECT_DIR/$dir (creating)${NC}"
        mkdir -p "$PROJECT_DIR/$dir"
    fi
done

# =============================================================================
# STEP 4: Check Core Files
# =============================================================================
echo -e "${BLUE}[4/8] Checking core project files...${NC}"
CORE_FILES=(
    "INTRO_HEURISTICS_GUIDE.md"
    "MASTER_TODO_LIST.md"
    "TABLE_OF_CONTENTS.md"
    "SESSION_RESUME_STATE.md"
)
for f in "${CORE_FILES[@]}"; do
    if [[ -f "$PROJECT_DIR/$f" ]]; then
        echo -e "${GREEN}  ✅ $f${NC}"
    else
        echo -e "${RED}  ❌ MISSING: $f${NC}"
    fi
done

# =============================================================================
# STEP 5: Check Scripts
# =============================================================================
echo -e "${BLUE}[5/8] Checking CSM scripts...${NC}"
SCRIPTS=(
    "Github_Handler.sh"
    "earthbeatv3.sh"
    "freenemo.sh"
    "sort_pieces.sh"
    "concat_all.sh"
)
for s in "${SCRIPTS[@]}"; do
    if [[ -f "$SCRIPTS_DIR/$s" ]]; then
        echo -e "${GREEN}  ✅ $s${NC}"
    else
        echo -e "${YELLOW}  ⚠️  Missing: $s${NC}"
    fi
done

# =============================================================================
# STEP 6: Check Heartbeat Status
# =============================================================================
echo -e "${BLUE}[6/8] Checking heartbeat processes...${NC}"
HEARTBEAT_PIDS=$(pgrep -f "earthbeatv3.sh chamber" 2>/dev/null || true)
if [[ -n "$HEARTBEAT_PIDS" ]]; then
    echo -e "${GREEN}  ✅ Active heartbeat chambers:${NC}"
    echo "$HEARTBEAT_PIDS" | while read pid; do
        ps -p "$pid" -o pid,cmd --no-headers 2>/dev/null | sed 's/^/      /'
    done
else
    echo -e "${YELLOW}  ⚠️  No active heartbeat chambers found${NC}"
fi

TOKENRING_PIDS=$(pgrep -f "earthbeatv3.sh tokenring" 2>/dev/null || true)
if [[ -n "$TOKENRING_PIDS" ]]; then
    echo -e "${GREEN}  ✅ Active token rings:${NC}"
    echo "$TOKENRING_PIDS" | while read pid; do
        ps -p "$pid" -o pid,cmd --no-headers 2>/dev/null | sed 's/^/      /'
    done
else
    echo -e "${YELLOW}  ⚠️  No active token ring found${NC}"
fi

# =============================================================================
# STEP 7: Show Current Progress (from MASTER_TODO_LIST.md)
# =============================================================================
echo -e "${BLUE}[7/8] Current progress summary:${NC}"
if [[ -f "$PROJECT_DIR/MASTER_TODO_LIST.md" ]]; then
    # Count papers by status
    PENDING=$(grep -c "PENDING" "$PROJECT_DIR/MASTER_TODO_LIST.md" 2>/dev/null || echo 0)
    READING=$(grep -c "READING" "$PROJECT_DIR/MASTER_TODO_LIST.md" 2>/dev/null || echo 0)
    WRITING=$(grep -c "WRITING" "$PROJECT_DIR/MASTER_TODO_LIST.md" 2>/dev/null || echo 0)
    DRAFTED=$(grep -c "DRAFTED" "$PROJECT_DIR/MASTER_TODO_LIST.md" 2>/dev/null || echo 0)
    MERGED=$(grep -c "MERGED" "$PROJECT_DIR/MASTER_TODO_LIST.md" 2>/dev/null || echo 0)
    VERIFIED=$(grep -c "VERIFIED" "$PROJECT_DIR/MASTER_TODO_LIST.md" 2>/dev/null || echo 0)
    COMPLETE=$(grep -c "COMPLETE" "$PROJECT_DIR/MASTER_TODO_LIST.md" 2>/dev/null || echo 0)
    
    echo -e "  ${YELLOW}PENDING:${NC}    $PENDING"
    echo -e "  ${BLUE}READING:${NC}    $READING"
    echo -e "  ${BLUE}WRITING:${NC}    $WRITING"
    echo -e "  ${CYAN}DRAFTED:${NC}    $DRAFTED"
    echo -e "  ${GREEN}MERGED:${NC}     $MERGED"
    echo -e "  ${GREEN}VERIFIED:${NC}   $VERIFIED"
    echo -e "  ${GREEN}COMPLETE:${NC}   $COMPLETE"
else
    echo -e "${RED}  ❌ MASTER_TODO_LIST.md not found${NC}"
fi

# =============================================================================
# STEP 8: Check Session Logs
# =============================================================================
echo -e "${BLUE}[8/8] Checking session logs...${NC}"
if [[ -d "$LOGS_DIR" ]]; then
    LOG_COUNT=$(ls -1 "$LOGS_DIR"/*.log 2>/dev/null | wc -l)
    echo -e "${GREEN}  ✅ Log directory exists: $LOGS_DIR ($LOG_COUNT log files)${NC}"
    ls -1 "$LOGS_DIR"/*.log 2>/dev/null | head -5 | sed 's/^/      /'
else
    echo -e "${YELLOW}  ⚠️  Log directory not found: $LOGS_DIR (will create on first push)${NC}"
fi

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}                    STARTUP COMPLETE — READY TO RESUME                      ${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════════${NC}"
echo ""

# =============================================================================
# QUICK ACTIONS MENU
# =============================================================================
echo -e "${YELLOW}Quick Actions:${NC}"
echo "  1. Start master token ring:     bash $SCRIPTS_DIR/earthbeatv3.sh tokenring \"publish-master\" 4 &"
echo "  2. Start stream chamber:        bash $SCRIPTS_DIR/earthbeatv3.sh chamber \"foundation-stream\" &"
echo "  3. View master todo:            cat $PROJECT_DIR/MASTER_TODO_LIST.md"
echo "  4. View heuristics guide:       cat $PROJECT_DIR/INTRO_HEURISTICS_GUIDE.md"
echo "  5. View session resume state:   cat $PROJECT_DIR/SESSION_RESUME_STATE.md"
echo "  6. Check sub-agent status:      (use OpenClaw sessions_list tool)"
echo "  7. Spawn missing sub-agents:    (use OpenClaw sessions_spawn tool)"
echo "  8. Verify merges:               bash $SCRIPTS_DIR/verify_merge.sh [paper-path]"
echo ""
echo -e "${GREEN}Next: Spawn any missing sub-agents and resume processing!${NC}"