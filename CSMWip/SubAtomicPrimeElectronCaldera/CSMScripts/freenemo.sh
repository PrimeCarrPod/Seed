#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# FREENEMO — Unified Nemotron 3 Ultra Orchestration Launcher
# Modular loader: loads ~100-line modules in sequence for optimal token efficiency
# Integrates: lettherebelight, earthbeatv3, SDKForge, GitHub_Handler, Nemotron optimizations
# ════════════════════════════════════════════════════════════════════════════

# ─── DIRECTORY STRUCTURE DOCUMENTATION ──────────────────────────────────────
# Root of Main is NOT for any temp work.
# CSMDropBox — delivers individual files (html, apk) while keeping copies in
#   respective WIP project folders or CSMApps Build Directories.
# CSMScripts — contains all scripts that are NOT job-specific.
#   Job-specific scripts are within their respective WIP work-in-progress folders.
# CSMWip — contains all work-in-progress projects with their own temp directories.
# CSMPieces — contains all pieces for files as a temp directory for pieces
#   that are NOT within their own WIP temp directory.
# __Python_Tools — folder for all Python scripts so they can be reused as necessary.
# ════════════════════════════════════════════════════════════════════════════
#
# ─── APK BUILD PROCESS (SDKForge) ────────────────────────────────────────────
# SDKForge (Module 05) installs the complete Android build toolchain:
#   • OpenJDK 17
#   • Android cmdline-tools (latest)
#   • Platform android-33 (android.jar)
#   • Build-tools 33.0.1 (aapt2, d8, zipalign, apksigner)
#
# Usage:
#   1. Install toolchain (run once per environment):
#      source CSMScripts/freenemo_modules/05a_sdk_forge_core.sh
#      source CSMScripts/freenemo_modules/05b_sdk_forge_install.sh
#      sdkforge_main
#
#   2. Or run the standalone script:
#      bash CSMScripts/freenemo_modules/05_sdk_forge.sh
#
#   3. Build an APK (from project directory, e.g., Bounce v1.0.92):
#      export ANDROID_HOME="${ANDROID_HOME:-$(pwd)/.sdk/android-sdk}"
#      export PATH="$ANDROID_HOME/build-tools/33.0.1:$PATH"
#      cd CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.92
#      bash build.sh
#
#   4. build.sh requirements (per project):
#      - PROJECT_DIR auto-detected via $(dirname "${BASH_SOURCE[0]}")
#      - SRC_DIR="$PROJECT_DIR/src/main" (Java, assets, res, AndroidManifest.xml)
#      - three.min.js must be in src/main/assets/js/ (603 KB, required for 230 KB APK)
#      - VERSION_CODE and VERSION_NAME in build.sh and AndroidManifest.xml must match
#      - debug.keystore auto-generated on first build
#
#   5. Output:
#      - APK at $PROJECT_DIR/out/$APP_NAME-v$VERSION_NAME.apk (~230 KB for Bounce)
#      - Copied to workspace root and CSMDropBox/ automatically
#
# Verification:
#   sdkforge_main --verify-only
#   $ANDROID_HOME/build-tools/33.0.1/aapt2 dump badging out/Bounce-v1.0.92.apk
# ════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── MODULE LOADER ──────────────────────────────────────────────────────────
MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/freenemo_modules"
MODULES=(
    "00_core_config.sh"              # Core config, colors, logging, env vars
    "01a_nemotron_payload_core.sh"   # Nemotron API payload - core functions
    "01b_nemotron_payload_advanced.sh" # Nemotron API payload - advanced functions
    "02_transport_hardening.sh"      # TCP/BBR, SSH multiplexing, curl timeouts
    "03a_github_handler_core.sh"     # GitHub handler - config, difficulty, logging
    "03b_github_handler_strategies.sh" # GitHub handler - strategies & save function
    "04a_earthbeat_chambers_core.sh" # Earthbeat - generators & chamber runners
    "04b_earthbeat_chambers_modes.sh" # Earthbeat - token ring & parallel modes
    "05a_sdk_forge_core.sh"          # SDK Forge - config, helpers, verify
    "05b_sdk_forge_install.sh"       # SDK Forge - install & entry point
    "06a_session_init_repo.sh"       # Session init - repo, heartbeat, validation
    "06b_session_init_heartbeat.sh"  # Session init - census, state, SDK
    "06c_session_init_persona.sh"    # Session init - persona, paths, banner
    "07_vllm_config.sh"              # vLLM engine flags for NVFP4/Mamba/MTP
    "08a_logging_session_core.sh"    # Logging - core functions
    "08b_logging_session_printer.sh" # Logging - periodic printer & summary
    "09a_error_recovery_repo.sh"     # Error recovery - repo & git conflicts
    "09b_error_recovery_api.sh"      # Error recovery - API & parser
    "09c_error_recovery_health.sh"   # Error recovery - health check
     "11_voice_recognition_validator.sh" # Voice command validation (anti-garble)
     "10a_main_orchestrator_setup.sh" # Orchestrator - setup, preflight, init
     "10b_main_orchestrator_loop.sh"  # Orchestrator - nemotron loop, main entry
 )

load_module() {
    local module="$1"
    local module_path="${MODULE_DIR}/${module}"
    if [[ -f "${module_path}" ]]; then
        # shellcheck source=/dev/null
        source "${module_path}"
    else
        echo "[FREENEMO] ERROR: Module not found: ${module_path}" >&2
        return 1
    fi
}

# ─── APK BUILD HELPER ─────────────────────────────────────────────────────────
# Usage: freenemo_build_apk <project_dir> [version_name]
# Example: freenemo_build_apk CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.92
freenemo_build_apk() {
    local project_dir="${1:-CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.92}"
    local version_name="${2:-1.0.92}"
    
    echo "═══════════════════════════════════════════════════════════════"
    echo "  FREENEMO APK BUILD — ${project_dir}"
    echo "═══════════════════════════════════════════════════════════════"
    
    # Ensure SDKForge is available
    if [[ ! -d "${ANDROID_HOME:-$(pwd)/.sdk/android-sdk}/build-tools/33.0.1" ]]; then
        echo "[FREENEMO] SDK not found. Installing via SDKForge..."
        source "${MODULE_DIR}/05a_sdk_forge_core.sh"
        source "${MODULE_DIR}/05b_sdk_forge_install.sh"
        sdkforge_main
    fi
    
    export ANDROID_HOME="${ANDROID_HOME:-$(pwd)/.sdk/android-sdk}"
    export PATH="$ANDROID_HOME/build-tools/33.0.1:$PATH"
    
    # Verify three.min.js exists
    local three_js="${project_dir}/src/main/assets/js/three.min.js"
    if [[ ! -f "$three_js" ]]; then
        echo "[FREENEMO] WARNING: three.min.js not found at $three_js"
        echo "  APK will be ~83 KB instead of ~230 KB"
        echo "  Copy from TardigradiaTGPU or run: cp /path/to/three.min.js $three_js"
    fi
    
    echo "[FREENEMO] Building APK in $project_dir..."
    cd "$project_dir" && bash build.sh
    
    local apk_name="$(basename "$project_dir")-v${version_name}.apk"
    local apk_path="${project_dir}/out/${apk_name}"
    
    if [[ -f "$apk_path" ]]; then
        local size=$(stat --printf="%s" "$apk_path" 2>/dev/null || echo 0)
        echo ""
        echo "═══════════════════════════════════════════════════════════════"
        echo "  BUILD SUCCESS — ${apk_name}"
        echo "  Size: $size bytes ($(echo "scale=1; $size/1024" | bc 2>/dev/null || echo "?") KB)"
        echo "  Path: $apk_path"
        echo "═══════════════════════════════════════════════════════════════"
    else
        echo "[FREENEMO] ERROR: APK not found at $apk_path"
        return 1
    fi
}

# ─── SDKFORGE INSTALL HELPER ──────────────────────────────────────────────────
# Usage: freenemo_sdkforge_install
freenemo_sdkforge_install() {
    echo "[FREENEMO] Installing Android SDK toolchain via SDKForge..."
    source "${MODULE_DIR}/05a_sdk_forge_core.sh"
    source "${MODULE_DIR}/05b_sdk_forge_install.sh"
    sdkforge_main
}

# ─── SDKFORGE VERIFY HELPER ───────────────────────────────────────────────────
# Usage: freenemo_sdkforge_verify
freenemo_sdkforge_verify() {
    source "${MODULE_DIR}/05a_sdk_forge_core.sh"
    sf_verify
}

# ─── MAIN LOADER SEQUENCE ───────────────────────────────────────────────────
echo "═══════════════════════════════════════════════════════════════"
echo "  FREENEMO — Nemotron 3 Ultra Unified Orchestration Launcher"
echo "  Loading ${#MODULES[@]} modules from ${MODULE_DIR}"
echo "═══════════════════════════════════════════════════════════════"

for module in "${MODULES[@]}"; do
    echo "[LOADER] Loading: ${module}"
    load_module "${module}"
done

echo "[LOADER] All modules loaded. Starting orchestrator..."
freenemo_main "$@"