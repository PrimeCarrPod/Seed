
bash
{
  "command": "cat /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_37d0e0d7-09fc-4f58-98af-a271afd290b3/aegis-iron-man-session/CSMScripts/GITHUB_HANDLER.sh",
  "description": "Print GITHUB_HANDLER.sh to terminal"
}
#!/usr/bin/env bash
# ============================================================
# GITHUB_HANDLER.sh — Multi-Strategy GitHub File Handler
# Handles saving files to GitHub with 3-13 strategies based on difficulty
# Auto-merges, tracks success/failure, splits/joins large files
# ============================================================
# Usage: bash GITHUB_HANDLER.sh <action> <file> [options]
# Actions: save, merge, split, join, status, retry
# ============================================================

set -euo pipefail

# ─── CONFIGURATION ─────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
LOG_DIR="$WORK_DIR/.github_handler"
DIFFICULTY_LOG="$LOG_DIR/difficulty_log.json"
METHODS_LOG="$LOG_DIR/methods_log.json"
MERGE_QUEUE="$LOG_DIR/merge_queue.json"
SPLIT_DIR="$LOG_DIR/splits"

# Difficulty thresholds (lines)
EASY_THRESHOLD=100
MEDIUM_THRESHOLD=500
HARD_THRESHOLD=2000
EXTREME_THRESHOLD=5000

# Strategy counts per difficulty
EASY_STRATEGIES=3
MEDIUM_STRATEGIES=6
HARD_STRATEGIES=9
EXTREME_STRATEGIES=13

# ─── COLORS ────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; MAGENTA='\033[0;35m'; BOLD='\033[1m'; NC='\033[0m'
log() { echo -e "${CYAN}[GH-HANDLER]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n"; }

# ─── INITIALIZATION ────────────────────────────────────────
init_logs() {
    mkdir -p "$LOG_DIR" "$SPLIT_DIR"
    [[ -f "$DIFFICULTY_LOG" ]] || echo '{"files":{}}' > "$DIFFICULTY_LOG"
    [[ -f "$METHODS_LOG" ]] || echo '{"methods":[]}' > "$METHODS_LOG"
    [[ -f "$MERGE_QUEUE" ]] || echo '{"queue":[]}' > "$MERGE_QUEUE"
}

# ─── DIFFICULTY ASSESSMENT ─────────────────────────────────
assess_difficulty() {
    local file="$1"
    local lines=0
    if [[ -f "$file" ]]; then
        lines=$(wc -l < "$file")
    fi
    
    if (( lines <= EASY_THRESHOLD )); then
        echo "easy"
    elif (( lines <= MEDIUM_THRESHOLD )); then
        echo "medium"
    elif (( lines <= HARD_THRESHOLD )); then
        echo "hard"
    elif (( lines <= EXTREME_THRESHOLD )); then
        echo "extreme"
    else
        echo "extreme"
    fi
}

get_strategy_count() {
    local difficulty="$1"
    case "$difficulty" in
        easy) echo $EASY_STRATEGIES ;;
        medium) echo $MEDIUM_STRATEGIES ;;
        hard) echo $HARD_STRATEGIES ;;
        extreme) echo $EXTREME_STRATEGIES ;;
        *) echo $EASY_STRATEGIES ;;
    esac
}

# ─── STRATEGY DEFINITIONS ──────────────────────────────────
# Each strategy is a function that attempts to save/merge a file
# Returns 0 on success, 1 on failure

strategy_1_direct_commit() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 1: Direct commit to $branch"
    cd "$WORK_DIR"
    git add "$file"
    git commit -m "$msg" || return 1
    git -c http.sslVerify=false push origin "$branch" || return 1
    return 0
}

strategy_2_staged_commit() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 2: Staged commit with index"
    cd "$WORK_DIR"
    git add -A
    git commit -m "$msg" || return 1
    git -c http.sslVerify=false push origin "$branch" || return 1
    return 0
}

strategy_3_force_push() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 3: Force push (use with caution)"
    cd "$WORK_DIR"
    git add "$file"
    git commit -m "$msg" || return 1
    git -c http.sslVerify=false push --force-with-lease origin "$branch" || return 1
    return 0
}

strategy_4_new_branch_pr() {
    local file="$1" msg="$2" branch="$3"
    local pr_branch="auto-save-$(date +%s)-$(basename "$file" | tr '.' '-')"
    log "Strategy 4: Create PR branch '$pr_branch'"
    cd "$WORK_DIR"
    git checkout -b "$pr_branch" "$branch" || return 1
    git add "$file"
    git commit -m "$msg" || return 1
    git -c http.sslVerify=false push origin "$pr_branch" || return 1
    # Create PR via gh CLI if available
    if command -v gh &> /dev/null; then
        gh pr create --base "$branch" --head "$pr_branch" --title "Auto-save: $file" --body "$msg" || return 1
    fi
    git checkout "$branch"
    return 0
}

strategy_5_rebase_merge() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 5: Rebase and merge"
    cd "$WORK_DIR"
    git -c http.sslVerify=false fetch origin "$branch"
    git rebase "origin/$branch" || { git rebase --abort; return 1; }
    git add "$file"
    git commit -m "$msg" || return 1
    git -c http.sslVerify=false push origin "$branch" || return 1
    return 0
}

strategy_6_merge_strategy_ours() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 6: Merge with 'ours' strategy"
    cd "$WORK_DIR"
    git -c http.sslVerify=false fetch origin "$branch"
    git merge -s ours "origin/$branch" -m "$msg" || return 1
    git add "$file"
    git commit --amend --no-edit || return 1
    git -c http.sslVerify=false push origin "$branch" || return 1
    return 0
}

strategy_7_cherry_pick() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 7: Cherry-pick from temp commit"
    cd "$WORK_DIR"
    local temp_branch="temp-cherry-$(date +%s)"
    git checkout -b "$temp_branch" || return 1
    git add "$file"
    git commit -m "$msg" || return 1
    local commit_hash=$(git rev-parse HEAD)
    git checkout "$branch"
    git cherry-pick "$commit_hash" || { git cherry-pick --abort; return 1; }
    git -c http.sslVerify=false push origin "$branch" || return 1
    git branch -D "$temp_branch"
    return 0
}

strategy_8_subtree_merge() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 8: Subtree merge for single file"
    cd "$WORK_DIR"
    local temp_dir=$(mktemp -d)
    local temp_repo="$temp_dir/repo"
    git clone --branch "$branch" --single-branch "$WORK_DIR" "$temp_repo" || return 1
    cp "$file" "$temp_repo/"
    cd "$temp_repo"
    git add "$(basename "$file")"
    git commit -m "$msg" || return 1
    git -c http.sslVerify=false push origin "$branch" || return 1
    rm -rf "$temp_dir"
    return 0
}

strategy_9_worktree_commit() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 9: Git worktree isolated commit"
    cd "$WORK_DIR"
    local wt_dir="$WORK_DIR/.git/worktrees/gh-handler-$(date +%s)"
    git worktree add "$wt_dir" "$branch" || return 1
    cp "$file" "$wt_dir/"
    cd "$wt_dir"
    git add "$(basename "$file")"
    git commit -m "$msg" || { git worktree remove "$wt_dir"; return 1; }
    git -c http.sslVerify=false push origin "$branch" || { git worktree remove "$wt_dir"; return 1; }
    cd "$WORK_DIR"
    git worktree remove "$wt_dir"
    return 0
}

strategy_10_patch_file() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 10: Generate and apply patch"
    cd "$WORK_DIR"
    local patch_file="$LOG_DIR/$(basename "$file").patch"
    git diff HEAD -- "$file" > "$patch_file" || return 1
    git apply "$patch_file" || return 1
    git add "$file"
    git commit -m "$msg" || return 1
    git push origin "$branch" || return 1
    return 0
}

strategy_11_github_api() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 11: Direct GitHub API (requires token)"
    if [[ -z "${GITHUB_TOKEN:-}" ]]; then
        warn "GITHUB_TOKEN not set, skipping API strategy"
        return 1
    fi
    # Implementation would use curl to GitHub REST API
    # Placeholder for actual API implementation
    return 1
}

strategy_12_lfs_upload() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 12: Git LFS for large files"
    if ! command -v git-lfs &> /dev/null; then
        warn "git-lfs not installed"
        return 1
    fi
    cd "$WORK_DIR"
    git lfs track "$(basename "$file")"
    git add "$file" .gitattributes
    git commit -m "$msg" || return 1
    git push origin "$branch" || return 1
    return 0
}

strategy_13_manual_intervention() {
    local file="$1" msg="$2" branch="$3"
    log "Strategy 13: Queue for manual intervention"
    local entry=$(jq -n --arg file "$file" --arg msg "$msg" --arg branch "$branch" --arg time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $file, message: $msg, branch: $branch, timestamp: $time, status: "pending"}')
    jq --argjson entry "$entry" '.queue += [$entry]' "$MERGE_QUEUE" > "$MERGE_QUEUE.tmp" && mv "$MERGE_QUEUE.tmp" "$MERGE_QUEUE"
    warn "Queued for manual merge: $file"
    return 0  # Don't fail, just queue
}

# ─── LOGGING FUNCTIONS ─────────────────────────────────────
log_difficulty() {
    local file="$1" difficulty="$2" lines="$3" strategies="$4"
    local entry=$(jq -n --arg file "$file" --arg diff "$difficulty" --arg lines "$lines" --arg strat "$strategies" --arg time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $file, difficulty: $diff, lines: ($lines|tonumber), strategies: ($strat|tonumber), timestamp: $time}')
    jq --argjson entry "$entry" --arg file "$file" '.files[$file] = $entry' "$DIFFICULTY_LOG" > "$DIFFICULTY_LOG.tmp" && mv "$DIFFICULTY_LOG.tmp" "$DIFFICULTY_LOG"
}

log_method_result() {
    local file="$1" method="$2" success="$3" difficulty="$4"
    local entry=$(jq -n --arg file "$file" --arg method "$method" --arg success "$success" --arg diff "$difficulty" --arg time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $file, method: $method, success: ($success == "true"), difficulty: $diff, timestamp: $time}')
    jq --argjson entry "$entry" '.methods += [$entry]' "$METHODS_LOG" > "$METHODS_LOG.tmp" && mv "$METHODS_LOG.tmp" "$METHODS_LOG"
}

# ─── FILE SPLITTING ────────────────────────────────────────
split_file() {
    local file="$1" max_lines="${2:-500}"
    local base_name=$(basename "$file" .md)
    local split_prefix="$SPLIT_DIR/${base_name}_part"
    
    log "Splitting $file into chunks of $max_lines lines"
    mkdir -p "$SPLIT_DIR"
    
    split -l "$max_lines" -d --additional-suffix=.md "$file" "$split_prefix"
    
    local parts=($(ls "$split_prefix"* 2>/dev/null | sort))
    log "Created ${#parts[@]} parts"
    
    # Create manifest
    local manifest="$SPLIT_DIR/${base_name}_manifest.json"
    jq -n --arg orig "$file" --argjson parts "$(printf '%s\n' "${parts[@]}" | jq -R . | jq -s .)" \
        '{original: $orig, parts: $parts, created: now | todateiso8601}' > "$manifest"
    
    echo "${parts[@]}"
}

join_files() {
    local manifest="$1" output_file="$2"
    log "Joining files from manifest $manifest"
    
    local parts=$(jq -r '.parts[]' "$manifest")
    cat $parts > "$output_file"
    
    log "Joined into $output_file"
}

# ─── MAIN SAVE FUNCTION ────────────────────────────────────
save_file() {
    local file="$1"
    local msg="${2:-Auto-save: $file}"
    local branch="${3:-$(cd "$WORK_DIR" && git branch --show-current)}"
    
    if [[ ! -f "$file" ]]; then
        error "File not found: $file"
        return 1
    fi
    
    # Use absolute path
    file=$(realpath "$file")
    
    init_logs
    
    local lines=$(wc -l < "$file")
    local difficulty=$(assess_difficulty "$file")
    local strategy_count=$(get_strategy_count "$difficulty")
    
    log "Saving $file ($lines lines, difficulty: $difficulty, strategies: $strategy_count)"
    log_difficulty "$file" "$difficulty" "$lines" "$strategy_count"
    
    # For large files, split first
    if (( lines > HARD_THRESHOLD )); then
        warn "Large file detected ($lines lines), splitting..."
        local parts=($(split_file "$file" 500))
        local all_success=true
        for part in "${parts[@]}"; do
            if ! save_file "$part" "Part: $msg" "$branch"; then
                all_success=false
            fi
        done
        if $all_success; then
            success "All parts saved successfully"
            return 0
        else
            error "Some parts failed to save"
            return 1
        fi
    fi
    
    # Try strategies in order
    local strategies=(
        strategy_1_direct_commit
        strategy_2_staged_commit
        strategy_3_force_push
        strategy_4_new_branch_pr
        strategy_5_rebase_merge
        strategy_6_merge_strategy_ours
        strategy_7_cherry_pick
        strategy_8_subtree_merge
        strategy_9_worktree_commit
        strategy_10_patch_file
        strategy_11_github_api
        strategy_12_lfs_upload
        strategy_13_manual_intervention
    )
    
    for ((i=0; i<strategy_count; i++)); do
        local strategy="${strategies[$i]}"
        log "Attempting strategy $((i+1))/$strategy_count: $strategy"
        
        if $strategy "$file" "$msg" "$branch"; then
            success "Strategy $strategy succeeded"
            log_method_result "$file" "$strategy" "true" "$difficulty"
            
            # Update difficulty log with success
            local entry=$(jq -n --arg file "$file" --arg diff "$difficulty" --arg lines "$lines" --arg strat "$strategy_count" --arg time "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --arg method "$strategy" \
                '{file: $file, difficulty: $diff, lines: ($lines|tonumber), strategies: ($strat|tonumber), timestamp: $time, success_method: $method}')
            jq --argjson entry "$entry" '.files[$file] = $entry' "$DIFFICULTY_LOG" > "$DIFFICULTY_LOG.tmp" && mv "$DIFFICULTY_LOG.tmp" "$DIFFICULTY_LOG"
            
            return 0
        else
            warn "Strategy $strategy failed"
            log_method_result "$file" "$strategy" "false" "$difficulty"
        fi
    done
    
    error "All $strategy_count strategies failed for $file"
    return 1
}

# ─── MERGE QUEUE PROCESSOR ─────────────────────────────────
process_merge_queue() {
    log "Processing merge queue..."
    local queue_length=$(jq '.queue | length' "$MERGE_QUEUE")
    
    if (( queue_length == 0 )); then
        log "Merge queue empty"
        return 0
    fi
    
    for ((i=0; i<queue_length; i++)); do
        local entry=$(jq ".queue[$i]" "$MERGE_QUEUE")
        local file=$(echo "$entry" | jq -r '.file')
        local msg=$(echo "$entry" | jq -r '.message')
        local branch=$(echo "$entry" | jq -r '.branch')
        local status=$(echo "$entry" | jq -r '.status')
        
        if [[ "$status" == "pending" ]]; then
            log "Processing queued item: $file"
            if save_file "$file" "$msg" "$branch"; then
                jq --argjson i "$i" '.queue[$i].status = "completed" | .queue[$i].completed = now | todateiso8601' "$MERGE_QUEUE" > "$MERGE_QUEUE.tmp" && mv "$MERGE_QUEUE.tmp" "$MERGE_QUEUE"
                success "Merge queue item completed: $file"
            else
                jq --argjson i "$i" '.queue[$i].status = "failed" | .queue[$i].attempts += 1' "$MERGE_QUEUE" > "$MERGE_QUEUE.tmp" && mv "$MERGE_QUEUE.tmp" "$MERGE_QUEUE"
                error "Merge queue item failed: $file"
            fi
        fi
    done
}

# ─── STATUS REPORT ─────────────────────────────────────────
show_status() {
    banner "GITHUB HANDLER STATUS"
    
    echo "Difficulty Log:"
    jq -r '.files | to_entries[] | "\(.key): \(.value.difficulty) (\(.value.lines) lines) - \(.value.strategies) strategies - \(.value.success_method // "none")"' "$DIFFICULTY_LOG" 2>/dev/null || echo "  No entries"
    
    echo ""
    echo "Method Success Rates:"
    jq -r '.methods | group_by(.method) | .[] | "\(.[0].method): \(map(select(.success)) | length)/\(length)"' "$METHODS_LOG" 2>/dev/null || echo "  No data"
    
    echo ""
    echo "Merge Queue:"
    jq -r '.queue[] | "\(.file): \(.status) (\(.attempts // 0) attempts)"' "$MERGE_QUEUE" 2>/dev/null || echo "  Empty"
}

# ─── COMMAND DISPATCHER ────────────────────────────────────
main() {
    local action="${1:-}"
    shift || true
    
    case "$action" in
        save)
            save_file "$@"
            ;;
        merge)
            process_merge_queue
            ;;
        split)
            split_file "$@"
            ;;
        join)
            join_files "$@"
            ;;
        status)
            show_status
            ;;
        retry)
            # Re-process failed queue items
            jq '.queue[] | select(.status == "failed") | .status = "pending"' "$MERGE_QUEUE" > "$MERGE_QUEUE.tmp" && mv "$MERGE_QUEUE.tmp" "$MERGE_QUEUE"
            process_merge_queue
            ;;
        *)
            echo "Usage: $0 {save|merge|split|join|status|retry} [args...]"
            echo "  save <file> [message] [branch]  - Save file with multi-strategy"
            echo "  merge                            - Process merge queue"
            echo "  split <file> [max_lines]         - Split large file"
            echo "  join <manifest> <output>         - Join split parts"
            echo "  status                           - Show handler status"
            echo "  retry                            - Retry failed queue items"
            exit 1
            ;;
    esac
}

main "$@"