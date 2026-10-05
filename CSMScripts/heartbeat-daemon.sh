#!/usr/bin/env bash
# HEARTBEAT DAEMON — Continuous session liveness indicator
# Runs in background, prints tiny chars to stderr for visible feedback
# Also writes heartbeat file for external monitoring

set -euo pipefail

HEARTBEAT_FILE="${HEARTBEAT_FILE:-CSMScripts/.heartbeat}"
HEARTBEAT_INTERVAL="${HEARTBEAT_INTERVAL:-1}"
HEARTBEAT_CHARS="${HEARTBEAT_CHARS:-♥♦♣♠}"
LOG_FILE="${LOG_FILE:-CSMScripts/heartbeat.log}"

mkdir -p "$(dirname "$HEARTBEAT_FILE")"
mkdir -p "$(dirname "$LOG_FILE")"

echo "[HEARTBEAT] Started at $(date -u) | PID: $$ | Interval: ${HEARTBEAT_INTERVAL}s" >> "$LOG_FILE"

# Trap signals for clean shutdown
cleanup() {
    echo "[HEARTBEAT] Stopping at $(date -u)" >> "$LOG_FILE"
    echo "[HEARTBEAT] SHUTDOWN — $(date -u)" > "$HEARTBEAT_FILE"
    # Print newline to clean up terminal
    echo "" >&2
    exit 0
}
trap cleanup SIGTERM SIGINT EXIT

# Print tiny heartbeat character to stderr (visible but non-intrusive)
print_beat() {
    local idx=$((SECONDS / HEARTBEAT_INTERVAL % ${#HEARTBEAT_CHARS}))
    local char="${HEARTBEAT_CHARS:$idx:1}"
    printf "%s" "$char" >&2
}

# Main loop
SECONDS=0
print_beat

while true; do
    sleep "$HEARTBEAT_INTERVAL"
    
    # Write heartbeat file
    echo "$(date -u) | PID: $$ | Alive: ${SECONDS}s" > "$HEARTBEAT_FILE"
    
    # Print visible heartbeat character
    print_beat
    
    # Log every 60 seconds
    if (( SECONDS % 60 == 0 )); then
        echo "[HEARTBEAT] $(date -u) | Alive: ${SECONDS}s | Char: ${HEARTBEAT_CHARS:$((SECONDS / HEARTBEAT_INTERVAL % ${#HEARTBEAT_CHARS})):1}" >> "$LOG_FILE"
    fi
done