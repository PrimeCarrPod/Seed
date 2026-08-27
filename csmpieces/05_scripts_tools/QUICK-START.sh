#!/usr/bin/env bash
# ============================================================
# QUICK-START.sh — One-line launcher for SubParticles V4/V5
# Run: bash QUICK-START.sh
# ============================================================

set -euo pipefail

REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_1474395b-daea-4849-ad09-b4ee4163c318"
cd "$REPO_ROOT"

# Start all three heartbeat modes
bash CSMScripts/earthbeatv3.sh chamber &
bash CSMScripts/earthbeatv3.sh parallel 4 &
bash CSMScripts/earthbeatv3.sh tokenring 8 &

# Show project status
./MASTER-RESUME.sh index

echo ""
echo "✅ All heartbeats started. Project ready for multi-agent work."
echo "📋 Run './MASTER-RESUME.sh work' for agent assignments"
echo "📋 Run './MASTER-RESUME.sh photon12' to edit Part 12 (Spectroscopy)"
echo "📋 Run './MASTER-RESUME.sh photon13' to edit Part 13 (Quantum Optics)"
echo "📋 Run './MASTER-RESUME.sh photon14' to edit Part 14 (Synthesis)"