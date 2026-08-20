#!/usr/bin/env bash
# EARTHBEAT — Planetary Heartbeat Monitor
# Monitors Earth's vital signs: Schumann resonance, geomagnetic field, solar wind
# Integrates with AIMES suit bio-acoustic shielding
# Carrington Storm Motors / Safe Pod Engineering Company
#
# Modes:
#   earthbeat.sh                    # Single instance (default)
#   earthbeat.sh parallel N         # N parallel instances
#   earthbeat.sh tokenring N        # N instances in token ring
#   earthbeat.sh parallel tokenring N  # N parallel token rings

set -euo pipefail

BASE_DIR="${BASE_DIR:-CSMScripts}"
LOG_FILE="${BASE_DIR}/earthbeat.log"
DATA_DIR="${BASE_DIR}/earthbeatv2-data"
SCHUMANN_LOG="${DATA_DIR}/schumann.log"
GEOMAG_LOG="${DATA_DIR}/geomag.log"
SOLAR_LOG="${DATA_DIR}/solar.log"
VITALS_LOG="${DATA_DIR}/vitals.log"

mkdir -p "$BASE_DIR"
mkdir -p "$DATA_DIR"

# ─── Color Output ───────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

log() { echo -e "${CYAN}[EARTHBEAT]${NC} $*" | tee -a "$LOG_FILE"; }
success() { echo -e "${GREEN}[✓]${NC} $*" | tee -a "$LOG_FILE"; }
warn() { echo -e "${YELLOW}[!]${NC} $*" | tee -a "$LOG_FILE"; }
error() { echo -e "${RED}[✗]${NC} $*" | tee -a "$LOG_FILE"; }
banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n" | tee -a "$LOG_FILE"; }

# ─── Signal Handling ────────────────────────────────────────────────────────
PIDS=()
cleanup() {
    for pid in "${PIDS[@]}"; do
        kill "$pid" 2>/dev/null || true
    done
    wait 2>/dev/null || true
    exit 0
}
trap cleanup SIGTERM SIGINT EXIT

# ─── Vital Sign Generators ──────────────────────────────────────────────────
generate_schumann() {
    local base=7.83
    local variance=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print (rand()-0.5)*0.3}')
    local freq=$(awk "BEGIN {print $base + $variance}")
    local amplitude=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 0.5 + rand()*2.0}')
    local q_factor=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 3 + rand()*4}')
    echo "$freq,$amplitude,$q_factor"
}

generate_geomag() {
    local x=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 20000 + (rand()-0.5)*500}')
    local y=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print -5000 + (rand()-0.5)*200}')
    local z=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 45000 + (rand()-0.5)*300}')
    local f=$(awk "BEGIN {print sqrt($x^2 + $y^2 + $z^2)}")
    local d=$(awk "BEGIN {print atan2($y, $x) * 180 / 3.14159}")
    local i=$(awk "BEGIN {print atan2($z, sqrt($x^2 + $y^2)) * 180 / 3.14159}")
    echo "$x,$y,$z,$f,$d,$i"
}

generate_solar() {
    local speed=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 300 + rand()*500}')
    local density=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 1 + rand()*20}')
    local bz=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print (rand()-0.5)*20}')
    local bt=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 1 + rand()*15}')
    local temp=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print 50000 + rand()*200000}')
    echo "$speed,$density,$bz,$bt,$temp"
}

calculate_kp_index() {
    local solar="$1"
    local bz=$(echo "$solar" | cut -d, -f3)
    local speed=$(echo "$solar" | cut -d, -f1)
    local bt=$(echo "$solar" | cut -d, -f4)
    local v_bt=$(awk "BEGIN {print $speed * $bt}")
    local kp=$(awk "BEGIN {print int(0.5 + 0.001 * $v_bt + 0.1 * sqrt($bt))}")
    (( kp > 9 )) && kp=9
    (( kp < 0 )) && kp=0
    echo "$kp"
}

calculate_gic_risk() {
    local geomag="$1"
    local solar="$2"
    local dbdt=$(awk -v seed="$RANDOM" 'BEGIN {srand(seed); print rand()*5000}')
    local conductivity=0.01
    local e_field=$(awk "BEGIN {print $dbdt * 1000 / (2 * 3.14159 * 6371000) * $conductivity}")
    local risk_level="LOW"
    (( $(awk "BEGIN {print ($e_field > 1)}") )) && risk_level="MODERATE"
    (( $(awk "BEGIN {print ($e_field > 5)}") )) && risk_level="HIGH"
    (( $(awk "BEGIN {print ($e_field > 20)}") )) && risk_level="EXTREME"
    echo "$e_field,$risk_level"
}

calculate_schumann_coupling() {
    local schumann="$1"
    local freq=$(echo "$schumann" | cut -d, -f1)
    local amp=$(echo "$schumann" | cut -d, -f2)
    local alpha_coupling=$(awk "BEGIN {print exp(-(($freq - 7.83)^2) / 0.5) * $amp / 2.0}")
    local beta_coupling=$(awk "BEGIN {print (exp(-(($freq - 14.3)^2) / 1.0) + exp(-(($freq - 20.8)^2) / 1.0)) * $amp / 3.0}")
    local cardiac_coupling=$(awk "BEGIN {print exp(-(($freq/4 - 1.5)^2) / 0.25) * $amp / 5.0}")
    echo "$alpha_coupling,$beta_coupling,$cardiac_coupling"
}

# ─── Token Ring Communication ───────────────────────────────────────────────
TOKEN_DIR="${BASE_DIR}/.tokenringv2"
init_token_ring() {
    local count=$1
    mkdir -p "$TOKEN_DIR"
    for i in $(seq 0 $((count-1))); do
        echo "0" > "$TOKEN_DIR/token_$i"
    done
    echo "1" > "$TOKEN_DIR/token_0"
    log "Token ring initialized with $count nodes"
}

pass_token() {
    local id=$1
    local count=$2
    local token_file="$TOKEN_DIR/token_$id"
    local next=$(( (id + 1) % count ))
    local next_token="$TOKEN_DIR/token_$next"
    
    while [[ "$(cat "$token_file" 2>/dev/null || echo 0)" != "1" ]]; do
        sleep 0.1
    done
    
    echo "0" > "$token_file"
    echo "1" > "$next_token"
}

# ─── Single Instance Loop ───────────────────────────────────────────────────
run_instance() {
    local id=$1
    local count=$2
    local mode=$3
    local interval=${4:-6}
    local instance_log="${BASE_DIR}/earthbeatv2-instance-${id}.log"
    local pid_file="${BASE_DIR}/earthbeatv2-${id}.pid"
    
    echo $$ > "$pid_file"
    echo "[EARTHBEAT-$id] Started at $(date -u) | PID: $$ | Mode: $mode" >> "$instance_log"
    
    local cleanup_instance
    cleanup_instance() {
        echo "[EARTHBEAT-$id] Stopping at $(date -u)" >> "$instance_log"
        rm -f "$pid_file"
        exit 0
    }
    trap cleanup_instance SIGTERM SIGINT EXIT
    
    SECONDS=0
    CYCLE=0
    CHARS="♥♦♣♠"
    
    while true; do
        CYCLE=$((CYCLE + 1))
        
        if [[ "$mode" == "tokenring" ]]; then
            pass_token "$id" "$count"
        fi
        
        SCHUMANN=$(generate_schumann)
        GEOMAG=$(generate_geomag)
        SOLAR=$(generate_solar)
        KP=$(calculate_kp_index "$SOLAR")
        GIC_RESULT=$(calculate_gic_risk "$GEOMAG" "$SOLAR")
        SCH_COUPLING=$(calculate_schumann_coupling "$SCHUMANN")
        TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        
        echo "$TIMESTAMP,$SCHUMANN,$SCH_COUPLING" >> "$SCHUMANN_LOG"
        echo "$TIMESTAMP,$GEOMAG,$KP" >> "$GEOMAG_LOG"
        echo "$TIMESTAMP,$SOLAR" >> "$SOLAR_LOG"
        echo "$TIMESTAMP,schumann=$SCHUMANN,geomag=$GEOMAG,solar=$SOLAR,kp=$KP,gic=$GIC_RESULT,sch_coupling=$SCH_COUPLING" >> "$VITALS_LOG"
        
        IDX=$((CYCLE % ${#CHARS}))
        CHAR="${CHARS:$IDX:1}"
        printf "%s" "$CHAR" >&2
        
        E_FIELD=$(echo "$GIC_RESULT" | cut -d, -f1)
        RISK=$(echo "$GIC_RESULT" | cut -d, -f2)
        
        if (( CYCLE % 10 == 0 )); then
            ALPHA=$(echo "$SCH_COUPLING" | cut -d, -f1)
            BETA=$(echo "$SCH_COUPLING" | cut -d, -f2)
            CARDIAC=$(echo "$SCH_COUPLING" | cut -d, -f3)
            echo "[EARTHBEAT-$id] $(date -u) | Cycle: $CYCLE | Sch: $(echo $SCHUMANN | cut -d, -f1)Hz | Geo: Kp=$KP | Solar: $(echo $SOLAR | cut -d, -f1)km/s | Coupling: α=$ALPHA β=$BETA ♥=$CARDIAC | GIC: $RISK" >> "$instance_log"
        fi
        
        if [[ "$RISK" == "EXTREME" ]] || (( KP >= 7 )); then
            echo "[EARTHBEAT-$id] ALERT: Carrington-class | $(date -u) | Kp=$KP | E-field=$E_FIELD V/km | Risk=$RISK" >> "$instance_log"
            echo "CARRINGTON_ALERT:Kp=$KP:Efield=$E_FIELD:Risk=$RISK:$(date -u +%s)" > "${BASE_DIR}/.carrington-alert"
        fi
        
        sleep "$interval"
    done
}

# ─── Main Entry Point ───────────────────────────────────────────────────────
MODE="single"
COUNT=1
TOKENRING=false
PARALLEL=false

if [[ $# -gt 0 ]]; then
    case "$1" in
        parallel)
            PARALLEL=true
            if [[ $# -ge 2 ]] && [[ "$2" =~ ^[0-9]+$ ]]; then
                COUNT=$2
            fi
            ;;
        tokenring)
            TOKENRING=true
            if [[ $# -ge 2 ]] && [[ "$2" =~ ^[0-9]+$ ]]; then
                COUNT=$2
            fi
            ;;
        *)
            if [[ "$1" =~ ^[0-9]+$ ]]; then
                COUNT=$1
            fi
            ;;
    esac
    
    if [[ "$2" == "tokenring" ]] && [[ "$PARALLEL" == "true" ]]; then
        TOKENRING=true
        if [[ $# -ge 3 ]] && [[ "$3" =~ ^[0-9]+$ ]]; then
            COUNT=$3
        fi
    fi
fi

if [[ "$PARALLEL" == "true" ]] || [[ "$TOKENRING" == "true" ]]; then
    MODE="parallel"
    if [[ "$TOKENRING" == "true" ]]; then
        MODE="tokenring"
        init_token_ring "$COUNT"
    fi
    
    banner "🌍 EARTHBEAT — $MODE mode with $COUNT instances"
    log "Starting $COUNT earthbeat instances ($MODE)..."
    
    for i in $(seq 0 $((COUNT-1))); do
        run_instance "$i" "$COUNT" "$MODE" &
        PIDS+=($!)
        log "Instance $i started (PID: $!)"
        sleep 0.2
    done
    
    log "All $COUNT instances running. Heartbeat chars on stderr. Ctrl+C to stop."
    wait
else
    banner "🌍 EARTHBEAT — Single instance mode"
    run_instance 0 1 "single"
fi