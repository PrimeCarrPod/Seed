#!/usr/bin/env bash
# ============================================================
# RESUME_SESSION.sh — Instant Session Restore for CarrPod/SEED
# Run this in a FRESH workspace to pick up exactly where we left off
# ============================================================
# Usage: bash RESUME_SESSION.sh
# Or:    curl -sSL <this-script> | bash
# ============================================================

set -euo pipefail

# ─── CONFIGURATION ─────────────────────────────────────────
REPO_URL="https://github.com/PrimeCarrPod/SEED.git"
TARGET_BRANCH="session/agent_3d28a8e3-d56f-4af3-a7a3-d6aa3a94ae63"
WORK_DIR="$(pwd)/aegis-iron-man-session"
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
    "CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/CSM_GEN_IMAGE_M_1830s.md"
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
chmod +x CSMScripts/*.sh
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
bash -c 'chars="♥♦♣♠◉◎●○◐◑◒◓⟐⟑⟒⟓"; i=0; while true; do echo -ne "\r${chars:i%16:1}  [Aegis Iron Man: RESUMED]  ${chars:(i+8)%16:1}"; sleep 0.5; i=$((i+1)); done' &
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
echo "  Latest: CSM_GEN_IMAGE_M_1830s.md (1830s Ballooning/Charles Green / Royal Nassau / Professional Aeronaut)"
echo "  Next:   CSM_GEN_IMAGE_N_1820s.md (1820s Hydrogen Balloons)"
echo ""
echo "Heartbeat PIDs:"
ps aux | grep -E "heartbeat|earthbeat" | grep -v grep | awk '{print "  PID " $2 ": " $11 " " $12 " " $13}'
echo ""
echo "Android SDK: $ANDROID_HOME"
echo ""
echo "To continue Document L (1840s):"
echo "  cd $(pwd)"
echo "  # Create CSM_GEN_IMAGE_L_1840s.md"
echo ""

# ─── STEP 7: SAVE RESUME STATE ─────────────────────────────
banner "💾 SAVING RESUME STATE"
cat > RESUME_STATE.txt <<RESUMEEOF
RESUME_SESSION.sh executed at $(date -u)
Branch: $(git branch --show-current)
Commit: $(git rev-parse HEAD)
Work dir: $(pwd)
Documents: 20/23 complete
Next: Document N (1820s Hydrogen Balloons)
Heartbeat: Running (daemon + 4 chambers + 3 earthbeat modes + visual)
Android SDK: $ANDROID_HOME
RESUMEEOF
success "Resume state saved to RESUME_STATE.txt"

banner "✅ SESSION FULLY RESTORED — READY TO CONTINUE"
echo ""
echo "To continue Document N (1820s):"
echo "  cd $(pwd)"
echo "  # Create CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/CSM_GEN_IMAGE_N_1820s.md"
echo ""

# Keep script alive to show heartbeats
log "Press Ctrl+C to stop heartbeats and exit"
wait
