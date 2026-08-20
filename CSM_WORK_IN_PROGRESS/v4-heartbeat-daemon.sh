#!/bin/bash
# CSM SubParticlesV4 Work In Progress — Heartbeat Daemon
# Tracks progress of V4 creation, writes heartbeat every 30 seconds

WORKDIR="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_40ef287c-adaf-47da-9d86-5be57b7c5d88/CSM_WORK_IN_PROGRESS"
HEARTBEAT_FILE="$WORKDIR/heartbeat.log"
PROGRESS_FILE="$WORKDIR/progress.json"
LOG_FILE="$WORKDIR/daemon.log"

echo "[V4-DAEMON] Started at $(date -u) | PID: $$" >> "$LOG_FILE"

# Initialize progress tracking
cat > "$PROGRESS_FILE" <<'EOF'
{
  "phase": 1,
  "phase_name": "Glueball V4.0 Parts 11-14",
  "parts_completed": 10,
  "parts_total": 14,
  "documents_created": 0,
  "documents_target": 526,
  "start_time": "'$(date -u)'",
  "last_update": "'$(date -u)'"
}
EOF

while true; do
    # Update heartbeat
    echo "$(date -u) | PID: $$ | Phase: $(cat $PROGRESS_FILE | grep -o '"phase": [0-9]*' | cut -d' ' -f2) | Docs: $(cat $PROGRESS_FILE | grep -o '"documents_created": [0-9]*' | cut -d' ' -f2)/$(cat $PROGRESS_FILE | grep -o '"documents_target": [0-9]*' | cut -d' ' -f2)" > "$HEARTBEAT_FILE"
    
    # Count actual documents created
    DOC_COUNT=$(find "$WORKDIR/DeepResearch/SubParticlesV4" -name "*.md" 2>/dev/null | wc -l)
    
    # Update progress JSON
    cat > "$PROGRESS_FILE" <<EOF
{
  "phase": 1,
  "phase_name": "Glueball V4.0 Parts 11-14",
  "parts_completed": 10,
  "parts_total": 14,
  "documents_created": $DOC_COUNT,
  "documents_target": 526,
  "start_time": "$(cat $PROGRESS_FILE | grep -o '"start_time": "[^"]*"' | cut -d'"' -f4)",
  "last_update": "$(date -u)"
}
EOF
    
    # Log activity
    echo "[V4-DAEMON] $(date -u) | Documents: $DOC_COUNT/526 | Phase 1: Glueball Parts 11-14" >> "$LOG_FILE"
    
    sleep 30
done