#!/bin/bash
# heartbeat.sh — TGE_E2 Session Heartbeat Logging
# Logs session state with prime engine status

LOG_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E2/logs"
mkdir -p "$LOG_DIR"

TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
MESSAGE="${1:-Heartbeat}"

cat >> "$LOG_DIR/heartbeat_$(date -u +%Y%m%d).log" <<EOF
[$TIMESTAMP] TGE_E2: $MESSAGE
EOF

# Also log to CSMLogs
CSM_LOG_DIR="/workspace/app/CSMLogs"
mkdir -p "$CSM_LOG_DIR"
echo "[$TIMESTAMP] TGE_E2: $MESSAGE" >> "$CSM_LOG_DIR/tge_e2_heartbeat.log"

echo "Heartbeat logged: $MESSAGE"