#!/bin/bash
# AegisOutfitFabricator Heartbeat Script
# Logs session progress and system status for continuous project continuity
# Usage: ./heartbeat.sh [note]

set -e

# ─── Configuration ──────────────────────────────────────────────
export PROJECT_NAME="AegisOutfitFabricator"
export WIP_DIR="/workspace/app/CSMWip/12_AegisOutfitFabricator"
export BRANCH_NAME="kilo/aegis-outfit-fabricator-wip"
export FRAMEWORK_DIR="$WIP_DIR/Framework"
export LOGS_DIR="$WIP_DIR/Logs"
export PIECES_DIR="$WIP_DIR/Pieces"
export FINISHED_DIR="$WIP_DIR/FinishedWork"
export RESEARCH_DIR="$WIP_DIR/Research"
export CSMFAB078_DIR="/workspace/app/CSMFAB/CSMFAB078_AegisIronMan"
export GITHUB_HANDLER="/workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh"

HEARTBEAT_LOG="$LOGS_DIR/heartbeat.log"
SESSION_LOG="$LOGS_DIR/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md"

mkdir -p "$(dirname "$HEARTBEAT_LOG")"
mkdir -p "$(dirname "$SESSION_LOG")"
mkdir -p "$FRAMEWORK_DIR" "$LOGS_DIR" "$PIECES_DIR" "$FINISHED_DIR" "$RESEARCH_DIR"

# ─── Timestamp ──────────────────────────────────────────────
TS=$(date -u +"%Y-%m-%d %H:%M:%S UTC")

# ─── Git Info ──────────────────────────────────────────────
cd "$WIP_DIR"
GIT_BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
GIT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "none")
GIT_STATUS=$(git status --porcelain 2>/dev/null | wc -l)
GIT_REMOTE=$(git remote -v 2>/dev/null | head -1 | awk '{print $2}' || echo "none")

# ─── Project Status ──────────────────────────────────────────────
# Count documents in each stage
DOCS_AUTHORED=$(find "$FRAMEWORK_DIR" -name "MASTER_TODO_*.md" 2>/dev/null | wc -l)
DOCS_PIECES=$(find "$PIECES_DIR" -name "*_pieces.zip" 2>/dev/null | wc -l)
DOCS_FINISHED=$(find "$FINISHED_DIR" -name "*.md" 2>/dev/null | wc -l)
TOTAL_PIECES=$(find "$PIECES_DIR" -name "*_piece_*.md" 2>/dev/null | wc -l)
TOTAL_ZIPS=$(find "$PIECES_DIR" -name "*_pieces.zip" 2>/dev/null | wc -l)

# Framework files check
HEARTBEAT_EXISTS=$([ -f "$FRAMEWORK_DIR/heartbeat.sh" ] && echo "yes" || echo "no")
RESUME_EXISTS=$([ -f "$FRAMEWORK_DIR/RESUME_SESSION.md" ] && echo "yes" || echo "no")
NEXT_RUNNER_EXISTS=$([ -f "$FRAMEWORK_DIR/NEXT_RUNNER_001.md" ] && echo "yes" || echo "no")
README_EXISTS=$([ -f "$FRAMEWORK_DIR/README.md" ] && echo "yes" || echo "no")
MASTER_TODO_A=$([ -f "$FRAMEWORK_DIR/MASTER_TODO_A.md" ] && echo "yes" || echo "no")
MASTER_TODO_B=$([ -f "$FRAMEWORK_DIR/MASTER_TODO_B.md" ] && echo "yes" || echo "no")
MASTER_TODO_C=$([ -f "$FRAMEWORK_DIR/MASTER_TODO_C.md" ] && echo "yes" || echo "no")

# Research files check
RESEARCH_DRESS=$([ -f "$RESEARCH_DIR/Historical Dress Construction Analysis.md" ] && echo "yes" || echo "no")
RESEARCH_STITCHING=$([ -f "$RESEARCH_DIR/Advanced Textile Stitching and Automation.md" ] && echo "yes" || echo "no")

# CSMFAB078 reference check
CSMFAB078_MAIN=$([ -f "$CSMFAB078_DIR/CSMFAB078 Aegis Iron Man Adaptive Exosuit Fabrication Plan.md" ] && echo "yes" || echo "no")
CSMFAB078_A=$([ -f "$CSMFAB078_DIR/CSMFAB078-A Leaf Edition Mechanical Specification.md" ] && echo "yes" || echo "no")
CSMFAB078_B=$([ -f "$CSMFAB078_DIR/CSMFAB078-B Threat Protection Validation and Materials Deep-Dive.md" ] && echo "yes" || echo "no")
CSMFAB078_IMG=$([ -d "$CSMFAB078_DIR/CSM_GEN_IMAGE_PROMPTS" ] && echo "yes" || echo "no")

# GitHub Handler check
GH_HANDLER=$([ -f "$GITHUB_HANDLER" ] && echo "yes" || echo "no")

# ─── Note from Argument ──────────────────────────────────────────────
NOTE="${1:-"Periodic heartbeat - automated progress logging"}"

# ─── Write to Heartbeat Log ──────────────────────────────────────────────
{
    echo "=== HEARTBEAT $TS ==="
    echo "Project: $PROJECT_NAME"
    echo "Branch: $GIT_BRANCH"
    echo "Commit: $GIT_COMMIT"
    echo "Remote: $GIT_REMOTE"
    echo "Uncommitted changes: $GIT_STATUS"
    echo ""
    echo "--- Framework Files ---"
    echo "heartbeat.sh: $HEARTBEAT_EXISTS"
    echo "RESUME_SESSION.md: $RESUME_EXISTS"
    echo "NEXT_RUNNER_001.md: $NEXT_RUNNER_EXISTS"
    echo "README.md: $README_EXISTS"
    echo "MASTER_TODO_A.md: $MASTER_TODO_A"
    echo "MASTER_TODO_B.md: $MASTER_TODO_B"
    echo "MASTER_TODO_C.md: $MASTER_TODO_C"
    echo ""
    echo "--- Research Files ---"
    echo "Historical Dress Construction: $RESEARCH_DRESS"
    echo "Advanced Textile Stitching: $RESEARCH_STITCHING"
    echo ""
    echo "--- CSMFAB078 Reference ---"
    echo "Main Fabrication Plan: $CSMFAB078_MAIN"
    echo "Leaf Edition Spec: $CSMFAB078_A"
    echo "Threat Protection: $CSMFAB078_B"
    echo "Image Prompts Dir: $CSMFAB078_IMG"
    echo ""
    echo "--- GitHub Handler ---"
    echo "github_handler.sh: $GH_HANDLER"
    echo ""
    echo "--- Document Pipeline Status ---"
    echo "Documents Authored (Framework): $DOCS_AUTHORED"
    echo "Documents in Pieces (zipped): $DOCS_PIECES"
    echo "Documents Finished (reassembled): $DOCS_FINISHED"
    echo "Total Individual Pieces: $TOTAL_PIECES"
    echo "Total Zip Archives: $TOTAL_ZIPS"
    echo ""
    echo "--- Target Progress ---"
    echo "Target Documents: 150 (50 Core + 50 RM + 50 RW)"
    echo "Target Pieces: 1,950 (150 × 13)"
    echo "Target Zips: 150"
    echo "Target Image Prompts: 10 (5 RM + 5 RW)"
    echo ""
    echo "Note: $NOTE"
    echo ""
} >> "$HEARTBEAT_LOG"

# ─── Create/Update Session Log ──────────────────────────────────────────────
{
    echo "# AegisOutfitFabricator Session Log - $TS"
    echo ""
    echo "## Heartbeat Entry"
    echo ""
    echo "- **Project:** $PROJECT_NAME"
    echo "- **Branch:** $GIT_BRANCH"
    echo "- **Commit:** $GIT_COMMIT"
    echo "- **Remote:** $GIT_REMOTE"
    echo "- **Uncommitted files:** $GIT_STATUS"
    echo ""
    echo "### Framework Status"
    echo "- heartbeat.sh: $HEARTBEAT_EXISTS"
    echo "- RESUME_SESSION.md: $RESUME_EXISTS"
    echo "- NEXT_RUNNER_001.md: $NEXT_RUNNER_EXISTS"
    echo "- README.md: $README_EXISTS"
    echo "- MASTER_TODO_A.md: $MASTER_TODO_A"
    echo "- MASTER_TODO_B.md: $MASTER_TODO_B"
    echo "- MASTER_TODO_C.md: $MASTER_TODO_C"
    echo ""
    echo "### Research Status"
    echo "- Historical Dress Construction: $RESEARCH_DRESS"
    echo "- Advanced Textile Stitching: $RESEARCH_STITCHING"
    echo ""
    echo "### CSMFAB078 Reference Status"
    echo "- Main Plan: $CSMFAB078_MAIN"
    echo "- Leaf Edition Spec: $CSMFAB078_A"
    echo "- Threat Protection: $CSMFAB078_B"
    echo "- Image Prompts: $CSMFAB078_IMG"
    echo ""
    echo "### GitHub Handler"
    echo "- github_handler.sh: $GH_HANDLER"
    echo ""
    echo "### Document Pipeline"
    echo "- Framework Docs: $DOCS_AUTHORED"
    echo "- Pieces Archives: $DOCS_PIECES"
    echo "- Finished Docs: $DOCS_FINISHED"
    echo "- Total Pieces: $TOTAL_PIECES"
    echo "- Total Zips: $TOTAL_ZIPS"
    echo ""
    echo "### Targets"
    echo "- **Documents:** 150 total (50 Core + 50 RM + 50 RW)"
    echo "- **Pieces:** 1,950 (150 × 13 pieces each)"
    echo "- **Zips:** 150 archives"
    echo "- **Image Prompts:** 10 (5 RM + 5 RW)"
    echo ""
    echo "- **Note:** $NOTE"
    echo ""
    echo "---"
    echo ""
} > "$SESSION_LOG"

# ─── Keep Only Last 2000 Lines of Heartbeat Log ────────────────────────────
tail -2000 "$HEARTBEAT_LOG" > "$HEARTBEAT_LOG.tmp" && mv "$HEARTBEAT_LOG.tmp" "$HEARTBEAT_LOG"

# ─── Output Summary ──────────────────────────────────────────────
echo "✅ Heartbeat logged: $TS"
echo "📝 Session log: $SESSION_LOG"
echo "📊 Heartbeat log: $HEARTBEAT_LOG"
echo ""
echo "=== QUICK STATUS ==="
echo "Branch: $GIT_BRANCH | Commit: $GIT_COMMIT | Uncommitted: $GIT_STATUS"
echo "Framework: heartbeat=$HEARTBEAT_EXISTS resume=$RESUME_EXISTS next=$NEXT_RUNNER_EXISTS readme=$README_EXISTS todoA=$MASTER_TODO_A todoB=$MASTER_TODO_B todoC=$MASTER_TODO_C"
echo "Research: dress=$RESEARCH_DRESS stitching=$RESEARCH_STITCHING"
echo "CSMFAB078: main=$CSMFAB078_MAIN specA=$CSMFAB078_A specB=$CSMFAB078_B img=$CSMFAB078_IMG"
echo "GitHub Handler: $GH_HANDLER"
echo "Pipeline: authored=$DOCS_AUTHORED pieces=$DOCS_PIECES finished=$DOCS_FINISHED total_pieces=$TOTAL_PIECES zips=$TOTAL_ZIPS"
echo "Targets: 150 docs | 1,950 pieces | 150 zips | 10 img prompts"
echo "Note: $NOTE"