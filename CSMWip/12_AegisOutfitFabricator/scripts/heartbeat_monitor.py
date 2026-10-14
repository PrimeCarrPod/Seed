#!/usr/bin/env python3
"""
Heartbeat Monitor for AegisOutfitFabricator
Updates terminal every 120 seconds with progress
Monitors subtask execution time (30s guard)
"""

import os
import sys
import time
import json
import signal
import subprocess
from pathlib import Path
from datetime import datetime
from threading import Thread, Event

PROJECT_ROOT = Path(__file__).parent.parent
TODO_FILE = PROJECT_ROOT / "TODO.md"
HEARTBEAT_LOG = PROJECT_ROOT / "Logs/heartbeat.log"
SUBTASK_LOG = PROJECT_ROOT / "Logs/subtask_times.log"

# Ensure log directories exist
HEARTBEAT_LOG.parent.mkdir(parents=True, exist_ok=True)
SUBTASK_LOG.parent.mkdir(parents=True, exist_ok=True)

# Global state
current_subtask = None
subtask_start_time = None
stop_event = Event()
heartbeat_count = 0


def log_heartbeat(message):
    """Log heartbeat message with timestamp"""
    timestamp = datetime.utcnow().isoformat()
    entry = f"[{timestamp}] {message}\n"
    with open(HEARTBEAT_LOG, 'a') as f:
        f.write(entry)
    print(entry.strip())


def log_subtask(subtask_id, duration, status):
    """Log subtask timing"""
    timestamp = datetime.utcnow().isoformat()
    entry = {
        "timestamp": timestamp,
        "subtask": subtask_id,
        "duration_seconds": duration,
        "status": status
    }
    with open(SUBTASK_LOG, 'a') as f:
        f.write(json.dumps(entry) + "\n")


def read_todo_progress():
    """Parse TODO.md for completion stats"""
    if not TODO_FILE.exists():
        return {"total": 0, "completed": 0, "in_progress": 0}

    content = TODO_FILE.read_text()
    total = content.count("- [ ]") + content.count("- [x]")
    completed = content.count("- [x]")
    in_progress = content.count("- [>]")  # Custom marker for in-progress
    return {"total": total, "completed": completed, "in_progress": in_progress}


def get_git_status():
    """Get brief git status"""
    try:
        result = subprocess.run(
            ["git", "status", "--short"],
            cwd=PROJECT_ROOT, capture_output=True, text=True, timeout=5
        )
        lines = result.stdout.strip().split('\n') if result.stdout.strip() else []
        return len(lines)
    except Exception:
        return -1


def heartbeat_loop(interval):
    """Main heartbeat loop"""
    global heartbeat_count, current_subtask, subtask_start_time

    while not stop_event.is_set():
        time.sleep(interval)
        if stop_event.is_set():
            break

        heartbeat_count += 1
        progress = read_todo_progress()
        git_changes = get_git_status()

        # Check subtask timeout
        timeout_msg = ""
        if current_subtask and subtask_start_time:
            elapsed = time.time() - subtask_start_time
            if elapsed > 30:
                timeout_msg = f" ⚠️ SUBTASK TIMEOUT ({elapsed:.0f}s > 30s)"

        msg = (
            f"💓 Heartbeat #{heartbeat_count} | "
            f"Progress: {progress['completed']}/{progress['total']} "
            f"({progress['completed']/progress['total']*100:.1f}%) | "
            f"Git changes: {git_changes} | "
            f"Current: {current_subtask or 'idle'}{timeout_msg}"
        )
        log_heartbeat(msg)


def start_subtask(subtask_id):
    """Mark subtask as started"""
    global current_subtask, subtask_start_time
    if current_subtask:
        # Log previous subtask completion
        elapsed = time.time() - subtask_start_time
        log_subtask(current_subtask, elapsed, "completed")
    current_subtask = subtask_id
    subtask_start_time = time.time()
    log_heartbeat(f"▶️ Started subtask: {subtask_id}")


def complete_subtask(subtask_id, status="completed"):
    """Mark subtask as complete"""
    global current_subtask, subtask_start_time
    if current_subtask == subtask_id and subtask_start_time:
        elapsed = time.time() - subtask_start_time
        log_subtask(subtask_id, elapsed, status)
        log_heartbeat(f"✅ Completed subtask: {subtask_id} ({elapsed:.1f}s)")
    current_subtask = None
    subtask_start_time = None


def signal_handler(signum, frame):
    """Handle shutdown signals"""
    log_heartbeat("🛑 Heartbeat monitor shutting down...")
    stop_event.set()


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Heartbeat monitor")
    parser.add_argument("--interval", type=int, default=120, help="Heartbeat interval in seconds")
    parser.add_argument("--daemon", action="store_true", help="Run as daemon")
    args = parser.parse_args()

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    log_heartbeat(f"🚀 Heartbeat monitor started (interval={args.interval}s)")

    if args.daemon:
        # Run in background
        thread = Thread(target=heartbeat_loop, args=(args.interval,), daemon=True)
        thread.start()
        # Keep main thread alive
        try:
            while not stop_event.is_set():
                time.sleep(1)
        except KeyboardInterrupt:
            signal_handler(signal.SIGINT, None)
    else:
        # Run in foreground
        heartbeat_loop(args.interval)

    log_heartbeat("👋 Heartbeat monitor stopped")


if __name__ == "__main__":
    main()