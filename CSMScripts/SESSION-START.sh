# PrimeCarrPod/Seed Cloud Session Startup Script

# This is the recommended first command to run in every new cloud session.
# It initializes the session, creates a properly named branch, and bootstraps
# the Android SDK toolchain.

# ─── STEP 1: SESSION INITIALIZATION ─────────────────────────────────────
# Always run lettherebelight.sh FIRST to:
#   - Create session branch with subject matter context
#   - Write immediate heartbeat
#   - Load quality protocols from super_lessons_learned.md
#   - Verify repository state

bash CSMScripts/lettherebelight.sh

# ─── STEP 2: SDK BOOTSTRAP ──────────────────────────────────────────────
# Bootstrap the complete No-Gradle Android APK build toolchain

bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)"

# ─── OPTIONAL: SUBJECT MATTER CONTEXT ──────────────────────────────────
# To include subject matter in branch naming, set KILO_SUBJECT before running:
# export KILO_SUBJECT="build-bounce-sdk"
# bash CSMScripts/lettherebelight.sh

# ─── NEXT STEPS ──────────────────────────────────────────────────────────
# After initialization, build APKs:
#   cd CSMApps/Bounce/v1.0.79 && bash build.sh
#   cd CSMApps/Marmalade/v7c && bash build.sh

# Or run other session tasks using the exported environment variables:
#   - $LETTHEREBELIGHT_BRANCH
#   - $LETTHEREBELIGHT_SESSION  
#   - $LETTHEREBELIGHT_REPO_ROOT
#   - $ANDROID_HOME