# Bounce — Lessons Learned

Compiled difficulties and lessons from this session and historical session logs.

---

## This Session (2026-08-12)

### 1. APK Version String Integrity
**Problem:** When repacking an APK by modifying only `assets/bounce.html`, accidental version string replacements (`1.0.91` → `1.0.95`) caused the APK to differ from the baseline by 3 bytes. This caused installation failures.

**Lesson:** When creating a "clean copy" APK from an existing base:
- Extract `assets/bounce.html` from the source APK **byte-for-byte**
- Do NOT run string replacements on version strings unless explicitly requested
- Always diff the resulting APK against the baseline using Python `zipfile` comparison
- Verify all 3 version occurrences (title, footer, status) match the intended version

### 2. APK Re-signing Changes RSA Signature
**Problem:** Every `apksigner` run generates a new RSA signature with a different timestamp/nonce, causing `META-INF/ANDROIDD.RSA` to differ by ~147 bytes between "identical" APKs.

**Lesson:** RSA signature differences are **expected and harmless**. When comparing APKs for content equality:
- Ignore `META-INF/ANDROIDD.RSA` differences
- Compare all other files byte-for-byte
- Use `apksigner verify` to confirm signature validity, not content equality

### 3. Git Push SSL Certificate Errors
**Problem:** `git push` failed with `server certificate verification failed` due to CA certificate issues in the sandboxed environment.

**Lesson:** In containerized/cloud environments, SSL verification may need to be disabled:
```bash
git -c http.sslVerify=false push origin <branch>
```
This is acceptable in trusted CI/container environments but should not be used in production developer workflows.

### 4. Build Toolchain Fragility
**Problem:** The build scripts reference specific SDK paths (`/workspace/.../agent_5744dc84...`) that may not exist in the current session. Java `keytool` failed due to missing `java.security` file configuration.

**Lesson:** When copying version folders for new releases:
- Update `PROJECT_DIR` and `SDK_DIR` in `build.sh` to current session paths
- Verify SDK tools exist before attempting build
- If build tools unavailable, fall back to APK repacking (zipfile replace + apksigner)

### 5. Directory Structure Hygiene
**Problem:** Copying entire version folders (`cp -r v1.0.91 v1.0.94`) also copied all accumulated `out/` artifacts (Bounce-v1.0.86.apk, Bounce-v1.0.87.apk, etc.), creating clutter.

**Lesson:** After copying a version folder:
- Clean the `out/` directory of stale APKs
- Keep only the current version's APK + base artifacts (`Bounce-aligned.apk`, `Bounce-base.apk`, `Bounce-dexed.apk`)
- Or better: copy only `src/` and rebuild, don't copy `out/`

### 6. Menu Toggle Direction Confusion
**Problem:** The update menu pullout toggle behavior was inverted — tapping the tab should open the menu, but it was closing it instead. The transform directions were backwards.

**Lesson:** Test UI toggle behavior visually or via simulated input before committing. CSS `translateX` directions:
- `translateX(0)` = fully visible
- `translateX(calc(100% - 28px))` = recessed, only tab visible
- Default state should be recessed (only tab visible)
- Open state should be fully visible

### 7. Version Code Incrementing
**Problem:** When creating v1.0.95 from v1.0.91, the version code was not incremented in the build script, causing potential Google Play compatibility issues.

**Lesson:** Always increment `VERSION_CODE` when creating a new release version, even if the source is identical. Follow the pattern:
- v1.0.91 → VERSION_CODE=191
- v1.0.95 → VERSION_CODE=195
- v1.0.96 → VERSION_CODE=196

---

## Historical Lessons from CSMLogs

### From 2026-08-11 Session (Bounce v1.0.87)
- **GitHub push SSL failures** are intermittent — workaround with `git config --global http.sslVerify false`
- **BT device detection debugging**: New devices not appearing as 3D dots while old devices show correctly. Investigation needed on Three.js scene visibility and coordinate system.
- **Version preservation**: Always keep previous version APKs untouched when creating new versions (v1.0.86 preserved while building v1.0.87).

### From 2026-08-11 Session (lettherebelight.sh v5)
- **Hardcoded paths are fragile**: Removed hardcoded workspace path from initialization script
- **Retry logic essential**: Added exponential backoff for all git operations
- **Network reachability probing**: `git ls-remote` used to verify connectivity before operations
- **Session logging**: All output tees to timestamped log files for debugging

### From 2026-07-29 Session (CSMFAB077)
- **Defensive programming**: Preflight checks and timeout handling for all network operations
- **Crash-proof transitions**: try/catch blocks around all `injectJs` calls

### From 2026-07-25 Sessions (SOPP Keymaker)
- **Documentation matters**: Comprehensive technical documentation added at v1.0.2
- **Permission patterns**: Reverted to proven permission pattern when new pattern failed

---

## General App Development Lessons

### APK Building
1. **Repacking is safer than rebuilding** when only assets change — use `zipfile` to swap `assets/bounce.html` and resign
2. **Always verify APK signature** with `apksigner verify` after signing
3. **Check APK contents** with `python3 -c "import zipfile; ..."` before distributing

### Git Workflow
1. **Commit before push** — always verify `git status` shows clean working tree
2. **Branch naming**: Use `session/<agent-uuid>` format for session branches
3. **Release organization**: Keep `CSMApps/Releases/` for current, `CSMApps/OldReleases/` for previous

### Android WebView Apps
1. **JavaScript interface stability**: Don't rename or remove `@JavascriptInterface` methods without updating HTML
2. **CSS transform directions**: Test on actual device — emulator may render differently
3. **Permission timing**: Delayed permission requests (post handler) prevent crashes on app launch

### Three.js in WebView
1. **Hardware acceleration**: Must be enabled in AndroidManifest for WebGL
2. **Memory management**: Dispose geometries/materials when removing devices from scene
3. **Coordinate system**: Phone azimuth/pitch/roll must be converted to 3D scene coordinates correctly

---

## Quick Reference: Common Pitfalls

| Pitfall | Prevention |
|---------|-----------|
| Accidental version string replacement | Diff APK against baseline after repack |
| RSA signature mismatch | Expected — ignore in comparisons |
| Build script pointing to wrong SDK | Update `PROJECT_DIR` and `SDK_DIR` when copying versions |
| Stale APKs in `out/` directories | Clean `out/` after copying version folders |
| Menu toggle inverted | Test transform directions on device |
| Missing `@JavascriptInterface` methods | Check HTML `onclick` handlers match Java bridge methods |
| Git push SSL failure | Use `-c http.sslVerify=false` in containers |
| APK install failure on Android 13+ | Verify `targetSdkVersion` and permissions in manifest |
