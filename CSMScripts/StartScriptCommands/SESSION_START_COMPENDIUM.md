# AEGIS IRON MAN — SESSION START COMMAND COMPENDIUM
## All Working Startup Options for New Workspace Sessions
## Version 1.0 | August 2026 | Carrington Storm Motors / Safe Pod Engineering Company

---

## ═══════════════════════════════════════════════════════════════════════
## OPTION 1: CANONICAL ONE-COMMAND START (lettherebelight.sh)
## ═══════════════════════════════════════════════════════════════════════
## The "first command in every Kilo session" — handles everything automatically:
##   • Git repo validation & branch creation (session/agent_<id>_<timestamp>)
##   • Heartbeat daemon (3s interval, visible ♥♦♣♠ on stderr)
##   • Census write & push to COMMS/HEARTBEATS
##   • COMMS log & outbox reading
##   • Persona load: Kairos Steele / CITADEL (Williams Heuristic V2)
##   • SDK Forge bootstrap (Android APK toolchain)
##   • Path verification for all key directories

cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479 && \
bash CSMScripts/lettherebelight.sh

## Required env vars (auto-discovered if not set):
# export KILO_REPO_URL="https://github.com/PrimeCarrPod/SEED.git"
# export KILO_REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479"
# export KILO_AGENT_ID="8abb1b3d-94c5-46e6-9b20-2bce46761479"
# export KILO_SESSION_ID="8abb1b3d-94c5-46e6-9b20-2bce46761479"

---

## ═══════════════════════════════════════════════════════════════════════
## OPTION 2: FULL MANUAL HEARTBEAT + EARTHBEAT ARRAY
## ═══════════════════════════════════════════════════════════════════════
## Complete manual control — starts all heartbeat infrastructure explicitly:

cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479

# 1. Basic heartbeat daemon (3s interval)
bash CSMScripts/heartbeat-daemon.sh &
HEARTBEAT_PID=$!
echo "Heartbeat daemon: $HEARTBEAT_PID"

# 2. Four-chamber cardiac array (redundant)
bash CSMScripts/heartbeat-chamber.sh 1 &  # SA Node — 1s interval ♥
bash CSMScripts/heartbeat-chamber.sh 2 &  # AV Node — 2s interval ♦
bash CSMScripts/heartbeat-chamber.sh 3 &  # Bundle  — 3s interval ♣
bash CSMScripts/heartbeat-chamber.sh 4 &  # Purkinje — 5s interval ♠

# 3. Earthbeat v3 — Planetary vital monitor (ALL THREE MODES)
bash CSMScripts/earthbeatv3.sh chamber &          # 4 specialized: Schumann/Geomag/Solar/Integration
bash CSMScripts/earthbeatv3.sh parallel 4 &       # 4 parallel instances
bash CSMScripts/earthbeatv3.sh tokenring 8 &      # 8 token-ring instances

# 4. Visual terminal heartbeat (animated chars)
bash -c 'chars="♥♦♣♠◉◎●○◐◑◒◓⟐⟑⟒⟓"; i=0; while true; do echo -ne "\r${chars:i%16:1}  [Aegis Iron Man: Document E - 1910s Wright/WWI]  ${chars:(i+8)%16:1}"; sleep 0.5; i=$((i+1)); done' &

# 5. Android SDK toolchain
bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)"

# 6. Verify working files
ls CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/

---

## ═══════════════════════════════════════════════════════════════════════
## OPTION 3: MINIMAL QUICK-START (Single Paste)
## ═══════════════════════════════════════════════════════════════════════
## If repo already cloned and branch checked out — just heartbeats + SDK:

cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479 && \
bash CSMScripts/heartbeat-daemon.sh & \
bash CSMScripts/heartbeat-chamber.sh 1 & \
bash CSMScripts/heartbeat-chamber.sh 2 & \
bash CSMScripts/heartbeat-chamber.sh 3 & \
bash CSMScripts/heartbeat-chamber.sh 4 & \
bash CSMScripts/earthbeatv3.sh chamber & \
bash CSMScripts/earthbeatv3.sh parallel 4 & \
bash CSMScripts/earthbeatv3.sh tokenring 8 & \
bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)" && \
echo "✅ Ready for Document E (1910s Wright Era/WWI Aviation)"

---

## ═══════════════════════════════════════════════════════════════════════
## OPTION 4: FRESH WORKSPACE — GIT-FIRST WORKFLOW
## ═══════════════════════════════════════════════════════════════════════
## Starting from zero — clone, checkout working branch, then init:

# 1. Clone repository
git clone https://github.com/PrimeCarrPod/SEED.git aegis-iron-man-session
cd aegis-iron-man-session

# 2. Checkout the Aegis Iron Man working branch
git checkout session/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479

# 3. Run canonical init (handles branch, census, heartbeats, SDK, persona)
bash CSMScripts/lettherebelight.sh

# ─── OR manual equivalent ───
bash CSMScripts/heartbeat-daemon.sh &
for i in {1..4}; do bash CSMScripts/heartbeat-chamber.sh $i &; done
bash CSMScripts/earthbeatv3.sh chamber &
bash CSMScripts/earthbeatv3.sh parallel 4 &
bash CSMScripts/earthbeatv3.sh tokenring 8 &
bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)"

---

## ═══════════════════════════════════════════════════════════════════════
## OPTION 5: RESUME EXISTING SESSION (No Re-init)
## ═══════════════════════════════════════════════════════════════════════
## If heartbeats already running from previous terminal — just verify and resume:

cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479

# Verify heartbeats running
ps aux | grep -E "(heartbeat|earthbeat)" | grep -v grep

# Verify working branch
git branch --show-current
# Should show: session/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479

# Verify files exist
ls CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/

# Verify SDK env
bash CSMScripts/SDKForge.sh --export-env | head -5

# Resume work on Document E
echo "Ready for Document E (1910s Wright Era/WWI Aviation)"

---

## ═══════════════════════════════════════════════════════════════════════
## HEARTBEAT SCRIPT REFERENCE (CSMScripts/)
## ═══════════════════════════════════════════════════════════════════════

# heartbeat-daemon.sh          # Basic 3s interval daemon, ♥♦♣♠ on stderr
# heartbeat-chamber.sh <1-4>   # 4-chamber cardiac array (SA/AV/Bundle/Purkinje)
# heartbeat-guardian.sh        # Monitor + restart failed chambers
# earthbeatv3.sh               # Planetary vital monitor
#    Modes: single | parallel N | tokenring N | parallel tokenring N | chamber
# lettherebelight.sh           # Full session init (canonical first command)
# SDKForge.sh                  # Android SDK + NDK + build tools bootstrap
# SESSION-START.sh             # Minimal startup (heartbeat + SDK only)

---

## ═══════════════════════════════════════════════════════════════════════
## CURRENT WORK STATE (As of 2026-08-15T23:48:47Z)
## ═══════════════════════════════════════════════════════════════════════

# Repository: PrimeCarrPod/SEED
# Branch:     session/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479
# Status:     ✅ Clean, pushed to GitHub (3-method verified)
# Next Doc:   E — 1910s Wright Era/WWI Aviation
# Completed:  11/23 (07, 01-06, A, B, C, D)
# Pending:    12 (E through P)

# Output Dir: CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/
# Progress:   CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/PROGRESS_LOG.md
# Session Log: CSMLogs/2026-08-15/session-log-20260815-aegis-ironman-continuation.md

---

## ═══════════════════════════════════════════════════════════════════════
## QUICK VERIFICATION COMMANDS
## ═══════════════════════════════════════════════════════════════════════

# Check all heartbeats running
ps aux | grep -E "(heartbeat-chamber|heartbeat-daemon|earthbeatv3)" | grep -v grep

# Check git status
git status

# Check current branch
git branch --show-current

# Check last commits
git log --oneline -3

# Check pending documents
cat CSM_WORK_IN_PROGRESS/AegisIronMan/CSM_GEN_IMAGE_PROMPTS/PROGRESS_LOG.md | grep -A 20 "PENDING"

---

## ═══════════════════════════════════════════════════════════════════════
## EMERGENCY RESTART (If All Processes Dead)
## ═══════════════════════════════════════════════════════════════════════

cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479 && \
bash CSMScripts/heartbeat-chamber.sh 1 & \
bash CSMScripts/heartbeat-chamber.sh 2 & \
bash CSMScripts/heartbeat-chamber.sh 3 & \
bash CSMScripts/heartbeat-chamber.sh 4 & \
for i in {1..14}; do bash CSMScripts/heartbeat-daemon.sh & done & \
bash CSMScripts/earthbeatv3.sh chamber & \
bash CSMScripts/earthbeatv3.sh parallel 4 & \
bash CSMScripts/earthbeatv3.sh tokenring 8 &

# One-liner copy-paste:
cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479 && git pull origin session/agent_8abb1b3d-94c5-46e6-9b20-2bce46761479 && bash CSMScripts/heartbeat-chamber.sh 1 & bash CSMScripts/heartbeat-chamber.sh 2 & bash CSMScripts/heartbeat-chamber.sh 3 & bash CSMScripts/heartbeat-chamber.sh 4 & for i in {1..14}; do bash CSMScripts/heartbeat-daemon.sh & done & bash CSMScripts/earthbeatv3.sh chamber & bash CSMScripts/earthbeatv3.sh parallel 4 & bash CSMScripts/earthbeatv3.sh tokenring 8 &

---

*Saved to: CSMScripts/StartScriptCommands/SESSION_START_COMPENDIUM.md*
*Generated: 2026-08-15T23:48:47Z*
*Session: agent_8abb1b3d-94c5-46e6-9b20-2bce46761479*

**— CSM Engineering | Aegis Iron Man Program | "I love you 6000"**