#!/usr/bin/env bash
# ==============================================================================
# CSMReadMe Taskmaster — Standalone task management for CSM README generation
# Independent of __Python_Tools/taskmaster.sh to avoid cross-project conflicts
# ==============================================================================

set -euo pipefail

# --- Configuration ---
REPO_ROOT="/workspace/app"
CSM_README_DIR="${REPO_ROOT}/CSMWip/CSMReadMe"
RESUME_SCRIPT="${REPO_ROOT}/resume_readme_session.sh"
STATE_FILE="${CSM_README_DIR}/.session_state.json"
RECOMMENDATIONS_FILE="${STATE_FILE}.recommendations"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# --- Logging ---
log() { echo -e "${BLUE}[$(date '+%H:%M:%S')]${NC} $*"; }
success() { echo -e "${GREEN}[OK]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERR]${NC} $*"; }
info() { echo -e "${CYAN}[INFO]${NC} $*"; }
rec() { echo -e "${MAGENTA}[REC]${NC} $*"; }

# --- Commands ---

cmd_quick_resume() {
    log "Running CSM README quick resume..."
    if [[ ! -f "$RESUME_SCRIPT" ]]; then
        error "Resume script not found: $RESUME_SCRIPT"
        return 1
    fi
    bash "$RESUME_SCRIPT"
}

cmd_full_resume() {
    log "Running full resume with extended output..."
    if [[ ! -f "$RESUME_SCRIPT" ]]; then
        error "Resume script not found: $RESUME_SCRIPT"
        return 1
    fi
    # Run with TOP_N=50 to see more candidates
    TOP_N=50 bash "$RESUME_SCRIPT"
}

cmd_show_recommendations() {
    if [[ ! -f "$RECOMMENDATIONS_FILE" ]]; then
        warn "No recommendations found. Run 'quick-resume' first."
        return 1
    fi
    log "Current recommendations:"
    cat "$RECOMMENDATIONS_FILE" | python3 -m json.tool 2>/dev/null || cat "$RECOMMENDATIONS_FILE"
}

cmd_target_project() {
    local target="$1"
    if [[ -z "$target" ]]; then
        error "Usage: taskmaster.sh target <project_name>"
        return 1
    fi
    
    log "Checking score and details for: $target"
    
    # Find in recommendations or run fresh
    if [[ ! -f "$RECOMMENDATIONS_FILE" ]]; then
        warn "No cached recommendations. Running fresh analysis..."
        cmd_quick_resume
    fi
    
    # Search in the log for this project
    local latest_log=$(ls -t "${CSM_README_DIR}"/resume_session_*.log 2>/dev/null | head -1)
    if [[ -n "$latest_log" ]]; then
        grep -i "$target" "$latest_log" || info "Project not found in latest analysis"
    fi
}

cmd_deep_readme() {
    local project_path="$1"
    if [[ -z "$project_path" ]]; then
        error "Usage: taskmaster.sh deep-readme <project_path>"
        return 1
    fi
    
    log "Creating deep README for: $project_path"
    local full_path="${REPO_ROOT}/${project_path}"
    
    if [[ ! -d "$full_path" ]]; then
        error "Project directory not found: $full_path"
        return 1
    fi
    
    # Check existing structure
    info "Project structure:"
    ls -la "$full_path"
    
    info "Reference deep READMEs:"
    echo "  ../../10_Prime_Electron_Caldera_Synthesis/README.md"
    echo "  ../../02_Caldera_Prime_Pi_Electron/README.md"
    echo "  ../../11_TGApp/README.md"
    echo "  ../../12_AegisOutfitFabricator/README.md"
    echo "  ../../01_SubAtomic_Prime_Electron_Canonical/README.md"
    echo "  ../../03_Legal_Enactment/README.md"
    echo "  ../../CSMMinesMagnets/README.md"
    echo "  ../../CSMReach/README.md"
}

cmd_status() {
    log "CSMReadMe Taskmaster Status"
    echo "=========================="
    echo "Repo root: $REPO_ROOT"
    echo "CSMReadMe dir: $CSM_README_DIR"
    echo "Resume script: $RESUME_SCRIPT"
    echo "State file: $STATE_FILE"
    echo ""
    
    if [[ -f "$STATE_FILE" ]]; then
        info "Last session state:"
        cat "$STATE_FILE" | python3 -m json.tool 2>/dev/null || cat "$STATE_FILE"
    else
        warn "No session state found"
    fi
    
    if [[ -f "$RECOMMENDATIONS_FILE" ]]; then
        info "Current recommendations:"
        cat "$RECOMMENDATIONS_FILE" | python3 -m json.tool 2>/dev/null || cat "$RECOMMENDATIONS_FILE"
    else
        warn "No recommendations cached"
    fi
}

cmd_help() {
    cat <<EOF
CSMReadMe Taskmaster — Standalone task management for CSM README generation

USAGE:
  taskmaster.sh <command> [args]

COMMANDS:
  quick-resume        Run resume analysis (top 20 candidates)
  full-resume         Run resume analysis (top 50 candidates)
  show-recs           Show cached recommendations
  target <project>    Check score/details for specific project
  deep-readme <path>  Show quick-start info for creating deep README
  status              Show current state and recommendations
  help                Show this help

EXAMPLES:
  ./taskmaster.sh quick-resume
  ./taskmaster.sh target "CSMFAB0108 Aegis-Forge"
  ./taskmaster.sh deep-readme "CSMFAB/CSMFAB0108 Aegis-Forge Thermal Cascade Inductive Material Separator"
  ./taskmaster.sh status

NOTES:
  - This is a standalone utility for CSMReadMe project only
  - Does not conflict with __Python_Tools/taskmaster.sh
  - Uses resume_readme_session.sh for analysis
  - Results cached in CSMWip/CSMReadMe/.session_state.json.recommendations
EOF
}

# --- Main ---
main() {
    local cmd="${1:-help}"
    shift || true
    
    case "$cmd" in
        quick-resume) cmd_quick_resume "$@" ;;
        full-resume) cmd_full_resume "$@" ;;
        show-recs|recommendations) cmd_show_recommendations "$@" ;;
        target) cmd_target_project "$@" ;;
        deep-readme) cmd_deep_readme "$@" ;;
        status) cmd_status "$@" ;;
        help|--help|-h) cmd_help ;;
        *) error "Unknown command: $cmd"; cmd_help; return 1 ;;
    esac
}

main "$@"