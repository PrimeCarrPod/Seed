#!/bin/bash
# taskmaster.sh - Task Management and Subtask Decomposition System
#
# A comprehensive task tracking system that:
#   - Displays all tasks and subtasks
#   - Decomposes tasks into smaller subtasks
#   - Tracks every command execution step-by-step
#   - Persists task state for resume capability
#   - Logs all commands for audit trail

set -euo pipefail

# Configuration
TASKMASTER_DIR="${TASKMASTER_DIR:-$HOME/.taskmaster}"
TASK_FILE="${TASK_FILE:-$TASKMASTER_DIR/tasks.json}"
LOG_FILE="${LOG_FILE:-$TASKMASTER_DIR/command_log.jsonl}"
STATE_FILE="${STATE_FILE:-$TASKMASTER_DIR/state.json}"
SUBTASK_DEPTH="${SUBTASK_DEPTH:-3}"
VERBOSE="${VERBOSE:-true}"
DRY_RUN="${DRY_RUN:-false}"

# Colors for output
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
NC="\033[0m"  # No Color

# Utility Functions
log() {
    local level="$1"
    shift
    local msg="$*"
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    echo -e "${timestamp} [${level}] ${msg}"
}

log_info() { log "INFO" "$*"; }
log_warn() { log "WARN" "${YELLOW}$*${NC}"; }
log_error() { log "ERROR" "${RED}$*${NC}"; }
log_debug() { [[ "$VERBOSE" == "true" ]] && log "DEBUG" "${CYAN}$*${NC}"; }
log_step() { log "STEP" "${GREEN}▶ $*${NC}"; }
log_substep() { log "SUBSTEP" "${BLUE}  ↳ $*${NC}"; }

ensure_dir() {
    mkdir -p "$TASKMASTER_DIR"
}

init_files() {
    ensure_dir
    [[ -f "$TASK_FILE" ]] || echo "[]" > "$TASK_FILE"
    [[ -f "$LOG_FILE" ]] || touch "$LOG_FILE"
    [[ -f "$STATE_FILE" ]] || echo '{"current_task_index": 0, "completed_tasks": []}' > "$STATE_FILE"
}

get_timestamp() {
    date -u +"%Y-%m-%dT%H:%M:%SZ"
}

generate_id() {
    echo "task_$(date +%s%N)_$$_$RANDOM"
}

# =============================================================================
# TASK DISPLAY AND LISTING FUNCTIONALITY
# =============================================================================

# Display all tasks in a tree format
display_tasks() {
    local filter="${1:-all}"  # all, pending, completed, current
    init_files
    
    log_step "Displaying tasks (filter: $filter)"
    
    local tasks_json=$(cat "$TASK_FILE")
    local state_json=$(cat "$STATE_FILE")
    local current_index=$(echo "$state_json" | jq -r '.current_task_index // 0')
    local completed=$(echo "$state_json" | jq -r '.completed_tasks // [] | join(",")')
    
    echo ""
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}                    TASK MASTER - TASK LIST                     ${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    
    local task_count=$(echo "$tasks_json" | jq 'length')
    
    if [[ "$task_count" -eq 0 ]]; then
        echo -e "${YELLOW}No tasks found. Use 'add' to create tasks.${NC}"
        return 0
    fi
    
    for ((i=0; i<task_count; i++)); do
        local task=$(echo "$tasks_json" | jq ".[$i]")
        local id=$(echo "$task" | jq -r '.id')
        local title=$(echo "$task" | jq -r '.title')
        local description=$(echo "$task" | jq -r '.description // ""')
        local status=$(echo "$task" | jq -r '.status // "pending"')
        local parent_id=$(echo "$task" | jq -r '.parent_id // ""')
        local depth=$(echo "$task" | jq -r '.depth // 0')
        local subtasks=$(echo "$task" | jq -r '.subtasks // [] | length')
        
        # Filter logic
        local show=true
        case "$filter" in
            "pending") [[ "$status" != "pending" ]] && show=false ;;
            "completed") [[ "$status" != "completed" ]] && show=false ;;
            "current") [[ $i -ne $current_index ]] && show=false ;;
        esac
        
        [[ "$show" == "false" ]] && continue
        
        # Indentation based on depth
        local indent=""
        for ((d=0; d<depth; d++)); do
            indent="${indent}  "
        done
        
        # Status indicator
        local status_icon=""
        local status_color=""
        case "$status" in
            "completed") status_icon="✓"; status_color="$GREEN" ;;
            "in_progress") status_icon="▶"; status_color="$BLUE" ;;
            "pending") status_icon="○"; status_color="$YELLOW" ;;
            "blocked") status_icon="⊘"; status_color="$RED" ;;
            *) status_icon="?"; status_color="$NC" ;;
        esac
        
        # Current task marker
        local current_marker=""
        [[ $i -eq $current_index ]] && current_marker="${MAGENTA} ← CURRENT${NC}"
        
        echo -e "${indent}${status_color}${status_icon}${NC} ${MAGENTA}${id}${NC} ${title}${current_marker}"
        [[ -n "$description" ]] && echo -e "${indent}  ${CYAN}Description:${NC} $description"
        [[ $subtasks -gt 0 ]] && echo -e "${indent}  ${BLUE}Subtasks:${NC} $subtasks"
        echo ""
    done
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "Total: $task_count tasks | Current index: $current_index"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
}

# Display a single task with full details
display_task_detail() {
    local task_id="$1"
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$task_id" '.[] | select(.id == $id)')
    
    if [[ -z "$task" ]]; then
        log_error "Task not found: $task_id"
        return 1
    fi
    
    local id=$(echo "$task" | jq -r '.id')
    local title=$(echo "$task" | jq -r '.title')
    local description=$(echo "$task" | jq -r '.description // ""')
    local status=$(echo "$task" | jq -r '.status // "pending"')
    local parent_id=$(echo "$task" | jq -r '.parent_id // ""')
    local depth=$(echo "$task" | jq -r '.depth // 0')
    local created=$(echo "$task" | jq -r '.created_at')
    local updated=$(echo "$task" | jq -r '.updated_at')
    local subtasks=$(echo "$task" | jq -r '.subtasks // []')
    local commands=$(echo "$task" | jq -r '.commands // []')
    
    echo ""
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}                    TASK DETAIL: ${title}                      ${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${MAGENTA}ID:${NC}           $id"
    echo -e "${MAGENTA}Title:${NC}        $title"
    echo -e "${MAGENTA}Status:${NC}       $status"
    echo -e "${MAGENTA}Depth:${NC}        $depth"
    echo -e "${MAGENTA}Parent:${NC}       ${parent_id:-"(root)"}"
    echo -e "${MAGENTA}Created:${NC}      $created"
    echo -e "${MAGENTA}Updated:${NC}      $updated"
    echo ""
    
    if [[ -n "$description" ]]; then
        echo -e "${CYAN}Description:${NC}"
        echo "$description"
        echo ""
    fi
    
    local sub_count=$(echo "$subtasks" | jq 'length')
    if [[ $sub_count -gt 0 ]]; then
        echo -e "${CYAN}Subtasks (${sub_count}):${NC}"
        for ((j=0; j<sub_count; j++)); do
            local st=$(echo "$subtasks" | jq ".[$j]")
            local st_id=$(echo "$st" | jq -r '.id')
            local st_title=$(echo "$st" | jq -r '.title')
            local st_status=$(echo "$st" | jq -r '.status')
            local st_icon=""
            case "$st_status" in
                "completed") st_icon="${GREEN}✓${NC}" ;;
                "in_progress") st_icon="${BLUE}▶${NC}" ;;
                *) st_icon="${YELLOW}○${NC}" ;;
            esac
            echo -e "  $st_icon $st_id: $st_title"
        done
        echo ""
    fi
    
    local cmd_count=$(echo "$commands" | jq 'length')
    if [[ $cmd_count -gt 0 ]]; then
        echo -e "${CYAN}Commands Executed (${cmd_count}):${NC}"
        for ((j=0; j<cmd_count; j++)); do
            local cmd=$(echo "$commands" | jq ".[$j]")
            local cmd_text=$(echo "$cmd" | jq -r '.command')
            local cmd_time=$(echo "$cmd" | jq -r '.timestamp')
            local cmd_status=$(echo "$cmd" | jq -r '.status')
            local status_icon="${GREEN}✓${NC}"
            [[ "$cmd_status" == "failed" ]] && status_icon="${RED}✗${NC}"
            echo -e "  $status_icon [$cmd_time] $cmd_text"
        done
        echo ""
    fi
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
}

# List tasks in a compact format
list_tasks_compact() {
    init_files
    local tasks_json=$(cat "$TASK_FILE")
    local task_count=$(echo "$tasks_json" | jq 'length')
    
    printf "%-20s %-12s %-50s %s\n" "ID" "STATUS" "TITLE" "SUBTASKS"
    printf "%-20s %-12s %-50s %s\n" "--------------------" "------------" "--------------------------------------------------" "--------"
    
    for ((i=0; i<task_count; i++)); do
        local task=$(echo "$tasks_json" | jq ".[$i]")
        local id=$(echo "$task" | jq -r '.id')
        local title=$(echo "$task" | jq -r '.title')
        local status=$(echo "$task" | jq -r '.status // "pending"')
        local subtasks=$(echo "$task" | jq -r '.subtasks // [] | length')
        
        local status_short="${status:0:10}"
        local title_short="${title:0:48}"
        
        printf "%-20s %-12s %-50s %d\n" "$id" "$status_short" "$title_short" "$subtasks"
    done
}

# =============================================================================
# TASK DECOMPOSITION INTO SUBTASKS
# =============================================================================

# Add a new task
add_task() {
    local title="$1"
    local description="${2:-}"
    local parent_id="${3:-}"
    
    init_files
    
    local id=$(generate_id)
    local timestamp=$(get_timestamp)
    local depth=0
    
    if [[ -n "$parent_id" ]]; then
        local parent_task=$(cat "$TASK_FILE" | jq --arg id "$parent_id" '.[] | select(.id == $id)')
        if [[ -z "$parent_task" ]]; then
            log_error "Parent task not found: $parent_id"
            return 1
        fi
        depth=$(echo "$parent_task" | jq -r '.depth + 1')
        
        if [[ $depth -gt $SUBTASK_DEPTH ]]; then
            log_warn "Maximum subtask depth ($SUBTASK_DEPTH) reached. Task created at depth $depth anyway."
        fi
    fi
    
    local new_task=$(jq -n \
        --arg id "$id" \
        --arg title "$title" \
        --arg desc "$description" \
        --arg status "pending" \
        --arg parent "$parent_id" \
        --argjson depth "$depth" \
        --arg created "$timestamp" \
        --arg updated "$timestamp" \
        '{
            id: $id,
            title: $title,
            description: $desc,
            status: $status,
            parent_id: $parent,
            depth: $depth,
            created_at: $created,
            updated_at: $updated,
            subtasks: [],
            commands: []
        }')
    
    local tasks_json=$(cat "$TASK_FILE")
    local updated_tasks=$(echo "$tasks_json" | jq ". + [$new_task]")
    echo "$updated_tasks" > "$TASK_FILE"
    
    # If parent exists, add to parent's subtasks
    if [[ -n "$parent_id" ]]; then
        updated_tasks=$(echo "$updated_tasks" | jq --arg pid "$parent_id" --argjson subtask "$new_task" '
            map(if .id == $pid then .subtasks += [$subtask] else . end)
        ')
        echo "$updated_tasks" > "$TASK_FILE"
    fi
    
    log_info "Created task: $id - $title"
    echo "$id"
}

# Decompose a task into subtasks interactively or from a list
decompose_task() {
    local task_id="$1"
    shift
    local subtask_titles=("$@")
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$task_id" '.[] | select(.id == $id)')
    
    if [[ -z "$task" ]]; then
        log_error "Task not found: $task_id"
        return 1
    fi
    
    local current_depth=$(echo "$task" | jq -r '.depth')
    local new_depth=$((current_depth + 1))
    
    if [[ $new_depth -gt $SUBTASK_DEPTH ]]; then
        log_error "Cannot decompose further: maximum depth ($SUBTASK_DEPTH) reached"
        return 1
    fi
    
    log_step "Decomposing task: $task_id"
    
    # If no subtask titles provided, prompt interactively
    if [[ ${#subtask_titles[@]} -eq 0 ]]; then
        echo -e "${CYAN}Enter subtask titles (empty line to finish):${NC}"
        local count=1
        while true; do
            read -p "  Subtask $count: " title
            [[ -z "$title" ]] && break
            subtask_titles+=("$title")
            ((count++))
        done
    fi
    
    local timestamp=$(get_timestamp)
    local subtasks_json="[]"
    
    for title in "${subtask_titles[@]}"; do
        local subtask_id=$(generate_id)
        local subtask=$(jq -n \
            --arg id "$subtask_id" \
            --arg title "$title" \
            --arg desc "" \
            --arg status "pending" \
            --arg parent "$task_id" \
            --argjson depth "$new_depth" \
            --arg created "$timestamp" \
            --arg updated "$timestamp" \
            '{
                id: $id,
                title: $title,
                description: $desc,
                status: $status,
                parent_id: $parent,
                depth: $depth,
                created_at: $created,
                updated_at: $updated,
                subtasks: [],
                commands: []
            }')
        subtasks_json=$(echo "$subtasks_json" | jq ". + [$subtask]")
        log_substep "Created subtask: $subtask_id - $title"
    done
    
    # Update parent task with subtasks
    local updated_tasks=$(echo "$tasks_json" | jq --arg id "$task_id" --argjson subtasks "$subtasks_json" '
        map(if .id == $id then .subtasks = $subtasks | .updated_at = now | .status = "in_progress" else . end)
    ')
    echo "$updated_tasks" > "$TASK_FILE"
    
    # Add each subtask to the main task list
    for ((i=0; i<${#subtask_titles[@]}; i++)); do
        local subtask=$(echo "$subtasks_json" | jq ".[$i]")
        updated_tasks=$(echo "$updated_tasks" | jq ". + [$subtask]")
    done
    echo "$updated_tasks" > "$TASK_FILE"
    
    log_info "Decomposed into ${#subtask_titles[@]} subtasks"
}

# Auto-decompose a task using heuristics
auto_decompose_task() {
    local task_id="$1"
    local max_subtasks="${2:-5}"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$task_id" '.[] | select(.id == $id)')
    
    if [[ -z "$task" ]]; then
        log_error "Task not found: $task_id"
        return 1
    fi
    
    local title=$(echo "$task" | jq -r '.title')
    local description=$(echo "$task" | jq -r '.description // ""')
    
    log_step "Auto-decomposing task: $task_id ($title)"
    
    # Simple heuristic-based decomposition
    local subtask_titles=()
    
    # Common patterns for decomposition
    if [[ "$title" =~ [Bb]uild|[Cc]ompile|[Mm]ake ]]; then
        subtask_titles+=("Prepare build environment" "Compile sources" "Link artifacts" "Verify build output" "Package deliverables")
    elif [[ "$title" =~ [Tt]est|[Qq]uality|[Cc]heck ]]; then
        subtask_titles+=("Set up test environment" "Run unit tests" "Run integration tests" "Run linting/checks" "Generate test report")
    elif [[ "$title" =~ [Dd]eploy|[Rr]elease|[Pp]ublish ]]; then
        subtask_titles+=("Prepare release artifacts" "Run pre-deployment checks" "Deploy to staging" "Validate deployment" "Promote to production")
    elif [[ "$title" =~ [Rr]efactor|[Cc]leanup|[Ii]mprove ]]; then
        subtask_titles+=("Analyze current code" "Plan refactoring steps" "Implement changes" "Run tests" "Verify improvements")
    elif [[ "$title" =~ [Dd]ebug|[Ff]ix|[Ii]ssue ]]; then
        subtask_titles+=("Reproduce issue" "Identify root cause" "Implement fix" "Test fix" "Verify no regressions")
    else
        # Generic decomposition
        subtask_titles+=("Analyze requirements" "Design approach" "Implement solution" "Test implementation" "Document changes")
    fi
    
    # Limit to max_subtasks
    subtask_titles=("${subtask_titles[@]:0:$max_subtasks}")
    
    decompose_task "$task_id" "${subtask_titles[@]}"
}

# Decompose all pending tasks recursively
decompose_all_pending() {
    local max_depth="${1:-$SUBTASK_DEPTH}"
    
    init_files
    log_step "Decomposing all pending tasks (max depth: $max_depth)"
    
    local tasks_json=$(cat "$TASK_FILE")
    local task_count=$(echo "$tasks_json" | jq 'length')
    local decomposed=0
    
    for ((i=0; i<task_count; i++)); do
        local task=$(echo "$tasks_json" | jq ".[$i]")
        local id=$(echo "$task" | jq -r '.id')
        local status=$(echo "$task" | jq -r '.status // "pending"')
        local depth=$(echo "$task" | jq -r '.depth // 0')
        local subtasks=$(echo "$task" | jq -r '.subtasks // [] | length')
        
        if [[ "$status" == "pending" && $depth -lt $max_depth && $subtasks -eq 0 ]]; then
            auto_decompose_task "$id"
            ((decomposed++))
            tasks_json=$(cat "$TASK_FILE")  # Refresh
            task_count=$(echo "$tasks_json" | jq 'length')
        fi
    done
    
    log_info "Auto-decomposed $decomposed tasks"
}

# =============================================================================
# STEP-BY-STEP EXECUTION TRACKING
# =============================================================================

# Execute a command with full tracking
execute_tracked() {
    local task_id="$1"
    local command="$2"
    local description="${3:-}"
    
    init_files
    
    log_step "Executing: $command"
    [[ -n "$description" ]] && log_substep "$description"
    
    local timestamp=$(get_timestamp)
    local cmd_id="cmd_$(date +%s%N)"
    local start_time=$(date +%s.%N)
    
    # Log command start
    local cmd_log=$(jq -nc \
        --arg id "$cmd_id" \
        --arg task_id "$task_id" \
        --arg command "$command" \
        --arg desc "$description" \
        --arg timestamp "$timestamp" \
        --arg status "running" \
        --arg start_time "$start_time" \
        '{
            id: $id,
            task_id: $task_id,
            command: $command,
            description: $desc,
            timestamp: $timestamp,
            status: $status,
            start_time: $start_time
        }')
    
    echo "$cmd_log" >> "$LOG_FILE"
    
    # Update task with command
    local tasks_json=$(cat "$TASK_FILE")
    local updated_tasks=$(echo "$tasks_json" | jq --arg id "$task_id" --argjson cmd "$cmd_log" '
        map(if .id == $id then .commands += [$cmd] | .updated_at = now | .status = "in_progress" else . end)
    ')
    echo "$updated_tasks" > "$TASK_FILE"
    
    if [[ "$DRY_RUN" == "true" ]]; then
        log_warn "DRY RUN: Would execute: $command"
        local result=0
        local output="(dry run)"
    else
        # Execute command and capture output
        local output
        output=$(eval "$command" 2>&1)
        local result=$?
    fi
    
    local end_time=$(date +%s.%N)
    local duration=$(echo "$end_time - $start_time" | bc -l 2>/dev/null || echo "0")
    local end_timestamp=$(get_timestamp)
    
    # Log command completion
    local cmd_log_complete=$(jq -nc \
        --arg id "$cmd_id" \
        --arg task_id "$task_id" \
        --arg command "$command" \
        --arg desc "$description" \
        --arg timestamp "$end_timestamp" \
        --arg status "$([ $result -eq 0 ] && echo "completed" || echo "failed")" \
        --argjson duration "$duration" \
        --arg output "$output" \
        --argjson exit_code "$result" \
        '{
            id: $id,
            task_id: $task_id,
            command: $command,
            description: $desc,
            timestamp: $timestamp,
            status: $status,
            duration_seconds: $duration,
            output: $output,
            exit_code: $exit_code
        }')
    
    echo "$cmd_log_complete" >> "$LOG_FILE"
    
    # Update task with completed command
    tasks_json=$(cat "$TASK_FILE")
    updated_tasks=$(echo "$tasks_json" | jq --arg id "$task_id" --argjson cmd "$cmd_log_complete" '
        map(if .id == $id then .commands = (.commands | map(if .id == $cmd.id then $cmd else . end)) | .updated_at = now else . end)
    ')
    echo "$updated_tasks" > "$TASK_FILE"
    
    if [[ $result -eq 0 ]]; then
        log_info "Command completed successfully (${duration}s)"
    else
        log_error "Command failed with exit code $result (${duration}s)"
        [[ -n "$output" ]] && log_error "Output: $output"
    fi
    
    return $result
}

# Execute multiple commands in sequence for a task
execute_task_sequence() {
    local task_id="$1"
    shift
    local commands=("$@")
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$task_id" '.[] | select(.id == $id)')
    
    if [[ -z "$task" ]]; then
        log_error "Task not found: $task_id"
        return 1
    fi
    
    log_step "Starting execution sequence for task: $task_id"
    
    # Update task status to in_progress
    local updated_tasks=$(echo "$tasks_json" | jq --arg id "$task_id" '
        map(if .id == $id then .status = "in_progress" | .updated_at = now else . end)
    ')
    echo "$updated_tasks" > "$TASK_FILE"
    
    local failed=0
    for cmd in "${commands[@]}"; do
        # Parse command and optional description (format: "command|description")
        local cmd_text="${cmd%%|*}"
        local cmd_desc="${cmd#*|}"
        [[ "$cmd_desc" == "$cmd_text" ]] && cmd_desc=""
        
        execute_tracked "$task_id" "$cmd_text" "$cmd_desc"
        local result=$?
        
        if [[ $result -ne 0 ]]; then
            failed=1
            log_error "Sequence stopped due to failure"
            break
        fi
    done
    
    # Update final task status
    tasks_json=$(cat "$TASK_FILE")
    local final_status="completed"
    [[ $failed -eq 1 ]] && final_status="failed"
    
    updated_tasks=$(echo "$tasks_json" | jq --arg id "$task_id" --arg status "$final_status" '
        map(if .id == $id then .status = $status | .updated_at = now else . end)
    ')
    echo "$updated_tasks" > "$TASK_FILE"
    
    if [[ $failed -eq 0 ]]; then
        log_info "Task sequence completed successfully"
        # Advance to next task
        advance_task
    else
        log_error "Task sequence failed"
    fi
    
    return $failed
}

# Interactive step-by-step execution
execute_interactive() {
    local task_id="$1"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$task_id" '.[] | select(.id == $id)')
    
    if [[ -z "$task" ]]; then
        log_error "Task not found: $task_id"
        return 1
    fi
    
    local title=$(echo "$task" | jq -r '.title')
    local subtasks=$(echo "$task" | jq -r '.subtasks // []')
    local sub_count=$(echo "$subtasks" | jq 'length')
    
    log_step "Interactive execution for: $title"
    
    if [[ $sub_count -gt 0 ]]; then
        echo -e "${CYAN}This task has $sub_count subtasks. Execute them first? (y/n)${NC}"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            for ((i=0; i<sub_count; i++)); do
                local st=$(echo "$subtasks" | jq ".[$i]")
                local st_id=$(echo "$st" | jq -r '.id')
                local st_status=$(echo "$st" | jq -r '.status')
                
                if [[ "$st_status" == "pending" ]]; then
                    execute_interactive "$st_id"
                fi
            done
        fi
    fi
    
    # Get commands for this task
    local commands=$(echo "$task" | jq -r '.commands // []')
    local cmd_count=$(echo "$commands" | jq 'length')
    
    if [[ $cmd_count -eq 0 ]]; then
        echo -e "${YELLOW}No commands recorded for this task. Enter commands interactively (empty to finish):${NC}"
        local cmd_list=()
        while true; do
            read -p "  Command: " cmd
            [[ -z "$cmd" ]] && break
            read -p "  Description (optional): " desc
            cmd_list+=("$cmd|$desc")
        done
        
        if [[ ${#cmd_list[@]} -gt 0 ]]; then
            execute_task_sequence "$task_id" "${cmd_list[@]}"
        fi
    else
        echo -e "${CYAN}Task has $cmd_count recorded commands. Re-execute? (y/n)${NC}"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            local cmd_list=()
            for ((i=0; i<cmd_count; i++)); do
                local cmd=$(echo "$commands" | jq ".[$i]")
                local cmd_text=$(echo "$cmd" | jq -r '.command')
                local cmd_desc=$(echo "$cmd" | jq -r '.description')
                cmd_list+=("$cmd_text|$cmd_desc")
            done
            execute_task_sequence "$task_id" "${cmd_list[@]}"
        fi
    fi
}

# Watch mode - continuously display task progress
watch_tasks() {
    local interval="${1:-2}"
    
    log_step "Starting watch mode (interval: ${interval}s, press Ctrl+C to stop)"
    
    while true; do
        clear
        display_tasks "all"
        sleep "$interval"
    done
}

# Show execution history for a task
show_execution_history() {
    local task_id="$1"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$task_id" '.[] | select(.id == $id)')
    
    if [[ -z "$task" ]]; then
        log_error "Task not found: $task_id"
        return 1
    fi
    
    local commands=$(echo "$task" | jq -r '.commands // []')
    local cmd_count=$(echo "$commands" | jq 'length')
    
    echo ""
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}              EXECUTION HISTORY FOR TASK                        ${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    
    if [[ $cmd_count -eq 0 ]]; then
        echo -e "${YELLOW}No commands executed yet.${NC}"
    else
        for ((i=0; i<cmd_count; i++)); do
            local cmd=$(echo "$commands" | jq ".[$i]")
            local cmd_text=$(echo "$cmd" | jq -r '.command')
            local cmd_desc=$(echo "$cmd" | jq -r '.description')
            local timestamp=$(echo "$cmd" | jq -r '.timestamp')
            local status=$(echo "$cmd" | jq -r '.status')
            local duration=$(echo "$cmd" | jq -r '.duration_seconds // 0')
            local exit_code=$(echo "$cmd" | jq -r '.exit_code // 0')
            local output=$(echo "$cmd" | jq -r '.output // ""')
            
            local status_icon="${GREEN}✓${NC}"
            [[ "$status" == "failed" ]] && status_icon="${RED}✗${NC}"
            [[ "$status" == "running" ]] && status_icon="${BLUE}▶${NC}"
            
            echo -e "$status_icon [$timestamp] ${MAGENTA}$cmd_text${NC}"
            [[ -n "$cmd_desc" ]] && echo -e "    ${CYAN}Description:${NC} $cmd_desc"
            echo -e "    ${BLUE}Duration:${NC} ${duration}s | ${BLUE}Exit Code:${NC} $exit_code"
            [[ -n "$output" && "$output" != "null" ]] && echo -e "    ${YELLOW}Output:${NC} $output"
            echo ""
        done
    fi
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
}

# =============================================================================
# TASK PERSISTENCE AND RESUME CAPABILITY
# =============================================================================

# Save current state for resume
save_state() {
    local task_index="${1:-0}"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local completed=()
    
    # Find completed task IDs
    local task_count=$(echo "$tasks_json" | jq 'length')
    for ((i=0; i<task_count; i++)); do
        local task=$(echo "$tasks_json" | jq ".[$i]")
        local status=$(echo "$task" | jq -r '.status // "pending"')
        local id=$(echo "$task" | jq -r '.id')
        [[ "$status" == "completed" ]] && completed+=("$id")
    done
    
    local state=$(jq -n \
        --argjson index "$task_index" \
        --argjson completed "$(printf '%s\n' "${completed[@]}" | jq -R . | jq -s .)" \
        --arg timestamp "$(get_timestamp)" \
        '{
            current_task_index: $index,
            completed_tasks: $completed,
            saved_at: $timestamp,
            version: "1.0"
        }')
    
    echo "$state" > "$STATE_FILE"
    log_debug "State saved: index=$task_index, completed=${#completed[@]}"
}

# Load state for resume
load_state() {
    init_files
    
    if [[ ! -f "$STATE_FILE" ]]; then
        log_warn "No state file found, starting fresh"
        return 1
    fi
    
    local state_json=$(cat "$STATE_FILE")
    local index=$(echo "$state_json" | jq -r '.current_task_index // 0')
    local completed=$(echo "$state_json" | jq -r '.completed_tasks // [] | join(",")')
    local saved_at=$(echo "$state_json" | jq -r '.saved_at')
    
    log_info "Loaded state from $saved_at: index=$index, completed=$completed"
    
    echo "$index"
}

# Get next pending task
get_next_task() {
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local state_json=$(cat "$STATE_FILE")
    local current_index=$(echo "$state_json" | jq -r '.current_task_index // 0')
    local task_count=$(echo "$tasks_json" | jq 'length')
    
    # Start from current index
    for ((i=current_index; i<task_count; i++)); do
        local task=$(echo "$tasks_json" | jq ".[$i]")
        local status=$(echo "$task" | jq -r '.status // "pending"')
        local id=$(echo "$task" | jq -r '.id')
        
        if [[ "$status" == "pending" ]]; then
            echo "$id"
            return 0
        fi
    done
    
    # Wrap around to beginning
    for ((i=0; i<current_index; i++)); do
        local task=$(echo "$tasks_json" | jq ".[$i]")
        local status=$(echo "$task" | jq -r '.status // "pending"')
        local id=$(echo "$task" | jq -r '.id')
        
        if [[ "$status" == "pending" ]]; then
            echo "$id"
            return 0
        fi
    done
    
    return 1
}

# Advance to next task
advance_task() {
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local state_json=$(cat "$STATE_FILE")
    local current_index=$(echo "$state_json" | jq -r '.current_task_index // 0')
    local task_count=$(echo "$tasks_json" | jq 'length')
    
    # Find next pending task
    local next_index=$((current_index + 1))
    local found=false
    
    for ((i=next_index; i<task_count; i++)); do
        local task=$(echo "$tasks_json" | jq ".[$i]")
        local status=$(echo "$task" | jq -r '.status // "pending"')
        if [[ "$status" == "pending" ]]; then
            found=true
            next_index=$i
            break
        fi
    done
    
    if [[ "$found" == "false" ]]; then
        # Check from beginning
        for ((i=0; i<=current_index; i++)); do
            local task=$(echo "$tasks_json" | jq ".[$i]")
            local status=$(echo "$task" | jq -r '.status // "pending"')
            if [[ "$status" == "pending" ]]; then
                found=true
                next_index=$i
                break
            fi
        done
    fi
    
    if [[ "$found" == "true" ]]; then
        save_state "$next_index"
        log_info "Advanced to task index $next_index"
    else
        log_info "All tasks completed!"
        save_state "$task_count"
    fi
}

# Resume from last saved state
resume() {
    init_files
    
    log_step "Resuming from last saved state"
    
    local next_task=$(get_next_task)
    
    if [[ -z "$next_task" ]]; then
        log_info "No pending tasks found. All tasks completed!"
        display_tasks "completed"
        return 0
    fi
    
    log_info "Next task: $next_task"
    display_task_detail "$next_task"
    
    # Check if task has subtasks
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$next_task" '.[] | select(.id == $id)')
    local subtasks=$(echo "$task" | jq -r '.subtasks // []')
    local sub_count=$(echo "$subtasks" | jq 'length')
    
    if [[ $sub_count -gt 0 ]]; then
        log_info "Task has $sub_count subtasks. Checking for pending subtasks..."
        for ((i=0; i<sub_count; i++)); do
            local st=$(echo "$subtasks" | jq ".[$i]")
            local st_id=$(echo "$st" | jq -r '.id')
            local st_status=$(echo "$st" | jq -r '.status')
            if [[ "$st_status" == "pending" ]]; then
                log_info "Found pending subtask: $st_id"
                resume  # Recursive call for subtask
                return $?
            fi
        done
    fi
    
    echo "$next_task"
}

# Export tasks to JSON for backup/portability
export_tasks() {
    local output_file="${1:-$TASKMASTER_DIR/tasks_export_$(date +%Y%m%d_%H%M%S).json}"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local state_json=$(cat "$STATE_FILE")
    local log_content=$(cat "$LOG_FILE")
    
    local export_data=$(jq -n \
        --argjson tasks "$tasks_json" \
        --argjson state "$state_json" \
        --arg log "$log_content" \
        --arg exported_at "$(get_timestamp)" \
        --arg version "1.0" \
        '{
            version: $version,
            exported_at: $exported_at,
            tasks: $tasks,
            state: $state,
            command_log: $log
        }')
    
    echo "$export_data" > "$output_file"
    log_info "Tasks exported to: $output_file"
}

# Import tasks from JSON
import_tasks() {
    local input_file="$1"
    
    if [[ ! -f "$input_file" ]]; then
        log_error "Import file not found: $input_file"
        return 1
    fi
    
    init_files
    
    local import_data=$(cat "$input_file")
    local version=$(echo "$import_data" | jq -r '.version // "1.0"')
    local tasks=$(echo "$import_data" | jq -r '.tasks // []')
    local state=$(echo "$import_data" | jq -r '.state // {}')
    local log=$(echo "$import_data" | jq -r '.command_log // ""')
    
    echo "$tasks" > "$TASK_FILE"
    echo "$state" > "$STATE_FILE"
    echo "$log" > "$LOG_FILE"
    
    local task_count=$(echo "$tasks" | jq 'length')
    log_info "Imported $task_count tasks from $input_file (version $version)"
}

# Create a resume script for the next task group
create_resume_script() {
    local output_file="${1:-$TASKMASTER_DIR/resume_next.sh}"
    
    init_files
    
    local next_task=$(get_next_task)
    
    cat > "$output_file" << RESUME_EOF
#!/bin/bash
# Auto-generated resume script for taskmaster.sh
# Generated: $(get_timestamp)
# Next task: $next_task

source "\$(dirname "\$0")/taskmaster.sh"

# Resume from saved state
taskmaster_resume

# Execute next task interactively
if [[ -n "\$TASKMASTER_NEXT_TASK" ]]; then
    taskmaster_execute_interactive "\$TASKMASTER_NEXT_TASK"
fi
RESUME_EOF
    
    chmod +x "$output_file"
    log_info "Resume script created: $output_file"
}

# Save task grouping for next session
save_task_grouping() {
    local group_name="${1:-default}"
    local output_file="$TASKMASTER_DIR/group_${group_name}_$(date +%Y%m%d_%H%M%S).json"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local state_json=$(cat "$STATE_FILE")
    
    # Group tasks by parent (top-level tasks with their subtasks)
    local grouped=$(echo "$tasks_json" | jq '
        group_by(.parent_id // "root") |
        map({
            parent: (.[0].parent_id // "root"),
            tasks: map({id, title, status, depth, subtasks: (.subtasks | length)})
        })
    ')
    
    local grouping=$(jq -n \
        --arg name "$group_name" \
        --argjson tasks "$tasks_json" \
        --argjson state "$state_json" \
        --argjson grouped "$grouped" \
        --arg created "$(get_timestamp)" \
        '{
            group_name: $name,
            created_at: $created,
            total_tasks: ($tasks | length),
            state: $state,
            grouped_tasks: $grouped,
            all_tasks: $tasks
        }')
    
    echo "$grouping" > "$output_file"
    log_info "Task grouping saved: $output_file"
    echo "$output_file"
}

# =============================================================================
# COMMAND LOGGING AND AUDIT TRAIL
# =============================================================================

# Show command log
show_command_log() {
    local filter_task="${1:-}"
    local filter_status="${2:-}"
    local limit="${3:-50}"
    
    init_files
    
    if [[ ! -f "$LOG_FILE" ]]; then
        log_warn "No command log found"
        return 0
    fi
    
    log_step "Showing command log (limit: $limit)"
    
    local log_entries=()
    while IFS= read -r line; do
        [[ -z "$line" ]] && continue
        log_entries+=("$line")
    done < "$LOG_FILE"
    
    local total=${#log_entries[@]}
    local start=$((total > limit ? total - limit : 0))
    
    echo ""
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}                    COMMAND AUDIT LOG                           ${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "Showing last $limit of $total entries"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    
    for ((i=start; i<total; i++)); do
        local entry="${log_entries[$i]}"
        local task_id=$(echo "$entry" | jq -r '.task_id // ""')
        local status=$(echo "$entry" | jq -r '.status // ""')
        
        # Apply filters
        [[ -n "$filter_task" && "$task_id" != "$filter_task" ]] && continue
        [[ -n "$filter_status" && "$status" != "$filter_status" ]] && continue
        
        local cmd_id=$(echo "$entry" | jq -r '.id')
        local command=$(echo "$entry" | jq -r '.command')
        local desc=$(echo "$entry" | jq -r '.description // ""')
        local timestamp=$(echo "$entry" | jq -r '.timestamp')
        local duration=$(echo "$entry" | jq -r '.duration_seconds // 0')
        local exit_code=$(echo "$entry" | jq -r '.exit_code // 0')
        local output=$(echo "$entry" | jq -r '.output // ""')
        
        local status_icon="${GREEN}✓${NC}"
        [[ "$status" == "failed" ]] && status_icon="${RED}✗${NC}"
        [[ "$status" == "running" ]] && status_icon="${BLUE}▶${NC}"
        
        echo -e "$status_icon [$timestamp] ${MAGENTA}$task_id${NC} | ${command}"
        [[ -n "$desc" ]] && echo -e "    ${CYAN}Description:${NC} $desc"
        echo -e "    ${BLUE}Duration:${NC} ${duration}s | ${BLUE}Exit:${NC} $exit_code"
        [[ -n "$output" && "$output" != "null" && "$output" != "(dry run)" ]] && echo -e "    ${YELLOW}Output:${NC} ${output:0:200}${output:200:+...}"
        echo ""
    done
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
}

# Show audit summary
show_audit_summary() {
    init_files
    
    if [[ ! -f "$LOG_FILE" ]]; then
        log_warn "No command log found"
        return 0
    fi
    
    local total_commands=0
    local successful=0
    local failed=0
    local total_duration=0
    local tasks_touched=()
    
    while IFS= read -r line; do
        [[ -z "$line" ]] && continue
        ((total_commands++))
        
        local status=$(echo "$line" | jq -r '.status // ""')
        local duration=$(echo "$line" | jq -r '.duration_seconds // 0')
        local task_id=$(echo "$line" | jq -r '.task_id // ""')
        local exit_code=$(echo "$line" | jq -r '.exit_code // 0')
        
        [[ "$status" == "completed" ]] && ((successful++))
        [[ "$status" == "failed" ]] && ((failed++))
        total_duration=$(awk -v t="$total_duration" -v d="$duration" 'BEGIN {print t + d}')
        tasks_touched+=("$task_id")
    done < "$LOG_FILE"
    
    # Unique tasks
    local unique_tasks=$(printf '%s\n' "${tasks_touched[@]}" | sort -u | wc -l)
    
    echo ""
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}                      AUDIT SUMMARY                             ${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    printf "  ${GREEN}Total Commands:${NC}     %d\n" "$total_commands"
    printf "  ${GREEN}Successful:${NC}          %d\n" "$successful"
    printf "  ${RED}Failed:${NC}              %d\n" "$failed"
    printf "  ${BLUE}Total Duration:${NC}      %.2fs\n" "$total_duration"
    printf "  ${MAGENTA}Tasks Touched:${NC}       %d\n" "$unique_tasks"
    echo ""
    
    # Commands per task
    echo -e "${CYAN}Commands per Task:${NC}"
    printf '%s\n' "${tasks_touched[@]}" | sort | uniq -c | sort -rn | while read count task; do
        printf "  %s: %d commands\n" "$task" "$count"
    done
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
}

# Export audit log to various formats
export_audit_log() {
    local format="${1:-json}"
    local output_file="${2:-$TASKMASTER_DIR/audit_$(date +%Y%m%d_%H%M%S).$format}"
    
    init_files
    
    if [[ ! -f "$LOG_FILE" ]]; then
        log_warn "No command log found"
        return 0
    fi
    
    case "$format" in
        "json")
            # Convert JSONL to JSON array
            jq -s '.' "$LOG_FILE" > "$output_file"
            ;;
        "csv")
            echo "id,task_id,command,description,timestamp,status,duration_seconds,exit_code,output" > "$output_file"
            while IFS= read -r line; do
                [[ -z "$line" ]] && continue
                local id=$(echo "$line" | jq -r '.id')
                local task_id=$(echo "$line" | jq -r '.task_id')
                local command=$(echo "$line" | jq -r '.command' | sed 's/"/""/g')
                local desc=$(echo "$line" | jq -r '.description // ""' | sed 's/"/""/g')
                local timestamp=$(echo "$line" | jq -r '.timestamp')
                local status=$(echo "$line" | jq -r '.status')
                local duration=$(echo "$line" | jq -r '.duration_seconds // 0')
                local exit_code=$(echo "$line" | jq -r '.exit_code // 0')
                local output=$(echo "$line" | jq -r '.output // ""' | sed 's/"/""/g' | sed ':a;N;s/\n/\\n/g;ta')
                echo "\"$id\",\"$task_id\",\"$command\",\"$desc\",\"$timestamp\",\"$status\",$duration,$exit_code,\"$output\"" >> "$output_file"
            done < "$LOG_FILE"
            ;;
        "markdown"|"md")
            echo "# Command Audit Log" > "$output_file"
            echo "" >> "$output_file"
            echo "Generated: $(get_timestamp)" >> "$output_file"
            echo "" >> "$output_file"
            echo "| Time | Task | Command | Status | Duration | Exit Code |" >> "$output_file"
            echo "|------|------|---------|--------|----------|-----------|" >> "$output_file"
            while IFS= read -r line; do
                [[ -z "$line" ]] && continue
                local timestamp=$(echo "$line" | jq -r '.timestamp')
                local task_id=$(echo "$line" | jq -r '.task_id')
                local command=$(echo "$line" | jq -r '.command' | sed 's/|/\\|/g')
                local status=$(echo "$line" | jq -r '.status')
                local duration=$(echo "$line" | jq -r '.duration_seconds // 0')
                local exit_code=$(echo "$line" | jq -r '.exit_code // 0')
                local status_md="$status"
                [[ "$status" == "completed" ]] && status_md="✓"
                [[ "$status" == "failed" ]] && status_md="✗"
                [[ "$status" == "running" ]] && status_md="▶"
                echo "| $timestamp | $task_id | $command | $status_md | ${duration}s | $exit_code |" >> "$output_file"
            done < "$LOG_FILE"
            ;;
        *)
            log_error "Unknown format: $format (supported: json, csv, md)"
            return 1
            ;;
    esac
    
    log_info "Audit log exported to: $output_file ($format)"
}

# Clean old logs
clean_logs() {
    local days="${1:-30}"
    
    init_files
    
    log_step "Cleaning logs older than $days days"
    
    # For JSONL, we'd need to parse timestamps - simplified version
    # In practice, you'd filter by timestamp
    local log_size=$(wc -l < "$LOG_FILE" 2>/dev/null || echo 0)
    
    if [[ $log_size -gt 10000 ]]; then
        # Keep last 5000 lines
        tail -5000 "$LOG_FILE" > "$LOG_FILE.tmp" && mv "$LOG_FILE.tmp" "$LOG_FILE"
        log_info "Trimmed command log from $log_size to 5000 lines"
    fi
}

# =============================================================================
# MAIN COMMAND INTERFACE
# =============================================================================

# Show help
show_help() {
    cat << HELP_EOF
${CYAN}═══════════════════════════════════════════════════════════════${NC}
${CYAN}                    TASKMASTER.SH - HELP                        ${NC}
${CYAN}═══════════════════════════════════════════════════════════════${NC}

${GREEN}USAGE:${NC}
    taskmaster.sh <command> [arguments...]

${GREEN}TASK MANAGEMENT:${NC}
    ${MAGENTA}add${NC} <title> [description] [parent_id]
        Add a new task. Returns task ID.
        
    ${MAGENTA}list${NC} [filter] [--compact]
        List all tasks. Filters: all, pending, completed, current
        
    ${MAGENTA}show${NC} <task_id>
        Show detailed view of a task.
        
    ${MAGENTA}update${NC} <task_id> <field> <value>
        Update a task field (status, title, description).
        
    ${MAGENTA}delete${NC} <task_id>
        Delete a task and its subtasks.

${GREEN}TASK DECOMPOSITION:${NC}
    ${MAGENTA}decompose${NC} <task_id> [subtask1] [subtask2] ...
        Decompose a task into subtasks. Interactive if no subtasks given.
        
    ${MAGENTA}auto-decompose${NC} <task_id> [max_subtasks]
        Auto-decompose using heuristics (default: 5 subtasks).
        
    ${MAGENTA}decompose-all${NC} [max_depth]
        Auto-decompose all pending tasks (default depth: 3).

${GREEN}EXECUTION TRACKING:${NC}
    ${MAGENTA}execute${NC} <task_id> <command> [description]
        Execute a command with full tracking.
        
    ${MAGENTA}sequence${NC} <task_id> <cmd1|desc1> [cmd2|desc2] ...
        Execute multiple commands in sequence.
        
    ${MAGENTA}interactive${NC} <task_id>
        Interactive step-by-step execution.
        
    ${MAGENTA}watch${NC} [interval_seconds]
        Continuously display task progress (default: 2s).
        
    ${MAGENTA}history${NC} <task_id>
        Show execution history for a task.

${GREEN}PERSISTENCE & RESUME:${NC}
    ${MAGENTA}resume${NC}
        Resume from last saved state, returns next task ID.
        
    ${MAGENTA}next${NC}
        Get next pending task ID.
        
    ${MAGENTA}advance${NC}
        Manually advance to next task.
        
    ${MAGENTA}save-state${NC} [task_index]
        Save current state for resume.
        
    ${MAGENTA}export${NC} [output_file]
        Export all tasks, state, and logs to JSON.
        
    ${MAGENTA}import${NC} <input_file>
        Import tasks from JSON export.
        
    ${MAGENTA}create-resume-script${NC} [output_file]
        Create a shell script to resume next session.
        
    ${MAGENTA}save-group${NC} [group_name]
        Save current task grouping for next session.

${GREEN}AUDIT & LOGGING:${NC}
    ${MAGENTA}log${NC} [task_id] [status] [limit]
        Show command audit log (default: last 50).
        
    ${MAGENTA}audit${NC}
        Show audit summary statistics.
        
    ${MAGENTA}export-log${NC} <format> [output_file]
        Export audit log. Formats: json, csv, md.
        
    ${MAGENTA}clean-logs${NC} [days]
        Clean old log entries (default: 30 days).

${GREEN}ENVIRONMENT VARIABLES:${NC}
    TASKMASTER_DIR    Directory for task data (default: ~/.taskmaster)
    TASK_FILE         Task JSON file (default: \$TASKMASTER_DIR/tasks.json)
    LOG_FILE          Command log file (default: \$TASKMASTER_DIR/command_log.jsonl)
    STATE_FILE        State file (default: \$TASKMASTER_DIR/state.json)
    SUBTASK_DEPTH     Max subtask depth (default: 3)
    VERBOSE           Enable verbose output (default: true)
    DRY_RUN           Dry run mode (default: false)

${GREEN}EXAMPLES:${NC}
    # Create a project task and decompose it
    taskmaster.sh add "Build Android APK" "No-Gradle build system"
    taskmaster.sh auto-decompose <task_id>
    
    # Execute with tracking
    taskmaster.sh sequence <task_id> "mkdir -p build" "Setup build dir" "javac src/*.java" "Compile Java"
    
    # Resume workflow
    taskmaster.sh resume
    taskmaster.sh interactive <task_id>
    
    # View everything
    taskmaster.sh list
    taskmaster.sh log
    taskmaster.sh audit
    taskmaster.sh watch 5

${CYAN}═══════════════════════════════════════════════════════════════${NC}
HELP_EOF
}

# Update task field
update_task() {
    local task_id="$1"
    local field="$2"
    local value="$3"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    local task=$(echo "$tasks_json" | jq --arg id "$task_id" '.[] | select(.id == $id)')
    
    if [[ -z "$task" ]]; then
        log_error "Task not found: $task_id"
        return 1
    fi
    
    local updated_tasks=$(echo "$tasks_json" | jq --arg id "$task_id" --arg field "$field" --arg value "$value" '
        map(if .id == $id then .[$field] = $value | .updated_at = now else . end)
    ')
    echo "$updated_tasks" > "$TASK_FILE"
    
    log_info "Updated task $task_id: $field = $value"
}

# Delete task
delete_task() {
    local task_id="$1"
    
    init_files
    
    local tasks_json=$(cat "$TASK_FILE")
    
    # Find all descendant tasks to delete
    local to_delete=("$task_id")
    local found=true
    
    while [[ "$found" == "true" ]]; do
        found=false
        local current_count=${#to_delete[@]}
        for ((i=0; i<current_count; i++)); do
            local pid="${to_delete[$i]}"
            local children=$(echo "$tasks_json" | jq --arg pid "$pid" '[.[] | select(.parent_id == $pid) | .id]')
            local child_count=$(echo "$children" | jq 'length')
            for ((j=0; j<child_count; j++)); do
                local cid=$(echo "$children" | jq -r ".[$j]")
                to_delete+=("$cid")
                found=true
            done
        done
    done
    
    # Remove from task list
    for tid in "${to_delete[@]}"; do
        tasks_json=$(echo "$tasks_json" | jq --arg id "$tid" 'map(select(.id != $id))')
    done
    
    # Remove from parent's subtasks
    for tid in "${to_delete[@]}"; do
        tasks_json=$(echo "$tasks_json" | jq --arg id "$tid" '
            map(.subtasks = (.subtasks | map(select(.id != $id))))
        ')
    done
    
    echo "$tasks_json" > "$TASK_FILE"
    log_info "Deleted task $task_id and ${#to_delete[@]} total tasks"
}

# Wrapper functions for external use (without taskmaster_ prefix)
taskmaster_add() { add_task "$@"; }
taskmaster_list() { display_tasks "$@"; }
taskmaster_show() { display_task_detail "$@"; }
taskmaster_update() { update_task "$@"; }
taskmaster_delete() { delete_task "$@"; }
taskmaster_decompose() { decompose_task "$@"; }
taskmaster_auto_decompose() { auto_decompose_task "$@"; }
taskmaster_decompose_all() { decompose_all_pending "$@"; }
taskmaster_execute() { execute_tracked "$@"; }
taskmaster_sequence() { execute_task_sequence "$@"; }
taskmaster_interactive() { execute_interactive "$@"; }
taskmaster_watch() { watch_tasks "$@"; }
taskmaster_history() { show_execution_history "$@"; }
taskmaster_resume() { resume; }
taskmaster_next() { get_next_task; }
taskmaster_advance() { advance_task; }
taskmaster_save_state() { save_state "$@"; }
taskmaster_export() { export_tasks "$@"; }
taskmaster_import() { import_tasks "$@"; }
taskmaster_create_resume_script() { create_resume_script "$@"; }
taskmaster_save_group() { save_task_grouping "$@"; }
taskmaster_log() { show_command_log "$@"; }
taskmaster_audit() { show_audit_summary; }
taskmaster_export_log() { export_audit_log "$@"; }
taskmaster_clean_logs() { clean_logs "$@"; }
taskmaster_help() { show_help; }

# Main entry point
main() {
    local command="${1:-help}"
    shift || true
    
    case "$command" in
        add) add_task "$@" ;;
        list) display_tasks "$@" ;;
        show) display_task_detail "$@" ;;
        update) update_task "$@" ;;
        delete) delete_task "$@" ;;
        decompose) decompose_task "$@" ;;
        auto-decompose) auto_decompose_task "$@" ;;
        decompose-all) decompose_all_pending "$@" ;;
        execute) execute_tracked "$@" ;;
        sequence) execute_task_sequence "$@" ;;
        interactive) execute_interactive "$@" ;;
        watch) watch_tasks "$@" ;;
        history) show_execution_history "$@" ;;
        resume) resume ;;
        next) get_next_task ;;
        advance) advance_task ;;
        save-state) save_state "$@" ;;
        export) export_tasks "$@" ;;
        import) import_tasks "$@" ;;
        create-resume-script) create_resume_script "$@" ;;
        save-group) save_task_grouping "$@" ;;
        log) show_command_log "$@" ;;
        audit) show_audit_summary ;;
        export-log) export_audit_log "$@" ;;
        clean-logs) clean_logs "$@" ;;
        help|--help|-h) show_help ;;
        *)
            log_error "Unknown command: $command"
            show_help
            exit 1
            ;;
    esac
}

# Run main if not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
