# HEARTBEAT COMMANDS — Earthbeat v3 Reference
## All Modes, Options, and Management

---

### 🌍 Earthbeat v3 — Three Operating Modes

#### 1. Chamber Mode (4 Specialized Chambers)
```bash
bash CSMScripts/earthbeatv3.sh chamber
```
- **Chambers:** Schumann (3s), Geomag (5s), Solar (7s), Integration (10s)
- **Output:** ♥=Schumann ♦=Geomag ♣=Solar ♠=Integration
- **Use case:** Focused deep work, specialized monitoring

#### 2. Parallel Mode (N Instances)
```bash
bash CSMScripts/earthbeatv3.sh parallel 4
```
- **Instances:** 4 (or any N)
- **Output:** Heartbeat chars on stderr (♣♠♥♦)
- **Use case:** Parallel document creation, throughput

#### 3. Tokenring Mode (N Nodes)
```bash
bash CSMScripts/earthbeatv3.sh tokenring 8
```
- **Nodes:** 8 (or any N)
- **Output:** Token-passing heartbeat pattern
- **Use case:** Distributed coordination, round-robin

---

### ⚡ Recommended: All Three Simultaneously
```bash
# Start all three (background)
bash CSMScripts/earthbeatv3.sh chamber &
CHAMBER_PID=$!

bash CSMScripts/earthbeatv3.sh parallel 4 &
PARALLEL_PID=$!

bash CSMScripts/earthbeatv3.sh tokenring 8 &
TOKENRING_PID=$!

# Monitor
jobs

# Stop all
kill $CHAMBER_PID $PARALLEL_PID $TOKENRING_PID
```

---

### 🔧 Kilo Background Process Management (Preferred)

```bash
# Start with readiness probe
background_process start "bash CSMScripts/earthbeatv3.sh chamber" \
  --ready.pattern "All 4 chambers running" \
  --description "Earthbeat Chamber Mode"

background_process start "bash CSMScripts/earthbeatv3.sh parallel 4" \
  --ready.pattern "All 4 instances running" \
  --description "Earthbeat Parallel Mode"

background_process start "bash CSMScripts/earthbeatv3.sh tokenring 8" \
  --ready.pattern "All 8 instances running" \
  --description "Earthbeat Tokenring Mode"

# List all
background_process list

# Check status
background_process status <id>

# View logs
background_process logs <id>

# Stop
background_process stop <id>

# Restart
background_process restart <id>
```

---

### 📊 Heartbeat Output Patterns

| Mode | Pattern | Meaning |
|------|---------|---------|
| Chamber | `♥♦♣♠` | 4 chambers active |
| Parallel | `♣♠♥♦` | 4 instances round-robin |
| Tokenring | Sequential chars | 8 nodes token-passing |

---

### 🛑 Stopping Heartbeats

```bash
# Method 1: Kill by PID (if started with &)
kill $CHAMBER_PID $PARALLEL_PID $TOKENRING_PID

# Method 2: Kill by pattern
pkill -f "earthbeatv3.sh chamber"
pkill -f "earthbeatv3.sh parallel"
pkill -f "earthbeatv3.sh tokenring"

# Method 3: Kilo background_process
background_process stop <id>
```

---

### 📁 Heartbeat Log Files (Auto-generated)

```
CSMScripts/
├── .heartbeat              # Main heartbeat
├── .heartbeat-1            # Instance 1
├── .heartbeat-2            # Instance 2
├── .heartbeat-3            # Instance 3
├── .heartbeat-4            # Instance 4
├── .heartbeat-chamber-1    # Chamber 1
├── .heartbeat-chamber-2    # Chamber 2
├── .heartbeat-chamber-3    # Chamber 3
├── .heartbeat-chamber-4    # Chamber 4
├── .keepalive-heartbeat    # Keepalive signal
├── .tokenring/             # Tokenring data
├── .tokenringv2/           # Tokenring v2
└── .tokenringv3/           # Tokenring v3
```

---

### 🎯 Quick Reference Card

```bash
# ┌─────────────────────────────────────────────────────────────┐
# │  ONE-LINER: Start all three (max throughput)               │
# └─────────────────────────────────────────────────────────────┘
bash CSMScripts/earthbeatv3.sh chamber & \
bash CSMScripts/earthbeatv3.sh parallel 4 & \
bash CSMScripts/earthbeatv3.sh tokenring 8 &

# ┌─────────────────────────────────────────────────────────────┐
# │  KILO MANAGED: Persistent, monitored, restartable          │
# └─────────────────────────────────────────────────────────────┘
background_process start "bash CSMScripts/earthbeatv3.sh chamber" \
  --ready.pattern "All 4 chambers running" --persistent
background_process start "bash CSMScripts/earthbeatv3.sh parallel 4" \
  --ready.pattern "All 4 instances running" --persistent
background_process start "bash CSMScripts/earthbeatv3.sh tokenring 8" \
  --ready.pattern "All 8 instances running" --persistent
```

---

*Reference: CSMScripts/earthbeatv3.sh | Session: agent_0315fdf8-a0f3-4bcc-ac94-e311c1d16ab9*