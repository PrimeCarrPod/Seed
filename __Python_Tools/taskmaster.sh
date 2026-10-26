#!/usr/bin/env bash
# ==============================================================================
# taskmaster.sh — Session Task Manager & Quick Resume
# Provides quick-resume, task tracking, and session management
# ==============================================================================

set -euo pipefail

# --- Configuration ---
REPO_ROOT="/workspace/app"
TASKMASTER_DIR="${REPO_ROOT}/__Python_Tools"
STATE_DIR="${REPO_ROOT}/.taskmaster"
mkdir -p "$STATE_DIR"

# Source resume script if exists
RESUME_SCRIPT="${REPO_ROOT}/resume_readme_session.sh"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# --- Logging ---
log() { echo -e "${BLUE}[taskmaster]${NC} $*"; }
success() { echo -e "${GREEN}[OK]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERR]${NC} $*"; }
info() { echo -e "${CYAN}[INFO]${NC} $*"; }

# --- Quick Resume Function ---
quick_resume() {
    log "=== QUICK RESUME ==="
    
    # 1. Run README resume analysis
    if [[ -f "$RESUME_SCRIPT" ]]; then
        log "Running README resume analysis..."
        bash "$RESUME_SCRIPT"
    else
        warn "resume_readme_session.sh not found at $RESUME_SCRIPT"
    fi
    
    # 2. Show git status
    log ""
    log "=== GIT STATUS ==="
    cd "$REPO_ROOT"
    git status --short | head -20
    
    # 3. Show recent commits
    log ""
    log "=== RECENT COMMITS ==="
    git log --oneline -10
    
    # 4. Show current project context
    log ""
    log "=== CURRENT CONTEXT ==="
    pwd
    
    # 5. Load recommendations if available
    RECS_FILE="${REPO_ROOT}/CSMWip/CSMReadMe/.session_state.json.recommendations"
    if [[ -f "$RECS_FILE" ]]; then
        log ""
        log "=== LAST RECOMMENDATIONS ==="
        cat "$RECS_FILE"
    fi
    
    success "Quick resume complete"
}

# --- Full Resume Function ---
full_resume() {
    log "=== FULL RESUME ==="
    
    # Run quick resume
    quick_resume
    
    # Additional checks
    log ""
    log "=== PROJECT STRUCTURE ==="
    find "$REPO_ROOT/CSMWip" -maxdepth 2 -name "README.md" -o -name "TODO.md" -o -name "AGENTS.md" | head -20
    
    log ""
    log "=== ACTIVE SESSIONS ==="
    find "$REPO_ROOT/CSMWip" -name "RESUME_SESSION_*" -o -name "NEXT_runner_*" | head -20
    
    log ""
    log "=== MEMORY LOGS ==="
    find "$REPO_ROOT" -name "memory" -type d | head -10
}

# --- Task Functions ---
add_task() {
    local task="$1"
    local priority="${2:-medium}"
    local id=$(date +%s%N)
    echo "$id|$priority|$task|pending" >> "$STATE_DIR/tasks.txt"
    success "Added task: $task (priority: $priority)"
}

list_tasks() {
    local filter="${1:-all}"
    if [[ -f "$STATE_DIR/tasks.txt" ]]; then
        case "$filter" in
            pending) grep "|pending$" "$STATE_DIR/tasks.txt" ;;
            done) grep "|done$" "$STATE_DIR/tasks.txt" ;;
            *) cat "$STATE_DIR/tasks.txt" ;;
        esac
    else
        info "No tasks yet"
    fi
}

complete_task() {
    local id="$1"
    if [[ -f "$STATE_DIR/tasks.txt" ]]; then
        sed -i "s/^$id|.*|pending$/$id|$(echo "$id" | cut -d'|' -f2)|$(echo "$id" | cut -d'|' -f3)|done/" "$STATE_DIR/tasks.txt"
        success "Task $id marked complete"
    fi
}

# --- Main Dispatch ---
case "${1:-help}" in
    quick-resume|qr)
        quick_resume
        ;;
    full-resume|fr)
        full_resume
        ;;
    add-task|add)
        add_task "${2:-}" "${3:-medium}"
        ;;
    list-tasks|list)
        list_tasks "${2:-all}"
        ;;
    complete-task|done)
        complete_task "${2:-}"
        ;;
    help|*)
        cat <<EOF
taskmaster.sh — Session Task Manager

USAGE:
  source /workspace/app/__Python_Tools/taskmaster.sh && taskmaster.sh <command>

COMMANDS:
  quick-resume, qr    Run quick resume (README analysis + git status + context)
  full-resume, fr     Full resume (quick + project structure + sessions + memory)
  add-task, add       Add a task: taskmaster.sh add "task description" [high|medium|low]
  list-tasks, list    List tasks: taskmaster.sh list [pending|done|all]
  complete-task, done Mark task complete: taskmaster.sh done <task_id>
  help                Show this help

EXAMPLES:
  # In new session, quick resume
  source /workspace/app/__Python_Tools/taskmaster.sh && taskmaster.sh qr
  
  # Full resume with all context
  taskmaster.sh fr
  
  # Track tasks
  taskmaster.sh add "Create deep README for CSMSubatomic082026" high
  taskmaster.sh list pending
  taskmaster.sh done <task_id>

EOF
        ;;
esac