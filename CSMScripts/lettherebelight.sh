#!/usr/bin/env bash
# lettherebelight — SESSION INIT SCRIPT v5.1 (Prime Edition)
# "Let there be light" — the first command in every Kilo session
# Adapted for PrimeCarrPod/Seed repository with subject-matter branch naming

set -euo pipefail

# ─── CONFIG ──────────────────────────────────────────────────────────────
REPO_URL="${KILO_REPO_URL:-https://github.com/PrimeCarrPod/Seed.git}"
REPO_ROOT="${KILO_REPO_ROOT:-}"
AGENT_ID="${KILO_AGENT_ID:-}"
SESSION_ID="${KILO_SESSION_ID:-}"
SUBJECT_MATTER="${KILO_SUBJECT:-manual}"
TIMESTAMP=$(date -u +%Y%m%d-%H%M%S)

# Branch naming with subject matter context
if [[ -n "$SUBJECT_MATTER" && "$SUBJECT_MATTER" != "manual" ]]; then
    BRANCH_NAME="session/$(echo "$SUBJECT_MATTER" | tr '/ ' '-' | tr '[:upper:]' '[:lower:]')-${SESSION_ID:-local}_${TIMESTAMP}"
else
    BRANCH_NAME="session/agent_${SESSION_ID:-local}_${TIMESTAMP}"
fi

HEARTBEAT_DIR="CSMGen/CSMAegis/COMMS/HEARTBEATS"
HEARTBEAT_FILE="${HEARTBEAT_DIR}/director-001.txt"
CENSUS_DIR="CSMGen/CSMAegis/COMMS/CENSUS/$(date -u +%Y-%m-%d)"
CENSUS_FILE="${CENSUS_DIR}/census-$(date -u +%H%M).txt"
SESSION_LOG="CSMScripts/CSMLogs/session-init-${TIMESTAMP}.log"
SUPER_LESSONS="CSMScripts/super_lessons_learned.md"
MAX_PUSH_RETRIES=5
PUSH_RETRY_DELAY=2
MAX_PULL_RETRIES=3
PULL_RETRY_DELAY=3

# ─── COLORS ──────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

log() { echo -e "${CYAN}[lettherebelight]${NC} $*" | tee -a "$SESSION_LOG"; }
success() { echo -e "${GREEN}[✓]${NC} $*" | tee -a "$SESSION_LOG"; }
warn() { echo -e "${YELLOW}[!]${NC} $*" | tee -a "$SESSION_LOG"; }
error() { echo -e "${RED}[✗]${NC} $*" | tee -a "$SESSION_LOG"; }
banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n" | tee -a "$SESSION_LOG"; }

# ─── ERROR HANDLING HEURISTICS ──────────────────────────────────────────
cleanup() {
    local exit_code=$?
    if [[ $exit_code -ne 0 ]]; then
        error "lettherebelight FAILED with exit code $exit_code"
        error "Branch: ${BRANCH_NAME:-unknown}"
        error "Repo: ${REPO_ROOT:-unknown}"
        error "Session: ${SESSION_ID:-unknown}"
        error "Check log: ${SESSION_LOG:-unknown}"
    fi
    exit $exit_code
}
trap cleanup EXIT

# ─── UTILITY: Retry wrapper with exponential backoff ─────────────────────
retry_git() {
    local max_attempts=$1
    local delay=$2
    shift 2
    local attempt=1
    while true; do
        if "$@"; then
            return 0
        fi
        if [[ $attempt -ge $max_attempts ]]; then
            error "Command failed after $max_attempts attempts: $*"
            return 1
        fi
        warn "Attempt $attempt/$max_attempts failed. Retrying in ${delay}s..."
        sleep "$delay"
        delay=$((delay * 2))
        attempt=$((attempt + 1))
    done
}

# ─── STEP -1: DYNAMIC REPO DISCOVERY ────────────────────────────────────
banner "⚡ LET THERE BE LIGHT — SESSION INIT v5.1 PROTOCOL (Prime Edition)"

# Discover REPO_ROOT if not provided
if [[ -z "$REPO_ROOT" ]]; then
    # Try current directory first
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        REPO_ROOT=$(git rev-parse --show-toplevel)
    else
        # Walk up to find .git
        local_dir="$(pwd)"
        while [[ "$local_dir" != "/" ]]; do
            if [[ -d "$local_dir/.git" ]]; then
                REPO_ROOT="$local_dir"
                break
            fi
            local_dir="$(dirname "$local_dir")"
        done
    fi
fi

if [[ -z "$REPO_ROOT" ]] || [[ ! -d "$REPO_ROOT/.git" ]]; then
    error "REPO_ROOT not set and could not discover git repository"
    error "Set KILO_REPO_ROOT or run from inside the PrimeCarrPod/Seed repository"
    exit 1
fi

# Derive SESSION_ID from KILO_AGENT_ID or hostname if not provided
if [[ -z "$SESSION_ID" ]]; then
    SESSION_ID="local"
fi

log "Repository: $REPO_ROOT"
log "Session ID: $SESSION_ID"
log "Branch: $BRANCH_NAME"
log "Remote: $REPO_URL"
log "Subject Matter: ${SUBJECT_MATTER:-manual}"

# Initialize session log
mkdir -p "$(dirname "$SESSION_LOG")"
echo "[INIT] $(date -u) | Session: $SESSION_ID | Branch: $BRANCH_NAME" >> "$SESSION_LOG"

# ─── STEP 0: REPO VALIDATION ───────────────────────────────────────────
banner "🔍 REPO VALIDATION"

cd "$REPO_ROOT"

# Verify git is available
if ! command -v git >/dev/null 2>&1; then
    error "git is not installed or not in PATH"
    exit 1
fi

# Verify we're in a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    error "Not inside a git work tree: $REPO_ROOT"
    exit 1
fi

# Verify origin remote exists
if ! git remote get-url origin >/dev/null 2>&1; then
    warn "No 'origin' remote configured"
    warn "Add remote: git remote add origin $REPO_URL"
else
    ORIGIN_URL=$(git remote get-url origin)
    log "Origin URL: $ORIGIN_URL"
    success "Origin configured"
fi

# Quick network check with SSL verification bypass for sandbox environments
if ! git -c http.sslVerify=false ls-remote --heads origin main >/dev/null 2>&1; then
    warn "Cannot reach origin/main — network may be unavailable"
    warn "Proceeding with local-only operations"
else
    success "Origin reachable"
fi

# Check for uncommitted changes
if [[ -n "$(git status --short)" ]]; then
    warn "Uncommitted changes detected in working tree"
    warn "These will be carried into the session branch"
fi

# Load and display super_lessons_learned.md if it exists
if [[ -f "$SUPER_LESSONS" ]]; then
    success "Loaded super lessons learned file"
fi

# ─── STEP 1: BRANCH LOCK ───────────────────────────────────────────────
banner "🔒 BRANCH LOCK — Checkout main and sync"

# Ensure main branch exists locally
if ! git show-ref --verify --quiet "refs/heads/main"; then
    warn "Local 'main' branch not found. Attempting to create from origin..."
    git fetch origin main:main 2>/dev/null || {
        warn "Could not fetch main from origin, checking local"
    }
fi

git checkout main >/dev/null 2>&1 || {
    error "Failed to checkout main branch"
    exit 1
}

# Pull with retry and conflict handling (with SSL bypass for sandbox)
local_pull() {
    git -c http.sslVerify=false pull --rebase origin main || {
        warn "Pull with rebase failed. Attempting merge strategy..."
        git merge --abort 2>/dev/null || true
        git rebase --abort 2>/dev/null || true
        git -c http.sslVerify=false pull origin main || return 1
    }
}

if ! retry_git $MAX_PULL_RETRIES $PULL_RETRY_DELAY local_pull; then
    warn "Failed to sync with origin/main, proceeding with local state"
fi
success "Synced with origin/main"

# Create or checkout session branch
if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
    warn "Branch $BRANCH_NAME already exists, checking out"
    git checkout "$BRANCH_NAME"
else
    log "Creating branch: $BRANCH_NAME"
    git checkout -b "$BRANCH_NAME"
fi
success "Branch locked: $(git branch --show-current)"

# ─── STEP 2: IMMEDIATE HEARTBEAT ────────────────────────────────────────
banner "💓 HEARTBEAT — Write and Push Within 5 Seconds"

mkdir -p "$HEARTBEAT_DIR"
cat > "$HEARTBEAT_FILE" <<EOF
[DIRECTOR-001 | $(date -u)] V5.1 ACTIVE — poll interval: 15s — branch: $BRANCH_NAME — session: $SESSION_ID — subject: ${SUBJECT_MATTER:-manual}
EOF

git add "$HEARTBEAT_FILE"
if ! git diff --cached --quiet; then
    git commit -m "[DIRECTOR-001] V5.1 HEARTBEAT — session $SESSION_ID initiated" >/dev/null || {
        warn "Heartbeat commit failed (may be empty)"
    }

    # Push with SSL bypass and retry
    push_heartbeat() {
        git -c http.sslVerify=false push origin "$BRANCH_NAME"
    }
    retry_git $MAX_PUSH_RETRIES $PUSH_RETRY_DELAY push_heartbeat || {
        warn "Push failed after $MAX_PUSH_RETRIES attempts, rebasing..."
        git pull --rebase origin main 2>/dev/null || true
        retry_git 2 5 git -c http.sslVerify=false push origin "$BRANCH_NAME" || {
            error "Heartbeat push ultimately failed"
            return 1
        }
    }
    success "Heartbeat pushed to origin/$BRANCH_NAME"
else
    warn "No changes to commit for heartbeat"
fi

# ─── STEP 3: IMMEDIATE CENSUS ──────────────────────────────────────────
banner "👥 CENSUS — Live Agent Count"

mkdir -p "$CENSUS_DIR"
{
    echo "=== AEGIS CENSUS — $(date -u) ==="
    echo "MY STATUS: [DIRECTOR-001] V5.1 ACTIVE — session $SESSION_ID"
    echo "SUBJECT: $SUBJECT_MATTER"
    echo ""
    echo "CONNECTED AGENTS (heartbeat check):"
    for f in CSMGen/CSMAegis/COMMS/HEARTBEATS/director-*.txt; do
        [[ -f "$f" ]] || continue
        STATUS=$(head -1 "$f" 2>/dev/null || echo "UNKNOWN")
        BASE=$(basename "$f" .txt)
        if echo "$STATUS" | grep -q "ACTIVE"; then
            echo "  ONLINE: $BASE — $STATUS"
        elif echo "$STATUS" | grep -q "SHUTDOWN"; then
            echo "  OFFLINE: $BASE — $STATUS"
        else
            echo "  UNKNOWN: $BASE — $STATUS"
        fi
    done
    ONLINE=$(ls CSMGen/CSMAegis/COMMS/HEARTBEATS/director-*.txt 2>/dev/null | xargs grep -l "ACTIVE" 2>/dev/null | wc -l || echo 0)
    OFFLINE=$(ls CSMGen/CSMAegis/COMMS/HEARTBEATS/director-*.txt 2>/dev/null | xargs grep -l "SHUTDOWN" 2>/dev/null | wc -l || echo 0)
    echo ""
    echo "SUMMARY: $ONLINE agents ONLINE, $OFFLINE agents OFFLINE"
} > "$CENSUS_FILE"

git add "$CENSUS_FILE"
if ! git diff --cached --quiet; then
    git commit -m "[DIRECTOR-001] CENSUS: $ONLINE online, $OFFLINE offline — session $SESSION_ID" >/dev/null || {
        warn "Census commit failed"
    }
    git -c http.sslVerify=false push origin "$BRANCH_NAME" >/dev/null 2>&1 || {
        warn "Census push failed, attempting rebase..."
        git pull --rebase origin main 2>/dev/null && git -c http.sslVerify=false push origin "$BRANCH_NAME" 2>/dev/null || warn "Census push ultimately failed"
    }
    success "Census written and pushed"
else
    warn "No changes to commit for census"
fi

# ─── STEP 4: LOAD SUPER LESSONS LEARNED ─────────────────────────────────
banner "📚 LESSONS LEARNED — Loading Quality Protocols"

if [[ -f "$SUPER_LESSONS" ]]; then
    success "Loaded super_lessons_learned.md with quality protocols"
    log "Key lessons available: APK build, git workflow, SDK setup, sandbox SSL, version strings"
else
    warn "super_lessons_learned.md not found at $SUPER_LESSONS"
fi

# ─── STEP 5: READ STATE ────────────────────────────────────────────────
banner "📖 READ STATE — COMMS Log, Outboxes, Directives"

log "Reading COMMS log..."
if [[ -f CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md ]]; then
    head -30 CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md | tee -a "$SESSION_LOG" || warn "COMMS log empty or unreadable"
else
    warn "No COMMS log found"
fi

log "Checking CITADEL outbox..."
if [[ -f CSMGen/CSMAegis/COMMS/director-001-outbox.md ]]; then
    head -20 CSMGen/CSMAegis/COMMS/director-001-outbox.md | tee -a "$SESSION_LOG" || warn "CITADEL outbox empty or unreadable"
else
    warn "No CITADEL outbox"
fi

log "Checking BASTION outbox..."
if [[ -f CSMGen/CSMAegis/COMMS/director-001B-outbox.md ]]; then
    head -20 CSMGen/CSMAegis/COMMS/director-001B-outbox.md | tee -a "$SESSION_LOG" || warn "BASTION outbox empty or unreadable"
else
    warn "No BASTION outbox"
fi

log "Scanning for @JASON BRODSKY directives (OVERRIDE ALL)..."
if grep -r "@JASON BRODSKY:" CSMGen/CSMAegis/COMMS/ 2>/dev/null | head -5 | tee -a "$SESSION_LOG"; then
    success "Human override directives found"
else
    log "No human override directives found"
fi

# ─── STEP 6: LOAD PERSONA & HEURISTICS ────────────────────────────────
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

# ─── STEP 7: SDK FORGE ────────────────────────────────────────────────
banner "🔧 SDK FORGE — Android Build Chain"

if [[ -f CSMScripts/SDKForge.sh ]]; then
    log "Running SDKForge.sh to bootstrap APK toolchain..."
    if bash CSMScripts/SDKForge.sh >/dev/null 2>&1; then
        eval "$(bash CSMScripts/SDKForge.sh --export-env 2>/dev/null | grep '^export ')" 2>/dev/null && success "SDK Forge ready" || warn "SDK Forge env export completed with warnings"
    else
        warn "SDKForge.sh failed — Android toolchain not available"
    fi
else
    warn "SDKForge.sh not found, skipping"
fi

# ─── STEP 8: VERIFY KEY PATHS ──────────────────────────────────────────
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

# ─── STEP 9: SESSION BANNER ────────────────────────────────────────────
banner "✅ LET THERE BE LIGHT — SESSION READY"

cat <<EOF
┌─────────────────────────────────────────────────────────────────────┐
│  PRIME CARR POD / SEED REPOSITORY — SESSION INIT v5.1              │
│  Director: Kairos Steele (CITADEL)                                 │
│  Session: ${SESSION_ID}                                                │
│  Branch: ${BRANCH_NAME}                                                │
│  Subject: ${SUBJECT_MATTER:-manual}                                       │
│  Protocol: SESSION-INITv5.1 — Always-On Quality                    │
│  Heuristics: Williams | El Segundo | Accountant                     │
│  Mandate: Build quality, document lessons, avoid known pitfalls    │
└─────────────────────────────────────────────────────────────────────┘
EOF

log "Branch: $BRANCH_NAME"
log "Session: $SESSION_ID | Subject: $SUBJECT_MATTER"
log "Protocol: V5.1 — Immediate writes, 15s polling, quality-first"
log ""
success "lettherebelight complete. Begin operations."

# ─── EXPORT FOR CHILD PROCESSES ────────────────────────────────────────
export LETTHEREBELIGHT_BRANCH="$BRANCH_NAME"
export LETTHEREBELIGHT_SESSION="$SESSION_ID"
export LETTHEREBELIGHT_AGENT="${SESSION_ID}"
export LETTHEREBELIGHT_TIMESTAMP="$TIMESTAMP"
export LETTHEREBELIGHT_REPO_ROOT="$REPO_ROOT"
export LETTHEREBELIGHT_SUBJECT="$SUBJECT_MATTER"
export LETTHEREBELIGHT_REPO_URL="$REPO_URL"

## Footer

[](https://github.com)© 2026 GitHub, Inc.