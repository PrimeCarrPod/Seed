#!/bin/bash
# ════════════════════════════════════════════════════════════════════════════
# OLDLADY.SH — Email Draft Creator with Attachments for Microsoft Graph
# Creates professional email drafts in Hotmail/Outlook with file attachments
# Uses existing Microsoft Graph token authentication
# ════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── CONFIGURATION ────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOKEN_PATH="${SCRIPT_DIR}/tmp_kilo/hotmail_token.json"
GRAPH_BASE="https://graph.microsoft.com/v1.0"

# ─── COLORS ───────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

log() { echo -e "${CYAN}[OLDLADY]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${BLUE}${BOLD}═══ $* ═══${NC}\n"; }

# ─── HELP ─────────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
OLDLADY.SH — Create Email Drafts with Attachments via Microsoft Graph

USAGE:
    oldlady.sh [OPTIONS]

OPTIONS:
    --to EMAIL              Recipient email address (required)
    --subject TEXT          Email subject (required)
    --body TEXT             Email body text
    --body-file PATH        Read body from file
    --attach PATH           File to attach (can specify multiple)
    --cc EMAIL              CC recipient (can specify multiple)
    --bcc EMAIL             BCC recipient (can specify multiple)
    --format FMT            Body format: text, html, markdown (default: text)
    --token-path PATH       Path to token JSON (default: ~/.kilo/hotmail_token.json)
    --list-drafts           List existing drafts
    --help                  Show this help

EXAMPLES:
    oldlady.sh --to grants@fqxi.org --subject "Grant Application" --body "Please find attached..." --attach proposal.pdf
    oldlady.sh --to pi@university.edu --subject "Collaboration" --body-file email.txt --attach proposal.md --attach cv.pdf
    oldlady.sh --list-drafts

NOTES:
    - Requires valid Microsoft Graph token with Mail.ReadWrite scope
    - Token auto-refreshes if refresh_token present
    - Attachments base64 encoded (max ~3MB each via Graph API)
    - Creates draft only — does NOT send
EOF
    exit 0
}

# ─── TOKEN MANAGEMENT ─────────────────────────────────────────────────────
load_token() {
    if [[ ! -f "$TOKEN_PATH" ]]; then
        error "Token not found at $TOKEN_PATH"
        error "Run authentication first or set --token-path"
        exit 1
    fi
    
    ACCESS_TOKEN=$(jq -r '.access_token' "$TOKEN_PATH" 2>/dev/null)
    REFRESH_TOKEN=$(jq -r '.refresh_token // empty' "$TOKEN_PATH" 2>/dev/null)
    EXPIRES_ON=$(jq -r '.expires_on // 0' "$TOKEN_PATH" 2>/dev/null)
    
    if [[ -z "$ACCESS_TOKEN" || "$ACCESS_TOKEN" == "null" ]]; then
        error "Invalid token file: missing access_token"
        exit 1
    fi
    
    # Check expiry and refresh if needed
    local now=$(date +%s)
    # Convert expires_on to integer for comparison
    local expires_int=${EXPIRES_ON%.*}
    if [[ $expires_int -gt 0 && $expires_int -lt $((now + 300)) ]]; then
        log "Token near expiry, refreshing..."
        refresh_token
    fi
}

refresh_token() {
    if [[ -z "$REFRESH_TOKEN" || "$REFRESH_TOKEN" == "null" ]]; then
        error "No refresh token available"
        exit 1
    fi
    
    local client_id="14d82eec-204b-4c2f-b7e8-296a70dab67e"
    local data="client_id=${client_id}&grant_type=refresh_token&refresh_token=${REFRESH_TOKEN}"
    
    local response=$(curl -s -X POST \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "$data" \
        "https://login.microsoftonline.com/common/oauth2/v2.0/token")
    
    local new_access=$(echo "$response" | jq -r '.access_token // empty')
    local new_refresh=$(echo "$response" | jq -r '.refresh_token // empty')
    local expires_in=$(echo "$response" | jq -r '.expires_in // 3600')
    
    if [[ -z "$new_access" || "$new_access" == "null" ]]; then
        error "Token refresh failed: $response"
        exit 1
    fi
    
    local new_expires=$(( $(date +%s) + expires_in ))
    jq --arg at "$new_access" --arg rt "$new_refresh" --arg exp "$new_expires" \
        '.access_token=$at | .refresh_token=$rt | .expires_on=($exp|tonumber)' \
        "$TOKEN_PATH" > "${TOKEN_PATH}.tmp" && mv "${TOKEN_PATH}.tmp" "$TOKEN_PATH"
    
    ACCESS_TOKEN="$new_access"
    success "Token refreshed (expires in ${expires_in}s)"
}

# ─── API CALLS ────────────────────────────────────────────────────────────
graph_post() {
    local endpoint="$1"
    local data="$2"
    curl -s -X POST \
        -H "Authorization: Bearer ${ACCESS_TOKEN}" \
        -H "Content-Type: application/json" \
        -d "$data" \
        "${GRAPH_BASE}${endpoint}"
}

graph_get() {
    local endpoint="$1"
    curl -s -X GET \
        -H "Authorization: Bearer ${ACCESS_TOKEN}" \
        -H "Content-Type: application/json" \
        "${GRAPH_BASE}${endpoint}"
}

# ─── DRAFT CREATION ───────────────────────────────────────────────────────
create_draft() {
    local to_json=$(printf '%s\n' "${TO[@]}" | jq -R . | jq -s 'map({emailAddress: {address: .}})')
    local cc_json=$(printf '%s\n' "${CC[@]}" | jq -R . | jq -s 'map({emailAddress: {address: .}})')
    local bcc_json=$(printf '%s\n' "${BCC[@]}" | jq -R . | jq -s 'map({emailAddress: {address: .}})')
    
    local draft_json=$(jq -n \
        --arg subject "$SUBJECT" \
        --arg body "$BODY" \
        --arg format "$FORMAT" \
        --argjson to "$to_json" \
        --argjson cc "$cc_json" \
        --argjson bcc "$bcc_json" \
        '{
            subject: $subject,
            body: {contentType: $format, content: $body},
            toRecipients: $to,
            ccRecipients: $cc,
            bccRecipients: $bcc
        }')
    
    local response=$(graph_post "/me/messages" "$draft_json")
    local msg_id=$(echo "$response" | jq -r '.id // empty')
    
    if [[ -z "$msg_id" || "$msg_id" == "null" ]]; then
        error "Failed to create draft: $response"
        return 1
    fi
    
    echo "$msg_id"
}

add_attachment() {
    local msg_id="$1"
    local file_path="$2"
    local file_name=$(basename "$file_path")
    
    if [[ ! -f "$file_path" ]]; then
        error "Attachment not found: $file_path"
        return 1
    fi
    
    local content_b64=$(base64 -w 0 "$file_path")
    local attach_json=$(jq -n \
        --arg name "$file_name" \
        --arg bytes "$content_b64" \
        '{
            "@odata.type": "#microsoft.graph.fileAttachment",
            name: $name,
            contentBytes: $bytes
        }')
    
    local response=$(graph_post "/me/messages/${msg_id}/attachments" "$attach_json")
    local attach_id=$(echo "$response" | jq -r '.id // empty')
    
    if [[ -z "$attach_id" || "$attach_id" == "null" ]]; then
        error "Failed to add attachment $file_name: $response"
        return 1
    fi
    
    echo "$attach_id"
}

list_drafts() {
    local response=$(graph_get "/me/mailFolders/drafts/messages?\$top=20&\$select=subject,hasAttachments,toRecipients,createdDateTime")
    echo "$response" | jq -r '.value[] | "\(.createdDateTime) | \(.subject // "(no subject)") | Attachments: \(.hasAttachments) | To: \(.toRecipients[].emailAddress.address // "none")"'
}

# ─── MAIN ─────────────────────────────────────────────────────────────────
TO=()
CC=()
BCC=()
ATTACHMENTS=()
SUBJECT=""
BODY=""
BODY_FILE=""
FORMAT="text"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --to) TO+=("$2"); shift 2 ;;
        --cc) CC+=("$2"); shift 2 ;;
        --bcc) BCC+=("$2"); shift 2 ;;
        --subject) SUBJECT="$2"; shift 2 ;;
        --body) BODY="$2"; shift 2 ;;
        --body-file) BODY_FILE="$2"; shift 2 ;;
        --attach) ATTACHMENTS+=("$2"); shift 2 ;;
        --format) FORMAT="$2"; shift 2 ;;
        --token-path) TOKEN_PATH="$2"; shift 2 ;;
        --list-drafts) 
            load_token
            list_drafts
            exit 0
            ;;
        --help) usage ;;
        *) error "Unknown option: $1"; usage ;;
    esac
done

# Validate required
if [[ ${#TO[@]} -eq 0 ]]; then
    error "At least one --to recipient required"
    usage
fi
if [[ -z "$SUBJECT" ]]; then
    error "--subject required"
    usage
fi

# Read body from file if specified
if [[ -n "$BODY_FILE" ]]; then
    if [[ ! -f "$BODY_FILE" ]]; then
        error "Body file not found: $BODY_FILE"
        exit 1
    fi
    BODY=$(cat "$BODY_FILE")
fi

# Default body if empty
if [[ -z "$BODY" ]]; then
    BODY="(No body content provided)"
fi

# Load token
load_token

# Create draft
log "Creating draft: $SUBJECT"
msg_id=$(create_draft)
success "Draft created: $msg_id"

# Add attachments
for attach in "${ATTACHMENTS[@]}"; do
    log "Attaching: $attach"
    attach_id=$(add_attachment "$msg_id" "$attach")
    success "Attachment added: $attach_id"
done

success "Complete! Draft with ${#ATTACHMENTS[@]} attachment(s) in Drafts folder"
echo "Draft ID: $msg_id"