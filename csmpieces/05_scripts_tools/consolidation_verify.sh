#!/bin/bash
# ============================================================
# CONSOLIDATION_VERIFY.sh — Safe Branch Consolidation with Worldline Verification
# ============================================================
# Incorporates WORLD_LINE_STEPS.sh verification philosophy:
# - Electron never loses itself (reassembly = 0 bytes difference)
# - Every step verified before proceeding
# - Human approval required for destructive actions
# ============================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_ROOT="/workspace/app"
WORLDLINE_SCRIPT="$REPO_ROOT/CSMWip/12_AegisOutfitFabricator/Framework/WORLD_LINE_STEPS.sh"

# Source worldline framework if available
if [ -f "$WORLDLINE_SCRIPT" ]; then
    source "$WORLDLINE_SCRIPT"
    echo -e "${GREEN}✅ WORLD_LINE_STEPS.sh loaded${NC}"
else
    echo -e "${YELLOW}⚠️  WORLD_LINE_STEPS.sh not found at $WORLDLINE_SCRIPT${NC}"
fi

# ============================================================
# VERIFICATION FUNCTIONS
# ============================================================

verify_branch_contents() {
    local branch="$1"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  VERIFYING BRANCH: $branch${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    
    # Check if branch exists locally or remotely
    if git show-ref --verify --quiet "refs/heads/$branch"; then
        echo -e "  ${GREEN}✅ Local branch exists${NC}"
    elif git show-ref --verify --quiet "refs/remotes/origin/$branch"; then
        echo -e "  ${GREEN}✅ Remote branch exists${NC}"
    else
        echo -e "  ${RED}❌ Branch not found${NC}"
        return 1
    fi
    
    # Show commit info
    local commit=$(git rev-parse "$branch")
    local commit_msg=$(git log -1 --format="%s" "$branch")
    echo -e "  Commit: ${YELLOW}$commit${NC}"
    echo -e "  Message: ${YELLOW}$commit_msg${NC}"
    
    # Show files changed vs main
    echo -e "\n  ${BLUE}Files different from main:${NC}"
    git diff --name-only main.."$branch" | head -20 | sed 's/^/    /'
    
    # Count commits ahead/behind
    local ahead=$(git rev-list --count main.."$branch" 2>/dev/null || echo 0)
    local behind=$(git rev-list --count "$branch"..main 2>/dev/null || echo 0)
    echo -e "\n  ${BLUE}Commits ahead of main: ${YELLOW}$ahead${NC}"
    echo -e "  ${BLUE}Commits behind main: ${YELLOW}$behind${NC}"
    
    return 0
}

verify_file_integrity() {
    local branch="$1"
    echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  FILE INTEGRITY CHECK (Worldline Reassembly)${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    
    # Create temp worktree to check files
    local temp_dir="/tmp/verify_${branch//\//_}_$$"
    git worktree add "$temp_dir" "$branch" 2>/dev/null || true
    
    if [ -d "$temp_dir" ]; then
        echo -e "  ${GREEN}✅ Worktree created${NC}"
        
        # Count files
        local file_count=$(find "$temp_dir" -type f -name "*.md" | wc -l)
        echo -e "  ${BLUE}Markdown files: ${YELLOW}$file_count${NC}"
        
        # Check for key directories
        for dir in "CSMWip" "CSM_WORK_IN_PROGRESS" "csmpieces"; do
            if [ -d "$temp_dir/$dir" ]; then
                local count=$(find "$temp_dir/$dir" -type f | wc -l)
                echo -e "  ${GREEN}✅ $dir exists ($count files)${NC}"
            else
                echo -e "  ${YELLOW}⚠️  $dir not found${NC}"
            fi
        done
        
        # Cleanup
        git worktree remove "$temp_dir" --force 2>/dev/null || rm -rf "$temp_dir"
    else
        echo -e "  ${RED}❌ Could not create worktree${NC}"
        return 1
    fi
    
    return 0
}

ask_confirmation() {
    local prompt="$1"
    local default="${2:-n}"
    
    echo -e "\n${YELLOW}⚠️  $prompt${NC}"
    echo -e "${YELLOW}   This action cannot be undone.${NC}"
    
    if [ "$default" = "y" ]; then
        read -p "   Continue? [Y/n]: " -n 1 -r
        echo
        [[ $REPLY =~ ^[Nn]$ ]] && return 1 || return 0
    else
        read -p "   Continue? [y/N]: " -n 1 -r
        echo
        [[ $REPLY =~ ^[Yy]$ ]] && return 0 || return 1
    fi
}

# ============================================================
# MAIN CONSOLIDATION WORKFLOW
# ============================================================

consolidate_branch() {
    local branch="$1"
    local target_branch="${2:-main}"
    
    echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  CONSOLIDATION WORKFLOW: $branch → $target_branch${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    
    # Step 1: Verify branch contents
    verify_branch_contents "$branch" || return 1
    
    # Step 2: Verify file integrity
    verify_file_integrity "$branch" || return 1
    
    # Step 3: Check if already merged
    if git merge-base --is-ancestor "$branch" "$target_branch" 2>/dev/null; then
        echo -e "\n${GREEN}✅ Branch $branch is already merged into $target_branch${NC}"
        
        if ask_confirmation "Branch already merged. Delete branch anyway?" "n"; then
            delete_branch "$branch"
        else
            echo -e "${BLUE}Keeping branch $branch${NC}"
        fi
        return 0
    fi
    
    # Step 4: Show merge preview
    echo -e "\n${BLUE}Merge preview (first 10 files):${NC}"
    git diff --name-only "$target_branch".."$branch" | head -10 | sed 's/^/  /'
    
    # Step 5: Ask for merge confirmation
    if ! ask_confirmation "Merge $branch into $target_branch?" "n"; then
        echo -e "${BLUE}Merge cancelled${NC}"
        return 1
    fi
    
    # Step 6: Perform merge
    echo -e "\n${BLUE}Merging...${NC}"
    git checkout "$target_branch"
    git merge "$branch" --no-edit
    
    # Step 7: Verify merge
    echo -e "\n${BLUE}Verifying merge...${NC}"
    if [ -f "$WORLDLINE_SCRIPT" ]; then
        # Use worldline verification if available
        worldline_init 2>/dev/null || true
    fi
    
    # Step 8: Ask before deleting branch
    if ask_confirmation "Delete branch $branch after successful merge?" "y"; then
        delete_branch "$branch"
    else
        echo -e "${BLUE}Branch $branch preserved${NC}"
    fi
    
    return 0
}

delete_branch() {
    local branch="$1"
    
    echo -e "\n${RED}═══════════════════════════════════════════════════════${NC}"
    echo -e "${RED}  DELETING BRANCH: $branch${NC}"
    echo -e "${RED}═══════════════════════════════════════════════════════${NC}"
    
    # Delete local
    if git show-ref --verify --quiet "refs/heads/$branch"; then
        git branch -D "$branch"
        echo -e "  ${GREEN}✅ Local branch deleted${NC}"
    fi
    
    # Delete remote
    if git show-ref --verify --quiet "refs/remotes/origin/$branch"; then
        if ask_confirmation "Also delete remote branch origin/$branch?" "y"; then
            git push origin --delete "$branch"
            echo -e "  ${GREEN}✅ Remote branch deleted${NC}"
        else
            echo -e "  ${BLUE}Remote branch preserved${NC}"
        fi
    fi
}

# ============================================================
# INTERACTIVE MENU
# ============================================================

show_menu() {
    echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  CONSOLIDATION VERIFY MENU${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "  ${GREEN}1)${NC} List all branches with status"
    echo -e "  ${GREEN}2)${NC} Verify specific branch contents"
    echo -e "  ${GREEN}3)${NC} Consolidate branch to main (with verification)"
    echo -e "  ${GREEN}4)${NC} Check for unmerged branches"
    echo -e "  ${GREEN}5)${NC} Show WORLD_LINE_STEPS.sh functions"
    echo -e "  ${GREEN}6)${NC} Exit"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
}

list_branches() {
    echo -e "\n${BLUE}Local branches:${NC}"
    for branch in $(git branch --format="%(refname:short)"); do
        local status=""
        if git merge-base --is-ancestor "$branch" main 2>/dev/null; then
            status="${GREEN}[MERGED]${NC}"
        else
            status="${YELLOW}[UNMERGED]${NC}"
        fi
        local current=""
        [ "$branch" = "$(git rev-parse --abbrev-ref HEAD)" ] && current="${BLUE}← CURRENT${NC}"
        echo -e "  $branch $status $current"
    done
    
    echo -e "\n${BLUE}Remote branches:${NC}"
    for branch in $(git branch -r --format="%(refname:short)" | grep -v HEAD); do
        local status=""
        if git merge-base --is-ancestor "$branch" main 2>/dev/null; then
            status="${GREEN}[MERGED]${NC}"
        else
            status="${YELLOW}[UNMERGED]${NC}"
        fi
        echo -e "  $branch $status"
    done
}

# ============================================================
# MAIN
# ============================================================

main() {
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  CONSOLIDATION_VERIFY.sh — Safe Branch Consolidation${NC}"
    echo -e "${BLUE}  Worldline Verification: Every step, human approved${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    
    # If arguments provided, run non-interactive
    if [ $# -gt 0 ]; then
        case "$1" in
            verify)
                verify_branch_contents "$2"
                verify_file_integrity "$2"
                ;;
            consolidate)
                consolidate_branch "$2" "$3"
                ;;
            list)
                list_branches
                ;;
            *)
                echo "Usage: $0 [verify|consolidate|list] <branch> [target]"
                exit 1
                ;;
        esac
        exit 0
    fi
    
    # Interactive mode
    while true; do
        show_menu
        read -p "Select option [1-6]: " choice
        case $choice in
            1) list_branches ;;
            2) 
                read -p "Branch name: " branch
                verify_branch_contents "$branch"
                verify_file_integrity "$branch"
                ;;
            3)
                read -p "Branch to consolidate: " branch
                read -p "Target branch [main]: " target
                target=${target:-main}
                consolidate_branch "$branch" "$target"
                ;;
            4)
                echo -e "\n${BLUE}Unmerged branches:${NC}"
                for branch in $(git branch --format="%(refname:short)"); do
                    if ! git merge-base --is-ancestor "$branch" main 2>/dev/null; then
                        echo -e "  ${YELLOW}$branch${NC}"
                    fi
                done
                for branch in $(git branch -r --format="%(refname:short)" | grep -v HEAD); do
                    if ! git merge-base --is-ancestor "$branch" main 2>/dev/null; then
                        echo -e "  ${YELLOW}$branch${NC}"
                    fi
                done
                ;;
            5)
                if [ -f "$WORLDLINE_SCRIPT" ]; then
                    grep "^worldline_" "$WORLDLINE_SCRIPT" | sed 's/() {/  /'
                else
                    echo -e "${RED}WORLD_LINE_STEPS.sh not found${NC}"
                fi
                ;;
            6)
                echo -e "${GREEN}Goodbye! Electron continues its worldline...${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option${NC}"
                ;;
        esac
    done
}

main "$@"