#!/usr/bin/env bash
# ============================================================
# RESUME_SESSION.sh — Instant Session Restore for Global Clay Deep Research
# Run this in a FRESH workspace to pick up exactly where we left off
# ============================================================
# Usage: bash RESUME_SESSION.sh
# Or:    curl -sSL <this-script> | bash
# ============================================================

set -euo pipefail

# ─── CONFIGURATION ─────────────────────────────────────────
REPO_URL="https://github.com/PrimeCarrPod/SEED.git"
TARGET_BRANCH="session/agent_3b2f0112-6503-4f30-9483-47f75c71e4aa"
WORK_DIR="$(pwd)/clay-deep-research"
TIMESTAMP=$(date -u +%Y%m%d-%H%M%S)

# ─── COLORS ────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; MAGENTA='\033[0;35m'; BOLD='\033[1m'; NC='\033[0m'
log() { echo -e "${CYAN}[RESUME]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n"; }

# ─── STEP 1: CLONE REPO ────────────────────────────────────
banner "📥 CLONING REPOSITORY"
log "Target: $REPO_URL"
log "Branch: $TARGET_BRANCH"
log "Directory: $WORK_DIR"

if [[ -d "$WORK_DIR" ]]; then
    warn "Directory exists, removing..."
    rm -rf "$WORK_DIR"
fi

git clone --branch "$TARGET_BRANCH" --single-branch "$REPO_URL" "$WORK_DIR" || {
    error "Clone failed. Trying main branch..."
    git clone --branch main --single-branch "$REPO_URL" "$WORK_DIR" || {
        error "Clone failed completely"
        exit 1
    }
    cd "$WORK_DIR"
    git checkout -b "$TARGET_BRANCH" origin/"$TARGET_BRANCH" 2>/dev/null || {
        error "Could not checkout session branch"
        exit 1
    }
}

cd "$WORK_DIR"
success "Repository cloned and checked out"

# ─── STEP 2: VERIFY KEY FILES ──────────────────────────────
banner "🔍 VERIFYING KEY FILES"

files=(
    "MASTER-TODO-LIST.md"
    "CSMScripts/SESSION-START.sh"
    "CSMScripts/SDKForge.sh"
    "CSMScripts/HEARTBEAT-MANAGE.sh"
    "CSMScripts/lettherebelight.sh"
    "CSMScripts/lettherebelightz.sh"
    "CSMScripts/heartbeat-daemon.sh"
    "CSMScripts/heartbeat-chamber.sh"
    "CSMScripts/heartbeat-guardian.sh"
    "CSMScripts/keepalive-daemon.sh"
    "CSMScripts/earthbeatv3.sh"
    "CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/CSM_GEN_IMAGE_J_1860s.md"
    "CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/CSM_GEN_IMAGE_K_1850s.md"
    "CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/CSM_GEN_IMAGE_L_1840s.md"
    "CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/CSM_GEN_IMAGE_N_1820s.md"
    "CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/PROGRESS_LOG.md"
)

missing=0
for f in "${files[@]}"; do
    if [[ -f "$f" ]]; then
        success "Found: $f"
    else
        error "MISSING: $f"
        missing=$((missing + 1))
    fi
done

if [[ $missing -gt 0 ]]; then
    error "$missing critical files missing"
    exit 1
fi
success "All key files verified"

# ─── STEP 3: MAKE SCRIPTS EXECUTABLE ───────────────────────
banner "🔧 MAKING SCRIPTS EXECUTABLE"
chmod +x CSMScripts/*.sh 2>/dev/null || true
success "Scripts executable"

# ─── STEP 4: START HEARTBEAT INFRASTRUCTURE ────────────────
banner "💓 STARTING HEARTBEAT INFRASTRUCTURE"

# Heartbeat daemon
bash CSMScripts/heartbeat-daemon.sh &
HB_PID=$!
log "Heartbeat daemon: PID $HB_PID"

# 4 chambers
for c in 1 2 3 4; do
    bash CSMScripts/heartbeat-chamber.sh $c &
    log "Chamber $c started"
done

# Earthbeat v3 - all three modes
bash CSMScripts/earthbeatv3.sh chamber &
log "Earthbeat chamber mode started"

bash CSMScripts/earthbeatv3.sh parallel 4 &
log "Earthbeat parallel mode started"

bash CSMScripts/earthbeatv3.sh tokenring 8 &
log "Earthbeat tokenring mode started"

# Visual heartbeat
bash -c 'chars="♥♦♣♠◉◎●○◐◑◒◓⟐⟑⟒⟓"; i=0; while true; do echo -ne "\r${chars:i%16:1}  [Clay Deep Research: RESUMED]  ${chars:(i+8)%16:1}"; sleep 0.5; i=$((i+1)); done' &
log "Visual heartbeat started"

success "All heartbeat processes running"

# ─── STEP 5: BOOTSTRAP ANDROID SDK ─────────────────────────
banner "🔧 BOOTSTRAPPING ANDROID SDK TOOLCHAIN"
bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)"
success "Android SDK ready: \$ANDROID_HOME=$ANDROID_HOME"

# ─── STEP 6: DISPLAY SESSION STATUS ────────────────────────
banner "📊 SESSION STATUS"

echo "Branch: $(git branch --show-current)"
echo "Commit: $(git log --oneline -1)"
echo "Work dir: $(pwd)"
echo ""
echo "Documents completed: 20/23"
echo "  Latest: CSM_GEN_IMAGE_N_1820s.md (1820s Hydrogen Balloons / Charles & Robert / Gay-Lussac)"
echo "  Next:   CSM_GEN_IMAGE_M_1830s.md (1830s Ballooning/Charles Green)"
echo ""
echo "Heartbeat PIDs:"
ps aux | grep -E "heartbeat|earthbeat" | grep -v grep | awk '{print "  PID " $2 ": " $11 " " $12 " " $13}'
echo ""
echo "Android SDK: $ANDROID_HOME"
echo ""

# ─── STEP 7: SAVE RESUME STATE ─────────────────────────────
banner "💾 SAVING RESUME STATE"
cat > RESUME_STATE.txt <<RESUMEEOF
RESUME_SESSION.sh executed at $(date -u)
Branch: $(git branch --show-current)
Commit: $(git rev-parse HEAD)
Work dir: $(pwd)
Documents: 20/23 complete
Next: Document M (1830s Ballooning/Charles Green)
Heartbeat: Running (daemon + 4 chambers + 3 earthbeat modes + visual)
Android SDK: $ANDROID_HOME
Session ID: agent_3b2f0112-6503-4f30-9483-47f75c71e4aa
Timestamp: $(date -u +%Y%m%d-%H%M%S)
RESUMEEOF
success "Resume state saved to RESUME_STATE.txt"

# ─── STEP 8: FINAL INSTRUCTIONS ────────────────────────────
banner "✅ SESSION FULLY RESTORED — READY TO CONTINUE"
echo ""
echo "Run this to continue Document 17 synthesis:"
echo "  cd $(pwd)"
echo "  # Continue with: Push to GitHub, zip, verify, log"
echo ""
echo "To push to GitHub:"
echo "  bash CSMScripts/Github_Handler.sh save DeepResearch/CONTENT.PDF/ContentFiles/DOC17_Synthesis_Global_Argillaceous_Dynamics_Future.md \"Complete 17-document clay synthesis\" main"
echo ""
echo "To verify all files:"
echo "  bash verify_all.sh  # (create this script)"
echo ""

# ─── STEP 9: KEEP ALIVE ────────────────────────────────────
log "Press Ctrl+C to stop heartbeats and exit"
wait