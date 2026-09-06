#!/bin/bash
# RESUME SCRIPT: SubAtomic Prime Electron Caldera Research Continuation
# Run this in a new session to continue from main branch

set -euo pipefail

WORKSPACE="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_c64ac33e-a0ac-4550-bb49-ee6048048fd7"
CALDERA_DIR="$WORKSPACE/CSMWip/SubAtomicPrimeElectronCaldera"
EXPLORATION_DIR="$CALDERA_DIR/KEY_FINDINGS_EXECUTIVE_EXPLORATION"

echo "=== RESUMING SUBATOMIC PRIME ELECTRON CALDERA RESEARCH ==="
echo "Workspace: $WORKSPACE"
echo "Caldera: $CALDERA_DIR"
echo "Exploration: $EXPLORATION_DIR"
echo ""

# 1. Ensure we're on main branch with latest
cd "$WORKSPACE"
git checkout main
git pull origin main
echo "✓ On main branch, pulled latest"

# 2. Verify caldera structure exists
if [[ ! -d "$CALDERA_DIR" ]]; then
    echo "ERROR: Caldera directory not found at $CALDERA_DIR"
    exit 1
fi
echo "✓ Caldera directory exists"

# 3. Verify key documents
for doc in MASTER_TREE.md KEY_FINDINGS_EXECUTIVE_SUMMARY.md GRANT_CAMPAIGN_ACTION_PLAN.md; do
    if [[ -f "$CALDERA_DIR/$doc" ]]; then
        echo "✓ $doc present"
    else
        echo "WARNING: $doc missing"
    fi
done

# 4. Verify exploration pieces
PIECE_COUNT=$(ls "$EXPLORATION_DIR"/section*_piece01.md 2>/dev/null | wc -l)
echo "✓ Exploration pieces: $PIECE_COUNT/12"

# 5. Verify combined raw document
if [[ -f "$EXPLORATION_DIR/COMBINED_RAW.md" ]]; then
    LINES=$(wc -l < "$EXPLORATION_DIR/COMBINED_RAW.md")
    echo "✓ COMBINED_RAW.md: $LINES lines"
else
    echo "WARNING: COMBINED_RAW.md missing"
fi

# 6. Show next steps
echo ""
echo "=== NEXT STEPS ==="
echo "1. Finalize COMBINED_RAW.md → KEY_FINDINGS_EXECUTIVE_EXPLORATION.md (clean headers/footers)"
echo "2. Target: ~900 lines professional document"
echo "3. Submit Nature Physics / PRL / Annals papers (Tier 1)"
echo "4. Execute grant campaign (NSF ANT Sep 15, NSF EPP-T Nov 25, Simons Oct 29)"
echo "5. KOL outreach: Witten, Tao, Arkani-Hamed, Zagier, Maldacena"
echo ""
echo "=== KEY FILES TO WORK WITH ==="
echo "Exploration pieces: $EXPLORATION_DIR/section*_piece01.md"
echo "Combined raw: $EXPLORATION_DIR/COMBINED_RAW.md"
echo "Master tree: $CALDERA_DIR/MASTER_TREE.md"
echo "Grant packages: $CALDERA_DIR/GrantCampaign/GRANT_APPLICATIONS.md"
echo "Outreach emails: $CALDERA_DIR/GrantCampaign/EMAILS_FOR_OUTREACH.md"
echo ""
echo "Ready to continue."