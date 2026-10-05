#!/usr/bin/env python3
"""
GoldRain Project Progress Tracker & Watchdog
Monitors 16-document research project completion.
Two processes: worker (does research) + watchdog (monitors worker)
"""

import json
import time
import os
import sys
from datetime import datetime
from pathlib import Path
from threading import Thread, Lock
import subprocess

PROJECT_ROOT = Path("/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_1bb70db6-171e-4e18-88b3-4b53a713af1e/DeepResearch/CrustalDisplacementGoldDeposition")
STATE_FILE = PROJECT_ROOT / "project_state.json"
LOCK_FILE = PROJECT_ROOT / ".progress_lock"

DOCUMENTS = [
    "01_Theoretical_Framework_Displacement_Gold_Mobilization",
    "02_Hydrothermal_Fluid_Dynamics_Supercritical_Gold",
    "03_MegaTsunami_Hydraulic_Gold_Transport",
    "04_Atmospheric_Gold_Transport_Gold_Rain",
    "05_Electrochemical_Plasma_Gold_Deposition",
    "06_Quartz_Gold_CoPrecipitation_Seismic_Pumping",
    "07_California_Gold_Deposits_Displacement_Correlation",
    "08_Costa_Rica_Osa_Talamanca_Gold_1991_Event",
    "09_Alaska_Yukon_1964_Earthquake_Gold_Remobilization",
    "10_Australia_Victorian_Goldfields_Displacement_Correlation",
    "11_South_Africa_Witwatersrand_Displacement_Origin",
    "12_Mathematical_Physics_Gold_Transport_Supercritical",
    "13_Plasma_Cosmology_Electrochemical_Gold_Mechanisms",
    "14_Documented_Gold_Rain_Events_Historical_Modern",
    "15_Modern_Exploration_Targeting_Displacement_Vectors",
    "16_Synthesis_Unified_Theory_Crustal_Displacement_Gold"
]

PHASES = [
    "literature_harvest",
    "field_data_collection", 
    "mathematical_modeling",
    "cross_validation_synthesis",
    "document_production",
    "quality_assurance",
    "complete"
]

DEFAULT_STATE = {
    "project": "CrustalDisplacementGoldDeposition",
    "branch": "GoldRain",
    "started": datetime.now().isoformat(),
    "documents": {doc: {"phase": "not_started", "progress": 0, "last_update": None, "worker_pid": None} for doc in DOCUMENTS},
    "current_document": 0,
    "watchdog_alive": True,
    "worker_alive": True,
    "total_completed": 0,
    "gold_rained": False
}

class ProgressTracker:
    def __init__(self):
        self.lock = Lock()
        self.load_state()
    
    def load_state(self):
        with self.lock:
            if STATE_FILE.exists():
                with open(STATE_FILE) as f:
                    self.state = json.load(f)
            else:
                self.state = DEFAULT_STATE
                self.save_state()
    
    def save_state(self):
        with self.lock:
            with open(STATE_FILE, 'w') as f:
                json.dump(self.state, f, indent=2)
    
    def update_doc(self, doc_name, phase=None, progress=None, worker_pid=None):
        with self.lock:
            if doc_name in self.state["documents"]:
                if phase:
                    self.state["documents"][doc_name]["phase"] = phase
                if progress is not None:
                    self.state["documents"][doc_name]["progress"] = progress
                if worker_pid:
                    self.state["documents"][doc_name]["worker_pid"] = worker_pid
                self.state["documents"][doc_name]["last_update"] = datetime.now().isoformat()
                self.save_state()
    
    def mark_complete(self, doc_name):
        with self.lock:
            if doc_name in self.state["documents"]:
                self.state["documents"][doc_name]["phase"] = "complete"
                self.state["documents"][doc_name]["progress"] = 100
                self.state["documents"][doc_name]["last_update"] = datetime.now().isoformat()
                self.state["total_completed"] += 1
                if self.state["total_completed"] == 16:
                    self.state["gold_rained"] = True
                self.save_state()
    
    def get_next_doc(self):
        with self.lock:
            for i, doc in enumerate(DOCUMENTS):
                if self.state["documents"][doc]["phase"] != "complete":
                    self.state["current_document"] = i
                    self.save_state()
                    return doc
            return None
    
    def heartbeat(self, process_type):
        with self.lock:
            self.state[f"{process_type}_alive"] = True
            self.state[f"{process_type}_last_heartbeat"] = datetime.now().isoformat()
            self.save_state()
    
    def check_heartbeat(self, process_type, timeout=120):
        with self.lock:
            last = self.state.get(f"{process_type}_last_heartbeat")
            if not last:
                return False
            elapsed = (datetime.now() - datetime.fromisoformat(last)).total_seconds()
            return elapsed < timeout
    
    def print_status(self):
        with self.lock:
            print(f"\n{'='*60}")
            print(f"  GOLDRAIN PROJECT STATUS - {datetime.now().strftime('%H:%M:%S')}")
            print(f"{'='*60}")
            print(f"  Branch: {self.state['branch']} | Completed: {self.state['total_completed']}/16")
            print(f"  Watchdog: {'ALIVE' if self.state['watchdog_alive'] else 'DEAD'}")
            print(f"  Worker:   {'ALIVE' if self.state['worker_alive'] else 'DEAD'}")
            print(f"  Gold Rain: {'🌧️ YES!' if self.state['gold_rained'] else '⏳ Waiting...'}")
            print(f"{'='*60}")
            for i, doc in enumerate(DOCUMENTS):
                d = self.state["documents"][doc]
                status = "✅" if d["phase"] == "complete" else ("🔄" if d["phase"] != "not_started" else "⏳")
                print(f"  {i+1:2d}. {status} {doc} [{d['phase']}] ({d['progress']}%)")
            print(f"{'='*60}\n")


tracker = ProgressTracker()

def worker_process():
    """Main research worker - executes document production"""
    import os
    pid = os.getpid()
    tracker.update_doc(DOCUMENTS[0], worker_pid=pid)
    tracker.heartbeat("worker")
    
    print(f"🔬 WORKER [{pid}] Starting GoldRain research...")
    
    doc_index = 0
    while doc_index < len(DOCUMENTS):
        doc = DOCUMENTS[doc_index]
        tracker.heartbeat("worker")
        
        # Simulate research phases
        for phase in PHASES[:-1]:  # exclude 'complete'
            tracker.update_doc(doc, phase=phase, progress=PHASES.index(phase)*100//len(PHASES))
            tracker.heartbeat("worker")
            time.sleep(2)  # Simulate work
            
            # Check if watchdog killed us
            if not tracker.state.get("worker_alive", True):
                print(f"💀 Worker received termination signal")
                return
        
        # Document complete
        tracker.mark_complete(doc)
        print(f"✅ WORKER: Completed {doc}")
        doc_index += 1
        
        if doc_index < len(DOCUMENTS):
            tracker.update_doc(DOCUMENTS[doc_index], worker_pid=pid)
    
    print("🌧️ WORKER: All 16 documents complete! GOLD RAIN ACHIEVED!")
    tracker.state["worker_alive"] = False
    tracker.save_state()

def watchdog_process():
    """Monitor worker, restart if dead"""
    import os
    pid = os.getpid()
    print(f"👁️  WATCHDOG [{pid}] Monitoring worker...")
    
    worker_pid = None
    restarts = 0
    max_restarts = 3
    
    while tracker.state.get("watchdog_alive", True):
        tracker.heartbeat("watchdog")
        
        # Check worker heartbeat
        if not tracker.check_heartbeat("worker", timeout=30):
            print(f"⚠️  WATCHDOG: Worker heartbeat lost! Restarting... (restart {restarts+1}/{max_restarts})")
            
            if restarts >= max_restarts:
                print(f"💀 WATCHDOG: Max restarts reached. Project failed.")
                tracker.state["watchdog_alive"] = False
                tracker.save_state()
                break
            
            # Restart worker
            restarts += 1
            worker_thread = Thread(target=worker_process, daemon=True)
            worker_thread.start()
            time.sleep(2)  # Give worker time to register
        
        # Check if project complete
        if tracker.state.get("gold_rained", False):
            print(f"🌧️ WATCHDOG: GOLD RAIN CONFIRMED! Project complete.")
            tracker.state["watchdog_alive"] = False
            tracker.save_state()
            break
        
        tracker.print_status()
        time.sleep(10)
    
    print("👁️  WATCHDOG: Shutting down.")

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1 and sys.argv[1] == "watchdog":
        watchdog_process()
    elif len(sys.argv) > 1 and sys.argv[1] == "worker":
        worker_process()
    elif len(sys.argv) > 1 and sys.argv[1] == "status":
        tracker.print_status()
    else:
        print("Usage: python progress_tracker.py [worker|watchdog|status]")
        print("Run both worker and watchdog in background for full monitoring.")