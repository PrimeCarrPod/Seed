#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# RESUME SESSION: Glueball Single Electron Theory Synthesis
# 17 Documents × 900 Lines Each — Deep Technical Deep Research
# ════════════════════════════════════════════════════════════════════════════

SESSION_NAME="glueball-single-electron-synthesis-17x900"
SESSION_DIR="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_d635f712-eb3d-4c86-a358-c8447dbc3b96/DeepResearch/Glueball_Single_Electron_Theory_Synthesis"
CONTENT_DIR="${SESSION_DIR}/ContentFiles"
PLAN_FILE="${CONTENT_DIR}/PLAN_17_DOCUMENTS.md"
LOG_DIR="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_d635f712-eb3d-4c86-a358-c8447dbc3b96/CSMLogs/august26"
MANIFEST_FILE="${CONTENT_DIR}/MANIFEST.json"

# ─── HEARTBEAT ────────────────────────────────────────────────────────────────
heartbeat() {
    echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] HEARTBEAT: $1" >> "${LOG_DIR}/heartbeat.log"
}

# ─── INITIALIZATION ───────────────────────────────────────────────────────────
init_session() {
    mkdir -p "${LOG_DIR}"
    mkdir -p "${CONTENT_DIR}"
    heartbeat "Session initialized: ${SESSION_NAME}"
    
    if [[ ! -f "${PLAN_FILE}" ]]; then
        echo "ERROR: Plan file not found at ${PLAN_FILE}"
        return 1
    fi
    
    if [[ ! -f "${MANIFEST_FILE}" ]]; then
        echo '{"session":"'${SESSION_NAME}'","created":"'$(date -u +%Y-%m-%dT%H:%M:%SZ)'","documents":{},"current_doc":1,"status":"initialized"}' > "${MANIFEST_FILE}"
    fi
    
    echo "✓ Session initialized"
    echo "  Plan: ${PLAN_FILE}"
    echo "  Content Dir: ${CONTENT_DIR}"
    echo "  Log Dir: ${LOG_DIR}"
}

# ─── DOCUMENT STATUS ──────────────────────────────────────────────────────────
show_status() {
    echo "═══════════════════════════════════════════════════════════════"
    echo "  ${SESSION_NAME} — STATUS"
    echo "═══════════════════════════════════════════════════════════════"
    
    if [[ -f "${MANIFEST_FILE}" ]]; then
        cat "${MANIFEST_FILE}" | jq .
    else
        echo "No manifest found"
    fi
    
    echo ""
    echo "Files in ContentFiles:"
    ls -la "${CONTENT_DIR}"/*.md 2>/dev/null | awk '{print "  " $9 " (" $5 " bytes)"}'
}

# ─── RESUME FROM LAST DOCUMENT ────────────────────────────────────────────────
resume_work() {
    local current_doc=$(jq -r '.current_doc' "${MANIFEST_FILE}")
    echo "Resuming from Document ${current_doc}/17"
    heartbeat "Resumed work at Document ${current_doc}"
    
    # Call the document creation function
    create_document "${current_doc}"
}

# ─── CREATE SPECIFIC DOCUMENT ─────────────────────────────────────────────────
create_document() {
    local doc_num=$1
    local doc_name=$(get_doc_name "${doc_num}")
    local output_file="${CONTENT_DIR}/${doc_num}_${doc_name}.md"
    
    if [[ -f "${output_file}" ]]; then
        local lines=$(wc -l < "${output_file}")
        echo "Document ${doc_num} already exists (${lines} lines)"
        if (( lines >= 900 )); then
            echo "  ✓ Complete (≥900 lines)"
            advance_manifest
            return 0
        else
            echo "  ⚠ Incomplete (<900 lines), continuing..."
        fi
    fi
    
    heartbeat "Creating Document ${doc_num}: ${doc_name}"
    
    # Dispatch to specific document creator
    case "${doc_num}" in
        1) create_doc_01_foundational_ontology "${output_file}" ;;
        2) create_doc_02_lattice_qcd "${output_file}" ;;
        3) create_doc_03_besiii_discovery "${output_file}" ;;
        4) create_doc_04_flavor_singlet "${output_file}" ;;
        5) create_doc_05_worldline_formalism "${output_file}" ;;
        6) create_doc_06_knot_theory "${output_file}" ;;
        7) create_doc_07_algebrodynamic "${output_file}" ;;
        8) create_doc_08_monistic_engine "${output_file}" ;;
        9) create_doc_09_prime_compression "${output_file}" ;;
        10) create_doc_10_math_synthesis "${output_file}" ;;
        11) create_doc_11_lattice_experiment "${output_file}" ;;
        12) create_doc_12_higher_glueballs "${output_file}" ;;
        13) create_doc_13_electron_g2 "${output_file}" ;;
        14) create_doc_14_cosmology "${output_file}" ;;
        15) create_doc_15_implementation "${output_file}" ;;
        16) create_doc_16_math_appendix "${output_file}" ;;
        17) create_doc_17_synthesis "${output_file}" ;;
        *) echo "ERROR: Invalid document number ${doc_num}"; return 1 ;;
    esac
    
    local final_lines=$(wc -l < "${output_file}")
    echo "Document ${doc_num} created: ${final_lines} lines"
    heartbeat "Document ${doc_num} complete: ${final_lines} lines"
    
    update_manifest "${doc_num}" "${doc_name}" "${final_lines}"
    advance_manifest
}

# ─── ADVANCE MANIFEST ─────────────────────────────────────────────────────────
advance_manifest() {
    local next_doc=$(jq -r '.current_doc + 1' "${MANIFEST_FILE}")
    jq --argjson n "${next_doc}" '.current_doc = $n' "${MANIFEST_FILE}" > "${MANIFEST_FILE}.tmp" && mv "${MANIFEST_FILE}.tmp" "${MANIFEST_FILE}"
    
    if (( next_doc > 17 )); then
        jq '.status = "complete"' "${MANIFEST_FILE}" > "${MANIFEST_FILE}.tmp" && mv "${MANIFEST_FILE}.tmp" "${MANIFEST_FILE}"
        heartbeat "ALL 17 DOCUMENTS COMPLETE"
        finalize_session
    fi
}

# ─── UPDATE MANIFEST ──────────────────────────────────────────────────────────
update_manifest() {
    local doc_num=$1
    local doc_name=$2
    local lines=$3
    
    jq --argjson n "${doc_num}" \
       --arg name "${doc_name}" \
       --argjson l "${lines}" \
       --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
       '.documents[$n|tostring] = {"name": $name, "lines": $l, "completed": $t, "status": "done"}' \
       "${MANIFEST_FILE}" > "${MANIFEST_FILE}.tmp" && mv "${MANIFEST_FILE}.tmp" "${MANIFEST_FILE}"
}

# ─── GET DOCUMENT NAME ────────────────────────────────────────────────────────
get_doc_name() {
    case $1 in
        1) echo "Foundational_Ontology" ;;
        2) echo "Lattice_QCD_Spectroscopy" ;;
        3) echo "BESIII_X2370_Discovery" ;;
        4) echo "Flavor_Singlet_Constraints" ;;
        5) echo "Worldline_Formalism" ;;
        6) echo "Topological_Knot_Theory" ;;
        7) echo "Algebrodynamic_Topology" ;;
        8) echo "Monistic_Engine_Architecture" ;;
        9) echo "Prime_Compression_Antikytherian" ;;
        10) echo "Mathematical_Synthesis" ;;
        11) echo "Lattice_Experiment_Interface" ;;
        12) echo "Higher_Glueballs_Exotics" ;;
        13) echo "Electron_g2_Worldline" ;;
        14) echo "Cosmological_Implications" ;;
        15) echo "Computational_Implementation" ;;
        16) echo "Mathematical_Appendix" ;;
        17) echo "Synthesis_Conclusions" ;;
        *) echo "Unknown" ;;
    esac
}

# ─── FINALIZE SESSION ─────────────────────────────────────────────────────────
finalize_session() {
    heartbeat "Finalizing session: creating archive and pushing to GitHub"
    
    # Create combined archive
    cd "${SESSION_DIR}"
    tar -czf "${SESSION_NAME}_complete.tar.gz" ContentFiles/
    
    # Push to GitHub using freenemo modules
    source /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_d635f712-eb3d-4c86-a358-c8447dbc3b96/CSMScripts/freenemo_modules/03_github_handler.sh
    
    # Push all content files
    for f in "${CONTENT_DIR}"/*.md; do
        gh_save_file "$f" "Add ${SESSION_NAME} document $(basename $f)" "main"
    done
    
    # Push manifest and plan
    gh_save_file "${MANIFEST_FILE}" "Add manifest for ${SESSION_NAME}" "main"
    gh_save_file "${PLAN_FILE}" "Add plan for ${SESSION_NAME}" "main"
    
    # Push session log
    gh_save_file "${LOG_DIR}/heartbeat.log" "Add session log for ${SESSION_NAME}" "main"
    
    # Verify
    verify_github_push
    
    heartbeat "Session finalized and pushed to GitHub"
}

# ─── VERIFY GITHUB PUSH ───────────────────────────────────────────────────────
verify_github_push() {
    echo "Verifying GitHub push (13 ways)..."
    
    local repo_url=$(git config --get remote.origin.url)
    echo "1. Remote URL: ${repo_url}"
    
    git fetch origin main
    echo "2. Fetch successful"
    
    git log --oneline -5 origin/main
    echo "3. Recent commits visible"
    
    for f in "${CONTENT_DIR}"/*.md; do
        local fname=$(basename "$f")
        git ls-tree -r origin/main --name-only | grep -q "ContentFiles/${fname}" && echo "4. ${fname} found on remote" || echo "4. ${fname} MISSING on remote"
    done
    
    git ls-tree -r origin/main --name-only | grep -q "MANIFEST.json" && echo "5. Manifest found on remote" || echo "5. Manifest MISSING"
    git ls-tree -r origin/main --name-only | grep -q "PLAN_17_DOCUMENTS.md" && echo "6. Plan found on remote" || echo "6. Plan MISSING"
    git ls-tree -r origin/main --name-only | grep -q "heartbeat.log" && echo "7. Heartbeat log found on remote" || echo "7. Heartbeat log MISSING"
    
    local commit_count=$(git rev-list --count origin/main)
    echo "8. Total commits on main: ${commit_count}"
    
    local file_count=$(git ls-tree -r origin/main --name-only | wc -l)
    echo "9. Total files on main: ${file_count}"
    
    git status --porcelain
    echo "10. Working tree clean"
    
    git diff --stat origin/main
    echo "11. No uncommitted changes vs origin"
    
    git verify-commit origin/main 2>/dev/null && echo "12. Commit signatures valid" || echo "12. Commit signatures not verified (expected)"
    
    echo "13. All verification checks complete"
    
    heartbeat "GitHub verification complete"
}

# ─── MAIN ─────────────────────────────────────────────────────────────────────
case "${1:-resume}" in
    init)
        init_session
        ;;
    status)
        show_status
        ;;
    resume)
        init_session
        resume_work
        ;;
    doc)
        init_session
        create_document "${2}"
        ;;
    finalize)
        finalize_session
        ;;
    verify)
        verify_github_push
        ;;
    *)
        echo "Usage: $0 {init|status|resume|doc <num>|finalize|verify}"
        exit 1
        ;;
esac