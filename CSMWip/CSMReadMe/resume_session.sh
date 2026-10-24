#!/usr/bin/env bash
# ==============================================================================
# CSMReadMe — Session Resume Script
# Resumes README generation from the exact state after CSMSOPP completion
# ==============================================================================

set -euo pipefail

# --- Configuration ---
REPO_ROOT="/workspace/app"
REPO_INDEX="${REPO_ROOT}/REPO_INDEX_V6.csv"
CSM_README_DIR="${REPO_ROOT}/CSMWip/CSMReadMe"
CHUNKS_DIR="${CSM_README_DIR}/chunks"
SCRIPTS_DIR="${CSM_README_DIR}/scripts"
WRITE_LARGE_FILE="${SCRIPTS_DIR}/write_large_file.py"
STATE_FILE="${CSM_README_DIR}/.session_state.json"
LOG_FILE="${CSM_README_DIR}/session_$(date +%Y%m%d_%H%M%S).log"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# --- Logging ---
log() { echo -e "${BLUE}[$(date '+%H:%M:%S')]${NC} $*" | tee -a "$LOG_FILE"; }
success() { echo -e "${GREEN}[OK]${NC} $*" | tee -a "$LOG_FILE"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*" | tee -a "$LOG_FILE"; }
error() { echo -e "${RED}[ERR]${NC} $*" | tee -a "$LOG_FILE"; }

# --- Initialize ---
mkdir -p "$CHUNKS_DIR" "$SCRIPTS_DIR"
echo "{" > "$STATE_FILE"
echo "  \"last_completed\": \"CSMSOPP\"," >> "$STATE_FILE"
echo "  \"timestamp\": \"$(date -Iseconds)\"," >> "$STATE_FILE"
echo "  \"repo_index\": \"$REPO_INDEX\"," >> "$STATE_FILE"
echo "  \"chunks_dir\": \"$CHUNKS_DIR\"," >> "$STATE_FILE"
echo "  \"scripts_dir\": \"$SCRIPTS_DIR\"" >> "$STATE_FILE"
echo "}" >> "$STATE_FILE"

log "=========================================="
log "CSMReadMe Session Resume — $(date)"
log "=========================================="
log "Repo root: $REPO_ROOT"
log "Repo index: $REPO_INDEX"
log "Chunks dir: $CHUNKS_DIR"
log "Scripts dir: $SCRIPTS_DIR"
log "State file: $STATE_FILE"
log "Log file: $LOG_FILE"

# --- Verify prerequisites ---
verify_prereqs() {
    log "Verifying prerequisites..."
    
    [[ -f "$REPO_INDEX" ]] || { error "REPO_INDEX_V6.csv not found at $REPO_INDEX"; return 1; }
    [[ -f "$WRITE_LARGE_FILE" ]] || { error "write_large_file.py not found at $WRITE_LARGE_FILE"; return 1; }
    [[ -d "$CHUNKS_DIR" ]] || { error "Chunks directory not found at $CHUNKS_DIR"; return 1; }
    
    local chunk_count=$(ls -1 "$CHUNKS_DIR"/*.md 2>/dev/null | wc -l)
    log "Found $chunk_count chapter chunks in $CHUNKS_DIR"
    
    success "Prerequisites verified"
    return 0
}

# --- Load project list from REPO_INDEX_V6.csv ---
load_projects() {
    log "Loading project list from REPO_INDEX_V6.csv..."
    
    # Extract TopLevel projects with README status
    # CSV columns: State,ParentProject,Summary,Category,Project,Path,FileCount,HasTODO,HasREADME,HasNEXT,CreationDate,LastWorkedDate,DaysSinceUpdated,AI,Status,Notes
    mapfile -t PROJECTS < <(tail -n +2 "$REPO_INDEX" | awk -F',' '$1 ~ /^Whole Project/ && $5 != "CSMSOPP" && $5 != "CSMSOPPv2" {print $5 "|" $6 "|" $9}' | sort -u)
    
    log "Found ${#PROJECTS[@]} TopLevel projects (excluding CSMSOPP/CSMSOPPv2)"
    for p in "${PROJECTS[@]}"; do
        IFS='|' read -r name path has_readme <<< "$p"
        log "  - $name ($path) README: ${has_readme:-N}"
    done
}

# --- Generate README for a single project ---
generate_readme() {
    local project_name="$1"
    local project_path="$2"
    local has_readme="$3"
    
    log "Generating README for: $project_name"
    
    # This is where the three-heuristic generation logic would go
    # For now, create a placeholder that follows the CSMSOPP pattern
    
    local output_dir="${REPO_ROOT}/${project_path}"
    local readme_file="${output_dir}/README.md"
    
    if [[ -f "$readme_file" ]] && [[ "$has_readme" == "Y" ]]; then
        warn "README already exists for $project_name, skipping (use --force to overwrite)"
        return 0
    fi
    
    # Create project-specific chunks directory
    local proj_chunks="${CHUNKS_DIR}/${project_name}"
    mkdir -p "$proj_chunks"
    
    # Generate using the three-heuristic pattern
    python3 "$WRITE_LARGE_FILE" incremental "$readme_file" "$proj_chunks" 2>&1 | tee -a "$LOG_FILE"
    
    success "README generated for $project_name at $readme_file"
    
    # Update state
    jq --arg p "$project_name" '.completed += [$p] | .last_completed = $p' "$STATE_FILE" > "${STATE_FILE}.tmp" && mv "${STATE_FILE}.tmp" "$STATE_FILE"
}

# --- Main loop ---
main() {
    verify_prereqs || exit 1
    load_projects
    
    log "Starting batch README generation..."
    
    for entry in "${PROJECTS[@]}"; do
        IFS='|' read -r name path has_readme <<< "$entry"
        generate_readme "$name" "$path" "$has_readme"
    done
    
    log "=========================================="
    log "Batch complete — $(date)"
    log "=========================================="
    
    # Show summary
    echo
    echo "Summary:"
    jq -r '.completed[]' "$STATE_FILE" 2>/dev/null | sed 's/^/  ✓ /'
}

# --- Entry point ---
case "${1:-}" in
    --verify) verify_prereqs ;;
    --list) load_projects ;;
    --project)
        [[ -n "${2:-}" ]] || { error "Usage: $0 --project <project_name>"; exit 1; }
        # Find project in list
        load_projects
        for entry in "${PROJECTS[@]}"; do
            IFS='|' read -r n p r <<< "$entry"
            [[ "$n" == "$2" ]] && generate_readme "$n" "$p" "$r"
        done
        ;;
    *) main ;;
esac