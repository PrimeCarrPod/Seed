#!/bin/bash
# WORK-IN-PROGRESS TRACKER: SubAtomic Prime Electron Caldera
# Tracks status of all major deliverables

set -euo pipefail

WORKSPACE="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_c64ac33e-a0ac-4550-bb49-ee6048048fd7"
CALDERA_DIR="$WORKSPACE/CSMWip/SubAtomicPrimeElectronCaldera"

echo "=== WORK-IN-PROGRESS STATUS ==="
echo "Date: $(date)"
echo ""

# Core Documents
echo "--- CORE DOCUMENTS ---"
for doc in MASTER_TREE.md KEY_FINDINGS_EXECUTIVE_SUMMARY.md GRANT_CAMPAIGN_ACTION_PLAN.md; do
    if [[ -f "$CALDERA_DIR/$doc" ]]; then
        LINES=$(wc -l < "$CALDERA_DIR/$doc")
        echo "✓ $doc ($LINES lines)"
    else
        echo "✗ $doc MISSING"
    fi
done

# Exploration Document
echo ""
echo "--- EXPLORATION DOCUMENT (KEY_FINDINGS_EXECUTIVE_EXPLORATION.md) ---"
EXPLORATION_DIR="$CALDERA_DIR/KEY_FINDINGS_EXECUTIVE_EXPLORATION"
PIECES=$(ls "$EXPLORATION_DIR"/section*_piece01.md 2>/dev/null | wc -l)
echo "Pieces written: $PIECES/12"

if [[ -f "$EXPLORATION_DIR/COMBINED_RAW.md" ]]; then
    RAW_LINES=$(wc -l < "$EXPLORATION_DIR/COMBINED_RAW.md")
    echo "COMBINED_RAW.md: $RAW_LINES lines"
else
    echo "COMBINED_RAW.md: NOT CREATED"
fi

TARGET_LINES=900
if [[ -f "$EXPLORATION_DIR/KEY_FINDINGS_EXECUTIVE_EXPLORATION.md" ]]; then
    FINAL_LINES=$(wc -l < "$EXPLORATION_DIR/KEY_FINDINGS_EXECUTIVE_EXPLORATION.md")
    echo "FINAL DOCUMENT: $FINAL_LINES lines (target: $TARGET_LINES)"
else
    echo "FINAL DOCUMENT: NOT CREATED"
fi

# Grant Campaign
echo ""
echo "--- GRANT CAMPAIGN ---"
GRANT_DIR="$CALDERA_DIR/GrantCampaign"
for grant in GRANT_APPLICATIONS.md EMAILS_FOR_OUTREACH.md; do
    if [[ -f "$GRANT_DIR/$grant" ]]; then
        LINES=$(wc -l < "$GRANT_DIR/$grant")
        echo "✓ $grant ($LINES lines)"
    else
        echo "✗ $grant MISSING"
    fi
done

# Folder Structure
echo ""
echo "--- CALDERA FOLDER STRUCTURE ---"
for dir in Foundation Worldline MassSpectrum HilbertSpace Couplings GeneticCode TranscendentPhysics QuarkHadronNuclear CosmologyAstrophysics ExperimentalSignatures Particles CrossCutting SubAtomic.Edu TardigradiaTGPU __CURRENT_RELEASES__ landolil.engine GrantCampaign Archive_LowQuality KEY_FINDINGS_EXECUTIVE_EXPLORATION; do
    if [[ -d "$CALDERA_DIR/$dir" ]]; then
        FILE_COUNT=$(find "$CALDERA_DIR/$dir" -type f -name "*.md" 2>/dev/null | wc -l)
        echo "✓ $dir ($FILE_COUNT .md files)"
    else
        echo "✗ $dir MISSING"
    fi
done

# Git Status
echo ""
echo "--- GIT STATUS ---"
cd "$WORKSPACE"
git status --short | head -20
echo "... ($(git status --short | wc -l) files changed)"

echo ""
echo "=== NEXT ACTIONS ==="
if [[ $PIECES -eq 12 && -f "$EXPLORATION_DIR/COMBINED_RAW.md" && ! -f "$EXPLORATION_DIR/KEY_FINDINGS_EXECUTIVE_EXPLORATION.md" ]]; then
    echo "1. CREATE FINAL DOC: Clean headers/footers from COMBINED_RAW.md → KEY_FINDINGS_EXECUTIVE_EXPLORATION.md"
fi
echo "2. SUBMIT PAPERS: Nature Physics, PRL, Annals of Mathematics"
echo "3. GRANT DEADLINES: NSF ANT (Sep 15), NSF EPP-T (Nov 25), Simons LOI (Oct 29)"
echo "4. KOL OUTREACH: Email Witten, Tao, Arkani-Hamed, Zagier, Maldacena"
echo "5. PUBLIC REPO: Create ArithmeticPhysics-Verification GitHub repo"