#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 04: Earthbeat v3 — 4-Chamber Planetary Heartbeat Monitor
# Chamber 1: Schumann (3s) | Chamber 2: Geomag (5s) | Chamber 3: Solar (7s) | Chamber 4: Integration (10s)
# Token ring support, cross-chamber monitoring, Carrington-class alerts
# ════════════════════════════════════════════════════════════════════════════

# ─── CONFIG ──────────────────────────────────────────────────────────────────
EB_DATA_DIR="${REPO_ROOT}/CSMScripts/earthbeatv3-data"
EB_SCHUMANN_LOG="${EB_DATA_DIR}/schumann.log"
EB_GEOMAG_LOG="${EB_DATA_DIR}/geomag.log"
EB_SOLAR_LOG="${EB_DATA_DIR}/solar.log"
EB_VITALS_LOG="${EB_DATA_DIR}/vitals.log"
EB_CHAMBER_LOG="${EB_DATA_DIR}/chambers.log"
EB_TOKEN_DIR="${REPO_ROOT}/CSMScripts/.tokenringv3"

declare -A CHAMBER_FOCUS=( [1]="SCHUMANN" [2]="GEOMAG" [3]="SOLAR" [4]="INTEGRATION" )
declare -A CHAMBER_INTERVAL=( [1]=3 [2]=5 [3]=7 [4]=10 )
declare -A CHAMBER_CHARS=( [1]="♥" [2]="♦" [3]="♣" [4]="♠" )
declare -A CHAMBER_PIDS=()

mkdir -p "${EB_DATA_DIR}" "${EB_TOKEN_DIR}"

# ─── VITAL SIGN GENERATORS ──────────────────────────────────────────────────
eb_gen_schumann() {
    local base=7.83 var=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print (rand()-0.5)*0.3}')
    local freq=$(awk "BEGIN{print $base+$var}")
    local amp=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 0.5+rand()*2.0}')
    local q=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 3+rand()*4}')
    echo "$freq,$amp,$q"
}

eb_gen_geomag() {
    local x=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 20000+(rand()-0.5)*500}')
    local y=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print -5000+(rand()-0.5)*200}')
    local z=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 45000+(rand()-0.5)*300}')
    local f=$(awk "BEGIN{print sqrt($x^2+$y^2+$z^2)}")
    local d=$(awk "BEGIN{print atan2($y,$x)*180/3.14159}")
    local i=$(awk "BEGIN{print atan2($z,sqrt($x^2+$y^2))*180/3.14159}")
    echo "$x,$y,$z,$f,$d,$i"
}

eb_gen_solar() {
    local sp=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 300+rand()*500}')
    local de=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 1+rand()*20}')
    local bz=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print (rand()-0.5)*20}')
    local bt=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 1+rand()*15}')
    local te=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print 50000+rand()*200000}')
    echo "$sp,$de,$bz,$bt,$te"
}

eb_calc_kp() { local s="$1"; local bz=$(echo "$s"|cut -d, -f3); local sp=$(echo "$s"|cut -d, -f1); local bt=$(echo "$s"|cut -d, -f4); local vb=$(awk "BEGIN{print $sp*$bt}"); local kp=$(awk "BEGIN{print int(0.5+0.001*$vb+0.1*sqrt($bt))}"); ((kp>9))&&kp=9; ((kp<0))&&kp=0; echo "$kp"; }
eb_calc_gic()  { local g="$1" s="$2"; local db=$(awk -v s="$RANDOM" 'BEGIN{srand(s);print rand()*5000}'); local ef=$(awk "BEGIN{print $db*1000/(2*3.14159*6371000)*0.01}"); local r="LOW"; (( $(awk "BEGIN{print($ef>1)}") ))&&r="MODERATE"; (( $(awk "BEGIN{print($ef>5)}") ))&&r="HIGH"; (( $(awk "BEGIN{print($ef>20)}") ))&&r="EXTREME"; echo "$ef,$r"; }
eb_calc_coupling() { local s="$1"; local f=$(echo "$s"|cut -d, -f1); local a=$(echo "$s"|cut -d, -f2); local al=$(awk "BEGIN{print exp(-(($f-7.83)^2)/0.5)*$a/2.0}"); local be=$(awk "BEGIN{print (exp(-(($f-14.3)^2)/1.0)+exp(-(($f-20.8)^2)/1.0))*$a/3.0}"); local ca=$(awk "BEGIN{print exp(-(($f/4-1.5)^2)/0.25)*$a/5.0}"); echo "$al,$be,$ca"; }

# ─── CHAMBER RUNNERS ────────────────────────────────────────────────────────
eb_run_chamber() {
    local id=$1 interval=${CHAMBER_INTERVAL[$id]} char=${CHAMBER_CHARS[$id]} focus=${CHAMBER_FOCUS[$id]}
    local log="${EB_DATA_DIR}/chamber-${id}.log" pidf="${REPO_ROOT}/CSMScripts/earthbeatv3-chamber-${id}.pid"
    echo $$ > "$pidf"
    echo "[CHAMBER-$id] Started $(date -u) | $focus | ${interval}s" >> "$log"
    trap "echo '[CHAMBER-$id] Stopping $(date -u)'>>$log; rm -f $pidf; exit 0" SIGTERM SIGINT EXIT

    local cycle=0
    while true; do
        cycle=$((cycle+1))
        local sch=$(eb_gen_schumann) geo=$(eb_gen_geomag) sol=$(eb_gen_solar)
        local ts=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        local freq=$(echo "$sch"|cut -d, -f1) amp=$(echo "$sch"|cut -d, -f2) q=$(echo "$sch"|cut -d, -f3)

        case $id in
            1) echo "$ts,$sch" >> "$EB_SCHUMANN_LOG"; echo "$ts,chamber=$id,focus=$focus,freq=$freq,amp=$amp,q=$q" >> "$EB_CHAMBER_LOG" ;;
            2) echo "$ts,$geo" >> "$EB_GEOMAG_LOG"; local x=$(echo "$geo"|cut -d, -f1) y=$(echo "$geo"|cut -d, -f2) z=$(echo "$geo"|cut -d, -f3) f=$(echo "$geo"|cut -d, -f4); echo "$ts,chamber=$id,focus=$focus,X=$x,Y=$y,Z=$z,F=$f" >> "$EB_CHAMBER_LOG" ;;
            3) echo "$ts,$sol" >> "$EB_SOLAR_LOG"; local sp=$(echo "$sol"|cut -d, -f1) de=$(echo "$sol"|cut -d, -f2) bz=$(echo "$sol"|cut -d, -f3) bt=$(echo "$sol"|cut -d, -f4); echo "$ts,chamber=$id,focus=$focus,speed=$sp,density=$de,bz=$bz,bt=$bt" >> "$EB_CHAMBER_LOG" ;;
            4) local kp=$(eb_calc_kp "$sol") gic=$(eb_calc_gic "$geo" "$sol") coup=$(eb_calc_coupling "$sch"); local ef=$(echo "$gic"|cut -d, -f1) risk=$(echo "$gic"|cut -d, -f2); echo "$ts,sch=$sch,geo=$geo,sol=$sol,kp=$kp,gic=$gic,coup=$coup" >> "$EB_VITALS_LOG"; echo "$ts,chamber=$id,focus=$focus,kp=$kp,ef=$ef,risk=$risk" >> "$EB_CHAMBER_LOG"; [[ "$risk" == "EXTREME" || $kp -ge 7 ]] && echo "CARRINGTON_ALERT:Kp=$kp:Efield=$ef:Risk=$risk:$(date -u +%s)" > "${REPO_ROOT}/CSMScripts/.carrington-alert" ;;
        esac

        printf "%s" "$char" >&2

        if (( id==1 && cycle%20==0 )) || (( id==2 && cycle%12==0 )) || (( id==3 && cycle%8==0 )) || (( id==4 && cycle%6==0 )); then
            case $id in
                1) local coup=$(eb_calc_coupling "$sch"); echo "[CHAMBER-$id] $(date -u) Cycle:$cycle Freq:${freq}Hz Amp:${amp}pT Q:$q Coup:$coup" >> "$log" ;;
                2) echo "[CHAMBER-$id] $(date -u) Cycle:$cycle X:${x}nT Y:${y}nT Z:${z}nT F:${f}nT" >> "$log" ;;
                3) local kp=$(eb_calc_kp "$sol"); echo "[CHAMBER-$id] $(date -u) Cycle:$cycle Speed:${sp}km/s Den:${de}p/cm³ Bz:${bz}nT Bt:${bt}nT Kp:$kp" >> "$log" ;;
                4) echo "[CHAMBER-$id] $(date -u) Cycle:$cycle Kp:$kp E-field:${ef}V/km Risk:$risk Coup:$coup" >> "$log" ;;
            esac
        fi
        sleep "$interval"
    done
}

# ─── TOKEN RING ──────────────────────────────────────────────────────────────
eb_init_token_ring() { local n=$1; mkdir -p "$EB_TOKEN_DIR"; for i in $(seq 0 $((n-1))); do echo 0 > "$EB_TOKEN_DIR/token_$i"; done; echo 1 > "$EB_TOKEN_DIR/token_0"; freenemo_log "Token ring init: $n nodes"; }
eb_pass_token() { local id=$1 n=$2 tf="$EB_TOKEN_DIR/token_$id" nt="$EB_TOKEN_DIR/token_$(( (id+1)%n ))"; while [[ "$(cat "$tf" 2>/dev/null || echo 0)" != "1" ]]; do sleep 0.1; done; echo 0 > "$tf"; echo 1 > "$nt"; }

# ─── GENERIC INSTANCE (parallel/tokenring modes) ────────────────────────────
eb_run_instance() {
    local id=$1 count=$2 mode=$3 interval=${4:-6}
    local log="${EB_DATA_DIR}/instance-${id}.log" pidf="${REPO_ROOT}/CSMScripts/earthbeatv3-instance-${id}.pid"
    echo $$ > "$pidf"; trap "rm -f $pidf; exit 0" SIGTERM SIGINT EXIT
    local cycle=0 chars="♥♦♣♠"
    while true; do
        cycle=$((cycle+1))
        [[ "$mode" == "tokenring" ]] && eb_pass_token "$id" "$count"
        local sch=$(eb_gen_schumann) geo=$(eb_gen_geomag) sol=$(eb_gen_solar)
        local kp=$(eb_calc_kp "$sol") gic=$(eb_calc_gic "$geo" "$sol") coup=$(eb_calc_coupling "$sch")
        local ts=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        echo "$ts,$sch,$coup" >> "$EB_SCHUMANN_LOG"
        echo "$ts,$geo,$kp" >> "$EB_GEOMAG_LOG"
        echo "$ts,$sol" >> "$EB_SOLAR_LOG"
        echo "$ts,sch=$sch,geo=$geo,sol=$sol,kp=$kp,gic=$gic,coup=$coup" >> "$EB_VITALS_LOG"
        printf "%s" "${chars:$((cycle%4)):1}" >&2
        local ef=$(echo "$gic"|cut -d, -f1) risk=$(echo "$gic"|cut -d, -f2)
        (( cycle%10==0 )) && echo "[INSTANCE-$id] $(date -u) Cycle:$cycle Kp:$kp Risk:$risk" >> "$log"
        [[ "$risk" == "EXTREME" || $kp -ge 7 ]] && echo "CARRINGTON_ALERT:Kp=$kp:Efield=$ef:Risk=$risk:$(date -u +%s)" > "${REPO_ROOT}/CSMScripts/.carrington-alert"
        sleep "$interval"
    done
}

# ─── CHAMBER MODE (4 specialized) ───────────────────────────────────────────
eb_run_chamber_mode() {
    freenemo_banner "🌍 EARTHBEAT v3 — Chamber Mode (4 specialized)"
    freenemo_log "Chambers: Schumann(3s)♥ Geomag(5s)♦ Solar(7s)♣ Integration(10s)♠"
    eb_run_chamber 1 & CHAMBER_PIDS[1]=$!; freenemo_log "Chamber 1 PID: $!"
    eb_run_chamber 2 & CHAMBER_PIDS[2]=$!; freenemo_log "Chamber 2 PID: $!"
    eb_run_chamber 3 & CHAMBER_PIDS[3]=$!; freenemo_log "Chamber 3 PID: $!"
    eb_run_chamber 4 & CHAMBER_PIDS[4]=$!; freenemo_log "Chamber 4 PID: $!"
    freenemo_log "All 4 chambers running. Heartbeat: ♥=Schumann ♦=Geomag ♣=Solar ♠=Integration"
    wait
}

# ─── PARALLEL/TOKENRING MODES ───────────────────────────────────────────────
eb_run_parallel() {
    local mode=$1 count=$2
    [[ "$mode" == "tokenring" ]] && eb_init_token_ring "$count"
    freenemo_banner "🌍 EARTHBEAT v3 — $mode mode ($count instances)"
    for i in $(seq 0 $((count-1))); do
        eb_run_instance "$i" "$count" "$mode" &
        CHAMBER_PIDS+=($!)
        freenemo_log "Instance $i PID: $!"
        sleep 0.2
    done
    freenemo_log "All $count instances running. Ctrl+C to stop."
    wait
}