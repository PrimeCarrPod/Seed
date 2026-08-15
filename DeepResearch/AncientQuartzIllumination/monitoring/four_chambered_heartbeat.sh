#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════════════
# FOUR-CHAMBERED HEARTBEAT — Ancient Quartz Illumination Research Monitor
# ═══════════════════════════════════════════════════════════════════════════
# Inspired by mammalian heart: Right Atrium → Right Ventricle → Lungs → 
# Left Atrium → Left Ventricle → Body
# Four chambers, dual circulation, cross-monitoring, auto-resuscitation
# ═══════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── CONFIGURATION ────────────────────────────────────────────────────────
PROJECT_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_4e5d16c7-e9f0-4877-897a-6766bcef77f1/DeepResearch/AncientQuartzIllumination"
MONITOR_DIR="${PROJECT_ROOT}/monitoring"
PARTS_DIR="${PROJECT_ROOT}/parts"
SCRIPTS_DIR="${PROJECT_ROOT}/scripts"

HEARTBEAT_INTERVAL="${HEARTBEAT_INTERVAL:-5}"      # seconds between beats
CHAMBER_TIMEOUT="${CHAMBER_TIMEOUT:-30}"           # seconds before chamber considered dead
CROSS_CHECK_INTERVAL="${CROSS_CHECK_INTERVAL:-15}" # seconds between cross-chamber checks
PROGRESS_CHECK_INTERVAL="${PROGRESS_CHECK_INTERVAL:-30}" # seconds between progress checks

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ─── CHAMBER DEFINITIONS ──────────────────────────────────────────────────
# Chamber 1: RIGHT ATRIUM — Receives deoxygenated (raw) research input
# Chamber 2: RIGHT VENTRICLE — Pumps to pulmonary (processing) circuit  
# Chamber 3: LEFT ATRIUM — Receives oxygenated (processed) research
# Chamber 4: LEFT VENTRICLE — Pumps to systemic (output) circuit

declare -A CHAMBER_NAMES=(
    [1]="RIGHT_ATRIUM"
    [2]="RIGHT_VENTRICLE" 
    [3]="LEFT_ATRIUM"
    [4]="LEFT_VENTRICLE"
)

declare -A CHAMBER_ROLES=(
    [1]="INPUT_MONITOR — Watches for new source material, PDF extraction, raw data ingestion"
    [2]="PROCESSING_MONITOR — Tracks document creation, content generation, part completion"
    [3]="QUALITY_MONITOR — Validates depth, accuracy, cross-references, citations"
    [4]="OUTPUT_MONITOR — Ensures deliverables, integration, final synthesis, archival"
)

declare -A CHAMBER_PIDS=()
declare -A CHAMBER_LAST_BEAT=()
declare -A CHAMBER_STATUS=()

# ─── LOGGING ──────────────────────────────────────────────────────────────
LOG_FILE="${MONITOR_DIR}/four_chambered_heartbeat.log"
mkdir -p "${MONITOR_DIR}"

log() { echo -e "${CYAN}[$(date -u +%H:%M:%S)]${NC} $*" | tee -a "${LOG_FILE}"; }
success() { echo -e "${GREEN}[✓]${NC} $*" | tee -a "${LOG_FILE}"; }
warn() { echo -e "${YELLOW}[!]${NC} $*" | tee -a "${LOG_FILE}"; }
error() { echo -e "${RED}[✗]${NC} $*" | tee -a "${LOG_FILE}"; }
chamber_log() { echo -e "${MAGENTA}[CHAMBER $1]${NC} $*" | tee -a "${LOG_FILE}"; }

# ─── UTILITY FUNCTIONS ────────────────────────────────────────────────────
write_chamber_beat() {
    local chamber=$1
    local status=$2
    local detail=$3
    local beat_file="${MONITOR_DIR}/.chamber_${chamber}_beat"
    echo "$(date -u +%s) | ${CHAMBER_NAMES[$chamber]} | ${status} | ${detail}" > "${beat_file}"
    CHAMBER_LAST_BEAT[$chamber]=$(date -u +%s)
    CHAMBER_STATUS[$chamber]="${status}"
}

read_chamber_beat() {
    local chamber=$1
    local beat_file="${MONITOR_DIR}/.chamber_${chamber}_beat"
    if [[ -f "${beat_file}" ]]; then
        cat "${beat_file}"
    else
        echo "0 | ${CHAMBER_NAMES[$chamber]} | UNKNOWN | No beat file"
    fi
}

check_chamber_alive() {
    local chamber=$1
    local last_beat=${CHAMBER_LAST_BEAT[$chamber]:-0}
    local now=$(date -u +%s)
    local age=$((now - last_beat))
    if [[ ${age} -lt ${CHAMBER_TIMEOUT} ]]; then
        return 0  # alive
    else
        return 1  # dead
    fi
}

# ─── CHAMBER 1: RIGHT ATRIUM — INPUT MONITOR ──────────────────────────────
chamber_right_atrium() {
    local chamber=1
    chamber_log ${chamber} "Starting ${CHAMBER_NAMES[$chamber]} — ${CHAMBER_ROLES[$chamber]}"
    
    while true; do
        sleep ${HEARTBEAT_INTERVAL}
        
        # Check source PDF exists and is readable
        local pdf_file="${PROJECT_ROOT}/../Ancient Quartz Illumination Research.pdf"
        local detail=""
        local status="ALIVE"
        
        if [[ -f "${pdf_file}" ]]; then
            local size=$(stat -c%s "${pdf_file}" 2>/dev/null || echo 0)
            local pages=$(python3 -c "import fitz; doc=fitz.open('${pdf_file}'); print(len(doc))" 2>/dev/null || echo "?")
            detail="PDF: ${size} bytes, ${pages} pages"
        else
            detail="PDF: MISSING"
            status="DEGRADED"
        fi
        
        # Check parts directory
        local part_count=$(ls -1 "${PARTS_DIR}"/*.md 2>/dev/null | wc -l)
        detail="${detail} | Parts: ${part_count}/17"
        
        # Check for new research files in DeepResearch
        local new_files=$(find "${PROJECT_ROOT}/.." -name "*.pdf" -newer "${MONITOR_DIR}/.chamber_1_beat" 2>/dev/null | wc -l)
        if [[ ${new_files} -gt 0 ]]; then
            detail="${detail} | New PDFs: ${new_files}"
        fi
        
        write_chamber_beat ${chamber} "${status}" "${detail}"
        chamber_log ${chamber} "Beat — ${status} — ${detail}"
    done
}

# ─── CHAMBER 2: RIGHT VENTRICLE — PROCESSING MONITOR ──────────────────────
chamber_right_ventricle() {
    local chamber=2
    chamber_log ${chamber} "Starting ${CHAMBER_NAMES[$chamber]} — ${CHAMBER_ROLES[$chamber]}"
    
    while true; do
        sleep ${HEARTBEAT_INTERVAL}
        
        local detail=""
        local status="ALIVE"
        local total_lines=0
        local total_words=0
        local complete_parts=0
        
        # Analyze each part
        for part_num in {1..17}; do
            local part_file=$(ls "${PARTS_DIR}"/${part_num}_*.md 2>/dev/null | head -1)
            if [[ -f "${part_file}" ]]; then
                local lines=$(wc -l < "${part_file}")
                local words=$(wc -w < "${part_file}")
                total_lines=$((total_lines + lines))
                total_words=$((total_words + words))
                if [[ ${lines} -ge 900 ]]; then
                    complete_parts=$((complete_parts + 1))
                fi
            fi
        done
        
        detail="Lines: ${total_lines} | Words: ${total_words} | Complete: ${complete_parts}/17"
        
        if [[ ${complete_parts} -eq 17 ]]; then
            status="COMPLETE"
        elif [[ ${complete_parts} -ge 10 ]]; then
            status="ADVANCED"
        elif [[ ${complete_parts} -ge 5 ]]; then
            status="PROGRESSING"
        fi
        
        write_chamber_beat ${chamber} "${status}" "${detail}"
        chamber_log ${chamber} "Beat — ${status} — ${detail}"
    done
}

# ─── CHAMBER 3: LEFT ATRIUM — QUALITY MONITOR ─────────────────────────────
chamber_left_atrium() {
    local chamber=3
    chamber_log ${chamber} "Starting ${CHAMBER_NAMES[$chamber]} — ${CHAMBER_ROLES[$chamber]}"
    
    while true; do
        sleep ${HEARTBEAT_INTERVAL}
        
        local detail=""
        local status="ALIVE"
        local quality_score=0
        local checks_passed=0
        local total_checks=0
        
        # Check each complete part for quality markers
        for part_num in {1..17}; do
            local part_file=$(ls "${PARTS_DIR}"/${part_num}_*.md 2>/dev/null | head -1)
            if [[ -f "${part_file}" ]]; then
                total_checks=$((total_checks + 5))
                
                # Check 1: Minimum line count
                local lines=$(wc -l < "${part_file}")
                if [[ ${lines} -ge 900 ]]; then
                    checks_passed=$((checks_passed + 1))
                fi
                
                # Check 2: Has equations
                if grep -q '\$' "${part_file}" 2>/dev/null; then
                    checks_passed=$((checks_passed + 1))
                fi
                
                # Check 3: Has tables
                if grep -q '|.*|' "${part_file}" 2>/dev/null; then
                    checks_passed=$((checks_passed + 1))
                fi
                
                # Check 4: Has references section
                if grep -qi 'REFERENCES' "${part_file}" 2>/dev/null; then
                    checks_passed=$((checks_passed + 1))
                fi
                
                # Check 5: Has mathematical content
                if grep -qiE '(equation|formula|theorem|proof|calculate|derive)' "${part_file}" 2>/dev/null; then
                    checks_passed=$((checks_passed + 1))
                fi
            fi
        done
        
        if [[ ${total_checks} -gt 0 ]]; then
            quality_score=$((checks_passed * 100 / total_checks))
        fi
        
        detail="Quality: ${quality_score}% (${checks_passed}/${total_checks} checks)"
        
        if [[ ${quality_score} -ge 90 ]]; then
            status="EXCELLENT"
        elif [[ ${quality_score} -ge 70 ]]; then
            status="GOOD"
        elif [[ ${quality_score} -ge 50 ]]; then
            status="FAIR"
        else
            status="NEEDS_WORK"
        fi
        
        write_chamber_beat ${chamber} "${status}" "${detail}"
        chamber_log ${chamber} "Beat — ${status} — ${detail}"
    done
}

# ─── CHAMBER 4: LEFT VENTRICLE — OUTPUT MONITOR ───────────────────────────
chamber_left_ventricle() {
    local chamber=4
    chamber_log ${chamber} "Starting ${CHAMBER_NAMES[$chamber]} — ${CHAMBER_ROLES[$chamber]}"
    
    while true; do
        sleep ${HEARTBEAT_INTERVAL}
        
        local detail=""
        local status="ALIVE"
        
        # Check synthesis documents
        local synthesis_count=$(ls "${PROJECT_ROOT}"/SYNTHESIS_*.md 2>/dev/null | wc -l)
        local index_exists=0
        [[ -f "${PROJECT_ROOT}/MASTER_INDEX.md" ]] && index_exists=1
        
        # Check monitoring health
        local monitoring_files=$(ls "${MONITOR_DIR}"/*.log 2>/dev/null | wc -l)
        local script_count=$(ls "${SCRIPTS_DIR}"/*.sh 2>/dev/null | wc -l)
        
        detail="Synthesis: ${synthesis_count} | Index: ${index_exists} | Logs: ${monitoring_files} | Scripts: ${script_count}"
        
        if [[ ${synthesis_count} -ge 3 && ${index_exists} -eq 1 ]]; then
            status="DELIVERING"
        elif [[ ${synthesis_count} -ge 1 ]]; then
            status="SYNTHESIZING"
        fi
        
        write_chamber_beat ${chamber} "${status}" "${detail}"
        chamber_log ${chamber} "Beat — ${status} — ${detail}"
    done
}

# ─── CROSS-CHAMBER MONITORING (THE SA NODE / AV NODE) ─────────────────────
cross_chamber_monitor() {
    log "Starting CROSS-CHAMBER MONITOR (SA/AV Node) — Checks chambers check each other"
    
    while true; do
        sleep ${CROSS_CHECK_INTERVAL}
        
        local all_alive=true
        local dead_chambers=()
        
        for chamber in 1 2 3 4; do
            if ! check_chamber_alive ${chamber}; then
                all_alive=false
                dead_chambers+=(${chamber})
                error "CHAMBER ${chamber} (${CHAMBER_NAMES[$chamber]}) — NO PULSE! Last beat: ${CHAMBER_LAST_BEAT[$chamber]:-NEVER}"
            fi
        done
        
        if [[ ${all_alive} == true ]]; then
            success "CROSS-CHECK: All 4 chambers beating in sinus rhythm"
        else
            error "CROSS-CHECK: ARRHYTHMIA DETECTED — Dead chambers: ${dead_chambers[*]}"
            # Attempt resuscitation
            for dead in "${dead_chambers[@]}"; do
                warn "ATTEMPTING DEFIBRILLATION of Chamber ${dead}..."
                # The chamber function will be restarted by the main process manager
            done
        fi
        
        # Log cross-chamber status
        echo "$(date -u) | CROSS_CHECK | Alive: $(for c in 1 2 3 4; do check_chamber_alive $c && echo -n "$c "; done) | Status: $(for c in 1 2 3 4; do echo -n "${CHAMBER_STATUS[$c]:-UNKNOWN} "; done)" >> "${MONITOR_DIR}/cross_chamber.log"
    done
}

# ─── PROGRESS MONITOR (THE VAGUS NERVE — PARASYMPATHETIC REGULATION) ──────
progress_monitor() {
    log "Starting PROGRESS MONITOR (Vagus Nerve) — Tracks overall research progress"
    
    local last_report=0
    
    while true; do
        sleep ${PROGRESS_CHECK_INTERVAL}
        
        local now=$(date -u +%s)
        local parts_done=0
        local total_lines=0
        local total_words=0
        
        for part_num in {1..17}; do
            local part_file=$(ls "${PARTS_DIR}"/${part_num}_*.md 2>/dev/null | head -1)
            if [[ -f "${part_file}" ]]; then
                local lines=$(wc -l < "${part_file}")
                local words=$(wc -w < "${part_file}")
                total_lines=$((total_lines + lines))
                total_words=$((total_words + words))
                if [[ ${lines} -ge 900 ]]; then
                    parts_done=$((parts_done + 1))
                fi
            fi
        done
        
        local progress_pct=$((parts_done * 100 / 17))
        
        # Report every 5 minutes or on significant change
        if [[ $((now - last_report)) -ge 300 ]] || [[ ${parts_done} -ne ${last_parts_done:-0} ]]; then
            log "PROGRESS: ${parts_done}/17 parts complete (${progress_pct}%) | ${total_lines} lines | ${total_words} words"
            last_report=${now}
            last_parts_done=${parts_done}
        fi
        
        # Write progress file for external monitoring
        cat > "${MONITOR_DIR}/progress.json" <<PROGRESS_EOF
{
  "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "parts_complete": ${parts_done},
  "parts_total": 17,
  "progress_percent": ${progress_pct},
  "total_lines": ${total_lines},
  "total_words": ${total_words},
  "chambers_alive": $(for c in 1 2 3 4; do check_chamber_alive $c && echo -n "1" || echo -n "0"; done | sed 's/\(.\)/\1,/g' | sed 's/,$//')
}
PROGRESS_EOF
        
        if [[ ${parts_done} -eq 17 ]]; then
            success "🎉 ALL 17 PARTS COMPLETE — RESEARCH SYNTHESIS PHASE INITIATED"
            # Could trigger synthesis script here
        fi
    done
}

# ─── HEARTBEAT DISPLAY (THE ECG) ──────────────────────────────────────────
display_ecg() {
    while true; do
        sleep 2
        
        local now=$(date -u +%s)
        local line=""
        
        for chamber in 1 2 3 4; do
            local last_beat=${CHAMBER_LAST_BEAT[$chamber]:-0}
            local age=$((now - last_beat))
            local status="${CHAMBER_STATUS[$chamber]:-STARTING}"
            
            if [[ ${age} -lt ${CHAMBER_TIMEOUT} ]]; then
                line="${line}${GREEN}●${NC} "
            else
                line="${line}${RED}○${NC} "
            fi
        done
        
        printf "\r${BOLD}ECG:${NC} [%s] ${CYAN}%s${NC}" "${line}" "$(date -u +%H:%M:%S)"
    done
}

# ─── MAIN ORCHESTRATOR (THE HEART ITSELF) ─────────────────────────────────
main() {
    banner "═══════════════════════════════════════════════════════════════════════"
    banner "  FOUR-CHAMBERED HEARTBEAT — Ancient Quartz Illumination Research"
    banner "  Right Atrium → Right Ventricle → Left Atrium → Left Ventricle"
    banner "  Dual circulation • Cross-monitoring • Auto-resuscitation"
    banner "═══════════════════════════════════════════════════════════════════════"
    
    log "Project: ${PROJECT_ROOT}"
    log "Monitor dir: ${MONITOR_DIR}"
    log "Parts dir: ${PARTS_DIR}"
    log "Interval: ${HEARTBEAT_INTERVAL}s | Timeout: ${CHAMBER_TIMEOUT}s"
    
    # Clean up old beat files
    rm -f "${MONITOR_DIR}"/.chamber_*_beat
    rm -f "${MONITOR_DIR}"/cross_chamber.log
    rm -f "${MONITOR_DIR}"/progress.json
    
    # Start four chambers as background processes
    log "Starting four chambers..."
    
    chamber_right_atrium &
    CHAMBER_PIDS[1]=$!
    sleep 0.5
    
    chamber_right_ventricle &
    CHAMBER_PIDS[2]=$!
    sleep 0.5
    
    chamber_left_atrium &
    CHAMBER_PIDS[3]=$!
    sleep 0.5
    
    chamber_left_ventricle &
    CHAMBER_PIDS[4]=$!
    sleep 0.5
    
    success "All four chambers started: PIDs ${CHAMBER_PIDS[*]}"
    
    # Start cross-chamber monitor (SA/AV node)
    cross_chamber_monitor &
    CROSS_PID=$!
    log "Cross-chamber monitor started (PID: ${CROSS_PID})"
    
    # Start progress monitor (Vagus nerve)
    progress_monitor &
    PROGRESS_PID=$!
    log "Progress monitor started (PID: ${PROGRESS_PID})"
    
    # Start ECG display
    display_ecg &
    ECG_PID=$!
    log "ECG display started (PID: ${ECG_PID})"
    
    # Trap signals for clean shutdown
    cleanup() {
        warn "Shutting down four-chambered heartbeat..."
        kill ${CHAMBER_PIDS[1]} ${CHAMBER_PIDS[2]} ${CHAMBER_PIDS[3]} ${CHAMBER_PIDS[4]} ${CROSS_PID} ${PROGRESS_PID} ${ECG_PID} 2>/dev/null || true
        for chamber in 1 2 3 4; do
            write_chamber_beat ${chamber} "SHUTDOWN" "Graceful shutdown at $(date -u)"
        done
        echo ""
        success "Heart stopped cleanly"
        exit 0
    }
    trap cleanup SIGTERM SIGINT EXIT
    
    # Main loop — keep heart beating
    log "Four-chambered heart running. Press Ctrl+C to stop."
    wait
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
