#!/usr/bin/env bash
# Simple GitHub save functions

REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_c38ddccd-0d45-4dc1-8ea4-55a34d25530f"
GH_LOG_DIR="${REPO_ROOT}/.github_handler"
GH_SPLIT_DIR="${GH_LOG_DIR}/splits"

mkdir -p "${GH_LOG_DIR}" "${GH_SPLIT_DIR}"

gh_split_file() {
    local file="$1" max_lines="${2:-500}"
    local base=$(basename "$file" .md)
    local prefix="${GH_SPLIT_DIR}/${base}_part"
    mkdir -p "${GH_SPLIT_DIR}"
    split -l "$max_lines" -d --additional-suffix=.md "$file" "$prefix"
    local parts=($(ls "${prefix}"* 2>/dev/null | sort))
    printf '%s\n' "${parts[@]}"
}

gh_join_files() {
    local manifest="$1" output="$2"
    local parts=$(jq -r '.parts[]' "$manifest")
    cat $parts > "$output"
}

gh_save_file() {
    local file="$1" msg="${2:-Auto-save: $file}" branch="${3:-$(cd "$REPO_ROOT" && git branch --show-current)}"
    [[ ! -f "$file" ]] && { echo "File not found: $file" >&2; return 1; }
    file=$(realpath "$file")
    
    local lines=$(wc -l < "$file")
    echo "Saving $file ($lines lines)"
    
    if (( lines > 2000 )); then
        echo "Large file ($lines lines), splitting..."
        local parts=($(gh_split_file "$file" 500))
        local all_ok=true
        for p in "${parts[@]}"; do gh_save_file "$p" "Part: $msg" "$branch" || all_ok=false; done
        $all_ok && return 0 || return 1
    fi
    
    cd "$REPO_ROOT"
    git add "$file"
    git commit -m "$msg"
    git push origin "$branch"
}
