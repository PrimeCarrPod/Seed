#!/bin/bash
# ================================================================
# SubParticleReturnToWork.sh — Universal Resume Script
# ================================================================
# This script loads all context, pointers, and next steps for any
# agent session to resume work exactly where we left off.
#
# Usage: bash CSMWipScripts/SubParticleReturnToWork.sh
# ================================================================

set -euo pipefail

REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_17368795-0402-4ed0-887a-36c3f4640db3"
cd "$REPO_ROOT"

echo "================================================================"
echo "  SubParticleReturnToWork.sh — Session Resume"
echo "================================================================"
echo "Repository: PrimeCarrPod/Seed"
echo "Branch: session/agent_17368795-0402-4ed0-887a-36c3f4640db3 (tracking origin/session/agent_17368795-0402-4ed0-887a-36c3f4640db3)"
echo "Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo ""

# -----------------------------------------------------------------
# 1. KEY CONTEXT FILES — Load these first to understand state
# -----------------------------------------------------------------
echo "📋 1. KEY CONTEXT FILES"
echo "   --------------------"

CONTEXT_FILES=(
    "CSMLogs/August26/TODO_HTML_INTEGRATION.md"
    "CSM_WORK_IN_PROGRESS/README.md"
    "CSM_WORK_IN_PROGRESS/INSTRUCTIONS.md"
    "CSMLogs/August26/session-v5-prime-electron-build.md"
    "CSMLogs/August26/session-full-creation-log.md"
    "CSMLogs/August26/session-subparticles-v3v4-creation.md"
)

for f in "${CONTEXT_FILES[@]}"; do
    if [[ -f "$f" ]]; then
        echo "   ✅ $f"
    else
        echo "   ❌ MISSING: $f"
    fi
done

# -----------------------------------------------------------------
# 2. LOG FILES — All session logs in CSMLogs/August26/
# -----------------------------------------------------------------
echo ""
echo "📋 2. SESSION LOGS (CSMLogs/August26/)"
echo "   --------------------"

LOG_FILES=(
    "session-v5-prime-electron-build.md"          # V5 complete (7 series, 98 parts)
    "session-full-creation-log.md"                # SubParticlesV3/V4 + HTML
    "session-subparticles-v3v4-creation.md"       # V3/V4 + HTML integration
    "session-v4-gluon-creation.md"                # Gluon V4.0 (10/14 parts)
    "session-legal-acts-qa-complete.md"           # Legal Acts QA (12 acts)
    "session-legal-acts-todo-updates.md"          # MASTER TODO LIST updates
    "TODO_HTML_INTEGRATION.md"                    # Master todo list (LIVE)
)

for f in "${LOG_FILES[@]}"; do
    if [[ -f "CSMLogs/August26/$f" ]]; then
        echo "   ✅ CSMLogs/August26/$f"
    else
        echo "   ❌ MISSING: CSMLogs/August26/$f"
    fi
done

# -----------------------------------------------------------------
# 3. WORK IN PROGRESS — HTML Integration (Phase 3-7)
# -----------------------------------------------------------------
echo ""
echo "📋 3. WORK IN PROGRESS — HTML Integration (Phases 3-7)"
echo "   --------------------"

WIP_PATHS=(
    "CSM_WORK_IN_PROGRESS/README.md"
    "CSM_WORK_IN_PROGRESS/INSTRUCTIONS.md"
    "CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/LOL_v4_staging/"
    "CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/TGPU004.htm"
    "CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/index_v4.html"
)

for p in "${WIP_PATHS[@]}"; do
    if [[ -e "$p" ]]; then
        echo "   ✅ $p"
    else
        echo "   ❌ MISSING: $p"
    fi
done

# -----------------------------------------------------------------
# 4. SOURCE FILES — Merge targets for Phase 3
# -----------------------------------------------------------------
echo ""
echo "📋 4. SOURCE FILES FOR PHASE 3 (LOL_v4_staging)"
echo "   --------------------"

SOURCE_FILES=(
    "DeepResearch/SubParticlesV1/Tardigradia/LOL_v3_staging/index_v3.html"
    "CSMApps/landolil/v7b/src/main/assets/tardigradia.html"
    "DeepResearch/SubParticlesV1/Tardigradia/LOL_v2_staging/css/styles_v2.css"
    "DeepResearch/SubParticlesV1/Tardigradia/LOL_v2_staging/js/v2/core/physics.js"
)

for f in "${SOURCE_FILES[@]}"; do
    if [[ -f "$f" ]]; then
        echo "   ✅ $f"
    else
        echo "   ❌ MISSING: $f"
    fi
done

# -----------------------------------------------------------------
# 5. V5 PRIME ELECTRON BUILD — Complete (7 series)
# -----------------------------------------------------------------
echo ""
echo "📋 5. V5 PRIME ELECTRON BUILD — COMPLETE (7/7 Series)"
echo "   --------------------"

V5_SERIES=(
    "Electron_V5.0:23 files"
    "Gluon_V5.0:23 files"
    "Graviton_V5.0:23 files"
    "Higgs_V5.0:20 files"
    "Neutrino_V5.0:20 files"
    "Photon_V5.0:14 files"
    "WZ_V5.0:20 files"
)

for s in "${V5_SERIES[@]}"; do
    echo "   ✅ $s"
done
echo "   Total: 98 parts, 143 files, ~15,100 lines"

# -----------------------------------------------------------------
# 6. RECENT WORK COMPLETED — TGPU v3e Header Button Fix
# -----------------------------------------------------------------
echo ""
echo "📋 6. RECENT WORK COMPLETED — TGPU v3e Header Button Fix"
echo "   --------------------"
echo "   ✅ Fixed header button interaction issue in TGPU v3e"
echo "   ✅ Root cause: pointer-events:none on #hud-header container"
echo "   ✅ Solution: Removed pointer-events-none from header container"
echo "   ✅ All 11 header buttons now functional:"
echo "      - 🎯 Follow (Camera Follow)"
echo "      - 📳 Motion (Motion Sensor)"
echo "      - 🌪 Swarm (Swarm Mode)"
echo "      - 🦠 Icons (Icon Mode Toggle)"
echo "      - 🔢 Prime Gaps (Prime View)"
echo "      - 📐 Riemann Zeros (Riemann View)"
echo "      - 🧮 Hilbert 256 (Hilbert View)"
echo "      - 📜 Trails (Trails View)"
echo "      - ☰ Hide Panels (HUD Toggle)"
echo "      - ✈ Random Flight (Flight Mode)"
echo "      - Credits"
echo "   ✅ Created index_v3e.html with fix"
echo "   ✅ Committed and pushed to GitHub"
echo "   ✅ Pull Request #62 created"

# -----------------------------------------------------------------
# 7. CURRENT WORK IN PROGRESS — TGPU v3f Fix (IMMEDIATE)
# -----------------------------------------------------------------
echo ""
echo "📋 7. CURRENT WORK IN PROGRESS — TGPU v3f Fix (IMMEDIATE)"
echo "   --------------------"
echo "   🔄 Fixing opening screen button navigation in index_v3e.html"
echo "   🔄 Issue: 'BEGIN WORLDLINE' button goes to broken menu instead of launching 3D world"
echo "   🔄 Creating index_v3f.html with:"
echo "      - Opening screen preserved (resolution/physics seed selection)"
echo "      - 'BEGIN WORLDLINE' properly launches 3D particle simulation"
echo "      - Microbe icons for all 34 species (from tardigradia.html)"
echo "      - Camera Follow mode (5s hold, smooth lerp)"
echo "      - Motion Sensor mode (accelerometer/gyro via Android bridge)"
echo "      - Click raycast → detail panel with particle data"
echo "      - Android bridge (LandOLil interface) preserved"
echo "      - Local Three.js/Chart.js/shaders (no CDN)"
echo "      - Configurable particle count (200-3000 default, up to 150k)"
echo "   🔄 index_v3f.html created at root level"
echo "   🔄 Next: Push to GitHub, update work in progress files"

# -----------------------------------------------------------------
# 8. NEXT STEPS — Phase 3b (IMMEDIATE)
# -----------------------------------------------------------------
echo ""
echo "🎯 8. NEXT STEP — PHASE 3b: TGPU v3f Fix (READY TO EXECUTE)"
echo "   --------------------"
echo "   Task: Complete index_v3f.html and push to GitHub"
echo ""
echo "   Requirements for index_v3f.html:"
echo "     - Opening screen preserved with resolution/physics seed selection"
echo "     - 'BEGIN WORLDLINE' button launches 3D world immediately (like index_v3.html)"
echo "     - 34 particle species with microbe icons"
echo "     - Camera Follow (5s hold, smooth lerp)"
echo "     - Motion Sensor (accelerometer/gyro via Android bridge)"
echo "     - Click raycast → detail panel"
echo "     - Android bridge (LandOLil interface) preserved"
echo "     - Local Three.js/Chart.js/shaders (no CDN — already downloaded)"
echo "     - Particle count configurable (200-3000 default, up to 150k)"
echo ""
echo "   Status: index_v3f.html created with all features"
echo "   Next: Push index_v3f.html to GitHub, update SubParticleReturnToWork.sh, push session log"

# -----------------------------------------------------------------
# 9. FOLLOW-UP — Phase 3.6 & Phase 4
# -----------------------------------------------------------------
echo ""
echo "🎯 9. FOLLOW-UP STEPS"
echo "   --------------------"
echo "   Phase 3.6: Test LOL_v4_staging/index_v4.html in browser/WebView"
echo "   Phase 4: Build TGPU004.htm (V4.0 physics integration)"
echo "   Phase 5: Create index_v4.html (main entry point)"
echo "   Phase 6: Compile CREDITS.md"
echo "   Phase 7: Git push to csmlogs branch"
echo ""
echo "   Source files for Phase 4:"
echo "     - TGPU00000001.htm → TGPU00000002.htm → TGPU003.htm evolution"
echo "     - All 34+ V4.0 particle species properties"
echo "     - Glueball worldlines with QCD string tension"
echo "     - Swarm mechanics + fluid dynamics coupling"
echo "     - Microbial ecosystem food chain visualization"
echo "     - One-electron universe worldline topology"

# -----------------------------------------------------------------
# 8. GIT STATUS
# -----------------------------------------------------------------
echo ""
echo "📋 8. GIT STATUS"
echo "   --------------------"
git status --short
echo ""
echo "   Branch: $(git branch --show-current)"
echo "   Remote: $(git remote get-url origin)"

# -----------------------------------------------------------------
# 10. QUICK COMMANDS FOR NEXT SESSION
# -----------------------------------------------------------------
echo ""
echo "🎯 10. QUICK COMMANDS FOR NEXT SESSION"
echo "   --------------------"
echo "   # Resume work:"
echo "   bash CSMWipScripts/SubParticleReturnToWork.sh"
echo ""
echo "   # View todo list:"
echo "   cat CSMLogs/August26/TODO_HTML_INTEGRATION.md"
echo ""
echo "   # Complete Phase 3b (TGPU v3f Fix):"
echo "   # 1. Verify index_v3f.html works correctly"
echo "   # 2. Push index_v3f.html to GitHub (root level)"
echo "   # 3. Update TODO_HTML_INTEGRATION.md checkboxes"
echo "   # 4. Push updated SubParticleReturnToWork.sh to GitHub"
echo "   # 5. Push session log to csmlogs/august26/"
echo ""
echo "   # Then Phase 3.6 (Test LOL_v4_staging):"
echo "   # 1. Open CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/LOL_v4_staging/index_v4.html in browser"
echo "   # 2. Verify all features work"
echo ""
echo "   # Then Phase 4 (TGPU004.htm):"
echo "   # 1. Read TGPU evolution files"
echo "   # 2. Build V4.0 physics integration"
echo ""
echo "   # Continue V4.0 series (Gluon Parts 11-14, then 17 more series):"
echo "   # ./MASTER-RESUME.sh new-v4 <ParticleName>"
echo ""

# -----------------------------------------------------------------
# 10. AGENT GUIDELINES
# -----------------------------------------------------------------
echo ""
echo "📋 10. AGENT GUIDELINES (CRITICAL)"
echo "   --------------------"
echo "   - WORK ONLY ON: Phase 3 (LOL_v4_staging) → Phase 4 (TGPU004.htm)"
echo "   - DO NOT START: New V5 series, other V4 series, other projects"
echo "   - PARALLEL WORK: Only within assigned phase (one task at a time)"
echo "   - UPDATE: TODO_HTML_INTEGRATION.md after each task completion"
echo "   - COMMIT: Incremental commits to csmlogs branch"
echo "   - LOG: Create session log in CSMLogs/August26/session-<date>-<task>.md"
echo ""
echo "   Other agents may work in parallel on:"
echo "   - GasTown: Separate Cloud Kilo.Ai instance"
echo "   - CloudAgent: Different workflow method"
echo "   - This session: csmlogs branch only"
echo ""
echo ""

echo "================================================================"
echo "  Ready for Phase 3.1 — LOL_v4_staging Merge"
echo "================================================================"