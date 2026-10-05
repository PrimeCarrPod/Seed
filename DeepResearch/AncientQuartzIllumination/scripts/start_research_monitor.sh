#!/usr/bin/env bash
# START RESEARCH MONITOR — Launches the four-chambered heartbeat and document generators

set -euo pipefail

PROJECT_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_4e5d16c7-e9f0-4877-897a-6766bcef77f1/DeepResearch/AncientQuartzIllumination"
MONITOR_DIR="${PROJECT_ROOT}/monitoring"
SCRIPTS_DIR="${PROJECT_ROOT}/scripts"
PARTS_DIR="${PROJECT_ROOT}/parts"

mkdir -p "${MONITOR_DIR}" "${SCRIPTS_DIR}" "${PARTS_DIR}"

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${MAGENTA}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${MAGENTA}  ANCIENT QUARTZ ILLUMINATION — RESEARCH MONITOR LAUNCHER${NC}"
echo -e "${MAGENTA}═══════════════════════════════════════════════════════════════${NC}"

# Start the four-chambered heartbeat in background
echo -e "${CYAN}Starting Four-Chambered Heartbeat...${NC}"
nohup "${MONITOR_DIR}/four_chambered_heartbeat.sh" > "${MONITOR_DIR}/heartbeat_main.log" 2>&1 &
HEARTBEAT_PID=$!
echo $HEARTBEAT_PID > "${MONITOR_DIR}/heartbeat.pid"
echo -e "${GREEN}Heartbeat started (PID: $HEARTBEAT_PID)${NC}"

# Start document generation workers (4 parallel workers)
echo -e "${CYAN}Starting Document Generation Workers...${NC}"

for worker in 1 2 3 4; do
    nohup "${SCRIPTS_DIR}/generate_part_worker.sh" $worker > "${MONITOR_DIR}/worker_${worker}.log" 2>&1 &
    WORKER_PID=$!
    echo $WORKER_PID > "${MONITOR_DIR}/worker_${worker}.pid"
    echo -e "${GREEN}Worker $worker started (PID: $WORKER_PID)${NC}"
    sleep 1
done

echo -e "${MAGENTA}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}All monitors and workers launched successfully!${NC}"
echo -e "${CYAN}Monitor logs: ${MONITOR_DIR}/${NC}"
echo -e "${CYAN}Heartbeat PID: $(cat ${MONITOR_DIR}/heartbeat.pid)${NC}"
echo -e "${CYAN}Worker PIDs: $(cat ${MONITOR_DIR}/worker_*.pid 2>/dev/null | tr '\n' ' ')${NC}"
echo -e "${MAGENTA}═══════════════════════════════════════════════════════════════${NC}"

# Show status
sleep 3
echo -e "\n${CYAN}Current Status:${NC}"
"${MONITOR_DIR}/four_chambered_heartbeat.sh" --status 2>/dev/null || true
