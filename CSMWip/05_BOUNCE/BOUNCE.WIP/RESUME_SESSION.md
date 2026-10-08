# RESUME SESSION INSTRUCTIONS — BOUNCE Android App
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  
**Project:** BOUNCE v1.0.91/v1.0.92 Android Build  
**Repository:** github.com/PrimeCarrPod/Seed  
**Target Directory:** CSMWip/05_BOUNCE/BOUNCE.WIP/

---

## QUICK START — Copy-Paste This Block to Resume

```bash
# 1. Navigate to workspace
cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/worktrees/worktree_45abbd01-5052-4779-9f50-eb86c6cc98cf

# 2. Verify branch
git checkout bounce-android-continue
git pull origin bounce-android-continue

# 3. Check status
git status
ls -la CSMWip/05_BOUNCE/BOUNCE.WIP/

# 4. Review Master Feature List
cat CSMWip/05_BOUNCE/BOUNCE.WIP/BOUNCE_ULTRA_MASTER_FEATURE_LIST.md

# 5. Review Project Logs
cat CSMWip/05_BOUNCE/BOUNCE.WIP/WIP_Bounce_LOG_Session_001.md
cat CSMWip/05_BOUNCE/BOUNCE.WIP/WIP_Bounce_LOG_Session_002.md

# 6. Start heartbeat monitor
nohup bash -c 'while true; do echo "$(date -u): HEARTBEAT - $(git branch --show-current) - BOUNCE Android Build" >> CSMWip/05_BOUNCE/BOUNCE.WIP/heartbeat.log; sleep 30; done' &
```

---

## BUILD VERIFICATION

### v1.0.91 Build
```bash
cd CSMWip/05_BOUNCE/BOUNCE.WIP/v1.0.91
./build.sh
# Output: Bounce-v1.0.91.apk in out/
```

### v1.0.92 Build
```bash
cd CSMWip/05_BOUNCE/BOUNCE.WIP/v1.0.92
./build.sh
# Output: Bounce-v1.0.92.apk in out/
```

### v92 Build (Debug)
```bash
cd CSMWip/05_BOUNCE/BOUNCE.WIP/v92
./build.sh
# Output: Bounce-v1.0.92.apk in out/
```

---

## KEY SOURCE FILES

### Core Application
- `v1.0.91/src/main/java/com/carrpod/bounce/MainActivity.java`
- `v1.0.91/src/main/assets/bounce.html` (Three.js visualization)
- `v1.0.91/src/main/assets/js/` (Three.js, Chart.js, shaders)

### Android Configuration
- `v1.0.91/src/main/AndroidManifest.xml`
- `v1.0.91/src/main/res/` (icons, strings, colors)

### Build System
- `v1.0.91/build.sh` — Gradle build script
- `v1.0.92/build.sh` — Updated build script

---

## HEARTBEAT MONITORING

```bash
# Start Heartbeat (Background)
HEARTBEAT_PID=$(nohup bash -c '
  while true; do
    echo "$(date -u +"%Y-%m-%d %H:%M:%S UTC") | BRANCH: $(git branch --show-current 2>/dev/null || echo detached) | PROJECT: BOUNCE Android" >> CSMWip/05_BOUNCE/BOUNCE.WIP/heartbeat.log
    sleep 30
  done
' & echo $!)
echo "Heartbeat PID: $HEARTBEAT_PID"

# Monitor Heartbeat
tail -f CSMWip/05_BOUNCE/BOUNCE.WIP/heartbeat.log

# Stop Heartbeat
kill $HEARTBEAT_PID 2>/dev/null || pkill -f "heartbeat.*BOUNCE"
```

---

## SESSION LOG PUSH

```bash
# After each major milestone
SESSION_LOG="csmlogs/aug26/session_$(date -u +%Y%m%d_%H%M%S).md"
cp CSMWip/05_BOUNCE/BOUNCE.WIP/WIP_Bounce_LOG_Session_001.md "$SESSION_LOG"
git add "$SESSION_LOG"
git commit -m "Add session log: $(basename $SESSION_LOG)"
git push origin bounce-android-continue
```

---

## NEXT SESSION STARTUP IMPROVEMENTS

When this session completes, the next RESUME_SESSION.md should include:
- [ ] Exact git commit hash of last successful push
- [ ] Which build version was tested (v1.0.91, v1.0.92, v92)
- [ ] Any failed builds needing retry
- [ ] Updated heartbeat PID if process survived
- [ ] Lessons learned: what worked, what didn't
- [ ] Any new source material discovered

---

**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Session ID:** bounce_android_$(date -u +%Y%m%d_%H%M%S)