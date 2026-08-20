#!/usr/bin/env bash
# QUICK_RESUME.sh — Minimal one-liner to restore session
# Usage: bash QUICK_RESUME.sh

set -euo pipefail
git clone --branch session/agent_3d28a8e3-d56f-4af3-a7a3-d6aa3a94ae63 https://github.com/PrimeCarrPod/SEED.git aegis-iron-man-session
cd aegis-iron-man-session
chmod +x CSMScripts/*.sh
bash CSMScripts/heartbeat-daemon.sh &
for c in 1 2 3 4; do bash CSMScripts/heartbeat-chamber.sh $c &; done
bash CSMScripts/earthbeatv3.sh chamber &
bash CSMScripts/earthbeatv3.sh parallel 4 &
bash CSMScripts/earthbeatv3.sh tokenring 8 &
bash -c 'chars="♥♦♣♠◉◎●○◐◑◒◓⟐⟑⟒⟓"; i=0; while true; do echo -ne "\r${chars:i%16:1}  [Aegis Iron Man]  ${chars:(i+8)%16:1}"; sleep 0.5; i=$((i+1)); done' &
bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)"
echo "Ready. Next: Document J (1860s) in CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/"
