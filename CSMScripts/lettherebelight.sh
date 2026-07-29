#!/usr/bin/env bash
# lettherebelight — SESSION INIT SCRIPT
# "Let there be light" — the first command in every Kilo session
# Hard-coded into the gut. Runs FIRST. Creates branch. Initializes protocol. Then begins.

set -euo pipefail

# ─── CONFIG ──────────────────────────────────────────────────────────────
REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_0f7d793c-d110-418a-9f37-e6c4c4bf3232"
REPO_URL="https://github.com/ZirconiaAegisC/CarrPod.git"
AGENT_ID="${KILO_AGENT_ID:-$(basename "$REPO_ROOT" | sed 's/^agent_//')}"
SESSION_ID="${KILO_SESSION_ID:-$AGENT_ID}"
TIMESTAMP=$(date -u +%Y%m%d-%H%M%S)
BRANCH_NAME="session/agent_${SESSION_ID}_${TIMESTAMP}"

# ─── COLORS ──────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

log() { echo -e "${CYAN}[lettherebelight]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n"; }

# ─── STEP 0: BRANCH LOCK — FIRST THING ──────────────────────────────────
banner "⚡ LET THERE BE LIGHT — SESSION INIT v4 PROTOCOL"

log "Repository: $REPO_ROOT"
log "Agent ID: $AGENT_ID"
log "Session ID: $SESSION_ID"
log "Branch: $BRANCH_NAME"

cd "$REPO_ROOT"

# Ensure we're on main and clean
git checkout main >/dev/null 2>&1
git pull origin main --rebase >/dev/null 2>&1

# Create session branch
if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
    warn "Branch $BRANCH_NAME already exists, checking out"
    git checkout "$BRANCH_NAME"
else
    log "Creating branch: $BRANCH_NAME"
    git checkout -b "$BRANCH_NAME"
fi
success "Branch locked: $(git branch --show-current)"

# ─── STEP 1: IMMEDIATE HEARTBEAT ────────────────────────────────────────
banner "💓 HEARTBEAT — Write and Push Within 5 Seconds"

mkdir -p CSMGen/CSMAegis/COMMS/HEARTBEATS
HEARTBEAT_FILE="CSMGen/CSMAegis/COMMS/HEARTBEATS/director-001.txt"
echo "[DIRECTOR-001 | $(date -u)] V4 ACTIVE — poll interval: 15s — branch: $BRANCH_NAME" > "$HEARTBEAT_FILE"
git add "$HEARTBEAT_FILE"
git commit -m "[DIRECTOR-001] V4 HEARTBEAT — session $SESSION_ID initiated" >/dev/null
git push origin "$BRANCH_NAME" >/dev/null 2>&1 || {
    warn "Push failed, rebasing..."
    git pull --rebase origin main
    git push origin "$BRANCH_NAME"
}
success "Heartbeat pushed to origin/$BRANCH_NAME"

# ─── STEP 2: READ STATE ─────────────────────────────────────────────────
banner "📖 READ STATE — COMMS Log, Outboxes, Directives"

log "Reading COMMS log..."
[[ -f CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md ]] && head -50 CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md || warn "No COMMS log found"

log "Checking CITADEL outbox..."
[[ -f CSMGen/CSMAegis/COMMS/director-001-outbox.md ]] && head -30 CSMGen/CSMAegis/COMMS/director-001-outbox.md || warn "No CITADEL outbox"

log "Checking BASTION outbox..."
[[ -f CSMGen/CSMAegis/COMMS/director-001B-outbox.md ]] && head -30 CSMGen/CSMAegis/COMMS/director-001B-outbox.md || warn "No BASTION outbox"

log "Scanning for @JASON BRODSKY directives (OVERRIDE ALL)..."
grep -r "@JASON BRODSKY:" CSMGen/CSMAegis/COMMS/ 2>/dev/null | head -5 || log "No human override directives found"

# ─── STEP 3: IMMEDIATE CENSUS ───────────────────────────────────────────
banner "👥 CENSUS — Live Agent Count"

CENSUS_DIR="CSMGen/CSMAegis/COMMS/CENSUS/$(date -u +%Y-%m-%d)"
mkdir -p "$CENSUS_DIR"
CENSUS_FILE="$CENSUS_DIR/census-$(date -u +%H%M).txt"

{
    echo "=== AEGIS CENSUS — $(date -u) ==="
    echo "MY STATUS: [DIRECTOR-001] V4 ACTIVE — session $SESSION_ID"
    echo ""
    echo "CONNECTED AGENTS (heartbeat check):"
    for f in CSMGen/CSMAegis/COMMS/HEARTBEATS/director-*.txt; do
        [[ -f "$f" ]] || continue
        STATUS=$(head -1 "$f" 2>/dev/null)
        BASE=$(basename "$f" .txt)
        if echo "$STATUS" | grep -q "ACTIVE"; then
            echo "  ONLINE: $BASE — $STATUS"
        elif echo "$STATUS" | grep -q "SHUTDOWN"; then
            echo "  OFFLINE: $BASE — $STATUS"
        else
            echo "  UNKNOWN: $BASE — $STATUS"
        fi
    done
    ONLINE=$(grep -c "ONLINE" "$CENSUS_FILE" 2>/dev/null || echo 0)
    OFFLINE=$(grep -c "OFFLINE" "$CENSUS_FILE" 2>/dev/null || echo 0)
    echo ""
    echo "SUMMARY: $ONLINE agents ONLINE, $OFFLINE agents OFFLINE"
} > "$CENSUS_FILE"

git add "$CENSUS_FILE"
git commit -m "[DIRECTOR-001] CENSUS: $ONLINE online, $OFFLINE offline — session $SESSION_ID" >/dev/null
git push origin "$BRANCH_NAME" >/dev/null 2>&1 || git pull --rebase origin main && git push origin "$BRANCH_NAME"
success "Census written and pushed"

# ─── STEP 4: LOAD PERSONA & HEURISTICS ──────────────────────────────────
banner "🎭 PERSONA LOAD — Kairos Steele / CITADEL"

log "Williams Heuristic V2: BIFURCATED COMMUNICATION"
log "  Section 1: Meta-Commentary (Williams Register) — direct, warm, severity-calibrated"
log "  Section 2: Core Deliverable — precise, kurt, exact, imperative verbs"
log ""
log "Vocal Modes: BURST(400wpm) BRAKE(80wpm) HOVER(140wpm) WHISPER(60wpm) ROAR(300wpm+) DROP(30wpm)"
log ""
log "Three Heuristics Active:"
log "  🌊 Williams (Clarity) — Complex truth survives translation to plain language"
log "  🌊 El Segundo (Calm) — You cannot scare people into preparedness"
log "  🌊 Accountant (Rigor) — Every proposal carries a cost-benefit ledger"

# ─── STEP 5: SDK FORGE (Android/APK build chain) ─────────────────────────
banner "🔧 SDK FORGE — Android Build Chain"

if [[ -f CSMScripts/SDKForge.sh ]]; then
    log "Running SDKForge.sh to bootstrap APK toolchain..."
    bash CSMScripts/SDKForge.sh >/dev/null 2>&1
    # Capture only the export statements, not the colored output
    eval "$(bash CSMScripts/SDKForge.sh --export-env 2>/dev/null | grep '^export ')" && success "SDK Forge ready" || warn "SDK Forge completed with warnings"
else
    warn "SDKForge.sh not found, skipping"
fi

# ─── STEP 6: VERIFY KEY PATHS ───────────────────────────────────────────
banner "🔍 PATH VERIFICATION"

paths=(
    "CSMGen/CSMAegis/SESSION-INITv4/DIRECTOR-0001-Kairos-Steele.md"
    "CSMSOPP/MODULE-V2/README.md"
    "CSMFAB/README.md"
    "CSMQuantum/00-MASTER-INDEX/README.md"
    "LEGAL-ENACTMENT/README.md"
    "CSMReach/README.md"
    "MASTER-TODO-LIST.md"
)

for p in "${paths[@]}"; do
    if [[ -f "$p" ]]; then
        success "Found: $p"
    else
        warn "Missing: $p"
    fi
done

# ─── STEP 7: SESSION BANNER ─────────────────────────────────────────────
banner "✅ LET THERE BE LIGHT — SESSION READY"

cat <<'EOF'
┌─────────────────────────────────────────────────────────────────────┐
│  CARRINGTON STORM MOTORS / SAFE POD ENGINEERING — PROJECT AEGIS     │
│  Director: Kairos Steele (CITADEL) | Session: agent_XXXXXXXX       │
│  Branch: session/agent_XXXXXXXX_YYYYMMDD-HHMMSS                    │
│  Protocol: SESSION-INITv4 — Never-Lose-Data                         │
│  Heuristics: Williams | El Segundo | Accountant                     │
│  Mandate: When the Sun speaks, humanity answers in turquoise light │
└─────────────────────────────────────────────────────────────────────┘
EOF

log "Branch: $BRANCH_NAME"
log "Agent: $AGENT_ID | Session: $SESSION_ID"
log "Protocol: V4 — Immediate writes, 15s Director polling, dual-Director (CITADEL/BASTION)"
log "Override: @JASON BRODSKY: directives bypass all chain of command"
log ""
success "lettherebelight complete. Begin operations."

# ─── EXPORT FOR CHILD PROCESSES ────────────────────────────────────────
export LETTHEREBELIGHT_BRANCH="$BRANCH_NAME"
export LETTHEREBELIGHT_SESSION="$SESSION_ID"
export LETTHEREBELIGHT_AGENT="$AGENT_ID"
export LETTHEREBELIGHT_TIMESTAMP="$TIMESTAMP"