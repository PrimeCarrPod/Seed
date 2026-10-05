#!/bin/bash
# Ping-Pong Heartbeat Daemon - alternating with main heartbeat
WORKDIR="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_40ef287c-adaf-47da-9d86-5be57b7c5d88/CSM_WORK_IN_PROGRESS"
PING_FILE="$WORKDIR/heartbeat-ping.log"
PONG_FILE="$WORKDIR/heartbeat-pong.log"
LOG_FILE="$WORKDIR/pingpong-daemon.log"

echo "[PINGPONG-DAEMON] Started at $(date -u) | PID: $$" >> "$LOG_FILE"

CYCLE=0
while true; do
    CYCLE=$((CYCLE + 1))
    
    # Write PING
    echo "$(date -u) | CYCLE:$CYCLE | PING | PID:$$ | Docs:$(find "$WORKDIR/DeepResearch/SubParticlesV4" -name "*.md" 2>/dev/null | wc -l)" > "$PING_FILE"
    
    # Write PONG
    echo "$(date -u) | CYCLE:$CYCLE | PONG | PID:$$ | Git:$(cd "$WORKDIR/../.." && git rev-parse --short HEAD 2>/dev/null)" > "$PONG_FILE"
    
    # Log activity
    echo "[PINGPONG] $(date -u) | CYCLE#$CYCLE | PING/PONG" >> "$LOG_FILE"
    
    sleep 15  # Faster ping-pong cycle
done
