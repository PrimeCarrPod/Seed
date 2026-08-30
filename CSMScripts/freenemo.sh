#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# FREENEMO — Unified Nemotron 3 Ultra Orchestration Launcher
# Modular loader: loads ~100-line modules in sequence for optimal token efficiency
# Integrates: lettherebelight, earthbeatv3, SDKForge, GitHub_Handler, Nemotron optimizations
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