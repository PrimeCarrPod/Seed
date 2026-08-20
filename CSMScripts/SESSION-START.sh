# CarrPod Cloud Session Startup — One Command

# This is the recommended first command to run in any new cloud session.
# It bootstraps the complete No-Gradle Android APK build toolchain.

# Usage: bash CSMScripts/SESSION-START.sh [--full|--heartbeat-only|--sdk-only|--earthbeat-chamber|--earthbeat-parallel N|--earthbeat-tokenring N|--visual-heartbeat|--no-heartbeat] [--timeout-extended]

# Parse arguments
MODE="full"
HEARTBEAT_MODE="daemon"
EARTHBEAT_MODE=""
EARTHBEAT_COUNT=4
EXTENDED_TIMEOUT=false
NO_HEARTBEAT=false

for arg in "$@"; do
    case "$arg" in
        --full) MODE="full" ;;
        --heartbeat-only) MODE="heartbeat-only" ;;
        --sdk-only) MODE="sdk-only" ;;
        --earthbeat-chamber) EARTHBEAT_MODE="chamber" ;;
        --earthbeat-parallel) EARTHBEAT_MODE="parallel" ;;
        --earthbeat-tokenring) EARTHBEAT_MODE="tokenring" ;;
        --visual-heartbeat) HEARTBEAT_MODE="visual" ;;
        --no-heartbeat) NO_HEARTBEAT=true ;;
        --timeout-extended) EXTENDED_TIMEOUT=true ;;
        --help|-h)
            echo "SESSION-START.sh — CarrPod Cloud Session Startup"
            echo "Usage: bash CSMScripts/SESSION-START.sh [options]"
            echo ""
            echo "Modes:"
            echo "  --full                    Full startup (heartbeat + SDK + earthbeat chamber)"
            echo "  --heartbeat-only          Only start heartbeat infrastructure"
            echo "  --sdk-only                Only bootstrap Android SDK toolchain"
            echo "  --earthbeat-chamber       Start earthbeat v3 chamber mode (4 chambers)"
            echo "  --earthbeat-parallel N    Start earthbeat v3 parallel mode (N instances, default 4)"
            echo "  --earthbeat-tokenring N   Start earthbeat v3 tokenring mode (N instances, default 8)"
            echo "  --visual-heartbeat        Start visual terminal heartbeat animation"
            echo "  --no-heartbeat            Skip all heartbeat processes"
            echo ""
            echo "Options:"
            echo "  --timeout-extended        Extend tool timeouts for long operations"
            echo "  --help, -h                Show this help"
            exit 0
            ;;
    esac
done

# Extract count for parallel/tokenring modes
if [[ "$EARTHBEAT_MODE" == "parallel" || "$EARTHBEAT_MODE" == "tokenring" ]]; then
    # Check if next arg is a number
    for i in "$@"; do
        if [[ "$i" =~ ^[0-9]+$ ]]; then
            EARTHBEAT_COUNT="$i"
            break
        fi
    done
fi

# Start heartbeat infrastructure
if [[ "$NO_HEARTBEAT" != "true" ]]; then
    if [[ "$HEARTBEAT_MODE" == "daemon" || "$MODE" == "full" || "$MODE" == "heartbeat-only" ]]; then
        if [[ -f CSMScripts/heartbeat-daemon.sh ]]; then
            bash CSMScripts/heartbeat-daemon.sh &
            HEARTBEAT_PID=$!
            echo "Heartbeat daemon started (PID: $HEARTBEAT_PID)"
            export HEARTBEAT_PID
        fi
        for c in 1 2 3 4; do
            bash CSMScripts/heartbeat-chamber.sh $c &
            echo "Heartbeat chamber $c started"
        done
    fi
    if [[ "$HEARTBEAT_MODE" == "visual" ]]; then
        bash -c 'chars="♥♦♣♠◉◎●○◐◑◒◓⟐⟑⟒⟓"; i=0; while true; do echo -ne "\r${chars:i%16:1}  [Aegis Iron Man: Session Active]  ${chars:(i+8)%16:1}"; sleep 0.5; i=$((i+1)); done' &
        echo "Visual terminal heartbeat started"
    fi
fi

# Start earthbeat if requested
if [[ -n "$EARTHBEAT_MODE" ]]; then
    bash CSMScripts/earthbeatv3.sh "$EARTHBEAT_MODE" "$EARTHBEAT_COUNT" &
    echo "Earthbeat v3 $EARTHBEAT_MODE mode started (count: $EARTHBEAT_COUNT)"
fi

# Bootstrap SDK unless heartbeat-only
if [[ "$MODE" != "heartbeat-only" ]]; then
    bash CSMScripts/SDKForge.sh && eval "$(bash CSMScripts/SDKForge.sh --export-env)"
fi

# After this, you can build any APK:
#   cd CSMApps/Bounce/v1.0.79 && bash build.sh
#   cd CSMApps/Marmalade/v7c && bash build.sh
