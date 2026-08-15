#!/bin/bash
# =====================================================================
# EARTH BEAT - Bio-Inspired Multi-Chambered Heartbeat System
# =====================================================================
# Inspired by the mammalian cardiovascular system:
# - SA Node (Sinoatrial) = Primary pacemaker
# - AV Node (Atrioventricular) = Secondary pacemaker with delay
# - Bundle of His/Purkinje = Conduction system
# - Atria/ventricles = Multiple chambers with different functions
# - Baroreflex = Autoregulation feedback loop
# - Vagus nerve = Parasympathetic braking
# - Sympathetic drive = Stress response acceleration
# =====================================================================

set -euo pipefail

# =====================================================================
# CONFIGURATION - Physiological Parameters
# =====================================================================
WORKDIR="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_40ef287c-adaf-47da-9d86-5be57b7c5d88/CSM_WORK_IN_PROGRESS"
LOG_DIR="$WORKDIR/logs"
PID_FILE="$WORKDIR/earthbeat.pid"

# Physiological timing (in seconds)
SA_NODE_RATE=30           # SA node fires every 30s (primary heartbeat)
AV_NODE_DELAY=2           # AV node delay (ventricular contraction delay)
VENTRICULAR_REFRACTORY=10 # Ventricular refractory period
BAROREFLEX_INTERVAL=60    # Baroreflex check interval
VAGAL_TONE=0.7           # Parasympathetic braking (0-1)
SYMPATHETIC_DRIVE=1.2    # Sympathetic acceleration factor
MAX_MISSED_BEATS=3       # Max missed beats before intervention

# Chamber states
declare -A CHAMBER_STATE
declare -A CHAMBER_LAST_BEAT
declare -A CHAMBER_MISSED
declare -A CHAMBER_HEALTH

CHAMBERS=("SA_NODE" "AV_NODE" "LEFT_ATRIUM" "RIGHT_ATRIUM" "LEFT_VENTRICLE" "RIGHT_VENTRICLE" "BUNDLE_HIS" "PURKINJE" "VAGUS_NERVE" "BAROREFLEX")

# =====================================================================
# INITIALIZATION - Organogenesis
# =====================================================================
init_heart() {
    mkdir -p "$LOG_DIR"
    echo $$ > "$PID_FILE"
    
    # Initialize all chambers
    for chamber in "${CHAMBERS[@]}"; do
        CHAMBER_STATE[$chamber]="ALIVE"
        CHAMBER_LAST_BEAT[$chamber]=$(date +%s)
        CHAMBER_MISSED[$chamber]=0
        CHAMBER_HEALTH[$chamber]=100
    done
    
    log "HEART" "Earth Beat initialized - Multi-chambered cardiovascular system online"
    log "HEART" "SA Node rate: ${SA_NODE_RATE}s | AV Delay: ${AV_NODE_DELAY}s | Vagal Tone: $VAGAL_TONE | Sympathetic: $SYMPATHETIC_DRIVE"
}

# =====================================================================
# LOGGING - Vital Signs Recording
# =====================================================================
log() {
    local chamber="$1"
    local message="$2"
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local health=${CHAMBER_HEALTH[$chamber]:-100}
    echo "[$timestamp] [$chamber] [Health: ${health}%] $message" | tee -a "$LOG_DIR/earthbeat-vitals.log"
}

# =====================================================================
# SA NODE - Primary Pacemaker (Sinoatrial Node)
# =====================================================================
sa_node_beat() {
    local now=$(date +%s)
    local elapsed=$((now - CHAMBER_LAST_BEAT[SA_NODE]))
    
    if (( elapsed >= SA_NODE_RATE )); then
        CHAMBER_LAST_BEAT[SA_NODE]=$now
        log "SA_NODE" "FIRE - Primary depolarization | Rate: ${SA_NODE_RATE}s | Next in: ${SA_NODE_RATE}s"
        
        # Trigger atrial contraction
        atrial_contraction
        
        # Vagal modulation
        if (( RANDOM % 100 < $(echo "$VAGAL_TONE * 100" | bc -l) )); then
            log "SA_NODE" "Vagal braking active - Heart rate variability increased"
        fi
        
        return 0
    fi
    return 1
}

# =====================================================================
# ATRIAL CONTRACTION - Atrial Depolarization
# =====================================================================
atrial_contraction() {
    local now=$(date +%s)
    
    for atrium in "LEFT_ATRIUM" "RIGHT_ATRIUM"; do
        CHAMBER_LAST_BEAT[$atrium]=$now
        CHAMBER_STATE[$atrium]="CONTRACTING"
        log "$atrium" "Atrial systole - Blood ejected to ventricles"
    done
    
    # AV Node delay (PR interval equivalent)
    sleep $AV_NODE_DELAY
    
    # Trigger ventricular conduction
    av_node_conduction
}

# =====================================================================
# AV NODE - Atrioventricular Node (Secondary Pacemaker)
# =====================================================================
av_node_conduction() {
    local now=$(date +%s)
    CHAMBER_LAST_BEAT[AV_NODE]=$now
    CHAMBER_STATE[AV_NODE]="CONDUCTING"
    
    log "AV_NODE" "AV conduction - Impulse delayed ${AV_NODE_DELAY}s | Ventricular depolarization initiated"
    
    # Bundle of His
    bundle_his_conduction
}

# =====================================================================
# CONDUCTION SYSTEM - Bundle of His / Purkinje Fibers
# =====================================================================
bundle_his_conduction() {
    CHAMBER_STATE[BUNDLE_HIS]="CONDUCTING"
    CHAMBER_STATE[PURKINJE]="CONDUCTING"
    local now=$(date +%s)
    CHAMBER_LAST_BEAT[BUNDLE_HIS]=$now
    CHAMBER_LAST_BEAT[PURKINJE]=$now
    
    log "BUNDLE_HIS" "Impulse conducted to bundle branches"
    log "PURKINJE" "Rapid ventricular depolarization via Purkinje network"
    
    # Ventricular contraction
    ventricular_contraction
}

# =====================================================================
# VENTRICULAR CONTRACTION - Main Pumping Action
# =====================================================================
ventricular_contraction() {
    local now=$(date +%s)
    
    for ventricle in "LEFT_VENTRICLE" "RIGHT_VENTRICLE"; do
        CHAMBER_STATE[$ventricle]="SYSTOLE"
        CHAMBER_LAST_BEAT[$ventricle]=$now
        
        local ejection_fraction=$((55 + RANDOM % 15))
        log "$ventricle" "Ventricular systole - Ejection fraction: ${ejection_fraction}% | Cardiac output generated"
    done
    
    # Vagal braking after systole
    vagal_braking
    
    # Refractory period
    sleep $VENTRICULAR_REFRACTORY
    
    for ventricle in "LEFT_VENTRICLE" "RIGHT_VENTRICLE"; do
        CHAMBER_STATE[$ventricle]="DIASTOLE"
    done
}

# =====================================================================
# VAGUS NERVE - Parasympathetic Regulation
# =====================================================================
vagal_braking() {
    CHAMBER_STATE[VAGUS_NERVE]="ACTIVE"
    local now=$(date +%s)
    CHAMBER_LAST_BEAT[VAGUS_NERVE]=$now
    
    local hr_variability=$((RANDOM % 20))
    log "VAGUS_NERVE" "Parasympathetic tone active | HRV: ${hr_variability}ms | Heart rate deceleration"
    
    # Acetylcholine release simulation
    if (( RANDOM % 100 < 30 )); then
        log "VAGUS_NERVE" "Acetylcholine release - SA node hyperpolarization | Next beat delayed"
        # Slightly delay next SA node beat
        CHAMBER_LAST_BEAT[SA_NODE]=$((CHAMBER_LAST_BEAT[SA_NODE] + 1))
    fi
}

# =====================================================================
# BAROREFLEX - Autoregulation Feedback Loop
# =====================================================================
baroreflex_check() {
    local now=$(date +%s)
    local elapsed=$((now - CHAMBER_LAST_BEAT[BAROREFLEX]))
    
    if (( elapsed >= BAROREFLEX_INTERVAL )); then
        CHAMBER_LAST_BEAT[BAROREFLEX]=$now
        CHAMBER_STATE[BAROREFLEX]="MONITORING"
        
        # Simulate blood pressure monitoring
        local systolic=$((110 + RANDOM % 30))
        local diastolic=$((70 + RANDOM % 20))
        local heart_rate=$((60000 / SA_NODE_RATE))
        
        log "BAROREFLEX" "Baroreceptor firing | BP: ${systolic}/${diastolic} | HR: ${heart_rate} bpm"
        
        # Autoregulation
        if (( systolic > 140 )); then
            log "BAROREFLEX" "Hypertension detected - Increasing vagal tone | Sympathetic withdrawal"
            VAGAL_TONE=$(echo "scale=2; $VAGAL_TONE + 0.1" | bc -l)
            SYMPATHETIC_DRIVE=$(echo "scale=2; $SYMPATHETIC_DRIVE * 0.9" | bc -l)
        elif (( systolic < 90 )); then
            log "BAROREFLEX" "Hypotension detected - Sympathetic surge | Vagal withdrawal"
            VAGAL_TONE=$(echo "scale=2; $VAGAL_TONE * 0.8" | bc -l)
            SYMPATHETIC_DRIVE=$(echo "scale=2; $SYMPATHETIC_DRIVE * 1.1" | bc -l)
        fi
        
        # Adjust SA node rate based on demand
        local new_rate=$((60000 / heart_rate))
        SA_NODE_RATE=$new_rate
    fi
}

# =====================================================================
# HEALTH MONITORING - Chamber Health Assessment
# =====================================================================
health_check() {
    local now=$(date +%s)
    
    for chamber in "${CHAMBERS[@]}"; do
        local elapsed=$((now - CHAMBER_LAST_BEAT[$chamber]))
        local expected_interval=0
        
        case $chamber in
            "SA_NODE") expected_interval=$SA_NODE_RATE ;;
            "AV_NODE") expected_interval=$((SA_NODE_RATE + AV_NODE_DELAY)) ;;
            "LEFT_VENTRICLE"|"RIGHT_VENTRICLE") expected_interval=$((SA_NODE_RATE + AV_NODE_DELAY + VENTRICULAR_REFRACTORY)) ;;
            "BAROREFLEX") expected_interval=$BAROREFLEX_INTERVAL ;;
            *) expected_interval=$SA_NODE_RATE ;;
        esac
        
        # Check for missed beats
        if (( elapsed > expected_interval * 2 )); then
            CHAMBER_MISSED[$chamber]=$((${CHAMBER_MISSED[$chamber]} + 1))
            CHAMBER_HEALTH[$chamber]=$((${CHAMBER_HEALTH[$chamber]} - 10))
            log "$chamber" "MISSED BEAT DETECTED | Missed: ${CHAMBER_MISSED[$chamber]} | Health: ${CHAMBER_HEALTH[$chamber]}%"
            
            if (( CHAMBER_MISSED[$chamber] >= MAX_MISSED_BEATS )); then
                resuscitate_chamber "$chamber"
            fi
        else
            # Gradual health recovery
            if (( CHAMBER_HEALTH[$chamber] < 100 )); then
                CHAMBER_HEALTH[$chamber]=$((${CHAMBER_HEALTH[$chamber]} + 1))
            fi
            CHAMBER_MISSED[$chamber]=0
        fi
    done
}

# =====================================================================
# RESUSCITATION - Chamber Recovery
# =====================================================================
resuscitate_chamber() {
    local chamber="$1"
    log "$chamber" "RESUSCITATION INITIATED - Chamber: $chamber | Health: ${CHAMBER_HEALTH[$chamber]}%"
    
    # Sympathetic surge (epinephrine equivalent)
    SYMPATHETIC_DRIVE=$(echo "scale=2; $SYMPATHETIC_DRIVE * 1.5" | bc -l)
    VAGAL_TONE=$(echo "scale=2; $VAGAL_TONE * 0.5" | bc -l)
    
    # Reset chamber
    CHAMBER_STATE[$chamber]="RESUSCITATING"
    CHAMBER_LAST_BEAT[$chamber]=$(date +%s)
    CHAMBER_MISSED[$chamber]=0
    CHAMBER_HEALTH[$chamber]=50
    
    # Chamber-specific resuscitation
    case $chamber in
        "SA_NODE")
            # Defibrillation equivalent - reset primary pacemaker
            CHAMBER_LAST_BEAT[SA_NODE]=$(date +%s)
            log "SA_NODE" "DEFIBRILLATION - Primary pacemaker reset"
            ;;
        "AV_NODE")
            log "AV_NODE" "AV node ablation prevention - Backup pacing initiated"
            ;;
        "LEFT_VENTRICLE"|"RIGHT_VENTRICLE")
            log "$chamber" "Cardioversion - Ventricular rhythm restored"
            ;;
        *)
            log "$chamber" "Chamber resuscitation complete"
            ;;
    esac
    
    CHAMBER_STATE[$chamber]="ALIVE"
    CHAMBER_HEALTH[$chamber]=80
}

# =====================================================================
# SYMPATHETIC STRESS RESPONSE
# =====================================================================
sympathetic_surge() {
    local trigger="$1"
    log "SYMPATHETIC" "STRESS RESPONSE | Trigger: $trigger | Epinephrine surge"
    
    SYMPATHETIC_DRIVE=$(echo "scale=2; $SYMPATHETIC_DRIVE * 1.5" | bc -l)
    VAGAL_TONE=$(echo "scale=2; $VAGAL_TONE * 0.3" | bc -l)
    
    # Increase heart rate (decrease SA node interval)
    SA_NODE_RATE=$(echo "scale=0; $SA_NODE_RATE * 0.7" | bc -l)
    if (( SA_NODE_RATE < 5 )); then SA_NODE_RATE=5; fi
    
    log "SYMPATHETIC" "Heart rate increased | SA Node interval: ${SA_NODE_RATE}s | Drive: $SYMPATHETIC_DRIVE"
}

# =====================================================================
# DOCUMENT GENERATION - Cardiac Output
# =====================================================================
generate_cardiac_output() {
    local now=$(date +%s)
    local output_file="$WORKDIR/cardiac-output-$(date +%s).json"
    
    cat > "$output_file" <<EOF
{
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "heart_rate_bpm": $(echo "scale=0; 60000 / $SA_NODE_RATE" | bc -l),
  "cardiac_output_l_min": $(echo "scale=1; 5.0 * $SYMPATHETIC_DRIVE" | bc -l),
  "ejection_fraction": $(echo "55 + $RANDOM % 10" | bc),
  "systemic_vascular_resistance": $(echo "scale=1; 1.0 / $SYMPATHETIC_DRIVE" | bc -l),
  "chambers": {
EOF

    for chamber in "${CHAMBERS[@]}"; do
        cat >> "$output_file" <<EOF
    "$chamber": {
      "state": "${CHAMBER_STATE[$chamber]}",
      "health": ${CHAMBER_HEALTH[$chamber]},
      "last_beat_ago": $(($(date +%s) - CHAMBER_LAST_BEAT[$chamber])),
      "missed_beats": ${CHAMBER_MISSED[$chamber]}
    },
EOF
    done

    cat >> "$output_file" <<EOF
  },
  "autonomic_balance": {
    "vagal_tone": $(printf "%.2f" $VAGAL_TONE),
    "sympathetic_drive": $(printf "%.2f" $SYMPATHETIC_DRIVE),
    "baroreflex_sensitivity": "normal"
  },
  "vitals": {
    "systolic_bp": $((110 + RANDOM % 30)),
    "diastolic_bp": $((70 + RANDOM % 20)),
    "heart_rate": $(echo "scale=0; 60000 / $SA_NODE_RATE" | bc -l),
    "respiratory_rate": $((12 + RANDOM % 8)),
    "temperature": $(echo "scale=1; 37.0 + $RANDOM % 10 / 10" | bc -l)
  }
}
EOF
    
    log "CARDIAC_OUTPUT" "Generated: $output_file"
}

# =====================================================================
# MAIN CARDIAC CYCLE - The Heartbeat Loop
# =====================================================================
cardiac_cycle() {
    while true; do
        local cycle_start=$(date +%s)
        
        # Primary pacemaker
        if sa_node_beat; then
            # Beat generated - cycle complete
            :
        fi
        
        # Background processes (run concurrently in real heart)
        baroreflex_check
        health_check
        generate_cardiac_output
        
        # Calculate sleep time to maintain rate
        local cycle_end=$(date +%s)
        local cycle_duration=$((cycle_end - cycle_start))
        local sleep_time=$((SA_NODE_RATE - cycle_duration))
        
        if (( sleep_time > 0 )); then
            sleep $sleep_time
        fi
        
        # Random sympathetic surge (stress events)
        if (( RANDOM % 1000 < 5 )); then
            sympathetic_surge "Random stress event"
        fi
    done
}

# =====================================================================
# GRACEFUL SHUTDOWN
# =====================================================================
cleanup() {
    log "HEART" "Earth Beat shutting down gracefully | Final vitals recorded"
    generate_cardiac_output
    rm -f "$PID_FILE"
    exit 0
}

trap cleanup SIGTERM SIGINT

# =====================================================================
# MAIN - Heart Start
# =====================================================================
main() {
    init_heart
    log "HEART" "Earth Beat v1.0 - Bio-inspired multi-chambered cardiovascular system STARTING"
    
    # Start cardiac cycle
    cardiac_cycle
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi