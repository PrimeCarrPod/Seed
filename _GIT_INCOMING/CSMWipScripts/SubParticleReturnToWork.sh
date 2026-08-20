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

REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_68a6309c-661d-4cb5-ad90-96661422cf37"
cd "$REPO_ROOT"

echo "================================================================"
echo "  SubParticleReturnToWork.sh — Session Resume"
echo "================================================================"
echo "Repository: PrimeCarrPod/Seed"
echo "Branch: session/agent_68a6309c-661d-4cb5-ad90-96661422cf37 (tracking origin/main)"
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
# 6. RECENT WORK COMPLETED — TGPU v3e Header Button Fix + JS Structure
# -----------------------------------------------------------------
echo ""
echo "📋 6. RECENT WORK COMPLETED — TGPU v3e Fixes (Session $(date -u +%Y-%m-%d))"
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
echo "   ✅ Added Tailwind CSS CDN to index_v3e.html (was missing - caused broken layout)"
echo "   ✅ Created js/ directory at repo root with all Three.js libraries:"
echo "      - three.min.js (603KB)"
echo "      - OrbitControls.js"
echo "      - EffectComposer.js, RenderPass.js, ShaderPass.js"
echo "      - CopyShader.js, UnrealBloomPass.js, LuminosityHighPassShader.js"
echo "      - chart.umd.js"
echo "   ✅ Fixed opening screen transition to 3D world (BEGIN WORLDLINE button)"
echo "   ✅ Created TGPU_v3e_package.zip with proper structure (index_v3e.html + js/)"

# -----------------------------------------------------------------
# 7. RECENT WORK COMPLETED — TGPU v3f Fix (COMPLETE)
# -----------------------------------------------------------------
echo ""
echo "📋 7. RECENT WORK COMPLETED — TGPU v3f Fix (COMPLETE)"
echo "   --------------------"
echo "   ✅ Fixed opening screen button navigation in index_v3e.html"
echo "   ✅ Issue: 'BEGIN WORLDLINE' button went to broken menu instead of launching 3D world"
echo "   ✅ Created index_v3f.html with:"
echo "      - Opening screen preserved (resolution/physics seed selection)"
echo "      - 'BEGIN WORLDLINE' properly launches 3D particle simulation (like index_v3.html)"
echo "      - Microbe icons for all 34 species (from tardigradia.html)"
echo "      - Camera Follow mode (5s hold, smooth lerp)"
echo "      - Motion Sensor mode (accelerometer/gyro via Android bridge)"
echo "      - Click raycast → detail panel with particle data"
echo "      - Android bridge (LandOLil interface) preserved"
echo "      - Local Three.js/Chart.js/shaders (no CDN)"
echo "      - Configurable particle count (200-3000 default, up to 150k)"
echo "   ✅ index_v3f.html created at root level and pushed to GitHub"
echo "   ✅ SubParticleReturnToWork.sh updated"
echo "   ✅ Session log pushed to csmlogs/august26/"

# -----------------------------------------------------------------
# 8. RECENT WORK COMPLETED — Land 'O' Lil v3g (COMPLETE)
# -----------------------------------------------------------------
echo ""
echo "📋 8. RECENT WORK COMPLETED — Land 'O' Lil v3g (COMPLETE)"
echo "   --------------------"
echo "   ✅ Created index_v3g.html — Land 'O' Lil v3g (Subatomic Worldline Evolution)"
echo "   ✅ TUCKABLE MENUS from bounce.html integrated:"
echo "      - Left/right side panels slide off-screen with smooth CSS transitions"
echo "      - TUCK/UNTUCK button at bottom center toggles both panels"
echo "      - Panel state preserved via UI.tuckToggle()"
echo "   ✅ LIQUID FLOW DYNAMICS (Navier-Stokes solver):"
echo "      - Viscosity control (0.01-2.0)"
echo "      - Surface tension control (0.0-1.0)"
echo "      - Flow velocity control (0.0-5.0)"
echo "      - Turbulence control (0.0-1.0)"
echo "      - Vortex strength control (0.0-3.0)"
echo "      - Compressibility control (0.0-1.0)"
echo "      - Real-time flow field visualization in side panel"
echo "      - Fluid velocity coupled to all 34 particle species"
echo "   ✅ SUBATOMIC PARTICLES ONLY (34 species, NO MICROBES):"
echo "      - electron, proton, neutron, photon, axion, neutralino"
echo "      - gluon, higgs, neutrino, up_quark, down_quark, muon"
echo "      - pion, kaon, demon, graviton, w_boson, z_boson"
echo "      - glueball, swarm_mode"
echo "      - Each with procedural icon textures (symbol: e⁻, p⁺, n⁰, γ, a, χ, g, H⁰, ν, u, d, μ, π, K, 👻, G, W, Z, 🔗, 🌪)"
echo "   ✅ CAMERA FOLLOW: 5s hold per particle, smooth lerp transition, HUD panel"
echo "   ✅ MOTION SENSOR: Accelerometer/gyro via Android bridge"
echo "   ✅ CLICK-TO-DETAIL: Raycast → detail panel with physics data"
echo "   ✅ PRIME GAP VIEW / RIEMANN ZERO VIEW / HILBERT 256 VIEW / TRAILS VIEW"
echo "   ✅ OPENING SCREEN: Resolution selection + 8 physics seed parameters + randomize buttons"
echo "   ✅ ANDROID BRIDGE: LandOLil interface preserved for native deployment"
echo "   ✅ LOCAL LIBRARIES: All Three.js/Chart.js/shaders local (no CDN)"
echo "   ✅ Created LandOLil_v3g_package.zip with proper structure (index_v3g.html + js/)"
echo "   ✅ index_v3g.html and LandOLil_v3g_package.zip pushed to GitHub"
echo "   ✅ SubParticleReturnToWork.sh updated"
echo "   ✅ Session log pushed to csmlogs/august26/"

# -----------------------------------------------------------------
# 9. RECENT WORK COMPLETED — TGPU v3h (COMPLETE)
# -----------------------------------------------------------------
echo ""
echo "📋 9. RECENT WORK COMPLETED — TGPU v3h (COMPLETE)"
echo "   --------------------"
echo "   ✅ Created index_v3h.html — Prime Electron Worldline v3h"
echo "   ✅ TUCKABLE MENUS from bounce.html integrated:"
echo "      - Left/right side panels slide off-screen with smooth CSS transitions"
echo "      - TUCK/UNTUCK button at bottom center toggles both panels"
echo "      - Panel state preserved via UI.tuckToggle()"
echo "   ✅ SUBATOMIC PARTICLE ICONS (34 species, NO MICROBES - removed per preference):"
echo "      - electron (e⁻), proton (p⁺), neutron (n⁰), photon (γ), axion (a)"
echo "      - neutralino (χ), gluon (g), higgs (H⁰), neutrino (ν), up_quark (u)"
echo "      - down_quark (d), muon (μ), pion (π), kaon (K), demon (👻)"
echo "      - graviton (G), w_boson (W), z_boson (Z), glueball (🔗), swarm_mode (🌪)"
echo "   ✅ FIXED HEADER BUTTONS: Removed pointer-events-none from #hud-header"
echo "      - All 11 header buttons now functional"
echo "   ✅ PROPER OPENING SCREEN TRANSITION:"
echo "      - 'BEGIN WORLDLINE' button correctly launches 3D particle simulation"
echo "      - Opening screen hidden via classList.add('hidden')"
echo "      - sim.init() called with opening parameters"
echo "   ✅ CAMERA FOLLOW: 5s hold per particle, smooth lerp transition, HUD panel"
echo "   ✅ MOTION SENSOR: Accelerometer/gyro via Android bridge"
echo "   ✅ CLICK-TO-DETAIL: Raycast → detail panel with physics data"
echo "   ✅ PRIME GAP VIEW / RIEMANN ZERO VIEW / HILBERT 256 VIEW / TRAILS VIEW"
echo "   ✅ OPENING SCREEN: Resolution selection + 8 physics seed parameters + randomize buttons"
echo "   ✅ ANDROID BRIDGE: LandOLil interface preserved for native deployment"
echo "   ✅ LOCAL LIBRARIES: All Three.js/Chart.js/shaders local (no CDN)"
echo "   ✅ Created TGPU_v3h_package.zip with proper structure (index_v3h.html + js/)"
echo "   ✅ index_v3h.html and TGPU_v3h_package.zip pushed to GitHub"
echo "   ✅ SubParticleReturnToWork.sh updated"
echo "   ✅ Session log pushed to csmlogs/august26/"

# -----------------------------------------------------------------
# 10. NEXT STEPS — Phase 4 (TGPU004.htm / LandOLil_v4)
# -----------------------------------------------------------------
echo ""
echo "🎯 10. NEXT STEP — PHASE 4: TGPU004.htm / LandOLil_v4 (READY TO EXECUTE)"
echo "   --------------------"
echo "   Task: Build V4.0 physics integration — Land 'O' Lil v4"
echo ""
echo "   Source files:"
echo "     - TGPU00000001.htm → TGPU00000002.htm → TGPU003.htm evolution"
echo "     - All 34+ V4.0 particle species properties"
echo "     - Glueball worldlines with QCD string tension"
echo "     - Swarm mechanics + fluid dynamics coupling"
echo "     - Microbial ecosystem food chain visualization"
echo "     - One-electron universe worldline topology"
echo "     - Real-time metrics: Action, Benevolence, Coherence, Glueball energy"
echo "     - Camera follow, motion sensor, click detail, flight controller"
echo "     - Android bridge for native deployment"
echo "     - Local Three.js/Chart.js (offline capable)"
echo ""
echo "   Status: v3h complete with tuckable menus + subatomic icons + fixed buttons. Ready for V4.0 integration."

# -----------------------------------------------------------------
# 11. GIT STATUS
# -----------------------------------------------------------------
echo ""
echo "📋 11. GIT STATUS"
echo "   --------------------"
git status --short
echo ""
echo "   Branch: $(git branch --show-current)"
echo "   Remote: $(git remote get-url origin)"

# -----------------------------------------------------------------
# 12. QUICK COMMANDS FOR NEXT SESSION
# -----------------------------------------------------------------
echo ""
echo "🎯 12. QUICK COMMANDS FOR NEXT SESSION"
echo "   --------------------"
echo "   # Resume work:"
echo "   bash CSMWipScripts/SubParticleReturnToWork.sh"
echo ""
echo "   # View todo list:"
echo "   cat CSMLogs/August26/TODO_HTML_INTEGRATION.md"
echo ""
echo "   # Phase 4: TGPU004.htm / LandOLil_v4:"
echo "   # 1. Read TGPU evolution files"
echo "   # 2. Build V4.0 physics integration with liquid flow"
echo "   # 3. Integrate tuckable menus from v3h"
echo ""
echo "   # Continue V4.0 series (Gluon Parts 11-14, then 17 more series):"
echo "   # ./MASTER-RESUME.sh new-v4 <ParticleName>"
echo ""

# -----------------------------------------------------------------
# 13. AGENT GUIDELINES
# -----------------------------------------------------------------
echo ""
echo "📋 10. AGENT GUIDELINES (CRITICAL)"
echo "   --------------------"
echo "   - WORK ONLY ON: Phase 4 (TGPU004.htm / LandOLil_v4) — V4.0 physics integration"
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
echo "  Ready for Phase 4 — TGPU004.htm / LandOLil_v4"
echo "================================================================"