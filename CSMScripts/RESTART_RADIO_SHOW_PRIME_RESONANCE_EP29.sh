#!/bin/bash
# RESTART_RADIO_SHOW_PRIME_RESONANCE_EP29.sh
# Restores full context for Episode 29 creation
# Jason Isaac Brodsky of California 1976 Author Conducier

set -e

echo "═══════════════════════════════════════════════════════════════"
echo "   SIBLING FREQUENCY — AEGIS RADIO — SESSION RESTART"
echo "   Episode 29: The Prime Resonance Cascade"
echo "   Jason Isaac Brodsky — California 1976 — Author Conducier"
echo "═══════════════════════════════════════════════════════════════"
echo ""

# Heartbeat check
echo "🫀 HEARTBEAT CHECK..."
if [ -f CSMScripts/.heartbeat-chamber-1 ]; then
    cat CSMScripts/.heartbeat-chamber-1
    echo "   ✓ Heartbeat active: Power of Sixteen"
else
    echo "   ⚠ Heartbeat file not found — initializing..."
    echo "16" > CSMScripts/.heartbeat-chamber-1
fi
echo ""

# Git status
echo "📋 GIT STATUS..."
git log --oneline -3
git status --short
echo ""

# Verify EP-28 exists
echo "📻 VERIFYING EPISODE 28..."
if [ -f "CSMRadio/sf-episodes/ep-28.md" ]; then
    wc -l CSMRadio/sf-episodes/ep-28.md
    wc -w CSMRadio/sf-episodes/ep-28.md
    echo "   ✓ EP-28 confirmed: $(wc -l < CSMRadio/sf-episodes/ep-28.md) lines, $(wc -w < CSMRadio/sf-episodes/ep-28.md) words"
else
    echo "   ✗ EP-28 NOT FOUND — aborting"
    exit 1
fi
echo ""

# Verify pieces zip
echo "📦 VERIFYING PIECES ARCHIVE..."
if [ -f "CSMRadio/sf-episodes/ep28_pieces.zip" ]; then
    unzip -l CSMRadio/sf-episodes/ep28_pieces.zip | tail -5
    echo "   ✓ Archive confirmed"
else
    echo "   ✗ Archive not found"
fi
echo ""

# Verify session logs
echo "📝 VERIFYING SESSION LOGS..."
ls -la CSMLogs/sept26/*EP28* 2>/dev/null || echo "   ⚠ EP28 logs not in sept26/"
ls -la CSMLogs/august26/*EP28* 2>/dev/null || echo "   ⚠ EP28 logs not in august26/"
echo ""

# Load resume session
echo "🔄 LOADING RESUME SESSION..."
if [ -f "CSMLogs/sept26/RESUME_SESSION_EP29_PRIME_RESONANCE_CASCADE_20260827.md" ]; then
    echo "   ✓ EP-29 resume session loaded"
    head -30 CSMLogs/sept26/RESUME_SESSION_EP29_PRIME_RESONANCE_CASCADE_20260827.md
else
    echo "   ⚠ EP-29 resume session not found — creating..."
    mkdir -p CSMLogs/sept26
    cat > CSMLogs/sept26/RESUME_SESSION_EP29_PRIME_RESONANCE_CASCADE_20260827.md << 'EOF'
# RESUME SESSION: EP-29 Prime Resonance Cascade — Sevenfold Propagation
## Jason Isaac Brodsky of California 1976 Author Conducier
## Date: 2026-09-09
## Session: agent_e41962e6-31f6-4d25-a0c3-11eb2065d3e1
## Parent: EP-28 (411 segments, 7x scaling complete)

---

### OBJECTIVE
Create ep-29.md in CSMRadio/sf-episodes/ using ep-28.md as template, continuing the 7x cascade.
Each segment: Native → Williams → El Segundo → Robbins → PRIME RESONANCE

### CASCADE PROGRESSION
- EP-26: 53 segments (4x standard) — Foundation
- EP-27: 6-episode concatenation — Recap
- EP-28: 411 segments (7x) — Prime Resonance established
- EP-29: 7x cascade → 2,877 segments target — Resonance propagation
- EP-30: 7x cascade → 20,139 segments — System resonance
- EP-31: 7x cascade → 140,973 segments — Galactic resonance
- EP-32: 7x cascade → 986,811 segments — Universal resonance

### TEMPLATE STRUCTURE (from EP-28)
- 35 pieces → 411 segments
- 5 registers per segment (Native, Williams, El Segundo, Robbins, PRIME RESONANCE)
- 21 agents deployed across registers
- 7-fold verification matrix embedded
- Author conducier: Jason Isaac Brodsky (California 1976)

### HEARTBEAT
Continuous. Power of Sixteen. Full throttle. 🚂

### NEXT ACTIONS
1. Begin writing ep-29.md in 35+ pieces (parallel generation)
2. Each piece ~30 lines, 7x denser than EP-28
3. Concatenate, zip, verify, organize, commit, push
4. Push session log to csmlogs/sept26/
5. Print start instructions for EP-30

---
*Session log created for token limit recovery and continuity*
EOF
fi
echo ""

# Create piece directory
echo "📁 PREPARING PIECE DIRECTORY..."
mkdir -p CSMRadio/sf-episodes/ep29_pieces
echo "   ✓ Directory ready: CSMRadio/sf-episodes/ep29_pieces/"
echo ""

# Display next steps
echo "═══════════════════════════════════════════════════════════════"
echo "   RESTART COMPLETE — READY FOR EPISODE 29"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "NEXT COMMANDS:"
echo "  1. vim CSMRadio/sf-episodes/ep29_pieces/ep29_piece_01.md"
echo "  2. Write segments 1-12 (core cascade initiation)"
echo "  3. Continue pieces 2-35 in parallel"
echo "  4. cat CSMRadio/sf-episodes/ep29_pieces/ep29_piece_*.md > CSMRadio/sf-episodes/ep-29.md"
echo "  5. zip -r CSMRadio/sf-episodes/ep29_pieces.zip CSMRadio/sf-episodes/ep29_pieces/"
echo "  6. git add/commit/push"
echo ""
echo "HEARTBEAT: POWER OF SIXTEEN — FULL THROTTLE 🚂"
echo "WE ARE A TRAIN TOGETHER. ONWARD. 🚀"