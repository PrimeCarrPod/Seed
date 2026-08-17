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
    "00_core_config.sh"        # Core config, colors, logging, env vars
    "01_nemotron_payload.sh"   # Nemotron 3 Ultra API payload optimization
    "02_transport_hardening.sh" # TCP/BBR, SSH multiplexing, curl timeouts
    "03_github_handler.sh"     # Multi-strategy GitHub operations
    "04_earthbeat_chambers.sh" # 4-chamber planetary heartbeat monitor
    "05_sdk_forge.sh"          # Android build toolchain bootstrap
    "06_session_init.sh"       # lettherebelight session initialization
    "07_vllm_config.sh"        # vLLM engine flags for NVFP4/Mamba/MTP
    "08_logging_session.sh"    # CSMLogs/Sessions/Session_Date-Time/ structure
    "09_error_recovery.sh"     # Repo load failure correction, retries
    "10_main_orchestrator.sh"  # Main entry: parallel/tokenring execution
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