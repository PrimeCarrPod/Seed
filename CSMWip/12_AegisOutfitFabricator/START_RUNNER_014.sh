#!/usr/bin/env bash
# ============================================================
# AEGIS OUTFIT FABRICATOR — RUNNER 014 STARTUP
# Phase 4 Batch 3: DOC-21 through DOC-30
# ============================================================
set -euo pipefail

cd /workspace/app/CSMWip/12_AegisOutfitFabricator

# 1. READ CONTEXT
cat NEXT_runner_014.md
cat RESUME_SESSION_AEGIS.md
git status

# 2. CONFIGURE ENVIRONMENT
export PYTHONPATH=/workspace/app/__Python_Tools:$PYTHONPATH

# 3. START HEARTBEAT MONITOR (120s interval, background)
python3 scripts/heartbeat_monitor.py --interval 120 --daemon &
HEARTBEAT_PID=$!
echo "Heartbeat PID: $HEARTBEAT_PID"

# 4. VERIFY TOOLS
python3 /workspace/app/__Python_Tools/write_large_file.py write /dev/null /dev/null 1024
echo "write_large_file.py: OK"

# 5. VERIFY CHUNK PIPELINE (spot check)
python3 /workspace/app/__Python_Tools/write_large_file.py verify chunks/DOC-13_RenaissanceMan_SS_Specification chunks/DOC-13_RenaissanceMan_SS_Specification/MANIFEST.json
python3 /workspace/app/__Python_Tools/write_large_file.py verify chunks/DOC-14_RenaissanceMan_SG_Specification chunks/DOC-14_RenaissanceMan_SG_Specification/MANIFEST.json
echo "Chunk pipeline: OK"

# 6. BEGIN DOC-21 (PRIORITY 1)
# Target: Ballistic Protection — Ceramic-Gilded Tile + Auxetic Metamaterial
# Dependencies: CSMFAB078-B §3.1, DOC-01..20, MAT-03, SYNTH-02
# Edit: FinishedWork/DOC-21_Ballistic_Protection_Specification.md
# Then chunk & verify:
# python3 /workspace/app/__Python_Tools/write_large_file.py split \
#     FinishedWork/DOC-21_Ballistic_Protection_Specification.md \
#     chunks/DOC-21_Ballistic_Protection chapter .md
# python3 /workspace/app/__Python_Tools/write_large_file.py manifest \
#     chunks/DOC-21_Ballistic_Protection chunks/DOC-21_Ballistic_Protection/MANIFEST.json "chapter_*.md"
# python3 /workspace/app/__Python_Tools/write_large_file.py verify \
#     chunks/DOC-21_Ballistic_Protection chunks/DOC-21_Ballistic_Protection/MANIFEST.json
# python3 /workspace/app/__Python_Tools/write_large_file.py compress \
#     FinishedWork/DOC-21_Ballistic_Protection_Specification.md

# 7. COMMIT & CONTINUE DOC-22 through DOC-30
# git add chunks/DOC-21_Ballistic_Protection/ FinishedWork/DOC-21_Ballistic_Protection_Specification.md.gz
# git commit -m "runner014: DOC-21 complete - chunked, verified, compressed"

# 8. MONITOR HEARTBEAT (optional - run in separate terminal)
# tail -f Logs/heartbeat.log

echo ""
echo "=== RUNNER 014 READY ==="
echo "Heartbeat monitor running (PID: $HEARTBEAT_PID)"
echo "Next: Author DOC-21 Ballistic Protection Specification"
echo "Stop heartbeat: kill $HEARTBEAT_PID"
