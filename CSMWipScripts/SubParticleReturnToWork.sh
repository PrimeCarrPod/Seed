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

REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_cdd37b35-0db7-463f-a90e-dec91eee7e3c"
cd "$REPO_ROOT"

echo "================================================================"
echo "  SubParticleReturnToWork.sh — Session Resume"
echo "================================================================"
echo "Repository: PrimeCarrPod/Seed"
echo "Branch: csmlogs (tracking origin/csmlogs)"
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
# 6. NEXT STEPS — Phase 3.1 (IMMEDIATE)
# -----------------------------------------------------------------
echo ""
echo "🎯 6. NEXT STEP — PHASE 3.1 (READY TO EXECUTE)"
echo "   --------------------"
echo "   Task: Create LOL_v4_staging/index_v4.html by merging:"
echo "     Source A: DeepResearch/SubParticlesV1/Tardigradia/LOL_v3_staging/index_v3.html"
echo "     Source B: CSMApps/landolil/v7b/src/main/assets/tardigradia.html"
echo ""
echo "   Requirements for index_v4.html:"
echo "     - 34 particle species (all V4.0)"
echo "     - Microbe icons for all 34 (extended from 18)"
echo "     - Camera Follow (5s hold, smooth lerp)"
echo "     - Motion Sensor (accelerometer/gyro via Android bridge)"
echo "     - Click raycast → detail panel"
echo "     - Android bridge (LandOLil interface) preserved"
echo "     - Local Three.js/Chart.js/shaders (no CDN — already downloaded)"
echo "     - Particle count configurable (200-3000 default, up to 150k)"
echo ""
echo "   Status: Directory structure created, JS/CSS copied, dependencies downloaded"
echo "   Next: Create index_v4.html merge"

# -----------------------------------------------------------------
# 7. GIT STATUS
# -----------------------------------------------------------------
echo ""
echo "📋 7. GIT STATUS"
echo "   --------------------"
git status --short
echo ""
echo "   Branch: $(git branch --show-current)"
echo "   Remote: $(git remote get-url origin)"

# -----------------------------------------------------------------
# 8. QUICK COMMANDS FOR NEXT SESSION
# -----------------------------------------------------------------
echo ""
echo "🎯 8. QUICK COMMANDS FOR NEXT SESSION"
echo "   --------------------"
echo "   # Resume work:"
echo "   bash CSMWipScripts/SubParticleReturnToWork.sh"
echo ""
echo "   # View todo list:"
echo "   cat CSMLogs/August26/TODO_HTML_INTEGRATION.md"
echo ""
echo "   # Start Phase 3.1:"
echo "   # 1. Read both source HTML files"
echo "   # 2. Create merged index_v4.html in CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/LOL_v4_staging/"
echo "   # 3. Update TODO_HTML_INTEGRATION.md checkboxes"
echo ""
echo "   # Continue V4.0 series (Gluon Parts 11-14, then 17 more series):"
echo "   # ./MASTER-RESUME.sh new-v4 <ParticleName>"
echo ""

# -----------------------------------------------------------------
# 9. AGENT GUIDELINES
# -----------------------------------------------------------------
echo ""
echo "📋 9. AGENT GUIDELINES (CRITICAL)"
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

echo "================================================================"
echo "  Ready for Phase 3.1 — LOL_v4_staging Merge"
echo "================================================================"