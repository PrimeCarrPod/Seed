#!/bin/bash
# ════════════════════════════════════════════════════════════════════════════
# RESTART SCRIPT — CSM Cinema Iteration 2 SOPP Pass — Session 3
# Jason Isaac Brodsky (California 1976) — Conducier
# Generated: 2026-08-26 18:44 UTC
# ════════════════════════════════════════════════════════════════════════════

set -euo pipefail

echo "═══════════════════════════════════════════════════════════════"
echo "  CSM CINEMA — ITERATION 2 SOPP PASS — SESSION 3 RESTART"
echo "  Jason Isaac Brodsky (California 1976) — Conducier"
echo "═══════════════════════════════════════════════════════════════"
echo ""

# 1. HEARTBEAT — Start the pulse
echo "[1/8] Starting heartbeat..."
bash CSMScripts/freenemo.sh chamber repeat 9 &
HEARTBEAT_PID=$!
echo "    Heartbeat PID: $HEARTBEAT_PID"
echo ""

# 2. GIT STATE — Verify branch and status
echo "[2/8] Verifying git state..."
git status
echo ""
git log --oneline -3
echo ""

# 3. CURRENT PROGRESS — Show what's done
echo "[3/8] Current Iteration 2 Progress:"
echo "    Part 6 (Temptation Away From Path): 14,363 words — COMPLETE"
echo "    Part 7 (Atonement With Father): 13,044 words — 4/11 pieces rewritten"
echo "    Parts 8-11: Template pieces only (11 each)"
echo ""
echo "    Full files in csmcinema/WIP/Iteration_2/full/:"
ls -la csmcinema/WIP/Iteration_2/full/
echo ""

# 4. BRANCH CONFIRMATION
echo "[4/8] Branch check:"
git branch --show-current
echo "    Remote tracking: $(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo 'none')"
echo ""

# 5. NEXT WORK — What to tackle
echo "[5/8] NEXT WORK QUEUE:"
echo "    1. Complete Part 7 pieces 5-11 (rewrite with full SOPP density)"
echo "    2. ./csmcinema/Scripts/GitHub_handler_cinema.sh concat-part 2 7"
echo "    3. ./csmcinema/Scripts/GitHub_handler_cinema.sh zip-part 2 7"
echo "    4. ./csmcinema/Scripts/GitHub_handler_cinema.sh organize-part 2 7"
echo "    5. Write Part 8 (Apotheosis) — 11 pieces ~27K words"
echo "    6. Write Part 9 (Ultimate Boon) — 11 pieces ~27K words"
echo "    7. Write Part 10 (Refusal of Return) — 11 pieces ~27K words"
echo "    8. Write Part 11 (Magic Flight Return) — 11 pieces ~27K words"
echo "    9. ./csmcinema/Scripts/GitHub_handler_cinema.sh concat-iteration 2"
echo "    10. ./csmcinema/Scripts/GitHub_handler_cinema.sh verify-iteration 2"
echo "    11. ./csmcinema/Scripts/GitHub_handler_cinema.sh commit-push \"CSM Cinema: Iteration 2 SOPP Pass Complete - 11 Parts Deepened\""
echo ""

# 6. KEY COMMANDS REFERENCE
echo "[6/8] KEY COMMANDS:"
cat << 'CMDS'
# Write a piece (after editing content):
./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 5 "<CONTENT>"

# Concat/zip/organize a part:
./csmcinema/Scripts/GitHub_handler_cinema.sh concat-part 2 7
./csmcinema/Scripts/GitHub_handler_cinema.sh zip-part 2 7
./csmcinema/Scripts/GitHub_handler_cinema.sh organize-part 2 7

# List all cinema files:
./csmcinema/Scripts/GitHub_handler_cinema.sh list

# Heartbeat:
bash CSMScripts/freenemo.sh chamber repeat 9

# Git:
git status
git add -A && git commit -m "msg" && git push origin session/iter2-sopp-pass
CMDS
echo ""

# 7. SESSION LOG LOCATION
echo "[7/8] Session logs:"
echo "    CSMLogs/Sessions/Session20260826-183232/ (latest heartbeat)"
echo "    CSMLogs/august26/ (session logs)"
echo ""

# 8. RESUME INSTRUCTIONS
echo "[8/8] TO RESUME IN NEW SESSION:"
cat << 'RESUME'
1. Clone repo, checkout session/iter2-sopp-pass
2. Run this script: bash RESTART_CSM_CINEMA_ITER2_SOPP_SESSION3_20260826.sh
3. Continue with Part 7 piece 5 rewrite
4. Keep heartbeat running: bash CSMScripts/freenemo.sh chamber repeat 9
5. Use GitHub_handler_cinema.sh for all piece operations
6. Commit/push frequently

AUTHOR: Jason Isaac Brodsky (California 1976) — Conducier
HEURISTICS: Williams Extreme (CSMSOPP) + El Segundo Extreme (CSMSOPPv2)
RESEARCH: JsnBAI Misinterpretation | Greek Fates | Jason & Argonauts
TARGET: ~27,500 words per part (~180 min read) × 11 parts = ~300K words
RESUME
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  READY. Heartbeat running (PID: $HEARTBEAT_PID)."
echo "  Next: Complete Part 7 pieces 5-11, then Parts 8-11."
echo "═══════════════════════════════════════════════════════════════"

# Keep script alive to show heartbeat
wait $HEARTBEAT_PID