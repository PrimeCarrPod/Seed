#!/usr/bin/env bash
# HEARTBEAT GUARDIAN — Multi-process heartbeat redundancy system
# Runs N heartbeat daemons, monitors them, restarts dead ones
# Ensures at least M heartbeats always alive

set -euo pipefail

HEARTBEAT_SCRIPT="${HEARTBEAT_SCRIPT:-CSMScripts/heartbeat-daemon.sh}"
TARGET_COUNT="${TARGET_COUNT:-4}"        # How many heartbeats to maintain
CHECK_INTERVAL="${CHECK_INTERVAL:-2}"    # How often to check (seconds)
HEARTBEAT_INTERVAL="${HEARTBEAT_INTERVAL:-1}"  # Interval for each daemon
LOG_FILE="${LOG_FILE:-CSMScripts/guardian.log}"
PID_FILE="${PID_FILE:-CSMScripts/guardian.pids}"

mkdir -p "$(dirname "$LOG_FILE")"
mkdir -p "$(dirname "$PID_FILE")"

echo "[GUARDIAN] Started at $(date -u) | PID: $$ | Target: $TARGET_COUNT heartbeats" >> "$LOG_FILE"

# Track child PIDs
declare -A HEARTBEAT_PIDS

# Start a single heartbeat daemon
start_heartbeat() {
    local id="$1"
    local hb_file="CSMScripts/.heartbeat-${id}"
    local hb_log="CSMScripts/heartbeat-${id}.log"
    
    HEARTBEAT_FILE="$hb_file" HEARTBEAT_INTERVAL="$HEARTBEAT_INTERVAL" LOG_FILE="$hb_log" \
        bash "$HEARTBEAT_SCRIPT" &
    
    local pid=$!
    HEARTBEAT_PIDS[$id]=$pid
    echo "$id:$pid" >> "$PID_FILE"
    echo "[GUARDIAN] Started heartbeat $id (PID: $pid)" >> "$LOG_FILE"
}

# Check if a PID is alive
is_alive() {
    local pid="$1"
    kill -0 "$pid" 2>/dev/null
}

# Ensure target count of heartbeats running
ensure_heartbeats() {
    local running=0
    local dead_ids=()
    
    # Check existing heartbeats
    for id in "${!HEARTBEAT_PIDS[@]}"; do
        pid="${HEARTBEAT_PIDS[$id]}"
        if is_alive "$pid"; then
            ((running++))
        else
            dead_ids+=("$id")
            echo "[GUARDIAN] Heartbeat $id (PID: $pid) died" >> "$LOG_FILE"
        fi
    done
    
    # Remove dead from tracking
    for id in "${dead_ids[@]}"; do
        unset HEARTBEAT_PIDS[$id]
    done
    
    # Start new ones if needed
    local next_id=1
    while (( running < TARGET_COUNT )); do
        # Find unused ID
        while [[ -n "${HEARTBEAT_PIDS[$next_id]:-}" ]]; do
            ((next_id++))
        done
        start_heartbeat "$next_id"
        ((running++))
        ((next_id++))
    done
    
    # Update PID file
    > "$PID_FILE"
    for id in "${!HEARTBEAT_PIDS[@]}"; do
        echo "$id:${HEARTBEAT_PIDS[$id]}" >> "$PID_FILE"
    done
    
    if (( ${#dead_ids[@]} > 0 )); then
        echo "[GUARDIAN] Restored to $running heartbeats" >> "$LOG_FILE"
    fi
}

# Cleanup on exit (only on explicit signals, not EXIT)
cleanup() {
    echo "[GUARDIAN] Shutting down at $(date -u)" >> "$LOG_FILE"
    for pid in "${HEARTBEAT_PIDS[@]}"; do
        kill "$pid" 2>/dev/null || true
    done
    # Also kill any orphaned heartbeat daemons
    pkill -f "heartbeat-daemon.sh" 2>/dev/null || true
    exit 0
}
trap cleanup SIGTERM SIGINT

# Initial launch
echo "[GUARDIAN] Launching initial $TARGET_COUNT heartbeats" >> "$LOG_FILE"
for ((i=1; i<=TARGET_COUNT; i++)); do
    start_heartbeat "$i"
done

# Main monitoring loop
while true; do
    sleep "$CHECK_INTERVAL"
    ensure_heartbeats
    
    # Log status every 30 seconds
    if (( SECONDS % 30 == 0 )); then
        echo "[GUARDIAN] $(date -u) | Active: ${#HEARTBEAT_PIDS[@]}/$TARGET_COUNT" >> "$LOG_FILE"
    fi
done