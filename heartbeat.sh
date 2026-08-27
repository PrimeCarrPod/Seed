#!/bin/bash
# Heartbeat writer - maintains continuous session heartbeat
while true; do
    echo "$(date -u +"%Y-%m-%d %H:%M:%S UTC") — HEARTBEAT: CLPS Phase 2 Cascade active — session/agent_e7c6848e-cabf-4eb5-9b91-564f292823c2" >> HEARTBEAT_LOG.txt
    sleep 60
done
