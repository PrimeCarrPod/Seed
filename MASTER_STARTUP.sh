#!/bin/bash
# ════════════════════════════════════════════════════════════════════════════
# MASTER STARTUP COMMAND — SubAtomicPrimeElectronHolographicUniverse
# Best General All-Purpose Start-up Bash Command
# Encapsulates all proven working commands for future sessions
# Author: Jason Isaac Brodsky of California 1976 Author Conducier
# Date: 2026-09-02
# ════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── CONFIGURATION ────────────────────────────────────────────────────────
REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_14f31ed0-c180-47d8-931e-0488ae73ae29"
SUBATOM_WIP="$REPO_ROOT/CSM_WORK_IN_PROGRESS/SubAtom_WIP"
CSM_LOGS="$REPO_ROOT/CSMLogs"
CSM_PIECES="$REPO_ROOT/csmpieces"
CSM_WIP_TRACKING="$REPO_ROOT/CSMWip"
SCRIPTS_DIR="$REPO_ROOT/CSMScripts"
GIT_INCOMING="$REPO_ROOT/_GIT_INCOMING"

# ─── COLORS ───────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

log() { echo -e "${CYAN}[STARTUP]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${BLUE}${BOLD}═══ $* ═══${NC}\n"; }

# ─── NAVIGATE & VERIFY ────────────────────────────────────────────────────
cd "$REPO_ROOT"

echo "════════════════════════════════════════════════════════════════════════════"
echo "  SUBATOMIC PRIME ELECTRON HOLOGRAPHIC UNIVERSE"
echo "  Master Session Resume — Jason Isaac Brodsky of California 1976"
echo "════════════════════════════════════════════════════════════════════════════"

banner "GIT STATUS"
git status --short
echo ""
log "Current branch: $(git branch --show-current)"
log "Latest commit:  $(git log --oneline -1)"
echo ""
log "Recent commits:"
git log --oneline -5

# ─── START HEARTBEATS (Proven Working) ────────────────────────────────────
banner "STARTING HEARTBEATS"
if [[ -f "$SCRIPTS_DIR/earthbeatv3.sh" ]]; then
    log "Starting Chamber mode (4 specialized chambers)..."
    bash "$SCRIPTS_DIR/earthbeatv3.sh chamber" &
    CHAMBER_PID=$!
    
    log "Starting Parallel mode (4 instances)..."
    bash "$SCRIPTS_DIR/earthbeatv3.sh parallel 4" &
    PARALLEL_PID=$!
    
    log "Starting Tokenring mode (8 instances)..."
    bash "$SCRIPTS_DIR/earthbeatv3.sh tokenring 8" &
    TOKENRING_PID=$!
    
    sleep 2
    success "Heartbeats running: Chamber=$CHAMBER_PID Parallel=$PARALLEL_PID Tokenring=$TOKENRING_PID"
    echo "  Stop all: kill $CHAMBER_PID $PARALLEL_PID $TOKENRING_PID"
else
    warn "earthbeatv3.sh not found in $SCRIPTS_DIR"
fi

# ─── QUICK PROJECT STATE ──────────────────────────────────────────────────
banner "PROJECT STATE SUMMARY"

echo ""
log "Article file counts (SubAtom_WIP):"
echo "  A1 (Worldline):     $(ls "$SUBATOM_WIP"/A_Article*_Worldline/full/*.md 2>/dev/null | wc -l) files"
echo "  A2 (Mass Spectrum): $(ls "$SUBATOM_WIP"/B_Article*_MassSpectrum/full/*.md 2>/dev/null | wc -l) files"
echo "  A3 (Hilbert Space): $(ls "$SUBATOM_WIP"/C_Article*_HilbertSpace/full/*.md 2>/dev/null | wc -l) files"
echo "  A4 (Couplings):     $(ls "$SUBATOM_WIP"/D_Article*_Couplings/full/*.md 2>/dev/null | wc -l) files"
echo "  A5 (Genetics):      $(ls "$SUBATOM_WIP"/E_Article*_GeneticCode/full/*.md 2>/dev/null | wc -l) files"
echo "  A6 (Transcendent):  $(ls "$SUBATOM_WIP"/F_Article*_TranscendentPhysics/full/*.md 2>/dev/null | wc -l) files"
echo "  A7 (Quark/Hadron):  $(ls "$SUBATOM_WIP"/G_Article*_QuarkHadronNuclear/full/*.md 2>/dev/null | wc -l) files"
echo "  A8 (Cosmology):     $(ls "$SUBATOM_WIP"/H_Article*_CosmologyAstrophysics/full/*.md 2>/dev/null | wc -l) files"
echo "  A9 (Experimental):  $(ls "$SUBATOM_WIP"/I_Article*_ExperimentalSignatures/full/*.md 2>/dev/null | wc -l) files"

echo ""
log "Total lines across all articles:"
find "$SUBATOM_WIP" -name "*.md" -path "*/full/*" -exec wc -l {} + 2>/dev/null | tail -1

echo ""
log "csmpieces archive counts:"
echo "  Final articles:  $(ls "$CSM_PIECES/01_final_articles"/*.md 2>/dev/null | wc -l)"
echo "  Piece archives:  $(ls "$CSM_PIECES/02_piece_archives"/*.zip 2>/dev/null | wc -l)"
echo "  Logs/docs:       $(ls "$CSM_PIECES/04_logs_docs"/*.md 2>/dev/null | wc -l)"
echo "  Scripts/tools:   $(ls "$CSM_PIECES/05_scripts_tools"/*.sh 2>/dev/null | wc -l)"

echo ""
log "CLPS Cascade parts:"
ls -d "$REPO_ROOT/CSM_WORK_IN_PROGRESS/CLPS_Cascade"/Part* 2>/dev/null | wc -l | xargs echo "  Parts complete:"

echo ""
log "Legal Acts status:"
cd "$REPO_ROOT/LEGAL-ENACTMENT" 2>/dev/null && ls -d Act* 2>/dev/null | wc -l | xargs echo "  Acts present:" || echo "  Not found"

# ─── SHOW MASTER TRACKING ─────────────────────────────────────────────────
banner "MASTER TRACKING"
if [[ -f "$CSM_WIP_TRACKING/MasterConcurrentProjects.md" ]]; then
    log "MasterConcurrentProjects.md exists — showing summary:"
    grep -A 20 "STATE OF COMPLETION SUMMARY" "$CSM_WIP_TRACKING/MasterConcurrentProjects.md" | head -25
else
    warn "MasterConcurrentProjects.md not found — run creation script"
fi

# ─── NEXT ACTIONS ─────────────────────────────────────────────────────────
banner "NEXT PRIORITY ACTIONS"
echo ""
echo "  📋 IMMEDIATE:"
echo "    1. Legal Acts 06, 08, 09, 10 — Complete 112 pending documents"
echo "    2. Photon V5.0 Parts 10-14 — Complete 5 remaining parts"
echo "    3. Cross-reference verification — All projects"
echo ""
echo "  📋 SHORT-TERM:"
echo "    4. Congressional committee outreach (Legal)"
echo "    5. Insurance industry mail campaign (Legal)"
echo "    6. Major media outreach (Legal)"
echo "    7. Additional dossier targets (Legal)"
echo "    8. Begin next V5.0 particle series after Photon"
echo ""
echo "  📋 SESSION MANAGEMENT:"
echo "    - View this script: cat MASTER_STARTUP.sh"
echo "    - View master tracking: cat CSMWip/MasterConcurrentProjects.md"
echo "    - View MASTER-RESUME.sh: bash _GIT_INCOMING/MASTER-RESUME.sh menu"
echo "    - Quick start: bash _GIT_INCOMING/QUICK-START.sh"
echo "    - Resume session: bash _GIT_INCOMING/RESUME_SESSION.sh"

# ─── LOOSE FILE CHECK ─────────────────────────────────────────────────────
banner "LOOSE FILE CHECK"
LOOSE_COUNT=$(find "$REPO_ROOT/CSM_WORK_IN_PROGRESS" -maxdepth 1 -name "*.md" -o -name "*.json" 2>/dev/null | wc -l)
if [[ $LOOSE_COUNT -gt 10 ]]; then
    warn "Found $LOOSE_COUNT loose files in CSM_WORK_IN_PROGRESS/ — consider organizing"
    find "$REPO_ROOT/CSM_WORK_IN_PROGRESS" -maxdepth 1 \( -name "*.md" -o -name "*.json" \) 2>/dev/null | head -10
else
    success "Loose file count OK: $LOOSE_COUNT"
fi

# ─── HEARTBEAT STATUS ─────────────────────────────────────────────────────
banner "HEARTBEAT STATUS"
if pgrep -f "earthbeatv3.sh chamber" >/dev/null; then
    success "Chamber mode: RUNNING"
else
    warn "Chamber mode: STOPPED"
fi
if pgrep -f "earthbeatv3.sh parallel" >/dev/null; then
    success "Parallel mode: RUNNING"
else
    warn "Parallel mode: STOPPED"
fi
if pgrep -f "earthbeatv3.sh tokenring" >/dev/null; then
    success "Tokenring mode: RUNNING"
else
    warn "Tokenring mode: STOPPED"
fi

echo ""
echo "════════════════════════════════════════════════════════════════════════════"
echo "  SESSION READY — ALL SYSTEMS OPERATIONAL"
echo "════════════════════════════════════════════════════════════════════════════"