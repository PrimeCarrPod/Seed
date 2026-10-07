#!/bin/bash
# Ping-Pong Heartbeat Daemon - alternating with main heartbeat
WORKDIR="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/worktrees/worktree_0511c36f-90d5-442d-a000-4eac7a6aeaea/CSMWip/SubAtomicPrimeElectronCaldera/SubAtomic.Edu/SubParticlesV4"
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
