# Bounce v1.0.87 Session Log — 2026-08-26

## Branch
`session/agent_ffc7f702-948b-4a00-b2ed-956874e356c8`

## Commits
1. `80c10888` feat(bounce): v1.0.87 Bluetooth 3D Spatial from v1.0.80 base
2. `c522defc` Bounce-v1.0.87.apk Release (manual upload)

## APKs Built
- `CSMApps/Bounce/v1.0.86/out/Bounce-v1.0.86.apk` (versionCode 186)
- `CSMApps/Bounce/v1.0.87-new/out/Bounce-v1.0.87.apk` (versionCode 187)
- `Bounce-v1.0.87.apk` (repo root, versionCode 187)

## Features Added
- 3D Spatial Positioning (x,y,z) using phone azimuth/pitch/roll
- Sensor smoothing (low-pass filter α=0.15)
- Device persistence + brightness re-energizing (×1.5 boost)
- Trajectory tracking (100 pts/device)
- Theory Mode toggle for ghost trajectories
- Periodic BT scan restart (5s)
- BT Debug Logging (logcat `BounceBT`)
- BT Status Display in UI
- Dual Callback: `onBtResult` (UI list) + `onBtResult3D` (3D)
- 3 `@JavascriptInterface` methods: `setTheoryMode`, `getTrajectory`, `getAllDevices`
- Volatile phone orientation for thread safety

## Status
Branch is ready for manual merge into `main`.
