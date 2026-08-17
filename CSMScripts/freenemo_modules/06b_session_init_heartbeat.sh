#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 06B: Session Init — Census, Read State, COMMS Logs
# lettherebelight Protocol v5 — Live agent count, directives scanning
# ════════════════════════════════════════════════════════════════════════════

# ─── IMMEDIATE CENSUS ───────────────────────────────────────────────────────
si_write_census() {
    freenemo_banner "👥 CENSUS — Live Agent Count"
    mkdir -p "$SI_CENSUS_DIR"
    {
        echo "=== AEGIS CENSUS — $(date -u) ==="
        echo "MY STATUS: [DIRECTOR-001] V5 ACTIVE — session $SESSION_ID"
        echo ""
        echo "CONNECTED AGENTS (heartbeat check):"
        for f in CSMGen/CSMAegis/COMMS/HEARTBEATS/director-*.txt; do
            [[ -f "$f" ]] || continue
            local status=$(head -1 "$f" 2>/dev/null || echo "UNKNOWN")
            local base=$(basename "$f" .txt)
            if echo "$status" | grep -q "ACTIVE"; then echo "  ONLINE: $base — $status"
            elif echo "$status" | grep -q "SHUTDOWN"; then echo "  OFFLINE: $base — $status"
            else echo "  UNKNOWN: $base — $status"; fi
        done
        local online=$(grep -c "ONLINE" "$SI_CENSUS_FILE" 2>/dev/null || echo 0)
        local offline=$(grep -c "OFFLINE" "$SI_CENSUS_FILE" 2>/dev/null || echo 0)
        echo ""; echo "SUMMARY: $online ONLINE, $offline OFFLINE"
    } > "$SI_CENSUS_FILE"

    git add "$SI_CENSUS_FILE"
    if ! git diff --cached --quiet; then
        git commit -m "[DIRECTOR-001] CENSUS: $online online, $offline offline — session $SESSION_ID" >/dev/null || freenemo_warn "Census commit failed"
        git push origin "$BRANCH_NAME" >/dev/null 2>&1 || { freenemo_warn "Census push failed, rebasing..."; git pull --rebase origin main && git push origin "$BRANCH_NAME" || freenemo_warn "Census push failed"; }
        freenemo_success "Census written and pushed"
    else
        freenemo_warn "No changes for census"
    fi
}

# ─── READ STATE ──────────────────────────────────────────────────────────────
si_read_state() {
    freenemo_banner "📖 READ STATE — COMMS Log, Outboxes, Directives"
    [[ -f CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md ]] && head -50 CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md || freenemo_warn "No COMMS log"
    [[ -f CSMGen/CSMAegis/COMMS/director-001-outbox.md ]] && head -30 CSMGen/CSMAegis/COMMS/director-001-outbox.md || freenemo_warn "No CITADEL outbox"
    [[ -f CSMGen/CSMAegis/COMMS/director-001B-outbox.md ]] && head -30 CSMGen/CSMAegis/COMMS/director-001B-outbox.md || freenemo_warn "No BASTION outbox"
    freenemo_log "Scanning for @JASON BRODSKY directives..."
    grep -r "@JASON BRODSKY:" CSMGen/CSMAegis/COMMS/ 2>/dev/null | head -5 || freenemo_log "No human override directives found"
}

# ─── SDK FORGE INTEGRATION ──────────────────────────────────────────────────
si_sdk_forge() {
    freenemo_banner "🔧 SDK FORGE — Android Build Chain"
    if [[ -f "${REPO_ROOT}/CSMScripts/SDKForge.sh" ]]; then
        freenemo_log "Running SDKForge.sh to bootstrap APK toolchain..."
        if bash "${REPO_ROOT}/CSMScripts/SDKForge.sh" >/dev/null 2>&1; then
            eval "$(bash "${REPO_ROOT}/CSMScripts/SDKForge.sh" --export-env 2>/dev/null | grep '^export ')" && freenemo_success "SDK Forge ready" || freenemo_warn "SDK Forge env export completed with warnings"
        else
            freenemo_warn "SDKForge.sh failed — Android toolchain not available"
        fi
    else
        freenemo_warn "SDKForge.sh not found, skipping"
    fi
}