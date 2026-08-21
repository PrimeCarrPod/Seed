#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════════════════
# SESSION START — Hotmail (jasonbrodsky@hotmail.com) via Dual Starlight Express
# ═══════════════════════════════════════════════════════════════════════════════
# Single-command entry point for the CSM campaign engine with Hotmail auth.
# Uses Azure CLI client ID (04b07795-8ddb-461a-bbee-02f9e1bf7b46) which works
# with personal Microsoft accounts — no admin consent needed.
#
# USAGE:
#   ./SESSION-START-HOTMAIL.sh [--test | --batch BATCH-XX | --live]
# ═══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── CONFIG ──────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="${SCRIPT_DIR}"
STARLIGHT="${WORKSPACE}/CSMSOPP/STARLIGHT/MODULE-V2/dual_starlight_express.py"
SCRATCH="/tmp/kilo"

# Azure CLI client ID — works with personal accounts (hotmail, outlook, live)
# No admin consent required for consumer Microsoft accounts
export CSM_CLIENT_ID="04b07795-8ddb-461a-bbee-02f9e1bf7b46"
export CSM_TENANT="common"  # or leave unset for common

# Account to authenticate
ACCOUNT="jasonbrodsky@hotmail.com"

# ─── PRE-FLIGHT ──────────────────────────────────────────────────────────
echo "
╔═══════════════════════════════════════════════════════════════════════════════
║  SESSION START — Carrington Storm Motors Campaign Engine                ║
║  Account: ${ACCOUNT}                                    ║
║  Client:  Azure CLI (04b07795-8ddb-461a-bbee-02f9e1bf7b46)              ║
╚═══════════════════════════════════════════════════════════════════════════════
"

# Ensure scratch dir exists
mkdir -p "${SCRATCH}"

# Check for existing cached token
HOTMAIL_TOKEN="${SCRATCH}/hotmail_token.json"
if [[ -f "${HOTMAIL_TOKEN}" ]]; then
    echo "🔑 Found cached token at ${HOTMAIL_TOKEN}"
    python3 -c "
import json, time
with open('${HOTMAIL_TOKEN}') as f:
    t = json.load(f)
expires = t.get('expires_on', 0)
if expires > time.time() + 60:
    print(f'   ✅ Token valid for {int(expires - time.time())} more seconds')
else:
    print('   ⚠️  Token expired — will re-authenticate')
"
fi

# ─── AUTH HELPER ─────────────────────────────────────────────────────────
auth_hotmail() {
    echo "
╔═══════════════════════════════════════════════════════════════════════════════
║  AUTHENTICATION REQUIRED                                              ║
║  Account: ${ACCOUNT}                                    ║
╚═══════════════════════════════════════════════════════════════════════════════
"
    python3 << 'PYEOF'
import urllib.request, urllib.parse, json, time, os

CLIENT_ID = '04b07795-8ddb-461a-bbee-02f9e1bf7b46'
SCOPES = 'https://graph.microsoft.com/Mail.ReadWrite https://graph.microsoft.com/Mail.Send offline_access'
TOKEN_FILE = '/tmp/kilo/hotmail_token.json'

def get_device_code():
    url = 'https://login.microsoftonline.com/common/oauth2/v2.0/devicecode'
    data = urllib.parse.urlencode({'client_id': CLIENT_ID, 'scope': SCOPES}).encode()
    req = urllib.request.Request(url, data=data, headers={'Content-Type': 'application/x-www-form-urlencoded'})
    return json.loads(urllib.request.urlopen(req).read())

def poll_for_token(device_code, interval=5, timeout=600):
    url = 'https://login.microsoftonline.com/common/oauth2/v2.0/token'
    start = time.time()
    while time.time() - start < timeout:
        time.sleep(interval)
        data = urllib.parse.urlencode({
            'client_id': CLIENT_ID,
            'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
            'code': device_code,
        }).encode()
        req = urllib.request.Request(url, data=data, headers={'Content-Type': 'application/x-www-form-urlencoded'})
        try:
            resp = json.loads(urllib.request.urlopen(req).read())
            if 'access_token' in resp:
                return resp
            if resp.get('error') == 'authorization_pending':
                print(f'  ... waiting ({(time.time()-start):.0f}s) ...', end='\r', flush=True)
                continue
        except urllib.error.HTTPError as e:
            err = e.read().decode()
            if 'authorization_pending' in err:
                print(f'  ... waiting ({(time.time()-start):.0f}s) ...', end='\r', flush=True)
                continue
            print(f'  Poll error: {e.code} {err[:200]}')
            pass
    raise TimeoutError('Login timed out after 10 minutes.')

# Check for cached token
if os.path.exists(TOKEN_FILE):
    with open(TOKEN_FILE) as f:
        td = json.load(f)
    if 'refresh_token' in td:
        try:
            url = 'https://login.microsoftonline.com/common/oauth2/v2.0/token'
            data = urllib.parse.urlencode({
                'client_id': CLIENT_ID,
                'grant_type': 'refresh_token',
                'refresh_token': td['refresh_token'],
            }).encode()
            req = urllib.request.Request(url, data=data, headers={'Content-Type': 'application/x-www-form-urlencoded'})
            resp = json.loads(urllib.request.urlopen(req).read())
            if 'access_token' in resp:
                resp['refresh_token'] = td.get('refresh_token', resp.get('refresh_token'))
                with open(TOKEN_FILE, 'w') as f:
                    json.dump(resp, f)
                print(f'✅ Using cached/refreshed token')
                print(f'  Token valid for ~{resp.get("expires_in", 3600)//60} minutes')
                exit(0)
        except Exception as e:
            print(f'Refresh failed: {e}')

print('=' * 60)
print('  MICROSOFT 365 LOGIN REQUIRED')
print('  Account: jasonbrodsky@hotmail.com (personal)')
print('  Using Azure CLI client ID for Graph API')
print('=' * 60)

dc = get_device_code()
print(f'\n  {dc["message"]}\n')
print(f'  URL:  {dc["verification_uri"]}')
print(f'  CODE: {dc["user_code"]}')
print(f'\n  ← Open the URL above in a PRIVATE browser window,')
print(f'    enter the code, and sign in as jasonbrodsky@hotmail.com')
print(f'  Waiting up to 600 seconds (10 minutes)...\n')

token_data = poll_for_token(dc['device_code'])
with open(TOKEN_FILE, 'w') as f:
    json.dump(token_data, f)
print(f'\n✅ Authenticated successfully!')
print(f'  Token cached at {TOKEN_FILE}')
print(f'  Valid for ~{token_data.get("expires_in", 3600)//60} minutes')
PYEOF
}

# ─── MAIN ────────────────────────────────────────────────────────────────
MODE="${1:-help}"

case "${MODE}" in
    --test|test)
        echo "🧪 TEST MODE — Dry run with Hotmail auth"
        auth_hotmail
        python3 "${STARLIGHT}" --test --account "${ACCOUNT}"
        ;;
    --batch)
        BATCH="${2:-}"
        if [[ -z "${BATCH}" ]]; then
            echo "❌ Usage: $0 --batch BATCH-XX"
            exit 1
        fi
        echo "📦 BATCH MODE — ${BATCH}"
        auth_hotmail
        python3 "${STARLIGHT}" --batch "${BATCH}" --account "${ACCOUNT}"
        ;;
    --live|live)
        echo "🚀 LIVE MODE — Full campaign engine"
        echo "   ⚠️  RULE #1: NO AUTO-SEND — all drafts require explicit approval"
        auth_hotmail
        python3 "${STARLIGHT}" --live --account "${ACCOUNT}"
        ;;
    --auth-only|auth)
        echo "🔑 AUTH ONLY — Authenticate and cache token"
        auth_hotmail
        echo "✅ Token cached. Ready for --live or --batch runs."
        ;;
    --status|status)
        echo "📊 CAMPAIGN STATUS"
        python3 "${STARLIGHT}" --status --account "${ACCOUNT}"
        ;;
    --resume|resume)
        echo "🔄 RESUME — Use cached token if available"
        if [[ -f "${HOTMAIL_TOKEN}" ]]; then
            python3 "${STARLIGHT}" --resume --account "${ACCOUNT}"
        else
            echo "⚠️  No cached token — running auth first"
            auth_hotmail
            python3 "${STARLIGHT}" --resume --account "${ACCOUNT}"
        fi
        ;;
    help|--help|-h|*)
        cat << 'EOF'
╔═══════════════════════════════════════════════════════════════════════════════
║  SESSION START — Hotmail Campaign Engine                                ║
╠═══════════════════════════════════════════════════════════════════════════════
║  USAGE:                                                                  ║
║    ./SESSION-START-HOTMAIL.sh --test          # Dry run, no sends        ║
║    ./SESSION-START-HOTMAIL.sh --batch BATCH-01  # Process specific batch ║
║    ./SESSION-START-HOTMAIL.sh --live          # Full campaign engine     ║
║    ./SESSION-START-HOTMAIL.sh --auth          # Auth only, cache token   ║
║    ./SESSION-START-HOTMAIL.sh --resume        # Resume with cached token ║
║    ./SESSION-START-HOTMAIL.sh --status        # Show campaign status     ║
╠═══════════════════════════════════════════════════════════════════════════════
║  ACCOUNT: jasonbrodsky@hotmail.com (personal Microsoft account)         ║
║  CLIENT:  Azure CLI public client (04b07795-8ddb-461a-bbee-02f9e1bf7b46)║
║  TENANT:  common (no admin consent needed for personal accounts)        ║
║  TOKEN:   Cached at /tmp/kilo/hotmail_token.json (expires ~1 hour)      ║
║  RULE:    NO AUTO-SEND — all emails stay in Drafts until approved       ║
╚═══════════════════════════════════════════════════════════════════════════════
EOF
        ;;
esac