#!/bin/bash
# ════════════════════════════════════════════════════════════════════════════
# QUICK RESUME — CSM Cinema Iteration 2 SOPP Pass
# Jason Isaac Brodsky (California 1976) — Conducier
# Run this script at session start to restore full context
# ════════════════════════════════════════════════════════════════════════════

set -euo pipefail

echo "═══════════════════════════════════════════════════════════════"
echo "  CSM CINEMA — ITERATION 2 SOPP PASS — QUICK RESUME"
echo "  Jason Isaac Brodsky (California 1976) — Conducier"
echo "  Session: csmcinema-iter2-sopp-continuation-20260827"
echo "═══════════════════════════════════════════════════════════════"
echo ""

# 1. HEARTBEAT — Start the pulse
echo "[1/7] Starting heartbeat (freenemo chamber repeat)..."
bash CSMScripts/freenemo.sh chamber repeat 9 &
HEARTBEAT_PID=$!
echo "    Heartbeat PID: $HEARTBEAT_PID"
echo ""

# 2. GIT STATE — Verify branch and status
echo "[2/7] Verifying git state..."
git status
echo ""
git log --oneline -3
echo ""

# 3. CURRENT PROGRESS — Show what's done
echo "[3/7] Current Iteration 2 Progress:"
echo "    ┌─────────────────────────────────────────────────────────────┐"
echo "    │ Part 6 (Temptation Away From Path): COMPLETE — 11 pieces   │"
echo "    │   ~104K words (SOPP deepened)                               │"
echo "    ├─────────────────────────────────────────────────────────────┤"
echo "    │ Part 7 (Atonement With Father): PARTIAL — 5/11 deepened    │"
echo "    │   Pieces 1-5: ~40K words each (exceptional depth)          │"
echo "    │   Pieces 6-11: ~9K words each (NEED REWRITE)               │"
echo "    ├─────────────────────────────────────────────────────────────┤"
echo "    │ Parts 8-11: TEMPLATE DEEPENED — ~10K each (need full SOPP) │"
echo "    ├─────────────────────────────────────────────────────────────┤"
echo "    │ Parts 1-5: TEMPLATE ONLY — ~9K each (need full SOPP)       │"
echo "    ├─────────────────────────────────────────────────────────────┤"
echo "    │ Master Iteration 2: 91,718 words                            │"
echo "    └─────────────────────────────────────────────────────────────┘"
echo ""

# 4. BRANCH CONFIRMATION
echo "[4/7] Branch check:"
CURRENT_BRANCH=$(git branch --show-current)
echo "    Current: $CURRENT_BRANCH"
if [[ "$CURRENT_BRANCH" != "session/csmcinema-iter2-sopp-continuation-20260827" ]]; then
    echo "    ⚠️  Not on session branch. Creating/switching..."
    git checkout -b session/csmcinema-iter2-sopp-continuation-20260827 2>/dev/null || git checkout session/csmcinema-iter2-sopp-continuation-20260827
fi
echo ""

# 5. NEXT WORK QUEUE
echo "[5/7] NEXT WORK QUEUE (Priority Order):"
echo ""
echo "    🎯 IMMEDIATE: Complete Part 7 pieces 6-11"
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 6 \"<CONTENT>\""
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 7 \"<CONTENT>\""
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 8 \"<CONTENT>\""
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 9 \"<CONTENT>\""
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 10 \"<CONTENT>\""
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 11 \"<CONTENT>\""
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh concat-part 2 7"
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh zip-part 2 7"
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh verify-part 2 7"
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh organize-part 2 7"
echo ""
echo "    🎯 NEXT: Deepen Parts 8, 9, 10, 11 (all 11 pieces each)"
echo "       Target: ~27,500 words per part (~180 min read)"
echo ""
echo "    🎯 THEN: Deepen Parts 1-5 (all 11 pieces each)"
echo ""
echo "    🏁 FINAL: Complete Iteration 2"
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh concat-iteration 2"
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh verify-iteration 2"
echo "       ./csmcinema/Scripts/GitHub_handler_cinema.sh commit-push \"CSM Cinema: Iteration 2 SOPP Pass Complete - 11 Parts Deepened\""
echo ""

# 6. KEY COMMANDS REFERENCE
echo "[6/7] KEY COMMANDS:"
cat << 'CMDS'
# Write a piece (after editing content):
./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece <iter> <part> <piece> "<CONTENT>"

# Concat/zip/organize a part:
./csmcinema/Scripts/GitHub_handler_cinema.sh concat-part <iter> <part>
./csmcinema/Scripts/GitHub_handler_cinema.sh zip-part <iter> <part>
./csmcinema/Scripts/GitHub_handler_cinema.sh verify-part <iter> <part>
./csmcinema/Scripts/GitHub_handler_cinema.sh organize-part <iter> <part>

# List all cinema files:
./csmcinema/Scripts/GitHub_handler_cinema.sh list

# Full iteration operations:
./csmcinema/Scripts/GitHub_handler_cinema.sh concat-iteration <iter>
./csmcinema/Scripts/GitHub_handler_cinema.sh verify-iteration <iter>

# Git commit/push:
git add -A && git commit -m "msg" && git push origin session/csmcinema-iter2-sopp-continuation-20260827

# Heartbeat (keep alive):
bash CSMScripts/freenemo.sh chamber repeat 9

# View resume session:
cat csmcinema/Resume/SESSION_CSM_CINEMA_ITER2_SOPP_CONTINUATION_20260827.md
CMDS
echo ""

# 7. SESSION LOG & HEURISTICS REFERENCE
echo "[7/7] REFERENCE FILES:"
echo "    Resume Session: csmcinema/Resume/SESSION_CSM_CINEMA_ITER2_SOPP_CONTINUATION_20260827.md"
echo "    Previous: csmcinema/Resume/SESSION_csmcinema-iter1-complete-20260825.md"
echo "    GitHub Handler: csmcinema/Scripts/GitHub_handler_cinema.sh"
echo "    Heartbeat Log: CSMLogs/heartbeat/2026-08-27/heartbeat_20260827.log"
echo ""

# Heuristics quick reference
echo "    HEURISTICS — Williams Extreme (CSMSOPP):"
echo "      1. Mork Morning  2. Fisher King  3. Vietnam  4. Awakenings  5. Transcended"
echo "    HEURISTICS — El Segundo Extreme (CSMSOPPv2):"
echo "      1. Surfer's Patience  2. Stoner Logic  3. Dude/Sweet  4. And Then?  5. Deep Time"
echo "    FATE PHASES per piece: 1-4=Clotho | 5-7=Lachesis | 8-11=Atropos"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "  READY. Heartbeat running (PID: $HEARTBEAT_PID)."
echo "  Next: Complete Part 7 piece 6 → 11, then Parts 8-11, then Parts 1-5."
echo "  Target: ~300K words Iteration 2 | 7 Iterations total."
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Author: Jason Isaac Brodsky (California 1976) — Conducier"
echo "Research: JsnBAI Misinterpretation | Greek Fates | Jason & Argonauts"
echo ""

# Keep script alive to show heartbeat (optional - comment out if not needed)
# wait $HEARTBEAT_PID