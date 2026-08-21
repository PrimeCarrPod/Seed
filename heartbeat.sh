#!/usr/bin/env bash
# Heartbeat logger - call after every command: hb "command description" "status" "details"

HEARTBEAT_DIR="CSMLogs/heartbeat/$(date -u +%Y-%m-%d)"
mkdir -p "$HEARTBEAT_DIR"
HEARTBEAT_FILE="$HEARTBEAT_DIR/heartbeat_$(date -u +%Y%m%d).log"

hb() {
    local cmd="$1"
    local status="${2:-OK}"
    local details="${3:-}"
    local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    echo "[$timestamp] CMD: $cmd | STATUS: $status | DETAILS: $details" >> "$HEARTBEAT_FILE"
}

# If called with args, log once and exit
if [[ $# -gt 0 ]]; then
    hb "$@"
    exit 0
fi

# Otherwise run continuous heartbeat
while true; do
    hb "HEARTBEAT" "ALIVE" "Background heartbeat"
    sleep 30
done