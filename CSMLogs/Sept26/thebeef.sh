#!/bin/bash
# ════════════════════════════════════════════════════════════════════════════
# THEBEEF.SH — Batch Email Campaign Processor for Grant Submissions
# Processes multiple grant proposals, creates drafts with attachments, manages queue
# Built on top of oldlady.sh for Microsoft Graph integration
# ═══════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── CONFIGURATION ────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OLDLADY="${SCRIPT_DIR}/oldlady.sh"
CAMPAIGN_DIR="${SCRIPT_DIR}/GrantProposals"
STATE_FILE="${SCRIPT_DIR}/.thebeef_state.json"
TOKEN_PATH="${SCRIPT_DIR}/tmp_kilo/hotmail_token.json"

# ─── COLORS ───────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

log() { echo -e "${CYAN}[THEBEEF]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${BLUE}${BOLD}═══ $* ═══${NC}\n"; }

# ─── CAMPAIGN DEFINITIONS ─────────────────────────────────────────────────
# Each grant: file|to|subject|body_file|attachments...
CAMPAIGNS=(
    "01_FQXi_Zenith_Grant_Proposal.md|grants@fqxi.org|FQXi Zenith Grant Application: Arithmetic Physics - Deriving the Fine Structure Constant from Prime Number Theory||"
    "02_NSF_EPPT_Grant_Proposal.md|epp-theory@nsf.gov|NSF EPP-T Proposal: Prime Gap Statistics and the Derivation of Standard Model Coupling Constants||"
    "03_NSF_ANT_Grant_Proposal.md|ANT@nsf.gov|NSF Algebra & Number Theory Proposal: Prime Gap Statistics and Physical Constants - A New Connection||"
    "04_Simons_Collaboration_Grant_Proposal.md|mps@simonsfoundation.org|Simons Collaboration MPS LOI: Arithmetic Physics Collaboration - Deriving Physical Law from Prime Number Theory||"
    "05_Simons_Targeted_Grant_Proposal.md|mps@simonsfoundation.org|Simons Targeted Research Group: Prime Gap Physics - From Number Theory to the Standard Model||"
    "06_Breakthrough_Prize_Nomination.md|prizes@breakthroughprize.org|Breakthrough Prize Nomination: Derivation of the Fine Structure Constant from Prime Number Theory||"
    "07_Clay_Institute_Proposal.md|info@claymath.org|Clay Research Award: Prime Gap Statistics and the Riemann Hypothesis - Physical Evidence for Mathematical Theorems||"
    "08_Perimeter_Institute_Proposal.md|visitors@perimeterinstitute.ca|Perimeter Institute Visiting Scientist Application: Arithmetic Physics - Deriving Physical Law from Prime Numbers||"
)

# ─── STATE MANAGEMENT ─────────────────────────────────────────────────────
load_state() {
    if [[ -f "$STATE_FILE" ]]; then
        cat "$STATE_FILE"
    else
        echo '{"created":[],"failed":[],"pending":[]}'
    fi
}

save_state() {
    echo "$1" > "$STATE_FILE"
}

mark_created() {
    local campaign="$1"
    local draft_id="$2"
    local state=$(load_state)
    state=$(echo "$state" | jq --arg c "$campaign" --arg id "$draft_id" '.created += [{"campaign":$c,"draft_id":$id,"timestamp":"'$(date -Iseconds)'"}] | .pending -= [$c]')
    save_state "$state"
}

mark_failed() {
    local campaign="$1"
    local err="$2"
    local state=$(load_state)
    state=$(echo "$state" | jq --arg c "$campaign" --arg e "$err" '.failed += [{"campaign":$c,"error":$e,"timestamp":"'$(date -Iseconds)'"}] | .pending -= [$c]')
    save_state "$state"
}

init_state() {
    local pending=()
    for c in "${CAMPAIGNS[@]}"; do
        local file=$(echo "$c" | cut -d'|' -f1)
        pending+=("$file")
    done
    local state=$(jq -n --argjson pending "$(printf '%s\n' "${pending[@]}" | jq -R . | jq -s .)" '{created:[],failed:[],pending:$pending}')
    save_state "$state"
}

# ─── HELP ─────────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
THEBEEF.SH — Batch Grant Proposal Email Campaign Processor

USAGE:
    thebeef.sh [COMMAND] [OPTIONS]

COMMANDS:
    init                    Initialize campaign state
    run                     Process all pending campaigns
    run-one INDEX           Process single campaign by index (0-7)
    status                  Show campaign status
    list                    List all campaigns
    retry-failed            Retry failed campaigns
    reset                   Reset state file
    verify                  Verify drafts in Hotmail

OPTIONS:
    --token-path PATH       Token path (default: ~/.kilo/hotmail_token.json)
    --dry-run               Show what would be done without creating drafts
    --help                  Show this help

EXAMPLES:
    thebeef.sh init
    thebeef.sh run
    thebeef.sh run-one 0
    thebeef.sh status
    thebeef.sh verify

CAMPAIGNS:
    0: FQXi Zenith Grant
    1: NSF EPP-T
    2: NSF ANT
    3: Simons Collaboration MPS
    4: Simons Targeted Research
    5: Breakthrough Prize
    6: Clay Institute
    7: Perimeter Institute
EOF
    exit 0
}

# ─── CAMPAIGN PROCESSING ──────────────────────────────────────────────────
process_campaign() {
    local index="$1"
    local campaign="${CAMPAIGNS[$index]}"
    
    IFS='|' read -r file to subject body_file extra_attaches <<< "$campaign"
    
    local proposal_path="${CAMPAIGN_DIR}/${file}"
    if [[ ! -f "$proposal_path" ]]; then
        error "Proposal file not found: $proposal_path"
        return 1
    fi
    
    log "Processing campaign $index: $file"
    log "  To: $to"
    log "  Subject: $subject"
    
    # Build oldlady command
    local cmd=("$OLDLADY" --to "$to" --subject "$subject" --attach "$proposal_path")
    
    # Add body file if exists
    local body_path="${CAMPAIGN_DIR}/${file%.md}_body.txt"
    if [[ -f "$body_path" ]]; then
        cmd+=(--body-file "$body_path")
    fi
    
    # Add extra attachments
    IFS=',' read -ra extra <<< "$extra_attaches"
    for extra_attach in "${extra[@]}"; do
        if [[ -n "$extra_attach" && -f "${CAMPAIGN_DIR}/${extra_attach}" ]]; then
            cmd+=(--attach "${CAMPAIGN_DIR}/${extra_attach}")
        fi
    done
    
    # Execute
    local output
    if output=$("${cmd[@]}" 2>&1); then
        local draft_id=$(echo "$output" | grep "Draft ID:" | awk '{print $3}')
        success "Campaign $index created: $draft_id"
        mark_created "$file" "$draft_id"
        return 0
    else
        error "Campaign $index failed: $output"
        mark_failed "$file" "$output"
        return 1
    fi
}

# ─── MAIN COMMANDS ────────────────────────────────────────────────────────
cmd_init() {
    banner "INITIALIZING CAMPAIGN STATE"
    init_state
    success "State initialized with ${#CAMPAIGNS[@]} campaigns"
    cmd_status
}

cmd_run() {
    banner "RUNNING CAMPAIGN"
    local state=$(load_state)
    local pending_count=$(echo "$state" | jq '.pending | length')
    
    if [[ $pending_count -eq 0 ]]; then
        warn "No pending campaigns. Run 'thebeef.sh init' to reset."
        return 0
    fi
    
    log "Processing $pending_count pending campaigns..."
    for i in "${!CAMPAIGNS[@]}"; do
        local file=$(echo "${CAMPAIGNS[$i]}" | cut -d'|' -f1)
        if echo "$state" | jq -e ".pending | index(\"$file\")" >/dev/null; then
            process_campaign "$i"
            state=$(load_state)  # Reload
        fi
    done
    
    success "Campaign run complete"
    cmd_status
}

cmd_run_one() {
    local index="$1"
    if [[ ! "$index" =~ ^[0-7]$ ]]; then
        error "Invalid index: $index (must be 0-7)"
        exit 1
    fi
    
    banner "RUNNING CAMPAIGN $index"
    process_campaign "$index"
    cmd_status
}

cmd_status() {
    banner "CAMPAIGN STATUS"
    local state=$(load_state)
    
    local created=$(echo "$state" | jq -r '.created[] | "\(.campaign) -> \(.draft_id) (\(.timestamp))"')
    local failed=$(echo "$state" | jq -r '.failed[] | "\(.campaign) -> FAILED: \(.error)"')
    local pending=$(echo "$state" | jq -r '.pending[]')
    
    echo -e "${GREEN}CREATED:${NC}"
    if [[ -n "$created" ]]; then
        echo "$created" | sed 's/^/  /'
    else
        echo "  (none)"
    fi
    
    echo -e "${RED}FAILED:${NC}"
    if [[ -n "$failed" ]]; then
        echo "$failed" | sed 's/^/  /'
    else
        echo "  (none)"
    fi
    
    echo -e "${YELLOW}PENDING:${NC}"
    if [[ -n "$pending" ]]; then
        echo "$pending" | sed 's/^/  /'
    else
        echo "  (none)"
    fi
}

cmd_list() {
    banner "CAMPAIGN LIST"
    for i in "${!CAMPAIGNS[@]}"; do
        IFS='|' read -r file to subject _ <<< "${CAMPAIGNS[$i]}"
        printf "%2d: %-45s -> %s\n" "$i" "$file" "$to"
    done
}

cmd_retry_failed() {
    banner "RETRYING FAILED CAMPAIGNS"
    local state=$(load_state)
    local failed=$(echo "$state" | jq -r '.failed[].campaign')
    
    for file in $failed; do
        for i in "${!CAMPAIGNS[@]}"; do
            if [[ "${CAMPAIGNS[$i]}" == *"$file|"* ]]; then
                log "Retrying: $file"
                process_campaign "$i"
                break
            fi
        done
    done
    
    cmd_status
}

cmd_reset() {
    banner "RESETTING STATE"
    rm -f "$STATE_FILE"
    cmd_init
}

cmd_verify() {
    banner "VERIFYING DRAFTS IN HOTMAIL"
    if [[ ! -f "$TOKEN_PATH" ]]; then
        error "Token not found at $TOKEN_PATH"
        exit 1
    fi
    
    local token=$(cat "$TOKEN_PATH")
    local access_token=$(echo "$token" | jq -r '.access_token')
    
    curl -s -H "Authorization: Bearer $access_token" \
        -H "Content-Type: application/json" \
        "https://graph.microsoft.com/v1.0/me/mailFolders/drafts/messages?\$top=20&\$select=subject,hasAttachments,toRecipients" | \
    jq -r '.value[] | "\(.subject // "(no subject)") | Attach: \(.hasAttachments) | To: \(.toRecipients[].emailAddress.address // "none")"'
}

# ─── ENTRY POINT ──────────────────────────────────────────────────────────
COMMAND="${1:-}"
shift || true

case "$COMMAND" in
    init) cmd_init ;;
    run) cmd_run ;;
    run-one) cmd_run_one "$1" ;;
    status) cmd_status ;;
    list) cmd_list ;;
    retry-failed) cmd_retry_failed ;;
    reset) cmd_reset ;;
    verify) cmd_verify ;;
    --help|help|"") usage ;;
    *) error "Unknown command: $COMMAND"; usage ;;
esac