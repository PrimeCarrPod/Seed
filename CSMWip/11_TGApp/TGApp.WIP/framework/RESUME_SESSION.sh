#!/bin/bash
# TGApp RESUME_SESSION.sh
# Restores development environment and context for TGApp sessions
# Usage: source ./RESUME_SESSION.sh

set -e

# ─── Configuration ──────────────────────────────────────────────
export APP_NAME="TGApp"
export PACKAGE_NAME="com.TGApp.mynewapp"
export PRICE_TIER="yearly_499"
export WIP_DIR="/workspace/app/CSMWip/11_TGApp/TGApp.WIP"
export BRANCH_NAME="kilo/tgapp-wip"

# ─── Android SDK Environment ────────────────────────────────────
export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk}
export ANDROID_HOME=${ANDROID_HOME:-$HOME/Android/Sdk}
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0

# ─── Build Tools Aliases ────────────────────────────────────────
alias aapt2="$ANDROID_HOME/build-tools/34.0.0/aapt2"
alias d8="$ANDROID_HOME/build-tools/34.0.0/d8"
alias zipalign="$ANDROID_HOME/build-tools/34.0.0/zipalign"
alias apksigner="$ANDROID_HOME/build-tools/34.0.0/apksigner"
alias kotlinc="kotlinc"

# ─── Keystore Passwords (set in CI/CD, not here) ────────────────
# export KEYSTORE_PASS="your_keystore_password"
# export KEY_PASS="your_key_password"

# ─── Quick Commands ─────────────────────────────────────────────
tgapp-build() {
    cd "$WIP_DIR" && ./build.sh all
}

tgapp-clean() {
    cd "$WIP_DIR" && ./build.sh clean
}

tgapp-install() {
    cd "$WIP_DIR" && adb install -r "out/${APP_NAME}-v1.0.0.apk"
}

tgapp-logcat() {
    adb logcat -s "TGApp_MainActivity" "TGApp" "WebView" "chromium" "*:E"
}

tgapp-shell() {
    adb shell
}

tgapp-pull-apk() {
    adb pull "/data/app/com.TGApp.mynewapp-*/base.apk" "$WIP_DIR/out/pulled.apk"
}

# ─── Git Helpers ────────────────────────────────────────────────
tgapp-status() {
    cd "$WIP_DIR" && git status
}

tgapp-diff() {
    cd "$WIP_DIR" && git diff
}

tgapp-commit() {
    cd "$WIP_DIR" && git add -A && git commit -m "$1"
}

tgapp-push() {
    cd "$WIP_DIR" && git push origin "$BRANCH_NAME"
}

tgapp-log() {
    cd "$WIP_DIR" && git log --oneline -10
}

# ─── Session Logging ────────────────────────────────────────────
tgapp-session-log() {
    local log_file="$WIP_DIR/csmlogs/session_$(date -u +%Y%m%d_%H%M%S).md"
    mkdir -p "$(dirname "$log_file")"
    echo "# TGApp Session Log - $(date -u)" > "$log_file"
    echo "" >> "$log_file"
    echo "## Context" >> "$log_file"
    echo "- Branch: $BRANCH_NAME" >> "$log_file"
    echo "- Commit: $(cd "$WIP_DIR" && git rev-parse --short HEAD 2>/dev/null || echo 'none')" >> "$log_file"
    echo "- Build: $(cd "$WIP_DIR" && ./build.sh all 2>&1 | tail -5)" >> "$log_file"
    echo "" >> "$log_file"
    echo "## Work Done" >> "$log_file"
    echo "" >> "$log_file"
    echo "## Next Steps" >> "$log_file"
    echo "" >> "$log_file"
    echo "Log created: $log_file"
    cat "$log_file"
}

# ─── Verification ───────────────────────────────────────────────
verify_environment() {
    echo "=== TGApp Environment Verification ==="
    echo "WIP_DIR: $WIP_DIR"
    echo "JAVA_HOME: $JAVA_HOME"
    echo "ANDROID_HOME: $ANDROID_HOME"
    echo "aapt2: $(which aapt2 || echo 'NOT FOUND')"
    echo "d8: $(which d8 || echo 'NOT FOUND')"
    echo "zipalign: $(which zipalign || echo 'NOT FOUND')"
    echo "apksigner: $(which apksigner || echo 'NOT FOUND')"
    echo "kotlinc: $(which kotlinc || echo 'NOT FOUND')"
    echo "adb: $(which adb || echo 'NOT FOUND')"
    echo "git: $(which git || echo 'NOT FOUND')"
    echo ""
    echo "=== Key Files ==="
    [ -f "$WIP_DIR/build.sh" ] && echo "✅ build.sh" || echo "❌ build.sh MISSING"
    [ -f "$WIP_DIR/src/main/AndroidManifest.xml" ] && echo "✅ AndroidManifest.xml" || echo "❌ AndroidManifest.xml MISSING"
    [ -f "$WIP_DIR/src/main/java/com/TGApp/mynewapp/MainActivity.kt" ] && echo "✅ MainActivity.kt" || echo "❌ MainActivity.kt MISSING"
    [ -f "$WIP_DIR/framework/MASTER_TODO.md" ] && echo "✅ MASTER_TODO.md" || echo "❌ MASTER_TODO.md MISSING"
    [ -f "$WIP_DIR/APP_TEMPLATE_TGApp.md" ] && echo "✅ APP_TEMPLATE_TGApp.md" || echo "❌ APP_TEMPLATE_TGApp.md MISSING"
    echo ""
}

# ─── Auto-run verification on source ────────────────────────────
verify_environment

# ─── Help ───────────────────────────────────────────────────────
tgapp-help() {
    cat << 'EOF'
TGApp Session Commands:
  tgapp-build       - Full build (clean + compile + sign + verify)
  tgapp-clean       - Clean build artifacts
  tgapp-install     - Install APK to connected device
  tgapp-logcat      - Filtered logcat for TGApp
  tgapp-shell       - ADB shell
  tgapp-pull-apk    - Pull installed APK from device
  tgapp-status      - Git status
  tgapp-diff        - Git diff
  tgapp-commit "msg"- Git commit all changes
  tgapp-push        - Push to origin/kilo/tgapp-wip
  tgapp-log         - Recent git log
  tgapp-session-log - Create session log in framework/csmlogs/
  tgapp-help        - Show this help
  verify_environment- Re-run environment check

Key Files:
  $WIP_DIR/build.sh                    - Build script
  $WIP_DIR/src/main/                   - Android source
  $WIP_DIR/framework/MASTER_TODO.md    - Master task list
  $WIP_DIR/APP_TEMPLATE_TGApp.md       - App configuration
  $WIP_DIR/NEW_APP_RUNNER_TGApp.md     - Runner documentation

First Iteration Goals:
  1. Build APK with ./build.sh all
  2. Install and test on device
  3. Verify Antikythera animation (background WebView)
  4. Verify TGHC.pro overlay (8 google.com windows)
  5. Test rotation adaptation
EOF
}

echo ""
echo "🚀 TGApp session ready! Type 'tgapp-help' for commands."
echo "📁 Working in: $WIP_DIR"
echo "🌿 Branch: $BRANCH_NAME"