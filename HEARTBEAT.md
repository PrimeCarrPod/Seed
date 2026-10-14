# HEARTBEAT.md — Periodic Checks

## Active Checks (rotate 2-4 times/day)

### Email & Communications
- [ ] Check Gmail for urgent unread (grant campaigns, collaborators)
- [ ] Check GitHub notifications (PR reviews, issues)

### Calendar (next 24-48h)
- [ ] Upcoming meetings/deadlines
- [ ] Grant submission deadlines

### Project Health
- [ ] `CSMWip/05_BOUNCE`: `git status` + build test
- [ ] `TGE_E5`: `git status` (when active)
- [ ] `__Python_Tools/`: run any scheduled generation scripts
- [ ] `pieces/`: verify no corruption in piece files

### System
- [ ] Disk space (`df -h /workspace`)
- [ ] Android SDK updates available?

## Heartbeat State Tracking

Track in `memory/heartbeat-state.json`:
```json
{
  "lastChecks": {
    "email": 1703275200,
    "calendar": 1703260800,
    "bounce_build": 1703200000,
    "tge_build": null,
    "disk": 1703275200
  }
}
```

## Trigger Conditions (reach out immediately)
- Grant deadline < 48h
- Build broken on main branch
- Critical email from collaborator
- Disk > 85% full

## Quiet Hours
- 23:00–08:00 local — only alert on critical
- If human clearly busy (active coding) — batch non-urgent