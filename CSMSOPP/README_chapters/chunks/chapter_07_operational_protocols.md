# Chapter 07: Operational Protocols — The Session Rhythm

Duuude. Good morning. The waves are coming in regular. Let me walk you through how we run sessions around here.

The calm is the engine. The rhythm is the vehicle. The precision is the destination.

## Session Lifecycle

### 1. Startup — The Paddle Out
Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`

You don't just drop in cold. You read the conditions. You check the forecast. You know what you're paddling into.

### 2. Execution — The Ride
Process subtasks sequentially with 30s timeout guard.

One wave at a time. You don't try to catch three sets at once. You take the one in front of you. You ride it clean. Then you paddle back out for the next.

### 3. Heartbeat — The Horizon Scan
Progress output every 2 minutes (120s interval).

You're sitting on your board, legs dangling, scanning the horizon. Every two minutes you check: sets coming? Wind shifting? Current pulling? You report. The team knows you're still out there. You know they're watching.

### 4. Checkpoint — The Beach Break
Update `TODO.md` and log to `memory/` after each subtask.

You come in. You rinse off. You write down what you caught. What you missed. What the conditions were. The log is not bureaucracy. The log is the institutional memory that lets the next session know where the good breaks are.

### 5. Handoff — The Board Pass
Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`.

You're tired. The light's fading. You pass the board to the next rider. "Here's where the sets are breaking. Here's the current. Here's what I caught. You got this."

## The 30-Second Rule

Every subtask has a 30-second timeout guard. Not because we're rushed. Because **the calm that rushes is not calm — it's anxiety wearing a disguise.**

If a subtask can't be completed in 30 seconds, it's not a subtask. It's a task. Break it down. The 30-second rule forces decomposition. Decomposition forces clarity. Clarity enables the calm.

## The 2-Minute Heartbeat

Every 120 seconds, the session emits a heartbeat. Not a status report — a heartbeat. "Still here. Still riding. Conditions: [current state]. Next: [next subtask]."

The heartbeat serves two masters:
1. **The human operator** — knows the session hasn't hung, hasn't drifted, hasn't silently failed
2. **The session itself** — the act of emitting the heartbeat forces a micro-check: am I still on track? Is the subtask still the right subtask?

## Memory Architecture

```
memory/
├── YYYY-MM-DD.md          # Raw daily logs (append-only)
├── latest.md              # Symlink to most recent daily
└── heartbeat-state.json   # Last check timestamps
```

The daily logs are raw. They're not polished. They're the sedimentary record of what actually happened. The `latest.md` symlink means you always know where the most recent session left off without hunting.

## Next Runner Protocol

`NEXT_runner_XXX.md` contains:
- Current subtask and its decomposition
- Blockers encountered and resolutions attempted
- Decisions made and their rationale
- Files modified and their locations
- Explicit next action for the incoming session

This is not a handoff document. This is a **continuity guarantee**. The work does not stop when the session ends. The work pauses. The next session resumes. The board passes clean.

## Parallel Agent Orchestration

Multiple specialized agents run simultaneously. One handles technical computation; another in the El Segundo drafter persona drafts company-wide communications with California warmth. The Kilo platform supports progressive skill disclosure: Level 1 (YAML frontmatter, ~100 tokens), Level 2 (full SKILL.md on activation), Level 3 (assets/templates loaded on demand).

The agents don't step on each other. They operate in their lanes. The technical agent computes. The drafter communicates. The Williams layer translates both for human reception.

---

*The rhythm is simple. Paddle out. Ride. Checkpoint. Handoff. Repeat. The calm is not the absence of work. The calm is the presence of rhythm. And then? You paddle out. Sweet. Go.*