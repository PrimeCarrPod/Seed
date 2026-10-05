#!/bin/bash
# Heartbeat Monitor for Legal Acts 06, 08, 09, 10
# Author: Jason Isaac Brodsky (California 1976) — Conducier
# Four-chambered heartbeat: Input, Processing, Quality, Output

set -e

PROJECT_DIR="CSM_WIP/LegalActs_06_08_09_10"
LOG_DIR="${PROJECT_DIR}/logs"
HEARTBEAT_LOG="${LOG_DIR}/heartbeat_$(date -u +%Y%m%d-%H%M%S).log"
CHAMBER_DIR="${PROJECT_DIR}/.chambers"
SESSION_ID="legal_acts_06_08_09_10"

# Chamber files
CHAMBER_1="${CHAMBER_DIR}/.chamber_1_beat"  # Right Atrium (Input)
CHAMBER_2="${CHAMBER_DIR}/.chamber_2_beat"  # Right Ventricle (Processing)
CHAMBER_3="${CHAMBER_DIR}/.chamber_3_beat"  # Left Atrium (Quality)
CHAMBER_4="${CHAMBER_DIR}/.chamber_4_beat"  # Left Ventricle (Output)

init_heartbeat() {
    mkdir -p "$LOG_DIR" "$CHAMBER_DIR"
    
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) INIT Legal Acts 06-10 heartbeat started" > "$HEARTBEAT_LOG"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) INIT" > "$CHAMBER_1"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) INIT" > "$CHAMBER_2"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) INIT" > "$CHAMBER_3"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) INIT" > "$CHAMBER_4"
    
    echo "[$(date -u +%H:%M:%S)] Heartbeat initialized — 4 chambers active"
}

chamber_beat() {
    local chamber_num="$1"
    local status="$2"
    local message="$3"
    local chamber_file="${CHAMBER_DIR}/.chamber_${chamber_num}_beat"
    
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) ${status} ${message}" >> "$chamber_file"
    echo "[$(date -u +%H:%M:%S)] Chamber ${chamber_num}: ${status} — ${message}"
}

log_progress() {
    local message="$1"
    echo "[$(date -u +%H:%M:%S)] ${message}" | tee -a "$HEARTBEAT_LOG"
}

show_status() {
    echo ""
    echo "=== HEARTBEAT STATUS — Legal Acts 06-10 ==="
    echo "Session: $SESSION_ID"
    echo "Time: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo ""
    for i in 1 2 3 4; do
        local chamber_file="${CHAMBER_DIR}/.chamber_${i}_beat"
        if [[ -f "$chamber_file" ]]; then
            local last_beat=$(tail -1 "$chamber_file" 2>/dev/null || echo "NONE")
            echo "Chamber $i: $last_beat"
        else
            echo "Chamber $i: INACTIVE"
        fi
    done
    echo ""
}

# Command dispatch
case "${1:-init}" in
    init)
        init_heartbeat
        ;;
    beat)
        chamber_beat "$2" "$3" "$4"
        ;;
    log)
        log_progress "$2"
        ;;
    status)
        show_status
        ;;
    *)
        echo "Usage: ./heartbeat.sh <init|beat|log|status> [args]"
        echo "  init — Initialize heartbeat chambers"
        echo "  beat <chamber> <status> <message> — Record chamber beat"
        echo "  log <message> — Log progress message"
        echo "  status — Show current chamber status"
        ;;
esac
