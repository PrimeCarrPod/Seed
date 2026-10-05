# Bounce — Current Direction: Update Menu Tasks

Exact tasks being worked on right now for the update menu pullout.

---

## Active Task: v1.0.96 Update Menu Overhaul

### Base
- Start from **v1.0.95** (clean baseline identical to v1.0.91)

### Menu Geometry
1. Panel width: **320px** (`#hud-update` width: 320px)
2. Inner content max-width: **300px**
3. Position: `bottom: 340px; right: 10px`
4. Pullout tab: vertical "UPDATE" text, left-aligned on right side of panel

### Behavior
1. Menu must start **recessed against right wall** — only the tab visible
   - Default state: `transform: translateX(calc(100% - 28px))`
   - Open state: `transform: translateX(0)`
2. Toggle behavior inverted from default:
   - `toggleUpdate()`: closed → open, open → closed
   - `showUpdateMenu()`: opens panel, shows buttons
   - `hideUpdateMenu()`: closes panel, hides buttons, resets status to "Ready"

### Buttons
1. **Update** — green (`btn btn-g`)
2. **Download APK** — blue (`btn btn-b`)
3. **Ignore** — orange (`btn btn-o`)

### JavaScript Methods Required
```javascript
updateNow() — calls BounceBridge.onUpdateSelected('update'), toggles menu
downloadOnly() — calls BounceBridge.onUpdateSelected('download'), toggles menu
ignoreUpdate() — calls BounceBridge.onUpdateSelected('ignore'), hides menu
```

### Java Bridge Methods Required
```java
@JavascriptInterface
public void onUpdateSelected(String action) — handles update/download/ignore
@JavascriptInterface
public void checkUpdate() — triggers version check
@JavascriptInterface
public void startUpdate(String ver) — starts update flow
```

### Status Text
- Default/closed: **"Ready"**
- Update available: **"New version: vX.Y.Z"**
- No update: **"Ready"** (not "No updates")

### Exclusions
- Remove `checkForUpdates()` auto-call from `onCreate()`
- Remove `checkUpdate()` JS method if present
- No auto-check on app launch

### Build Requirements
- Version code: 196
- Version name: 1.0.96
- Build from `CSMApps/Bounce/v1.0.96/`
- Output APK: `CSMApps/Bounce/v1.0.96/out/Bounce-v1.0.96.apk`
- Release copy: `CSMApps/Releases/Bounce-v1.0.96.apk`

### Verification Checklist
- [ ] v1.0.96 source `src/` is byte-identical to v1.0.95 except for `bounce.html`
- [ ] `bounce.html` contains all 3 buttons
- [ ] `bounce.html` has recess toggle behavior
- [ ] `bounce.html` status text says "Ready" by default
- [ ] `bounce.html` has `downloadOnly()` and `ignoreUpdate()` methods
- [ ] APK installs on Android 13 without compatibility warnings
- [ ] Menu opens/closes smoothly with correct transform direction
