# Build Environment Setup Errors (E001-E003, E025, E026, E030)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 02 of 13  
**Generated:** 2026-10-08 05:24:48 UTC

---

# E001: JAVA_HOME is set to an invalid directory
**Type:** Build | **First:** v1.0.0 | **Last:** v1.0.91 | **Frequency:** Every session
**Root Cause:** Sandbox/container resets wipe Java environment between sessions
**Solution:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64`
**Worked:** Yes | **Fixed In:** v1.0.0 | **Time Lost:** High
**Notes:** Must run in EVERY session. Add to shell rc or session startup script.

### Reproduction
```bash
$ ./build.sh
Error: JAVA_HOME is set to an invalid directory: /usr/lib/jvm/java-11-openjdk
```

### Fix Implementation
```bash
# In build.sh preamble or session init
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
java -version  # Verify: openjdk version "17.0.x"
```

### Prevention
- Add to `.bashrc` or session startup
- Verify in build.sh with explicit check
- Use JDK 17 (LTS) for compatibility with `-source 11 -target 11`

---

# E002: sdkmanager: command not found
**Type:** Build | **First:** v1.0.0 | **Last:** v1.0.91 | **Frequency:** Every session
**Root Cause:** cmdline-tools not at `latest/` subdirectory
**Solution:** `mv cmdline-tools/cmdline-tools cmdline-tools/latest`
**Worked:** Yes | **Fixed In:** v1.0.0 | **Time Lost:** High
**Notes:** Hardcoded path requirement in SDK structure

### Reproduction
```bash
$ sdkmanager --list
bash: sdkmanager: command not found
```

### Root Cause Detail
Android SDK cmdline-tools installs to `cmdline-tools/<version>/` but tools expect `cmdline-tools/latest/`.

### Fix Implementation
```bash
# After extracting commandlinetools-linux-*.zip
unzip commandlinetools-linux-*.zip -d $ANDROID_HOME/cmdline-tools
mv $ANDROID_HOME/cmdline-tools/cmdline-tools $ANDROID_HOME/cmdline-tools/latest
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
```

### Prevention
- Document in setup guide
- Automate in environment provisioning script
- Verify with `sdkmanager --version`

---

# E003: yes | sdkmanager --licenses fails with EPIPE
**Type:** Build | **First:** v1.0.0 | **Last:** v1.0.91 | **Frequency:** Every session
**Root Cause:** sdkmanager closes stdin after reading some licenses
**Solution:** `printf 'y\ny\ny\ny\ny\ny\ny\ny\n' | sdkmanager --licenses`
**Worked:** Yes | **Fixed In:** v1.0.0 | **Time Lost:** Medium
**Notes:** Or use license hash bypass (copy licenses from working machine)

### Reproduction
```bash
$ yes | sdkmanager --licenses
... (accepts some) ...
Error: Failed to read or create install properties file (EPIPE)
```

### Root Cause Detail
`sdkmanager --licenses` prompts for multiple licenses but closes stdin after ~8, causing `yes` to get SIGPIPE.

### Fix Implementation
```bash
# Option 1: Explicit printf with known license count
printf 'y\ny\ny\ny\ny\ny\ny\ny\n' | sdkmanager --licenses

# Option 2: License hash bypass (faster, no prompts)
mkdir -p $ANDROID_HOME/licenses
echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license
echo "d56f5187479451eabf01fb78af6dfcb131a6481e" > $ANDROID_HOME/licenses/android-sdk-preview-license
```

### Prevention
- Use license hash method for CI/CD
- Document license hashes in repo
- Verify with `sdkmanager --licenses --verbose`

---

# E025: zipalign: command not found
**Type:** Build | **First:** v1.0.0 | **Last:** v1.0.91 | **Frequency:** Every session
**Root Cause:** build-tools not installed or wrong version
**Solution:** `sdkmanager "build-tools;33.0.1"`
**Worked:** Yes | **Fixed In:** v1.0.0 | **Time Lost:** High
**Notes:** Must match compileSdk version

### Reproduction
```bash
$ zipalign -v 4 app-unaligned.apk app.apk
bash: zipalign: command not found
```

### Fix Implementation
```bash
# Install matching build-tools
sdkmanager "build-tools;33.0.1"
export PATH=$ANDROID_HOME/build-tools/33.0.1:$PATH
```

---

# E026: apksigner: command not found
**Type:** Build | **First:** v1.0.0 | **Last:** v1.0.91 | **Frequency:** Every session
**Root Cause:** build-tools not installed (part of same package as zipalign)
**Solution:** `sdkmanager "build-tools;33.0.1"`
**Worked:** Yes | **Fixed In:** v1.0.0 | **Time Lost:** High
**Notes:** Same fix as E025 - part of build-tools package

---

# E030: Missing platforms/android-33/android.jar (CRITICAL)
**Type:** Build | **First:** v1.0.0 | **Last:** v1.0.91 | **Frequency:** Cloud environments
**Root Cause:** SDK platform not installed
**Solution:** `sdkmanager "platforms;android-33"`
**Worked:** Yes | **Fixed In:** v1.0.0 | **Time Lost:** Critical
**Notes:** Required for compilation - blocks ALL builds

### Reproduction
```bash
$ aapt2 link ... -I $ANDROID_HOME/platforms/android-33/android.jar
Error: Could not read /path/to/android.jar
```

### Fix Implementation
```bash
# Install Android 33 platform (API level 33)
sdkmanager "platforms;android-33"
# Verify
ls -la $ANDROID_HOME/platforms/android-33/android.jar
```

### Prevention
- Include in environment bootstrap script
- Verify in build.sh before aapt2 link
- Pin to API 33 (compileSdk 33) for stability

---

*Next Piece: Build SDK/License Errors (E004, E005, E014, E015, E021, E022)*