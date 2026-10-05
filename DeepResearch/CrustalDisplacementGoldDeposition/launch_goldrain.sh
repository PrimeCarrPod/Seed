#!/bin/bash
# GoldRain Project Launcher - Starts worker + watchdog background processes

PROJECT_DIR="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_1bb70db6-171e-4e18-88b3-4b53a713af1e/DeepResearch/CrustalDisplacementGoldDeposition"
cd "$PROJECT_DIR"

echo "🌧️  GOLDRAIN PROJECT LAUNCHER"
echo "=============================="
echo "Branch: GoldRain"
echo "Project: CrustalDisplacementGoldDeposition"
echo "Target: 16 Documents"
echo ""

# Kill any existing processes
pkill -f "progress_tracker.py" 2>/dev/null

# Start watchdog (monitors worker)
echo "👁️  Starting Watchdog..."
python3 progress_tracker.py watchdog &
WATCHDOG_PID=$!
echo "   Watchdog PID: $WATCHDOG_PID"

# Give watchdog a moment
sleep 2

# Start worker (does actual research)
echo "🔬 Starting Worker..."
python3 progress_tracker.py worker &
WORKER_PID=$!
echo "   Worker PID: $WORKER_PID"

echo ""
echo "✅ Both processes launched!"
echo "   Watchdog: $WATCHDOG_PID (monitors worker, restarts if dead)"
echo "   Worker:   $WORKER_PID (executes 16-document research)"
echo ""
echo "📊 Check status anytime: python3 progress_tracker.py status"
echo "🛑 Stop all: pkill -f progress_tracker.py"
echo ""
echo "Let it rain gold! ☔🌧️💰"

# Keep script alive to show output
wait $WATCHDOG_PID $WORKER_PID