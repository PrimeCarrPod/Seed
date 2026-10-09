#!/bin/bash
# Phase 5b: Generate Read-Aloud Volumes (4 versions for TTS)
# Project 10: Prime Electron Caldera Synthesis
# Run from: CSMWip/10_Prime_Electron_Caldera_Synthesis/

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CALDERA_DIR="$PROJECT_DIR/Caldera_Prime_Pi_Electron"
SECTIONS_DIR="$CALDERA_DIR/sections"
COMPILATIONS_DIR="$CALDERA_DIR/framework/compilations"
OUTPUT_DIR="$PROJECT_DIR/publication_outputs/read_aloud"

echo "=========================================="
echo "PHASE 5b: Generate Read-Aloud Volumes (4 versions)"
echo "=========================================="
echo ""

mkdir -p "$OUTPUT_DIR"

# Source compilation documents
CLEAN_COMPILATION="$COMPILATIONS_DIR/Caldera_Prime_Pi_Electron_Compilation_Clean.md"
READALOUD_COMPILATION="$COMPILATIONS_DIR/Caldera_Prime_Pi_Electron_Compilation_ReadAloud.md"
INTROS_ONLY="$COMPILATIONS_DIR/Caldera_Prime_Pi_Electron_Intros_Only_ReadAloud.md"
SECTIONS_ONLY="$COMPILATIONS_DIR/Caldera_Prime_Pi_Electron_Sections_Only_ReadAloud.md"
MASTER_DOC="$SECTIONS_DIR/Caldera_Prime_Pi_Electron_Complete.md"

# Version 1: FULL - Sections + Intros (complete)
FULL_OUTPUT="$OUTPUT_DIR/Caldera_ReadAloud_Full.txt"
echo "Generating Version 1: Full (Sections + Intros)..."
{
    echo "CALDERA PRIME PI ELECTRON SYNTHESIS - FULL READ-ALOUD VERSION"
    echo "============================================================="
    echo ""
    echo "Project 10: Prime Electron Caldera Synthesis"
    echo "12 Sections, 156 Pieces, 48 Heuristic Intros, 19,372 Lines"
    echo "Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")"
    echo ""
    echo "CONTENTS: All 12 sections with combined intros prepended,"
    echo "followed by all 13 pieces per section."
    echo ""
    echo "============================================================="
    echo ""
    
    # Prepend combined intros and section content from master doc
    if [[ -f "$MASTER_DOC" ]]; then
        cat "$MASTER_DOC"
    else
        echo "[Master document not found at $MASTER_DOC]"
    fi
} > "$FULL_OUTPUT"

# Version 2: INTROS_ONLY - Just the 48 heuristic intros
INTROS_OUTPUT="$OUTPUT_DIR/Caldera_ReadAloud_IntrosOnly.txt"
echo "Generating Version 2: Intros Only..."
{
    echo "CALDERA PRIME PI ELECTRON SYNTHESIS - INTROS ONLY READ-ALOUD"
    echo "============================================================="
    echo ""
    echo "48 Heuristic Introductory Passages (4 per section x 12 sections)"
    echo "Frameworks: Williams | Keymaker | El Segundo | Combined"
    echo "Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")"
    echo ""
    echo "============================================================="
    echo ""
    
    for i in {01..12}; do
        echo "SECTION $i"
        echo "========"
        echo ""
        
        for heuristic in williams keymaker elsegundo combined; do
            INTRO_FILE="$SECTIONS_DIR/Section_${i}_intro_${heuristic}.md"
            if [[ -f "$INTRO_FILE" ]]; then
                echo "--- ${heuristic^^} INTRO ---"
                echo ""
                cat "$INTRO_FILE"
                echo ""
                echo ""
            fi
        done
    done
} > "$INTROS_OUTPUT"

# Version 3: SECTIONS_ONLY - Just the 12 section masters (no intros)
SECTIONS_OUTPUT="$OUTPUT_DIR/Caldera_ReadAloud_SectionsOnly.txt"
echo "Generating Version 3: Sections Only..."
{
    echo "CALDERA PRIME PI ELECTRON SYNTHESIS - SECTIONS ONLY READ-ALOUD"
    echo "=============================================================="
    echo ""
    echo "12 Section Masters (13 pieces each = 156 technical pieces)"
    echo "No heuristic intros - pure technical content"
    echo "Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")"
    echo ""
    echo "=============================================================="
    echo ""
    
    for i in {01..12}; do
        SEC_FILE=$(ls "$SECTIONS_DIR"/Section_${i}_*.md 2>/dev/null | grep -v intro | head -1)
        if [[ -f "$SEC_FILE" ]]; then
            echo "SECTION $i: $(basename "$SEC_FILE" .md | sed 's/Section_[0-9]*_//' | tr '_' ' ')"
            echo "===================================================="
            echo ""
            cat "$SEC_FILE"
            echo ""
            echo ""
        fi
    done
} > "$SECTIONS_OUTPUT"

# Version 4: CLEAN - Publication-ready (from compilation clean)
CLEAN_OUTPUT="$OUTPUT_DIR/Caldera_ReadAloud_Clean.txt"
echo "Generating Version 4: Clean (Publication-ready)..."
{
    echo "CALDERA PRIME PI ELECTRON SYNTHESIS - CLEAN READ-ALOUD"
    echo "======================================================"
    echo ""
    echo "Publication-ready compilation (heuristics removed, formatted for ArXiv)"
    echo "Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")"
    echo ""
    echo "======================================================"
    echo ""
    
    if [[ -f "$CLEAN_COMPILATION" ]]; then
        cat "$CLEAN_COMPILATION"
    else
        echo "[Clean compilation not found]"
    fi
} > "$CLEAN_OUTPUT"

# Summary
echo ""
echo "Read-Aloud Volumes generated:"
echo "  1. Full (Sections + Intros):       $FULL_OUTPUT ($(wc -l < "$FULL_OUTPUT") lines)"
echo "  2. Intros Only (48 passages):      $INTROS_OUTPUT ($(wc -l < "$INTROS_OUTPUT") lines)"
echo "  3. Sections Only (12 masters):     $SECTIONS_OUTPUT ($(wc -l < "$SECTIONS_OUTPUT") lines)"
echo "  4. Clean (Publication-ready):      $CLEAN_OUTPUT ($(wc -l < "$CLEAN_OUTPUT") lines)"
echo ""
echo "Output directory: $OUTPUT_DIR"
echo ""
echo ">>> Phase 5b Complete."
echo "=========================================="