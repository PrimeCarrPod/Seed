#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 05: SDK Forge — Android Build Toolchain Bootstrap (CarrPod)
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

# ─── MAIN INSTALL ────────────────────────────────────────────────────────────
sf_install() {
    sf_banner

    # Step 1: System packages
    sf_msg "[1/5] Installing system packages (Java 17, zip, unzip, bc)..."
    apt-get update -qq 2>/dev/null || true
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq openjdk-17-jdk-headless zip unzip bc 2>/dev/null || true
    java -version 2>&1 | head -1
    sf_msg "System packages ready."

    # Step 2: cmdline-tools
    sf_msg "[2/5] Downloading Android cmdline-tools..."
    mkdir -p "${SF_SDK_BASE}/cmdline-tools"
    if [[ ! -f "${SF_SDK_BASE}/cmdline-tools/latest/bin/sdkmanager" ]]; then
        local zip="${SF_SDK_BASE}/../cmdline-tools.zip"
        curl -k -sL "$SF_CMDTOOLS_URL" -o "$zip" 2>&1
        local size=$(stat --printf="%s" "$zip" 2>/dev/null || echo 0)
        (( size < 100000 )) && { sf_err "Download failed (size: $size)"; return 1; }
        sf_msg "  Downloaded: $size bytes"
        rm -rf "${SF_SDK_BASE}/tmp-extract"
        mkdir -p "${SF_SDK_BASE}/tmp-extract"
        unzip -qo "$zip" -d "${SF_SDK_BASE}/tmp-extract"
        rm -rf "${SF_SDK_BASE}/cmdline-tools/latest"
        mv "${SF_SDK_BASE}/tmp-extract/cmdline-tools" "${SF_SDK_BASE}/cmdline-tools/latest"
        rm -rf "${SF_SDK_BASE}/tmp-extract"
        sf_msg "  cmdline-tools installed."
    else
        sf_msg "  cmdline-tools already present."
    fi

    # Step 3: Platform
    sf_msg "[3/5] Downloading platform android-${SF_COMPILE_SDK}..."
    local plat_dir="${SF_SDK_BASE}/platforms/android-${SF_COMPILE_SDK}"
    if [[ ! -f "${plat_dir}/android.jar" ]]; then
        local zip="${SF_SDK_BASE}/../platform-${SF_COMPILE_SDK}.zip"
        curl -k -sL "$SF_PLATFORM_URL" -o "$zip" 2>&1
        local size=$(stat --printf="%s" "$zip" 2>/dev/null || echo 0)
        (( size < 100000 )) && { sf_err "Platform download failed"; return 1; }
        mkdir -p "${SF_SDK_BASE}/platforms"
        unzip -qo "$zip" -d "${SF_SDK_BASE}/platforms"
        [[ -d "${SF_SDK_BASE}/platforms/android-13" ]] && mv "${SF_SDK_BASE}/platforms/android-13" "$plat_dir" 2>/dev/null || true
        sf_msg "  Platform android-${SF_COMPILE_SDK} installed."
    else
        sf_msg "  Platform already present."
    fi

    # Step 4: Build Tools
    sf_msg "[4/5] Downloading build-tools ${SF_BUILD_TOOLS_VER}..."
    local bt_dir="${SF_SDK_BASE}/build-tools/${SF_BUILD_TOOLS_VER}"
    if [[ ! -f "${bt_dir}/aapt2" ]]; then
        local zip="${SF_SDK_BASE}/../build-tools-${SF_BUILD_TOOLS_VER}.zip"
        curl -k -sL "$SF_BT_URL" -o "$zip" 2>&1
        local size=$(stat --printf="%s" "$zip" 2>/dev/null || echo 0)
        if (( size < 100000 )); then
            sf_warn "Primary URL 404, trying fallback..."
            curl -k -sL "$SF_BT_FALLBACK" -o "$zip" 2>&1
            size=$(stat --printf="%s" "$zip" 2>/dev/null || echo 0)
            (( size < 100000 )) && { sf_err "All build-tools downloads failed"; return 1; }
            SF_BUILD_TOOLS_VER="34.0.0"
            bt_dir="${SF_SDK_BASE}/build-tools/${SF_BUILD_TOOLS_VER}"
            sf_warn "Using build-tools ${SF_BUILD_TOOLS_VER} (fallback)"
        fi
        sf_msg "  Downloaded: $size bytes"
        mkdir -p "${SF_SDK_BASE}/build-tools"
        unzip -qo "$zip" -d "${SF_SDK_BASE}/build-tools"
        [[ -d "${SF_SDK_BASE}/build-tools/android-13" ]] && mv "${SF_SDK_BASE}/build-tools/android-13" "$bt_dir" 2>/dev/null || true
        sf_msg "  build-tools ${SF_BUILD_TOOLS_VER} installed."
    else
        sf_msg "  build-tools already present."
    fi

    # Step 5: Verify
    sf_msg "[5/5] Verifying complete toolchain..."
    local bt="${SF_SDK_BASE}/build-tools/${SF_BUILD_TOOLS_VER}"
    local plat="${SF_SDK_BASE}/platforms/android-${SF_COMPILE_SDK}"
    local fail=0
    for t in aapt2 d8 zipalign apksigner; do
        [[ -f "${bt}/${t}" ]] && echo "  ${GREEN}✓${NC} $t" || { echo "  ${RED}✗${NC} $t MISSING"; fail=1; }
    done
    [[ -f "${plat}/android.jar" ]] && echo "  ${GREEN}✓${NC} android.jar (platform ${SF_COMPILE_SDK})" || { echo "  ${RED}✗${NC} android.jar MISSING"; fail=1; }
    java -version >/dev/null 2>&1 && echo "  ${GREEN}✓${NC} java" || { echo "  ${RED}✗${NC} java MISSING"; fail=1; }
    [[ $fail -eq 1 ]] && { sf_err "Some tools missing"; return 1; }

    # Done
    echo -e "${GREEN}═══════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}  SDKFORGE COMPLETE — Toolchain Ready${NC}"
    echo -e "${GREEN}═══════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "  ${YELLOW}Build tools:${NC} ${bt}"
    echo -e "  ${YELLOW}Platform:${NC}    ${plat}"
    echo -e "  ${YELLOW}SDK base:${NC}    ${SF_SDK_BASE}"
    echo ""
    echo -e "  ${CYAN}Build an APK:${NC}"
    echo -e "  export ANDROID_HOME=${SF_SDK_BASE}"
    echo -e "  cd CSMApps/Bounce/v1.0.79 && bash build.sh"
    echo ""
    sf_export_env
}

# ─── ENTRY POINT ─────────────────────────────────────────────────────────────
sdkforge_main() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --verify-only) SF_VERIFY_ONLY=true; shift ;;
            --export-env) SF_EXPORT_ENV=true; shift ;;
            --build-tools) SF_BUILD_TOOLS_VER="$2"; shift 2 ;;
            --platform) SF_COMPILE_SDK="$2"; shift 2 ;;
            --timeout) SF_TIMEOUT="$2"; shift 2 ;;
            --quiet) SF_QUIET=true; shift ;;
            --help|-h) echo "Usage: sdkforge [--verify-only] [--export-env] [--build-tools VER] [--platform API] [--timeout SEC] [--quiet]"; return 0 ;;
            *) echo "Unknown: $1"; return 1 ;;
        esac
    done

    [[ "$SF_EXPORT_ENV" == "true" ]] && { sf_export_env; return 0; }
    [[ "$SF_VERIFY_ONLY" == "true" ]] && { sf_verify; return $?; }
    sf_install
}