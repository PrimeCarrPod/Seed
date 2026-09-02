#!/bin/bash
# AEGIS Campaign - Next Session Startup Script
# Campaign: 2026-09-02 | Resume from WORK_IN_PROGRESS_RESUME_STATE.md

set -e

WORKSPACE="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_08314a48-5995-4968-b6b1-a93bc340a097"
CAMPAIGN_DIR="$WORKSPACE/CSMReach/CSMEmail/Campaign_2026-09-02"

echo "═══════════════════════════════════════════"
echo "  AEGIS CAMPAIGN - SESSION STARTUP"
echo "  Campaign: 2026-09-02"
echo "═══════════════════════════════════════════"

cd "$WORKSPACE"

# 1. Show resume state
echo ""
echo "📋 Loading resume state..."
cat "$CAMPAIGN_DIR/WORK_IN_PROGRESS_RESUME_STATE.md" | head -80

# 2. Verify token
echo ""
echo "🔑 Checking authentication token..."
if [ -f "/tmp/kilo/hotmail_token.json" ]; then
    python3 -c "
import json, time
with open('/tmp/kilo/hotmail_token.json') as f: t = json.load(f)
exp = t.get('expires_on', 0)
if exp > time.time() + 300:
    print(f'  ✅ Token valid (expires in {int(exp - time.time())}s)')
else:
    print(f'  ⚠️ Token expired/near expiry - needs refresh')
"
else
    echo "  ❌ No token found at /tmp/kilo/hotmail_token.json"
fi

# 3. Show git status
echo ""
echo "📦 Git status:"
git status --short

# 4. List available batches
echo ""
echo "📧 Verified batches ready to send:"
for b in BATCH-07-National-Outreach BATCH-09-Community-Specialist BATCH-10-Cleantech-Energy BATCH-11-Aerospace-Space-Dossier BATCH-12-Advanced-Manufacturing-Materials; do
    count=$(find "$WORKSPACE/CSMReach/CSMEmailOutgoing/July2026/$b" -name "E*.md" -exec grep -l '\*\*TO:\*\*' {} \; | wc -l)
    echo "  - $b ($count emails with TO field)"
done

echo ""
echo "═══════════════════════════════════════════"
echo "  READY FOR NEXT ACTIONS"
echo "═══════════════════════════════════════════"
echo ""
echo "Options:"
echo "  1. Send next batch:  python3 send_verified_batches.py --batches BATCH-07-National-Outreach"
echo "  2. Send multiple:    python3 send_verified_batches.py --batches BATCH-07-National-Outreach BATCH-09-Community-Specialist"
echo "  3. Test mode:        python3 send_verified_batches.py --batches BATCH-07-National-Outreach --test"
echo "  4. Check drafts:     python3 -c \"...\" (see resume state)"
echo "  5. Refresh token:    (see resume state for command)"
echo ""
echo "Resume state: $CAMPAIGN_DIR/WORK_IN_PROGRESS_RESUME_STATE.md"