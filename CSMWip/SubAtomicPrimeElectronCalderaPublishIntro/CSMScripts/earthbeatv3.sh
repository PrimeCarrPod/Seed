#!/usr/bin/env bash
# EARTHBEAT v3 — Planetary Heartbeat Monitor with Chamber Architecture
# Merges: planetary vital signs (Schumann/geomag/solar) + 4-chamber heartbeat array
# Modes: single | parallel N | tokenring N | parallel tokenring N | chamber
# Carrington Storm Motors / Safe Pod Engineering Company

set -euo pipefail

BASE_DIR="${BASE_DIR:-CSMScripts}"
LOG_FILE="${BASE_DIR}/earthbeatv3.log"
DATA_DIR="${BASE_DIR}/earthbeatv3-data"
SCHUMANN_LOG="${DATA_DIR}/schumann.log"
GEOMAG_LOG="${DATA_DIR}/geomag.log"
SOLAR_LOG="${DATA_DIR}/solar.log"
VITALS_LOG="${DATA_DIR}/vitals.log"
CHAMBER_LOG="${DATA_DIR}/chambers.log"

mkdir -p "$BASE_DIR"
mkdir -p "$DATA_DIR"

# ─── Colors ─────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

log() { echo -e "${CYAN}[EARTHBEATv3]${NC} $*" | tee -a "$LOG_FILE"; }
success() { echo -e "${GREEN}[✓]${NC} $*" | tee -a "$LOG_FILE"; }
warn() { echo -e "${YELLOW}[!]${NC} $*" | tee -a "$LOG_FILE"; }
error() { echo -e "${RED}[✗]${NC} $*" | tee -a "$LOG_FILE"; }
banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n" | tee -a "$LOG_FILE"; }

# ─── Signal Handling ────────────────────────────────────────────────────────
PIDS=()
CHAMBER_PIDS=()
cleanup() {
    for pid in "${PIDS[@]}" "${CHAMBER_PIDS[@]}"; do
        kill "$pid" 2>/dev/null || true
    done
    wait 2>/dev/null || true
    exit 0
}
trap cleanup SIGTERM SIGINT EXIT

# ─── Chamber Definitions ────────────────────────────────────────────────────
# Each chamber has a specific monitoring focus
declare -A CHAMBER_FOCUS=(
    [1]="SCHUMANN"      # Chamber 1: Schumann resonance specialist
    [2]="GEOMAG"        # Chamber 2: Geomagnetic field specialist
    [3]="SOLAR"         # Chamber 3: Solar wind specialist
    [4]="INTEGRATION"   # Chamber 4: Cross-correlation & alerting
)

declare -A CHAMBER_INTERVAL=(
    [1]=3
    [2]=5
    [3]=7
    [4]=10
)

declare -A CHAMBER_CHARS=(
    [1]="♥"
    [2]="♦"
    [3]="♣"
    [4]="♠"
)

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

# ─── Chamber 1: Schumann Specialist ─────────────────────────────────────────
run_chamber_schumann() {
    local id=1
    local interval=${CHAMBER_INTERVAL[$id]}
    local char=${CHAMBER_CHARS[$id]}
    local chamber_log="${DATA_DIR}/chamber-${id}.log"
    local pid_file="${BASE_DIR}/earthbeatv3-chamber-${id}.pid"
    
    echo $$ > "$pid_file"
    echo "[CHAMBER-$id] Started at $(date -u) | Focus: ${CHAMBER_FOCUS[$id]} | Interval: ${interval}s" >> "$chamber_log"
    
    cleanup_chamber() {
        echo "[CHAMBER-$id] Stopping at $(date -u)" >> "$chamber_log"
        rm -f "$pid_file"
        exit 0
    }
    trap cleanup_chamber SIGTERM SIGINT EXIT
    
    local cycle=0
    while true; do
        cycle=$((cycle + 1))
        local schumann=$(generate_schumann)
        local freq=$(echo "$schumann" | cut -d, -f1)
        local amp=$(echo "$schumann" | cut -d, -f2)
        local q=$(echo "$schumann" | cut -d, -f3)
        local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        
        echo "$timestamp,$schumann" >> "$SCHUMANN_LOG"
        echo "$timestamp,chamber=$id,focus=${CHAMBER_FOCUS[$id]},freq=$freq,amp=$amp,q=$q" >> "$CHAMBER_LOG"
        
        printf "%s" "$char" >&2
        
        if (( cycle % 20 == 0 )); then
            local coupling=$(calculate_schumann_coupling "$schumann")
            echo "[CHAMBER-$id] $(date -u) | Cycle: $cycle | Freq: ${freq}Hz | Amp: ${amp}pT | Q: $q | Coupling: $coupling" >> "$chamber_log"
        fi
        
        sleep "$interval"
    done
}

# ─── Chamber 2: Geomagnetic Specialist ──────────────────────────────────────
run_chamber_geomag() {
    local id=2
    local interval=${CHAMBER_INTERVAL[$id]}
    local char=${CHAMBER_CHARS[$id]}
    local chamber_log="${DATA_DIR}/chamber-${id}.log"
    local pid_file="${BASE_DIR}/earthbeatv3-chamber-${id}.pid"
    
    echo $$ > "$pid_file"
    echo "[CHAMBER-$id] Started at $(date -u) | Focus: ${CHAMBER_FOCUS[$id]} | Interval: ${interval}s" >> "$chamber_log"
    
    cleanup_chamber() {
        echo "[CHAMBER-$id] Stopping at $(date -u)" >> "$chamber_log"
        rm -f "$pid_file"
        exit 0
    }
    trap cleanup_chamber SIGTERM SIGINT EXIT
    
    local cycle=0
    while true; do
        cycle=$((cycle + 1))
        local geomag=$(generate_geomag)
        local x=$(echo "$geomag" | cut -d, -f1)
        local y=$(echo "$geomag" | cut -d, -f2)
        local z=$(echo "$geomag" | cut -d, -f3)
        local f=$(echo "$geomag" | cut -d, -f4)
        local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        
        echo "$timestamp,$geomag" >> "$GEOMAG_LOG"
        echo "$timestamp,chamber=$id,focus=${CHAMBER_FOCUS[$id]},X=$x,Y=$y,Z=$z,F=$f" >> "$CHAMBER_LOG"
        
        printf "%s" "$char" >&2
        
        if (( cycle % 12 == 0 )); then
            echo "[CHAMBER-$id] $(date -u) | Cycle: $cycle | X: ${x}nT Y: ${y}nT Z: ${z}nT | F: ${f}nT" >> "$chamber_log"
        fi
        
        sleep "$interval"
    done
}

# ─── Chamber 3: Solar Wind Specialist ───────────────────────────────────────
run_chamber_solar() {
    local id=3
    local interval=${CHAMBER_INTERVAL[$id]}
    local char=${CHAMBER_CHARS[$id]}
    local chamber_log="${DATA_DIR}/chamber-${id}.log"
    local pid_file="${BASE_DIR}/earthbeatv3-chamber-${id}.pid"
    
    echo $$ > "$pid_file"
    echo "[CHAMBER-$id] Started at $(date -u) | Focus: ${CHAMBER_FOCUS[$id]} | Interval: ${interval}s" >> "$chamber_log"
    
    cleanup_chamber() {
        echo "[CHAMBER-$id] Stopping at $(date -u)" >> "$chamber_log"
        rm -f "$pid_file"
        exit 0
    }
    trap cleanup_chamber SIGTERM SIGINT EXIT
    
    local cycle=0
    while true; do
        cycle=$((cycle + 1))
        local solar=$(generate_solar)
        local speed=$(echo "$solar" | cut -d, -f1)
        local density=$(echo "$solar" | cut -d, -f2)
        local bz=$(echo "$solar" | cut -d, -f3)
        local bt=$(echo "$solar" | cut -d, -f4)
        local temp=$(echo "$solar" | cut -d, -f5)
        local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        
        echo "$timestamp,$solar" >> "$SOLAR_LOG"
        echo "$timestamp,chamber=$id,focus=${CHAMBER_FOCUS[$id]},speed=$speed,density=$density,bz=$bz,bt=$bt,temp=$temp" >> "$CHAMBER_LOG"
        
        printf "%s" "$char" >&2
        
        if (( cycle % 8 == 0 )); then
            local kp=$(calculate_kp_index "$solar")
            echo "[CHAMBER-$id] $(date -u) | Cycle: $cycle | Speed: ${speed}km/s | Density: ${density}p/cm³ | Bz: ${bz}nT | Bt: ${bt}nT | Kp: $kp" >> "$chamber_log"
        fi
        
        sleep "$interval"
    done
}

# ─── Chamber 4: Integration & Alerting ──────────────────────────────────────
run_chamber_integration() {
    local id=4
    local interval=${CHAMBER_INTERVAL[$id]}
    local char=${CHAMBER_CHARS[$id]}
    local chamber_log="${DATA_DIR}/chamber-${id}.log"
    local pid_file="${BASE_DIR}/earthbeatv3-chamber-${id}.pid"
    
    echo $$ > "$pid_file"
    echo "[CHAMBER-$id] Started at $(date -u) | Focus: ${CHAMBER_FOCUS[$id]} | Interval: ${interval}s" >> "$chamber_log"
    
    cleanup_chamber() {
        echo "[CHAMBER-$id] Stopping at $(date -u)" >> "$chamber_log"
        rm -f "$pid_file"
        exit 0
    }
    trap cleanup_chamber SIGTERM SIGINT EXIT
    
    local cycle=0
    while true; do
        cycle=$((cycle + 1))
        local schumann=$(generate_schumann)
        local geomag=$(generate_geomag)
        local solar=$(generate_solar)
        local kp=$(calculate_kp_index "$solar")
        local gic=$(calculate_gic_risk "$geomag" "$solar")
        local coupling=$(calculate_schumann_coupling "$schumann")
        local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        
        local e_field=$(echo "$gic" | cut -d, -f1)
        local risk=$(echo "$gic" | cut -d, -f2)
        
        echo "$timestamp,schumann=$schumann,geomag=$geomag,solar=$solar,kp=$kp,gic=$gic,coupling=$coupling" >> "$VITALS_LOG"
        echo "$timestamp,chamber=$id,focus=${CHAMBER_FOCUS[$id]},kp=$kp,e_field=$e_field,risk=$risk" >> "$CHAMBER_LOG"
        
        printf "%s" "$char" >&2
        
        if (( cycle % 6 == 0 )); then
            echo "[CHAMBER-$id] $(date -u) | Cycle: $cycle | Kp: $kp | E-field: ${e_field}V/km | Risk: $risk | Coupling: $coupling" >> "$chamber_log"
        fi
        
        if [[ "$risk" == "EXTREME" ]] || (( kp >= 7 )); then
            echo "[CHAMBER-$id] ALERT: Carrington-class | $(date -u) | Kp=$kp | E-field=$e_field | Risk=$risk" >> "$chamber_log"
            echo "CARRINGTON_ALERT:Kp=$kp:Efield=$e_field:Risk=$risk:$(date -u +%s)" > "${BASE_DIR}/.carrington-alert"
        fi
        
        sleep "$interval"
    done
}

# ─── Token Ring (for parallel/tokenring modes) ──────────────────────────────
TOKEN_DIR="${BASE_DIR}/.tokenringv3"
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

# ─── Generic Instance (for parallel/tokenring modes) ────────────────────────
run_instance() {
    local id=$1
    local count=$2
    local mode=$3
    local interval=${4:-6}
    local instance_log="${DATA_DIR}/instance-${id}.log"
    local pid_file="${BASE_DIR}/earthbeatv3-instance-${id}.pid"
    
    echo $$ > "$pid_file"
    echo "[INSTANCE-$id] Started at $(date -u) | Mode: $mode | Interval: ${interval}s" >> "$instance_log"
    
    cleanup_instance() {
        echo "[INSTANCE-$id] Stopping at $(date -u)" >> "$instance_log"
        rm -f "$pid_file"
        exit 0
    }
    trap cleanup_instance SIGTERM SIGINT EXIT
    
    local cycle=0
    local chars="♥♦♣♠"
    
    while true; do
        cycle=$((cycle + 1))
        
        if [[ "$mode" == "tokenring" ]]; then
            pass_token "$id" "$count"
        fi
        
        local schumann=$(generate_schumann)
        local geomag=$(generate_geomag)
        local solar=$(generate_solar)
        local kp=$(calculate_kp_index "$solar")
        local gic=$(calculate_gic_risk "$geomag" "$solar")
        local coupling=$(calculate_schumann_coupling "$schumann")
        local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        
        echo "$timestamp,$schumann,$coupling" >> "$SCHUMANN_LOG"
        echo "$timestamp,$geomag,$kp" >> "$GEOMAG_LOG"
        echo "$timestamp,$solar" >> "$SOLAR_LOG"
        echo "$timestamp,schumann=$schumann,geomag=$geomag,solar=$solar,kp=$kp,gic=$gic,coupling=$coupling" >> "$VITALS_LOG"
        
        local idx=$((cycle % ${#chars}))
        printf "%s" "${chars:$idx:1}" >&2
        
        local e_field=$(echo "$gic" | cut -d, -f1)
        local risk=$(echo "$gic" | cut -d, -f2)
        
        if (( cycle % 10 == 0 )); then
            echo "[INSTANCE-$id] $(date -u) | Cycle: $cycle | Kp: $kp | Risk: $risk" >> "$instance_log"
        fi
        
        if [[ "$risk" == "EXTREME" ]] || (( kp >= 7 )); then
            echo "[INSTANCE-$id] ALERT: Carrington-class | $(date -u) | Kp=$kp | E-field=$e_field | Risk=$risk" >> "$instance_log"
            echo "CARRINGTON_ALERT:Kp=$kp:Efield=$e_field:Risk=$risk:$(date -u +%s)" > "${BASE_DIR}/.carrington-alert"
        fi
        
        sleep "$interval"
    done
}

# ─── Chamber Mode (4 specialized chambers) ──────────────────────────────────
run_chamber_mode() {
    banner "🌍 EARTHBEAT v3 — Chamber Mode (4 specialized chambers)"
    log "Starting 4 chambers: Schumann(3s) | Geomag(5s) | Solar(7s) | Integration(10s)"
    
    run_chamber_schumann &
    CHAMBER_PIDS+=($!)
    log "Chamber 1 (Schumann) started (PID: $!)"
    
    run_chamber_geomag &
    CHAMBER_PIDS+=($!)
    log "Chamber 2 (Geomag) started (PID: $!)"
    
    run_chamber_solar &
    CHAMBER_PIDS+=($!)
    log "Chamber 3 (Solar) started (PID: $!)"
    
    run_chamber_integration &
    CHAMBER_PIDS+=($!)
    log "Chamber 4 (Integration) started (PID: $!)"
    
    log "All 4 chambers running. Heartbeat: ♥=Schumann ♦=Geomag ♣=Solar ♠=Integration"
    wait
}

# ─── Main Entry Point ───────────────────────────────────────────────────────
MODE="single"
COUNT=1
TOKENRING=false
PARALLEL=false

if [[ $# -gt 0 ]]; then
    case "$1" in
        chamber)
            MODE="chamber"
            ;;
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
    
    if [[ "$1" == "parallel" && "$2" == "tokenring" ]] && [[ "$PARALLEL" == "true" ]]; then
        TOKENRING=true
        if [[ $# -ge 3 ]] && [[ "$3" =~ ^[0-9]+$ ]]; then
            COUNT=$3
        fi
    fi
fi

case "$MODE" in
    chamber)
        run_chamber_mode
        ;;
    *)
        if [[ "$PARALLEL" == "true" ]] || [[ "$TOKENRING" == "true" ]]; then
            MODE="parallel"
            if [[ "$TOKENRING" == "true" ]]; then
                MODE="tokenring"
                init_token_ring "$COUNT"
            fi
            
            banner "🌍 EARTHBEAT v3 — $MODE mode with $COUNT instances"
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
            banner "🌍 EARTHBEAT v3 — Single instance mode"
            run_instance 0 1 "single"
        fi
        ;;
esac