#!/usr/bin/env bash
# Heartbeat writer - writes timestamp to CSMLogs/heartbeat/YYYY-MM-DD/ every 30 seconds

HEARTBEAT_DIR="CSMLogs/heartbeat/$(date -u +%Y-%m-%d)"
mkdir -p "$HEARTBEAT_DIR"

while true; do
    TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    echo "$TIMESTAMP - Agent active - Working on index_v4.html merge" > "$HEARTBEAT_DIR/heartbeat_$(date -u +%H%M%S).log"
    sleep 30
done