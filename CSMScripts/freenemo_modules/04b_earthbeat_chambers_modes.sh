#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 04B: Earthbeat v3 — Token Ring & Parallel/Tokenring Modes
# Token ring support, cross-chamber monitoring, Carrington-class alerts
# ════════════════════════════════════════════════════════════════════════════

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