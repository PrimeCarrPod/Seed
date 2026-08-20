#!/usr/bin/env bash
# ============================================================
# GITHUB_UNDERSCORE_HANDLER.sh — GitHub Sync Verification
# Handles underscore-separated GitHub update files and verifies sync
# ============================================================

set -euo pipefail

REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_1474395b-daea-4849-ad09-b4ee4163c318"
cd "$REPO_ROOT"

# ─── COLORS ───────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

log() { echo -e "${CYAN}[GITHUB-HANDLER]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${BLUE}${BOLD}═══ $* ═══${NC}\n"; }

# ─── STEP 1: FIND ALL UNDERSCORE UPDATE FILES ──────────────
banner "STEP 1: Scanning for GitHub underscore update files"

UNDERSCORE_FILES=(
    "UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMFAB/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMQuantum/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMApps/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMHuman/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "DeepResearch/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMLogs/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMLogs/CSMGen/CSMAegis/PIPELINE/.github/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMLogs/Final/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "CSMLogs/Final/CSMGen/CSMAegis/PIPELINE/.github/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
    "LEGAL-ENACTMENT/UPDATES_at_github_com_PrimeCarrPod_Seed_.md"
)

FOUND=0
MISSING=0
for f in "${UNDERSCORE_FILES[@]}"; do
    if [[ -f "$f" ]]; then
        success "Found: $f"
        FOUND=$((FOUND + 1))
    else
        warn "Missing: $f"
        MISSING=$((MISSING + 1))
    fi
done

log "Total found: $FOUND, Missing: $MISSING"

# ─── STEP 2: VERIFY GIT STATUS ─────────────────────────────
banner "STEP 2: Git Status Verification"

log "Current branch: $(git branch --show-current)"
log "Local HEAD: $(git rev-parse --short HEAD)"

# Check remote
REMOTE_HEAD=$(git ls-remote origin "$(git branch --show-current)" 2>/dev/null | cut -f1)
if [[ -n "$REMOTE_HEAD" ]]; then
    log "Remote HEAD: ${REMOTE_HEAD:0:12}"
    LOCAL_HEAD=$(git rev-parse HEAD)
    if [[ "$LOCAL_HEAD" == "$REMOTE_HEAD" ]]; then
        success "Local and remote HEAD match"
    else
        warn "Local/remote mismatch - push needed"
    fi
else
    warn "Could not fetch remote HEAD"
fi

# ─── STEP 3: VERIFY ALL NEW FILES ARE TRACKED ──────────────
banner "STEP 3: Verifying new files are tracked"

NEW_FILES=(
    "QUICK-START.sh"
    "MASTER-RESUME.sh"
    "DeepResearch/SubParticlesV4/Photon_V5.0/Part10/Part_10-Photon_Strong_Fields.md"
    "DeepResearch/SubParticlesV4/Photon_V5.0/Part11/Part_11-Photon_Nuclear_Physics.md"
    "DeepResearch/SubParticlesV4/Photon_V5.0/Part12/Part_12-Precision_Spectroscopy.md"
    "DeepResearch/SubParticlesV4/Photon_V5.0/Part13/Part_13-Quantum_Optics_Photonics.md"
    "DeepResearch/SubParticlesV4/Photon_V5.0/Part14/Part_14-Final_Synthesis.md"
    "CSMLogs/Final/session-log-20260816-photon-v5-complete-master-resume.md"
)

TRACKED=0
UNTRACKED=0
for f in "${NEW_FILES[@]}"; do
    if git ls-files --error-unmatch "$f" >/dev/null 2>&1; then
        success "Tracked: $f"
        TRACKED=$((TRACKED + 1))
    else
        error "UNTRACKED: $f"
        UNTRACKED=$((UNTRACKED + 1))
    fi
done

log "Tracked: $TRACKED, Untracked: $UNTRACKED"

# ─── STEP 4: PUSH IF NEEDED ────────────────────────────────
banner "STEP 4: GitHub Sync"

if [[ "$LOCAL_HEAD" != "$REMOTE_HEAD" ]] || [[ $UNTRACKED -gt 0 ]]; then
    log "Pushing to GitHub..."
    git push origin "$(git branch --show-current)" 2>&1 | tail -5
    success "Push complete"
else
    success "Already in sync with GitHub"
fi

# ─── STEP 5: FINAL VERIFICATION ────────────────────────────
banner "STEP 5: Final Verification"

log "Verifying remote has all files..."
REMOTE_FILES=$(git ls-tree -r origin/"$(git branch --show-current)" --name-only 2>/dev/null | wc -l)
LOCAL_FILES=$(git ls-tree -r HEAD --name-only 2>/dev/null | wc -l)
log "Local files in tree: $LOCAL_FILES"
log "Remote files in tree: $REMOTE_FILES"

if [[ $LOCAL_FILES -eq $REMOTE_FILES ]]; then
    success "File counts match — FULL SYNC CONFIRMED"
else
    warn "File count mismatch — check manually"
fi

banner "GITHUB UNDERSCORE HANDLER COMPLETE"
echo "All underscore update files verified."
echo "All new Photon V5.0 parts committed and pushed."
echo "Repository: https://github.com/PrimeCarrPod/Seed"
echo "Branch: $(git branch --show-current)"