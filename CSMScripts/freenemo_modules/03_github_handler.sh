#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 03: GitHub Handler — Multi-Strategy Save/Merge with Difficulty Assessment
# 3-13 strategies based on file size, auto-split/join, merge queue, success tracking
# ════════════════════════════════════════════════════════════════════════════

# ─── CONFIG ──────────────────────────────────────────────────────────────────
GH_LOG_DIR="${REPO_ROOT}/.github_handler"
GH_DIFFICULTY_LOG_DIR="${GH_LOG_DIR}/difficulty_logs"
GH_METHODS_LOG_DIR="${GH_LOG_DIR}/methods_logs"
GH_MERGE_QUEUE="${GH_LOG_DIR}/merge_queue.json"
GH_SPLIT_DIR="${GH_LOG_DIR}/splits"

EASY_THRESHOLD=100
MEDIUM_THRESHOLD=500
HARD_THRESHOLD=2000
EXTREME_THRESHOLD=5000

EASY_STRATS=3
MEDIUM_STRATS=6
HARD_STRATS=9
EXTREME_STRATS=13

# Unique session/process identifier for log file serialization
GH_SESSION_ID="${GH_SESSION_ID:-$(date +%s%N)_$$_${RANDOM}}"

# ─── INIT ────────────────────────────────────────────────────────────────────
gh_init() {
    mkdir -p "${GH_LOG_DIR}" "${GH_SPLIT_DIR}" "${GH_DIFFICULTY_LOG_DIR}" "${GH_METHODS_LOG_DIR}"
    [[ -f "${GH_MERGE_QUEUE}" ]] || echo '{"queue":[]}' > "${GH_MERGE_QUEUE}"
}

# ─── DIFFICULTY ASSESSMENT ──────────────────────────────────────────────────
gh_assess_difficulty() {
    local file="$1" lines=0
    [[ -f "$file" ]] && lines=$(wc -l < "$file")
    if (( lines <= EASY_THRESHOLD )); then echo "easy"
    elif (( lines <= MEDIUM_THRESHOLD )); then echo "medium"
    elif (( lines <= HARD_THRESHOLD )); then echo "hard"
    else echo "extreme"; fi
}

gh_strategy_count() {
    case "$1" in
        easy) echo $EASY_STRATS ;;
        medium) echo $MEDIUM_STRATS ;;
        hard) echo $HARD_STRATS ;;
        *) echo $EXTREME_STRATS ;;
    esac
}

# ─── LOGGING ─────────────────────────────────────────────────────────────────
gh_log_difficulty() {
    local file="$1" diff="$2" lines="$3" strats="$4"
    local entry=$(jq -n --arg f "$file" --arg d "$diff" --arg l "$lines" --arg s "$strats" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $f, difficulty: $d, lines: ($l|tonumber), strategies: ($s|tonumber), timestamp: $t}')
    local log_file="${GH_DIFFICULTY_LOG_DIR}/difficulty_${GH_SESSION_ID}.json"
    echo "$entry" > "$log_file"
}

gh_log_method() {
    local file="$1" method="$2" success="$3" diff="$4"
    local entry=$(jq -n --arg f "$file" --arg m "$method" --arg s "$success" --arg d "$diff" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $f, method: $m, success: ($s=="true"), difficulty: $d, timestamp: $t}')
    local log_file="${GH_METHODS_LOG_DIR}/methods_${GH_SESSION_ID}.json"
    echo "$entry" > "$log_file"
}

# ─── STRATEGIES (1-13) ──────────────────────────────────────────────────────
gh_strat_1_direct() { local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; git add "$f"; git commit -m "$m"; git -c http.sslVerify=false push origin "$b"; }
gh_strat_2_staged() { local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; git add -A; git commit -m "$m"; git -c http.sslVerify=false push origin "$b"; }
gh_strat_3_force()  { local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; git add "$f"; git commit -m "$m"; git -c http.sslVerify=false push --force-with-lease origin "$b"; }
gh_strat_4_pr()     { local f="$1" m="$2" b="$3"; local br="auto-save-$(date +%s)-$(basename "$f"|tr '.' '-')"; cd "$REPO_ROOT"; git checkout -b "$br" "$b"; git add "$f"; git commit -m "$m"; git -c http.sslVerify=false push origin "$br"; command -v gh >/dev/null && gh pr create --base "$b" --head "$br" --title "Auto-save: $f" --body "$m"; git checkout "$b"; }
gh_strat_5_rebase() { local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; git -c http.sslVerify=false fetch origin "$b"; git rebase "origin/$b" || { git rebase --abort; return 1; }; git add "$f"; git commit -m "$m"; git -c http.sslVerify=false push origin "$b"; }
gh_strat_6_ours()   { local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; git -c http.sslVerify=false fetch origin "$b"; git merge -s ours "origin/$b" -m "$m"; git add "$f"; git commit --amend --no-edit; git -c http.sslVerify=false push origin "$b"; }
gh_strat_7_cherry() { local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; local tb="temp-cherry-$(date +%s)"; git checkout -b "$tb"; git add "$f"; git commit -m "$m"; local h=$(git rev-parse HEAD); git checkout "$b"; git cherry-pick "$h" || { git cherry-pick --abort; return 1; }; git -c http.sslVerify=false push origin "$b"; git branch -D "$tb"; }
gh_strat_8_subtree(){ local f="$1" m="$2" b="$3"; local td=$(mktemp -d); cd "$REPO_ROOT"; git clone --branch "$b" --single-branch "$REPO_ROOT" "$td/repo"; cp "$f" "$td/repo/"; cd "$td/repo"; git add "$(basename "$f")"; git commit -m "$m"; git -c http.sslVerify=false push origin "$b"; rm -rf "$td"; }
gh_strat_9_worktree(){ local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; local wt="${REPO_ROOT}/.git/worktrees/gh-$(date +%s)"; git worktree add "$wt" "$b"; cp "$f" "$wt/"; cd "$wt"; git add "$(basename "$f")"; git commit -m "$m"; git -c http.sslVerify=false push origin "$b"; cd "$REPO_ROOT"; git worktree remove "$wt"; }
gh_strat_10_patch() { local f="$1" m="$2" b="$3"; cd "$REPO_ROOT"; local pf="${GH_LOG_DIR}/$(basename "$f").patch"; git diff HEAD -- "$f" > "$pf"; git apply "$pf"; git add "$f"; git commit -m "$m"; git push origin "$b"; }
gh_strat_11_api()   { [[ -z "${GITHUB_TOKEN:-}" ]] && return 1; return 1; }  # Placeholder
gh_strat_12_lfs()   { command -v git-lfs >/dev/null || return 1; cd "$REPO_ROOT"; git lfs track "$(basename "$1")"; git add "$1" .gitattributes; git commit -m "$2"; git push origin "$3"; }
gh_strat_13_manual(){ local f="$1" m="$2" b="$3"; local e=$(jq -n --arg f "$f" --arg m "$m" --arg b "$b" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" '{file:$f,message:$m,branch:$b,timestamp:$t,status:"pending"}); jq --argjson e "$e" '.queue+=[$e]' "${GH_MERGE_QUEUE}" > "${GH_MERGE_QUEUE}.tmp" && mv "${GH_MERGE_QUEUE}.tmp" "${GH_MERGE_QUEUE}"; return 0; }

# ─── SPLIT/JOIN ──────────────────────────────────────────────────────────────
gh_split_file() {
    local file="$1" max_lines="${2:-500}"
    local base=$(basename "$file" .md)
    local prefix="${GH_SPLIT_DIR}/${base}_part"
    mkdir -p "${GH_SPLIT_DIR}"
    split -l "$max_lines" -d --additional-suffix=.md "$file" "$prefix"
    local parts=($(ls "${prefix}"* 2>/dev/null | sort))
    jq -n --arg o "$file" --argjson p "$(printf '%s\n' "${parts[@]}" | jq -R . | jq -s .)" '{original:$o,parts:$p,created:now|todateiso8601}' > "${GH_SPLIT_DIR}/${base}_manifest.json"
    printf '%s\n' "${parts[@]}"
}

gh_join_files() {
    local manifest="$1" output="$2"
    local parts=$(jq -r '.parts[]' "$manifest")
    cat $parts > "$output"
}

# ─── MAIN SAVE FUNCTION ──────────────────────────────────────────────────────
gh_save_file() {
    local file="$1" msg="${2:-Auto-save: $file}" branch="${3:-$(cd "$REPO_ROOT" && git branch --show-current)}"
    [[ ! -f "$file" ]] && { freenemo_error "File not found: $file"; return 1; }
    file=$(realpath "$file")

    gh_init
    local lines=$(wc -l < "$file")
    local diff=$(gh_assess_difficulty "$file")
    local count=$(gh_strategy_count "$diff")

    freenemo_log "Saving $file ($lines lines, $diff, $count strategies)"
    gh_log_difficulty "$file" "$diff" "$lines" "$count"

    if (( lines > HARD_THRESHOLD )); then
        freenemo_warn "Large file ($lines lines), splitting..."
        local parts=($(gh_split_file "$file" 500))
        local all_ok=true
        for p in "${parts[@]}"; do gh_save_file "$p" "Part: $msg" "$branch" || all_ok=false; done
        $all_ok && return 0 || return 1
    fi

    local strategies=(gh_strat_1_direct gh_strat_2_staged gh_strat_3_force gh_strat_4_pr gh_strat_5_rebase gh_strat_6_ours gh_strat_7_cherry gh_strat_8_subtree gh_strat_9_worktree gh_strat_10_patch gh_strat_11_api gh_strat_12_lfs gh_strat_13_manual)
    for ((i=0; i<count; i++)); do
        local strat="${strategies[$i]}"
        freenemo_log "Strategy $((i+1))/$count: $strat"
        if $strat "$file" "$msg" "$branch"; then
            freenemo_success "$strat succeeded"
            gh_log_method "$file" "$strat" "true" "$diff"
            # Log success to difficulty log (separate file per session)
            local entry=$(jq -n --arg f "$file" --arg d "$diff" --arg l "$lines" --arg s "$count" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --arg m "$strat" '{file:$f,difficulty:$d,lines:($l|tonumber),strategies:($s|tonumber),timestamp:$t,success_method:$m}')
            local log_file="${GH_DIFFICULTY_LOG_DIR}/difficulty_${GH_SESSION_ID}.json"
            echo "$entry" > "$log_file"
            return 0
        else
            freenemo_warn "$strat failed"
            gh_log_method "$file" "$strat" "false" "$diff"
        fi
    done
    freenemo_error "All $count strategies failed"
    return 1
}

# ─── MERGE QUEUE ─────────────────────────────────────────────────────────────
gh_process_queue() {
    freenemo_log "Processing merge queue..."
    local len=$(jq '.queue|length' "${GH_MERGE_QUEUE}")
    (( len == 0 )) && { freenemo_log "Queue empty"; return 0; }
    for ((i=0; i<len; i++)); do
        local e=$(jq ".queue[$i]" "${GH_MERGE_QUEUE}")
        local f=$(echo "$e" | jq -r '.file')
        local m=$(echo "$e" | jq -r '.message')
        local b=$(echo "$e" | jq -r '.branch')
        local s=$(echo "$e" | jq -r '.status')
        [[ "$s" == "pending" ]] || continue
        freenemo_log "Processing: $f"
        if gh_save_file "$f" "$m" "$b"; then
            jq --argjson i "$i" '.queue[$i].status="completed"|.queue[$i].completed=now|todateiso8601' "${GH_MERGE_QUEUE}" > "${GH_MERGE_QUEUE}.tmp" && mv "${GH_MERGE_QUEUE}.tmp" "${GH_MERGE_QUEUE}"
            freenemo_success "Queue item done: $f"
        else
            jq --argjson i "$i" '.queue[$i].status="failed"|.queue[$i].attempts+=1' "${GH_MERGE_QUEUE}" > "${GH_MERGE_QUEUE}.tmp" && mv "${GH_MERGE_QUEUE}.tmp" "${GH_MERGE_QUEUE}"
            freenemo_error "Queue item failed: $f"
        fi
    done
}