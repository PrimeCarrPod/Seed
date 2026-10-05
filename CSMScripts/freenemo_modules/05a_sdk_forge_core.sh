#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 05A: SDK Forge — Core Config, Helpers, Export, Verify
# Java 17, cmdline-tools, platform android-33, build-tools 33.0.1, verified pairs
# ════════════════════════════════════════════════════════════════════════════

# ─── CONFIG ──────────────────────────────────────────────────────────────────
SF_SDK_BASE="${ANDROID_HOME:-$(pwd)/.sdk/android-sdk}"
SF_CMDTOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
SF_PLATFORM_URL="https://dl.google.com/android/repository/platform-33_r02.zip"
SF_BT_URL="https://dl.google.com/android/repository/build-tools_r33.0.1-linux.zip"
SF_BT_FALLBACK="https://dl.google.com/android/repository/build-tools_r34.0.0-linux.zip"
SF_BUILD_TOOLS_VER="33.0.1"
SF_COMPILE_SDK="33"
SF_TIMEOUT=300
SF_QUIET=false
SF_VERIFY_ONLY=false
SF_EXPORT_ENV=false

# ─── HELPERS ─────────────────────────────────────────────────────────────────
sf_msg()  { [[ "$SF_QUIET" != "true" ]] && echo -e "${GREEN}[SDKForge]${NC} $1" || true; }
sf_warn() { [[ "$SF_QUIET" != "true" ]] && echo -e "${YELLOW}[SDKForge]${NC} $1" || true; }
sf_err()  { [[ "$SF_QUIET" != "true" ]] && echo -e "${RED}[SDKForge]${NC} $1" || true; }

sf_banner() {
    [[ "$SF_QUIET" != "true" ]] && {
        echo ""; echo -e "${CYAN}╔═══════════════════════════════════════════════════════════╗${NC}"
        echo -e "${CYAN}║${NC}       ${GREEN}SDKForge — CarrPod Cloud Toolchain${NC}        ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  Build Tools: ${YELLOW}${SF_BUILD_TOOLS_VER}${NC} | Platform: ${YELLOW}android-${SF_COMPILE_SDK}${NC}     ${CYAN}║${NC}"
        echo -e "${CYAN}║${NC}  Target: ${CYAN}${SF_SDK_BASE}${NC}                          ${CYAN}║${NC}"
        echo -e "${CYAN}╚═══════════════════════════════════════════════════════════╝${NC}"; echo ""
    } || true
}

# ─── EXPORT ENV ──────────────────────────────────────────────────────────────
sf_export_env() {
    local bt_dir="${SF_SDK_BASE}/build-tools/${SF_BUILD_TOOLS_VER}"
    echo "export ANDROID_HOME=${SF_SDK_BASE}"
    echo "export BUILD_TOOLS_VERSION=${SF_BUILD_TOOLS_VER}"
    echo "export COMPILE_SDK=${SF_COMPILE_SDK}"
    echo "export PATH=\"${bt_dir}:\$PATH\""
}

# ─── VERIFY ONLY ─────────────────────────────────────────────────────────────
sf_verify() {
    sf_msg "Verify-only mode..."
    local bt_dir="${SF_SDK_BASE}/build-tools/${SF_BUILD_TOOLS_VER}"
    local plat_dir="${SF_SDK_BASE}/platforms/android-${SF_COMPILE_SDK}"
    local fail=0
    for t in aapt2 d8 zipalign apksigner; do
        [[ -f "${bt_dir}/${t}" ]] && echo "  ${GREEN}✓${NC} $t" || { echo "  ${RED}✗${NC} $t MISSING"; fail=1; }
    done
    [[ -f "${plat_dir}/android.jar" ]] && echo "  ${GREEN}✓${NC} android.jar" || { echo "  ${RED}✗${NC} android.jar MISSING"; fail=1; }
    java -version >/dev/null 2>&1 && echo "  ${GREEN}✓${NC} java" || { echo "  ${RED}✗${NC} java MISSING"; fail=1; }
    [[ $fail -eq 1 ]] && { sf_err "Tools missing — run without --verify-only"; return 1; }
    sf_msg "All tools present. Toolchain ready."
    return 0
}