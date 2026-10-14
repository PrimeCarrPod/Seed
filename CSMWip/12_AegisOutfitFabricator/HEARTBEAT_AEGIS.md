# HEARTBEAT_AEGIS.md — AegisOutfitFabricator Heartbeat Configuration

## Heartbeat Settings

| Parameter | Value | Description |
|-----------|-------|-------------|
| Interval | 120 seconds | Terminal progress update frequency |
| Subtask Timeout | 30 seconds | Maximum time per subtask before auto-split |
| Log File | `Logs/heartbeat.log` | Persistent heartbeat log |
| Subtask Log | `Logs/subtask_times.log` | JSONL subtask timing log |
| Auto-continue | Enabled | No blocking waits, queue next immediately |

## Heartbeat Monitor Commands

```bash
# Start in foreground (for monitoring)
python3 scripts/heartbeat_monitor.py --interval 120

# Start as daemon (background)
python3 scripts/heartbeat_monitor.py --interval 120 --daemon &

# Check heartbeat log
tail -f Logs/heartbeat.log

# Check subtask timings
cat Logs/subtask_times.log | jq .
```

## Expected Output Format

```
💓 Heartbeat #1 | Progress: 5/210 (2.4%) | Git changes: 3 | Current: migrate DOC-11
💓 Heartbeat #2 | Progress: 12/210 (5.7%) | Git changes: 5 | Current: migrate DOC-12
💓 Heartbeat #3 | Progress: 18/210 (8.6%) | Git changes: 8 | Current: author DOC-13
```

## Subtask Timeout Alert

If a subtask exceeds 30 seconds:
```
💓 Heartbeat #5 | Progress: 22/210 (10.5%) | Git changes: 10 | Current: author DOC-13 ⚠️ SUBTASK TIMEOUT (45s > 30s)
```

**Action**: Split current subtask into smaller pieces, update TODO.md

## Integration with TODO.md

Mark subtasks in TODO.md with custom markers:
- `- [ ]` — Pending
- `- [>]` — In progress (being worked on now)
- `- [x]` — Completed
- `- [!]` — Blocked/needs split

## Git Commit Triggers

Heartbeat should correlate with commits:
- Every document completion → commit
- Every 5 subtasks → commit
- Every heartbeat cycle → at least status update

## Emergency Procedures

### Upstream Idle Timeout Prevention
- Heartbeat runs every 120s (well under typical 5-10 min idle timeout)
- Subtask guard at 30s prevents long-running operations
- Auto-continue ensures no blocking waits

### If Heartbeat Stops
1. Check `Logs/heartbeat.log` for last entry
2. Restart: `python3 scripts/heartbeat_monitor.py --interval 120 --daemon &`
3. Verify with `ps aux | grep heartbeat_monitor`

### If Subtask Consistently Times Out
1. Split subtask in TODO.md
2. Reduce scope per subtask
3. Target: 10-15 seconds per subtask ideal

## Monitoring Dashboard (Optional)

```bash
# Real-time progress
watch -n 30 'tail -5 Logs/heartbeat.log'

# Subtask time analysis
cat Logs/subtask_times.log | jq -s 'map(.duration_seconds) | {avg: (add/length), max: max, min: min, count: length}'
```