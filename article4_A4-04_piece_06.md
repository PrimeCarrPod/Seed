# SDK_Tools_Methods_Build_Pipeline — Piece 06/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 06 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## VERSION CONTROL & CI/CD TOOLS

### git
- **Version:** Latest (system)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Version control, commit, push, pull
- **Known Issue:** Contention on multi-agent environments
- **Workaround:** safe_push() retry loop in scripts
- **Best Practice:** Commit often, use GitHub handler script
- **Environment Notes:** Pre-installed in most environments

### GitHub CLI (gh)
- **Version:** Latest
- **First Used:** 1.0.91 | **Last Used:** 1.0.91
- **Purpose:** PR/merge automation, API access
- **Commands:** `gh pr create`, `gh pr merge`, `gh api repos/owner/repo/merges`
- **Known Issue:** None
- **Best Practice:** Use for merge methods (17 ways documented)
- **Environment Notes:** Pre-installed in GitHub Actions

---

## UTILITY TOOLS

### unzip
- **Version:** Latest (system)
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Extract source zips for forensic analysis
- **Command:** `unzip -q file.zip -d dir`
- **Known Issue:** None
- **Best Practice:** Use `-q` for quiet output
- **Environment Notes:** Pre-installed

### bc (Basic Calculator)
- **Version:** Latest
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Build size calculation (KB display)
- **Command:** `echo "scale=1; size/1024" | bc`
- **Install:** `apt-get install bc`
- **Known Issue:** None
- **Best Practice:** Optional for KB display
- **Environment Notes:** Build script uses for size reporting

### stat (File Statistics)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** File size checking (bytes)
- **Command:** `stat --printf="%s" file`
- **Known Issue:** Format varies (GNU vs BSD)
- **Best Practice:** Use `--printf` for consistent bytes output
- **Environment Notes:** Build script uses for APK size

### date (Timestamps)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Heartbeat timestamps, build logs
- **Command:** `date -u +"%Y-%m-%d %H:%M:%S UTC"`
- **Known Issue:** Format varies by system
- **Best Practice:** Use UTC format consistently
- **Environment Notes:** Heartbeat monitor uses this

---

## PROCESS MANAGEMENT TOOLS

### nohup (Background Processes)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Background processes (heartbeat monitor)
- **Command:** `nohup bash -c 'while...' &`
- **Known Issue:** Output capture needs redirection
- **Best Practice:** Redirect to log file
- **Environment Notes:** Heartbeat PID tracking

### pkill (Process Termination)
- **Version:** GNU coreutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Stop background processes
- **Command:** `pkill -f "pattern"`
- **Known Issue:** Match full command to avoid false positives
- **Best Practice:** Use specific pattern (e.g., `pkill -f "heartbeat.*BOUNCE"`)
- **Environment Notes:** Stop heartbeat monitor

---

## DIFF & ARCHIVE TOOLS

### diff (Version Diffing)
- **Version:** GNU diffutils
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Version diffing for forensic analysis
- **Command:** `diff -u file1 file2 > out.diff`
- **Known Issue:** None
- **Best Practice:** Unified format (-u) for readability
- **Environment Notes:** 364 diff files generated (91 versions × 4 files)

### zip (Archiving)
- **Version:** Latest
- **First Used:** 1.0.0 | **Last Used:** 1.0.91
- **Purpose:** Asset injection (build.sh) + piece zipping (GitHub handler)
- **Command:** `zip -r archive.zip dir/`
- **Known Issue:** None
- **Best Practice:** Use `-r` recursive
- **Environment Notes:** Build step 3 + zip-pieces workflow

---

## PIECE 06 SUMMARY
This piece covers version control (git with safe_push retry, gh for PR/merge automation), utility tools (unzip for forensics, bc for size calc, stat for bytes, date for UTC timestamps), process management (nohup for background heartbeat, pkill for cleanup), and diff/archive tools (diff for 364 forensic diffs, zip for asset injection and piece archiving). All are standard Linux tools, pre-installed or easily installed.

**Next Piece (07):** ADB, sdkmanager licenses, License hash bypass, ANDROID_HOME, local.properties