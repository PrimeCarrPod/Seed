# HEARTBEAT_CSMREADME.md
## CSMReadMe Campaign — 2-Minute Heartbeat Configuration

**Campaign**: Deep 7-Chapter README Generation for CSMFAB Subprojects  
**Interval**: 120 seconds (2 minutes)  
**Timeout Guard**: 30 seconds per subtask  
**Auto-Continue**: Enabled

---

## Heartbeat Monitor Command

```bash
# Run in background during session
python3 /workspace/app/CSMWip/CSMReadMe/scripts/heartbeat_monitor.py --interval 120 &

# Or use simple shell heartbeat
while true; do
    echo "[$(date '+%H:%M:%S')] HEARTBEAT: CSMReadMe campaign active"
    echo "  Current: $(cat /workspace/app/NEXT_runner_001.md | grep -A2 'Next Priority' | tail -1)"
    echo "  Git: $(cd /workspace/app && git status --short | wc -l) files modified"
    sleep 120
done
```

---

## Heartbeat Status Fields

Each heartbeat should report:
1. **Timestamp** — Current time
2. **Active Project** — Which CSMFAB project being processed
3. **Phase** — Reading / Authoring / Quality Gates / Committing / Pushing
4. **Progress** — Chapter/section completed
5. **Git Status** — Files staged, committed, pushed
6. **Next Target** — From taskmaster.sh quick-resume

---

## Subtask Timeout Guard (30 seconds)

Any subtask exceeding 30 seconds should be split:
- Reading source docs → split by document
- Authoring chapter → split by subsection
- Quality gates → run individually
- Git operations → commit per file

---

## Auto-Continue Queue

After each subtask completion:
1. Log progress to memory/YYYY-MM-DD.md
2. Update TODO.md checkboxes
3. Queue next subtask immediately
4. No blocking waits

---

## Session End Protocol

On session end:
1. Kill heartbeat process
2. Update NEXT_runner_XXX.md with completed/next
3. Commit any remaining changes
4. Push to origin/main
5. Run final taskmaster.sh quick-resume
6. Log session summary

---

## Heartbeat Log Location

`/workspace/app/CSMWip/CSMReadMe/Logs/heartbeat.log`

Format:
```
[2026-10-26 04:50:52] START: CSMReadMe campaign session
[2026-10-26 04:50:52] RESUME: taskmaster.sh quick-resume complete
[2026-10-26 04:50:52] TARGET: CSMFAB07 (score 45, 102 files)
[2026-10-26 04:52:14] AUTHORING: CSMFAB07 Chapter 1-3
[2026-10-26 04:54:30] AUTHORING: CSMFAB07 Chapter 4-7
[2026-10-26 04:56:45] QUALITY: Gates passed
[2026-10-26 04:57:01] COMMIT: fc36793e7
[2026-10-26 04:57:12] PUSH: origin/main
...
```

---

*Heartbeat configuration for CSMReadMe campaign. Run monitor in background during all sessions.*