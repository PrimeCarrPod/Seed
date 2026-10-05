#!/usr/bin/env bash
# HEARTBEAT-MANAGE.sh — Heartbeat Infrastructure Control
# Start, stop, status, restart all heartbeat processes

set -euo pipefail

BASE_DIR="${BASE_DIR:-CSMScripts}"
PID_DIR="${BASE_DIR}"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
msg() { echo -e "${GREEN}[HB-MANAGE]${NC} $1"; }
warn() { echo -e "${YELLOW}[HB-MANAGE]${NC} $1"; }
err() { echo -e "${RED}[HB-MANAGE]${NC} $1"; }

usage() {
    echo "HEARTBEAT-MANAGE.sh — Heartbeat Infrastructure Control"
    echo "Usage: bash CSMScripts/HEARTBEAT-MANAGE.sh [command]"
    echo ""
    echo "Commands:"
    echo "  start [daemon|chamber|earthbeat|visual|all]  Start heartbeat processes"
    echo "  stop [daemon|chamber|earthbeat|visual|all]   Stop heartbeat processes"
    echo "  status                                       Show status of all processes"
    echo "  restart [daemon|chamber|earthbeat|visual|all] Restart heartbeat processes"
    echo "  logs [daemon|chamber N|earthbeat|visual]     Show recent logs"
    echo "  help                                         Show this help"
    echo ""
    echo "Examples:"
    echo "  bash CSMScripts/HEARTBEAT-MANAGE.sh start all"
    echo "  bash CSMScripts/HEARTBEAT-MANAGE.sh start chamber"
    echo "  bash CSMScripts/HEARTBEAT-MANAGE.sh start earthbeat chamber"
    echo "  bash CSMScripts/HEARTBEAT-MANAGE.sh status"
    echo "  bash CSMScripts/HEARTBEAT-MANAGE.sh logs chamber 1"
    exit 0
}

get_pids() {
    local pattern="$1"
    pgrep -f "$pattern" 2>/dev/null || true
}

start_daemon() {
    msg "Starting heartbeat daemon..."
    bash CSMScripts/heartbeat-daemon.sh &
    echo $! > "${PID_DIR}/heartbeat-daemon.pid"
    msg "Heartbeat daemon started (PID: $!)"
}

start_chambers() {
    msg "Starting 4 heartbeat chambers..."
    for c in 1 2 3 4; do
        bash CSMScripts/heartbeat-chamber.sh $c &
        echo $! > "${PID_DIR}/heartbeat-chamber-${c}.pid"
        msg "Chamber $c started (PID: $!)"
        sleep 0.2
    done
}

start_earthbeat() {
    local mode="${1:-chamber}"
    local count="${2:-4}"
    msg "Starting earthbeat v3 $mode mode (count: $count)..."
    bash CSMScripts/earthbeatv3.sh "$mode" "$count" &
    echo $! > "${PID_DIR}/earthbeatv3-${mode}.pid"
    msg "Earthbeat v3 $mode started (PID: $!)"
}

start_visual() {
    msg "Starting visual terminal heartbeat..."
    bash -c 'chars="♥♦♣♠◉◎●○◐◑◒◓⟐⟑⟒⟓"; i=0; while true; do echo -ne "\r${chars:i%16:1}  [Aegis Iron Man: Session Active]  ${chars:(i+8)%16:1}"; sleep 0.5; i=$((i+1)); done' &
    echo $! > "${PID_DIR}/heartbeat-visual.pid"
    msg "Visual heartbeat started (PID: $!)"
}

stop_pattern() {
    local pattern="$1"
    local name="$2"
    local pids=$(get_pids "$pattern")
    if [[ -n "$pids" ]]; then
        kill $pids 2>/dev/null || true
        msg "Stopped $name (PIDs: $pids)"
    else
        warn "$name not running"
    fi
}

stop_all() {
    stop_pattern "heartbeat-daemon.sh" "Heartbeat daemon"
    for c in 1 2 3 4; do
        stop_pattern "heartbeat-chamber.sh $c" "Chamber $c"
    done
    stop_pattern "earthbeatv3.sh" "Earthbeat v3"
    stop_pattern 'chars="♥♦♣♠' "Visual heartbeat"
    # Clean up PID files
    rm -f "${PID_DIR}"/heartbeat*.pid "${PID_DIR}"/earthbeatv3*.pid
}

status_all() {
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}         HEARTBEAT INFRASTRUCTURE STATUS${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
    
    # Daemon
    pids=$(get_pids "heartbeat-daemon.sh")
    if [[ -n "$pids" ]]; then
        echo -e "  ${GREEN}●${NC} Heartbeat daemon:     RUNNING (PIDs: $pids)"
    else
        echo -e "  ${RED}●${NC} Heartbeat daemon:     STOPPED"
    fi
    
    # Chambers
    for c in 1 2 3 4; do
        pids=$(get_pids "heartbeat-chamber.sh $c")
        if [[ -n "$pids" ]]; then
            echo -e "  ${GREEN}●${NC} Chamber $c (SA/AV/Bundle/Purkinje): RUNNING (PIDs: $pids)"
        else
            echo -e "  ${RED}●${NC} Chamber $c:              STOPPED"
        fi
    done
    
    # Earthbeat
    pids=$(get_pids "earthbeatv3.sh")
    if [[ -n "$pids" ]]; then
        echo -e "  ${GREEN}●${NC} Earthbeat v3:         RUNNING (PIDs: $pids)"
    else
        echo -e "  ${RED}●${NC} Earthbeat v3:         STOPPED"
    fi
    
    # Visual
    pids=$(get_pids 'chars="♥♦♣♠')
    if [[ -n "$pids" ]]; then
        echo -e "  ${GREEN}●${NC} Visual heartbeat:     RUNNING (PIDs: $pids)"
    else
        echo -e "  ${RED}●${NC} Visual heartbeat:     STOPPED"
    fi
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
}

show_logs() {
    local type="$1"
    local arg="$2"
    case "$type" in
        daemon)
            [[ -f "${BASE_DIR}/heartbeat.log" ]] && tail -20 "${BASE_DIR}/heartbeat.log" || warn "No daemon log found"
            ;;
        chamber)
            [[ -f "${BASE_DIR}/chamber-${arg}.log" ]] && tail -20 "${BASE_DIR}/chamber-${arg}.log" || warn "No chamber $arg log found"
            ;;
        earthbeat)
            [[ -f "${BASE_DIR}/earthbeatv3.log" ]] && tail -20 "${BASE_DIR}/earthbeatv3.log" || warn "No earthbeat log found"
            ;;
        visual)
            warn "Visual heartbeat logs to stderr only"
            ;;
        *)
            warn "Unknown log type: $type"
            ;;
    esac
}

# Main
CMD="${1:-help}"
case "$CMD" in
    start)
        SUB="${2:-all}"
        case "$SUB" in
            daemon) start_daemon ;;
            chamber) start_chambers ;;
            earthbeat) start_earthbeat "${3:-chamber}" "${4:-4}" ;;
            visual) start_visual ;;
            all) start_daemon; start_chambers; start_earthbeat "chamber" "4"; start_visual ;;
            *) err "Unknown start target: $SUB"; usage ;;
        esac
        ;;
    stop)
        SUB="${2:-all}"
        case "$SUB" in
            daemon) stop_pattern "heartbeat-daemon.sh" "Heartbeat daemon" ;;
            chamber) for c in 1 2 3 4; do stop_pattern "heartbeat-chamber.sh $c" "Chamber $c"; done ;;
            earthbeat) stop_pattern "earthbeatv3.sh" "Earthbeat v3" ;;
            visual) stop_pattern 'chars="♥♦♣♠' "Visual heartbeat" ;;
            all) stop_all ;;
            *) err "Unknown stop target: $SUB"; usage ;;
        esac
        ;;
    status) status_all ;;
    restart)
        SUB="${2:-all}"
        case "$SUB" in
            all) stop_all; sleep 1; start_daemon; start_chambers; start_earthbeat "chamber" "4"; start_visual ;;
            daemon) stop_pattern "heartbeat-daemon.sh" "Heartbeat daemon"; sleep 1; start_daemon ;;
            chamber) for c in 1 2 3 4; do stop_pattern "heartbeat-chamber.sh $c" "Chamber $c"; done; sleep 1; start_chambers ;;
            earthbeat) stop_pattern "earthbeatv3.sh" "Earthbeat v3"; sleep 1; start_earthbeat "${3:-chamber}" "${4:-4}" ;;
            visual) stop_pattern 'chars="♥♦♣♠' "Visual heartbeat"; sleep 1; start_visual ;;
            *) err "Unknown restart target: $SUB"; usage ;;
        esac
        ;;
    logs)
        show_logs "${2:-}" "${3:-}"
        ;;
    help|*) usage ;;
esac