#!/bin/bash
# sort_pieces.sh - Find loose files in root older than 13 hours and organize into csmpieces/
# Usage: ./sort_pieces.sh [--dry-run] [--hours N]

set -euo pipefail

DRY_RUN=false
HOURS=13
WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CSMPIECES_DIR="$WORKSPACE_ROOT/csmpieces"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run) DRY_RUN=true; shift ;;
        --hours) HOURS="$2"; shift 2 ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

# Calculate cutoff time (seconds since epoch)
CUTOFF=$(date -d "$HOURS hours ago" +%s)

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# Create category directories
create_dirs() {
    for dir in \
        "01_final_articles" \
        "02_piece_archives" \
        "03_loose_pieces" \
        "04_logs_docs" \
        "05_scripts_tools"; do
        if [[ "$DRY_RUN" == "true" ]]; then
            log "Would create: $CSMPIECES_DIR/$dir"
        else
            mkdir -p "$CSMPIECES_DIR/$dir"
        fi
    done
}

# Check if file is older than cutoff (by atime)
is_old() {
    local file="$1"
    local atime
    atime=$(stat -c %X "$file" 2>/dev/null || stat -f %a "$file" 2>/dev/null)
    [[ $atime -lt $CUTOFF ]]
}

# Categorize and move file
move_file() {
    local file="$1"
    local basename="$(basename "$file")"
    local dest_dir=""

    # 01_final_articles: A3-A6 series markdown files
    if [[ "$basename" =~ ^A[3-6]-[0-9]+_.*\.md$ ]]; then
        dest_dir="01_final_articles"
    # 02_piece_archives: *_pieces.zip files
    elif [[ "$basename" =~ _pieces\.zip$ ]]; then
        dest_dir="02_piece_archives"
    # 03_loose_pieces: individual piece markdown files (article*_piece_*.md)
    elif [[ "$basename" =~ ^article[0-9]+_A[0-9]+-[0-9]+_piece_[0-9]+\.md$ ]]; then
        dest_dir="03_loose_pieces"
    # 04_logs_docs: session logs, execution logs, documentation
    elif [[ "$basename" =~ ^(CLPS_|RESUME_SESSION_|SESSION_LOG_|TEST_|TIM_|CONTRACTS_|CSM_|DEPLOYMENT_|FAA_|GITHUB_|OUTREACH_|MASTER-TODO-LIST|QUICK_REFERENCE_|AFP_).*\.md$ ]] || \
         [[ "$basename" =~ ^(CSM_LOGS_SUMMARY|detailedreadme|readme|HEARTBEAT_LOG)\. ]]; then
        dest_dir="04_logs_docs"
    # 05_scripts_tools: scripts, tools, config files
    elif [[ "$basename" =~ \.(sh|py|json|html)$ ]] || \
         [[ "$basename" =~ ^(heartbeat|organize_particles|create_|concat_)\.sh$ ]] || \
         [[ "$basename" == ".gitignore" ]] || \
         [[ "$basename" == "kilo.json" ]] || \
         [[ "$basename" == "browse.html" ]]; then
        dest_dir="05_scripts_tools"
    else
        log "SKIP (no category): $basename"
        return 0
    fi

    local dest="$CSMPIECES_DIR/$dest_dir/$basename"
    if [[ "$DRY_RUN" == "true" ]]; then
        log "Would move: $basename -> $dest_dir/"
    else
        log "Moving: $basename -> $dest_dir/"
        mv "$file" "$dest"
    fi
}

main() {
    log "Starting sort_pieces.sh (hours=$HOURS, dry_run=$DRY_RUN)"
    log "Workspace: $WORKSPACE_ROOT"
    log "Cutoff: $(date -d "@$CUTOFF" '+%Y-%m-%d %H:%M:%S')"

    create_dirs

    # Find loose files in root (not in subdirectories)
    local moved=0
    local skipped=0

    while IFS= read -r -d '' file; do
        # Skip if it's a directory or special file
        [[ -f "$file" ]] || continue

        # Skip if inside .git, csmpieces, or other known directories
        [[ "$file" == "$WORKSPACE_ROOT/.git"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/csmpieces"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/.github_handler"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/.sdk"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/CSM"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/DeepResearch"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/LEGAL-ENACTMENT"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/Subatomic"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/V3-Compendiums"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/_GIT_INCOMING"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/__GIT_NEW_INCOMING__"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/csmcinema"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/js"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/landing-page"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/tmp_work"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/v3h_package"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/v3h_parts"* ]] && continue
        [[ "$file" == "$WORKSPACE_ROOT/RESTART_PACKAGE"* ]] && continue

        # Check age
        if is_old "$file"; then
            move_file "$file"
            ((moved++))
        else
            log "SKIP (too new): $(basename "$file")"
            ((skipped++))
        fi
    done < <(find "$WORKSPACE_ROOT" -maxdepth 1 -type f -print0)

    log "Done. Moved: $moved, Skipped (new): $skipped"
}

main "$@"