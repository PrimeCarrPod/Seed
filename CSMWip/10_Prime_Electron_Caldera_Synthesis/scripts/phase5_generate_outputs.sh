#!/bin/bash
# Phase 5 Master: Generate All Publication Outputs
# Project 10: Prime Electron Caldera Synthesis

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=========================================="
echo "PHASE 5: Publication Pipeline - Master Script"
echo "=========================================="
echo ""

# Run all sub-phases
echo ">>> Running Phase 5a: Caldera Synthesis Volume..."
bash "$PROJECT_DIR/scripts/phase5a_synthesis_volume.sh"

echo ""
echo ">>> Running Phase 5b: Read-Aloud Volumes..."
bash "$PROJECT_DIR/scripts/phase5b_read_aloud.sh"

echo ""
echo ">>> Running Phase 5c: Flagship Papers..."
bash "$PROJECT_DIR/scripts/phase5c_flagship_papers.sh"

echo ""
echo ">>> Running Phase 5d: Methodology Appendix..."
bash "$PROJECT_DIR/scripts/phase5d_methodology_appendix.sh"

echo ""
echo ">>> Running Phase 5e: Unified Compendium..."
bash "$PROJECT_DIR/scripts/phase5e_unified_compendium.sh"

echo ""
echo "=========================================="
echo "PHASE 5 COMPLETE - All 5 Outputs Generated"
echo "=========================================="
echo ""
echo "Output Summary:"
echo "  1. Caldera Synthesis Volume: publication_outputs/caldera_synthesis/"
echo "  2. Read-Aloud Volumes (4): publication_outputs/read_aloud/"
echo "  3. Flagship Papers (3): publication_outputs/flagship_papers/"
echo "  4. Methodology Appendix: publication_outputs/methodology_appendix/"
echo "  5. Unified Compendium: publication_outputs/unified_compendium/"
echo "  6. Computational Compendium: publication_outputs/computational_compendium/"
