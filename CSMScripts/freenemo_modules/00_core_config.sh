#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 00: Core Configuration, Colors, Logging, Environment Variables
# ════════════════════════════════════════════════════════════════════════════

# ─── GLOBAL CONFIG ──────────────────────────────────────────────────────────
export FREENEMO_VERSION="1.0.0"
export FREENEMO_START_TIME=$(date -u +%s)
export FREENEMO_TIMESTAMP=$(date -u +%Y%m%d-%H%M%S)
export FREENEMO_SESSION_ID="${KILO_SESSION_ID:-$(basename "$(pwd)" | sed 's/^agent_//')}"
export FREENEMO_AGENT_ID="${KILO_AGENT_ID:-${FREENEMO_SESSION_ID}}"

# Repo & Git
export REPO_URL="${KILO_REPO_URL:-https://github.com/PrimeCarrPod/SEED.git}"
export REPO_ROOT="${KILO_REPO_ROOT:-}"
export BRANCH_NAME="session/agent_${FREENEMO_SESSION_ID}_${FREENEMO_TIMESTAMP}"

# Nemotron 3 Ultra API
export NEMOTRON_API_ENDPOINT="${NVIDIA_API_URL:-https://openrouter.ai/api/v1/chat/completions}"
export NEMOTRON_API_KEY="${NVIDIA_API_KEY:-${OPENROUTER_API_KEY:-}}"
export NEMOTRON_MODEL="${NVIDIA_MODEL_NAME:-nvidia/nemotron-3-ultra-550b-a55b:free}"

# Nemotron Payload Defaults (optimized for 55B active / 1M context)
export NEMOTRON_THINKING_MODE="${NEMOTRON_THINKING_MODE:-true}"
export NEMOTRON_REASONING_EFFORT="${NEMOTRON_REASONING_EFFORT:-medium}"
export NEMOTRON_THINKING_BUDGET="${NEMOTRON_THINKING_BUDGET:-1024}"
export NEMOTRON_MAX_TOKENS="${NEMOTRON_MAX_TOKENS:-4096}"
export NEMOTRON_FORCE_NON_EMPTY="${NEMOTRON_FORCE_NON_EMPTY:-true}"
export NEMOTRON_RESPONSE_FORMAT='{"type": "json_object"}'

# Heartbeat & Earthbeat
export HEARTBEAT_INTERVAL="${HEARTBEAT_INTERVAL:-3}"
export HEARTBEAT_CHARS="${HEARTBEAT_CHARS:-♥♦♣♠}"
export EARTHBEAT_MODE="${EARTHBEAT_MODE:-chamber}"
export EARTHBEAT_COUNT="${EARTHBEAT_COUNT:-4}"

# SDK Forge
export ANDROID_HOME="${ANDROID_HOME:-$(pwd)/.sdk/android-sdk}"
export BUILD_TOOLS_VERSION="${BUILD_TOOLS_VERSION:-33.0.1}"
export COMPILE_SDK="${COMPILE_SDK:-33}"

# Logging Structure: CSMLogs/Sessions/Session'Date-Time'/
export CSM_LOGS_ROOT="${CSM_LOGS_ROOT:-CSMLogs}"
export SESSION_LOG_DIR="${CSM_LOGS_ROOT}/Sessions/Session${FREENEMO_TIMESTAMP}"
export HEARTBEAT_LOG_DIR="${SESSION_LOG_DIR}/heartbeats"
export GIT_STATS_LOG_DIR="${SESSION_LOG_DIR}/gitstats"
export ERROR_LOG_DIR="${SESSION_LOG_DIR}/errors"
export PERF_LOG_DIR="${SESSION_LOG_DIR}/performance"

mkdir -p "${SESSION_LOG_DIR}" "${HEARTBEAT_LOG_DIR}" "${GIT_STATS_LOG_DIR}" "${ERROR_LOG_DIR}" "${PERF_LOG_DIR}"

# ─── COLORS ──────────────────────────────────────────────────────────────────
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export MAGENTA='\033[0;35m'
export CYAN='\033[0;36m'
export BOLD='\033[1m'
export DIM='\033[2m'
export NC='\033[0m'

# ─── LOGGING FUNCTIONS ───────────────────────────────────────────────────────
freenemo_log()    { echo -e "${CYAN}[FREENEMO]${NC} $*" | tee -a "${SESSION_LOG_DIR}/freenemo.log"; }
freenemo_success() { echo -e "${GREEN}[✓]${NC} $*" | tee -a "${SESSION_LOG_DIR}/freenemo.log"; }
freenemo_warn()   { echo -e "${YELLOW}[!]${NC} $*" | tee -a "${SESSION_LOG_DIR}/freenemo.log"; }
freenemo_error()  { echo -e "${RED}[✗]${NC} $*" | tee -a "${SESSION_LOG_DIR}/freenemo.log"; }
freenemo_banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n" | tee -a "${SESSION_LOG_DIR}/freenemo.log"; }

# ─── RETRY UTILITY (exponential backoff) ────────────────────────────────────
freenemo_retry() {
    local max_attempts=$1 delay=$2; shift 2
    local attempt=1
    while true; do
        if "$@"; then return 0; fi
        if [[ $attempt -ge $max_attempts ]]; then
            freenemo_error "Command failed after $max_attempts attempts: $*"
            return 1
        fi
        freenemo_warn "Attempt $attempt/$max_attempts failed. Retrying in ${delay}s..."
        sleep "$delay"
        delay=$((delay * 2))
        attempt=$((attempt + 1))
    done
}

# ─── GIT UTILITIES ──────────────────────────────────────────────────────────
freenemo_git_discover_repo() {
    if [[ -n "$REPO_ROOT" && -d "$REPO_ROOT/.git" ]]; then return 0; fi
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        REPO_ROOT=$(git rev-parse --show-toplevel)
        return 0
    fi
    local dir="$(pwd)"
    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/.git" ]]; then REPO_ROOT="$dir"; return 0; fi
        dir="$(dirname "$dir")"
    done
    return 1
}

freenemo_git_ensure_origin() {
    cd "$REPO_ROOT"
    if ! git remote get-url origin >/dev/null 2>&1; then
        git remote add origin "$REPO_URL"
    fi
}