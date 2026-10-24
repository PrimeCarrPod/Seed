#!/usr/bin/env bash
# startup.sh — CSMMinesMagnets Session Initialization
# Installs Python3, sets project directory, starts heartbeat

set -euo pipefail

# ============================================================
# HARD-CODED PROJECT DIRECTORY (relative, not absolute)
# ============================================================
PROJECT_DIR="CSMWip/CSMMinesMagnets"
PROJECT_ROOT="/workspace/app/$PROJECT_DIR"

echo "=== CSMMinesMagnets Session Startup ==="
echo "Project directory: $PROJECT_DIR"
echo "Project root: $PROJECT_ROOT"

# ============================================================
# 1. ENSURE PYTHON3 INSTALLED (Debian minimal container)
# ============================================================
if ! command -v python3 >/dev/null 2>&1; then
    echo "Installing Python3..."
    apt-get update && apt-get install -y python3 python3-pip python3-venv
    echo "Python3 installed: $(python3 --version)"
else
    echo "Python3 already available: $(python3 --version)"
fi

# ============================================================
# 2. VERIFY PROJECT DIRECTORY EXISTS
# ============================================================
if [[ ! -d "$PROJECT_ROOT" ]]; then
    echo "ERROR: Project directory not found: $PROJECT_ROOT" >&2
    exit 1
fi

cd "$PROJECT_ROOT"
echo "Changed to project directory: $(pwd)"

# ============================================================
# 3. VERIFY WRITE_LARGE_FILE.PY AVAILABLE
# ============================================================
WRITE_TOOL="../../__Python_Tools/write_large_file.py"
if [[ ! -f "$WRITE_TOOL" ]]; then
    echo "WARNING: write_large_file.py not found at $WRITE_TOOL"
else
    echo "write_large_file.py verified at $WRITE_TOOL"
    python3 "$WRITE_TOOL" --help >/dev/null 2>&1 && echo "write_large_file.py operational"
fi

# ============================================================
# 4. VERIFY SCRIPTS
# ============================================================
for script in heartbeat_monitor.py task_timer.py generate_heuristic_intros.sh; do
    if [[ -f "scripts/$script" ]]; then
        echo "Script verified: scripts/$script"
    else
        echo "WARNING: Missing script: scripts/$script"
    fi
done

# ============================================================
# 5. GIT STATUS
# ============================================================
echo ""
echo "=== Git Status ==="
git status --short

# ============================================================
# 6. START HEARTBEAT MONITOR (background)
# ============================================================
echo ""
echo "=== Starting Heartbeat Monitor (120s interval) ==="
python3 scripts/heartbeat_monitor.py --interval 120 --project-root . &
HEARTBEAT_PID=$!
echo "Heartbeat monitor PID: $HEARTBEAT_PID"
echo "HEARTBEAT_PID=$HEARTBEAT_PID" > .heartbeat_pid

# ============================================================
# 7. DISPLAY RESUME CONTEXT
# ============================================================
echo ""
echo "=== Session Resume Context ==="
cat RESUME_SESSION_MAGNETS.md

echo ""
echo "=== Next Runner Instructions ==="
cat NEXT_runner_005.md

# ============================================================
# 8. PROGRESS MARKER - DOC-08 Chapter 1 Research Complete
# ============================================================
echo ""
echo "=== Progress Marker ==="
echo "DOC-08 Chapter 1 (Port Infrastructure Capability) Research: COMPLETE"
echo "  - Puerto Antofagasta (EMPORCHA): capacity, berths, REE handling ✓"
echo "  - Puerto Mejillones: deep water bulk terminals, TGN US$120M expansion ✓"
echo "  - Puerto San Antonio: container capabilities, Puerto Exterior US$4B project ✓"
echo "  - Puerto Coronel: forest/bulk operations, most productive port in Chile ✓"
echo "  - Puerto Punta Arenas: austral gateway, US$85M expansion, Antarctic logistics ✓"
echo "  - EMPORCHI: Law 19.542 (1997) created 10 autonomous state port companies ✓"
echo "Next Action: Write Chapter 1 - Port Infrastructure Capability"
echo "Target: ≥900 lines, 9 chapters total for DOC-08"

echo ""
echo "=== Session Ready ==="
echo "Working directory: $(pwd)"
echo "Heartbeat PID: $HEARTBEAT_PID (saved to .heartbeat_pid)"
echo ""
echo "To stop heartbeat: kill \$(cat .heartbeat_pid)"
echo "To resume: cd $PROJECT_DIR && bash startup.sh"
