#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 09A: Error Recovery — Repo Load Failure & Git Conflict Resolution
# Handles: network failures, git conflicts, repo cloning strategies
# ════════════════════════════════════════════════════════════════════════════

# ─── REPO LOAD RECOVERY ─────────────────────────────────────────────────────
# If repo cannot be loaded at launch, try multiple strategies
repo_recover_load() {
    freenemo_banner "🔧 REPO RECOVERY — Attempting to Load Repository"

    # Strategy 1: Standard discovery
    if freenemo_git_discover_repo; then
        freenemo_success "Repo discovered at: ${REPO_ROOT}"
        return 0
    fi

    # Strategy 2: Clone from known URL
    freenemo_warn "Strategy 1 failed. Trying clone from ${REPO_URL}..."
    local clone_dir="/tmp/freenemo-repo-$(date +%s)"
    if git clone "${REPO_URL}" "${clone_dir}" 2>/dev/null; then
        REPO_ROOT="${clone_dir}"
        export REPO_ROOT
        freenemo_success "Cloned repo to: ${REPO_ROOT}"
        return 0
    fi

    # Strategy 3: Shallow clone (faster, less bandwidth)
    freenemo_warn "Full clone failed. Trying shallow clone..."
    if git clone --depth 1 "${REPO_URL}" "${clone_dir}" 2>/dev/null; then
        REPO_ROOT="${clone_dir}"
        export REPO_ROOT
        freenemo_success "Shallow cloned repo to: ${REPO_ROOT}"
        return 0
    fi

    # Strategy 4: Try alternative remote (SSH vs HTTPS)
    freenemo_warn "HTTPS clone failed. Trying SSH..."
    local ssh_url="${REPO_URL/https:\/\/github.com\//git@github.com:}"
    if git clone "${ssh_url}" "${clone_dir}" 2>/dev/null; then
        REPO_ROOT="${clone_dir}"
        export REPO_ROOT
        freenemo_success "SSH cloned repo to: ${REPO_ROOT}"
        return 0
    fi

    freenemo_error "All repo recovery strategies failed"
    return 1
}

# ─── GIT CONFLICT RESOLUTION ────────────────────────────────────────────────
git_resolve_conflicts() {
    freenemo_log "Checking for git conflicts..."
    if git status --short | grep -q "^UU\|^AA\|^DD"; then
        freenemo_warn "Conflicts detected. Attempting auto-resolution..."
        # Try ours strategy for binary/config files
        git diff --name-only --diff-filter=U | while read -r file; do
            if [[ "$file" == *.md || "$file" == *.txt || "$file" == *.json || "$file" == *.yaml || "$file" == *.yml ]]; then
                freenemo_log "Auto-merging text file: $file"
                git checkout --ours -- "$file" 2>/dev/null || true
                git add "$file"
            fi
        done
        # Commit resolved
        if ! git diff --cached --quiet; then
            git commit -m "[AUTO-RESOLVE] Merge conflict resolution" >/dev/null 2>&1 || true
            freenemo_success "Conflicts auto-resolved and committed"
        fi
    else
        freenemo_log "No conflicts detected"
    fi
}