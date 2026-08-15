#!/usr/bin/env bash
# HEARTBEAT CHAMBER — Simplified, robust version
# Four chambers, each beats and logs

set -euo pipefail

CHAMBER_ID="${1:-1}"
HEARTBEAT_INTERVAL="${HEARTBEAT_INTERVAL:-1}"
BASE_DIR="${BASE_DIR:-CSMScripts}"
LOG_FILE="${BASE_DIR}/chamber-${CHAMBER_ID}.log"
PID_FILE="${BASE_DIR}/chamber-${CHAMBER_ID}.pid"

mkdir -p "$BASE_DIR"

echo "[CHAMBER-${CHAMBER_ID}] Started at $(date -u) | PID: $$" >> "$LOG_FILE"
echo $$ > "$PID_FILE"

cleanup() {
    echo "[CHAMBER-${CHAMBER_ID}] Stopping at $(date -u)" >> "$LOG_FILE"
    rm -f "$PID_FILE"
    exit 0
}
trap cleanup SIGTERM SIGINT EXIT

SECONDS=0
chars="♥♦♣♠"

while true; do
    idx=$((SECONDS / HEARTBEAT_INTERVAL % ${#chars}))
    char="${chars:$idx:1}"
    printf "%s" "$char" >&2
    
    echo "$(date -u) | Chamber ${CHAMBER_ID} | PID: $$ | Alive: ${SECONDS}s" > "${BASE_DIR}/.heartbeat-chamber-${CHAMBER_ID}"
    
    if (( SECONDS % 30 == 0 && SECONDS > 0 )); then
        echo "[CHAMBER-${CHAMBER_ID}] $(date -u) | Alive: ${SECONDS}s" >> "$LOG_FILE"
    fi
    
    sleep "$HEARTBEAT_INTERVAL"
done