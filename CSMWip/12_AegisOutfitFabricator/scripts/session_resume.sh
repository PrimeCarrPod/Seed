#!/usr/bin/env bash
#
# session_resume.sh — AegisOutfitFabricator Session Resume
# Uses __Python_Tools/write_large_file.py for ALL file operations
# No 17-piece fragmentation — logical chapter chunks only
#

set -euo pipefail

PROJECT_ROOT="/workspace/app/CSMWip/12_AegisOutfitFabricator"
WRITE_TOOL="../../__Python_Tools/write_large_file.py"
HEARTBEAT_INTERVAL=120
SUBTASK_GUARD=30

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() { echo -e "${BLUE}[RESUME]${NC} $*"; }
success() { echo -e "${GREEN}[OK]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*"; }

# Subtask tracker
SUBTASK_COUNT=0
start_subtask() {
    ((SUBTASK_COUNT++))
    echo -e "\n${BLUE}=== SUBTASK $SUBTASK_COUNT: $* ===${NC}"
    echo "Started: $(date '+%H:%M:%S')"
}

complete_subtask() {
    echo "Completed: $(date '+%H:%M:%S')"
    echo -e "${GREEN}✓ Subtask $SUBTASK_COUNT complete${NC}"
}

# Verify write_large_file.py exists and works
verify_write_tool() {
    start_subtask "Verify write_large_file.py"
    if [[ ! -f "$WRITE_TOOL" ]]; then
        error "write_large_file.py not found at $WRITE_TOOL"
        exit 1
    fi
    python3 "$WRITE_TOOL" --help >/dev/null 2>&1 || {
        error "write_large_file.py failed to execute"
        exit 1
    }
    success "write_large_file.py verified"
    complete_subtask
}

# Start heartbeat monitor in background
start_heartbeat() {
    start_subtask "Start heartbeat monitor (${HEARTBEAT_INTERVAL}s interval)"
    python3 scripts/heartbeat_monitor.py --interval "$HEARTBEAT_INTERVAL" &
    HEARTBEAT_PID=$!
    echo $HEARTBEAT_PID > /tmp/heartbeat_pid.txt
    success "Heartbeat monitor started (PID: $HEARTBEAT_PID)"
    complete_subtask
}

# Stop heartbeat monitor
stop_heartbeat() {
    if [[ -f /tmp/heartbeat_pid.txt ]]; then
        kill $(cat /tmp/heartbeat_pid.txt) 2>/dev/null || true
        rm /tmp/heartbeat_pid.txt
        log "Heartbeat monitor stopped"
    fi
}

# Decompress document using write_large_file.py
decompress_doc() {
    local doc_id=$1
    local output_path="/tmp/${doc_id}.md"
    local gz_file
    
    gz_file=$(find FinishedWork -name "${doc_id}_*.md.gz" | head -1)
    if [[ -z "$gz_file" ]]; then
        error "Compressed file not found for $doc_id"
        return 1
    fi
    
    start_subtask "Decompress $doc_id from $gz_file"
    python3 "$WRITE_TOOL" decompress "$gz_file" "$output_path"
    echo "$output_path"
    complete_subtask
}

# Re-chunk document using write_large_file.py
rechunk_doc() {
    local doc_id=$1
    local input_path=$2
    local chunk_dir="chunks/${doc_id}"
    
    start_subtask "Re-chunk $doc_id to $chunk_dir"
    mkdir -p "$chunk_dir"
    python3 "$WRITE_TOOL" split "$input_path" "$chunk_dir" chapter .md
    complete_subtask
}

# Verify chunks using write_large_file.py
verify_chunks() {
    local doc_id=$1
    local chunk_dir="chunks/${doc_id}"
    
    start_subtask "Verify chunks for $doc_id"
    python3 "$WRITE_TOOL" verify "$chunk_dir"
    complete_subtask
}

# Compress document using write_large_file.py
compress_doc() {
    local doc_id=$1
    local input_path="/tmp/${doc_id}.md"
    local gz_file="FinishedWork/${doc_id}_$(date +%Y%m%d).md.gz"
    
    start_subtask "Compress $doc_id to FinishedWork/"
    python3 "$WRITE_TOOL" compress "$input_path" "$gz_file"
    complete_subtask
}

# Update master index
update_master_index() {
    local doc_id=$1
    
    start_subtask "Update master index for $doc_id"
    if [[ -f scripts/update_master_index_single.py ]]; then
        python3 scripts/update_master_index_single.py "$doc_id"
    else
        python3 "$WRITE_TOOL" manifest "chunks/${doc_id}"
        # Rebuild full master index
        python3 -c "
import json, os
from pathlib import Path
chunks_dir = Path('chunks')
index = {'project': 'AegisOutfitFabricator', 'documents': {}}
for d in chunks_dir.iterdir():
    if d.is_dir() and (d / 'MANIFEST.json').exists():
        with open(d / 'MANIFEST.json') as f:
            index['documents'][d.name] = json.load(f)
with open(chunks_dir / 'MASTER_INDEX.json', 'w') as f:
    json.dump(index, f, indent=2)
print('Master index rebuilt')
"
    fi
    complete_subtask
}

# Quality gate check for a document
quality_gate_check() {
    local doc_id=$1
    local chunk_dir="chunks/${doc_id}"
    local temp_file="/tmp/${doc_id}_check.md"
    
    start_subtask "Quality gate check for $doc_id"
    
    # Reassemble to temp file for checking
    python3 "$WRITE_TOOL" concat "$chunk_dir" "$temp_file" "chapter_*.md"
    
    local lines=$(wc -l < "$temp_file")
    local formulas=$(grep -c '\\$\\|\\[' "$temp_file" || echo 0)
    local refs=$(grep -ci 'Research\|SYNTH\|MAT\|DRAFT\|CSMFAB078' "$temp_file" || echo 0)
    local standards=$(grep -ci 'CIETA\|ASTM\|NIJ\|NFPA\|MIL-STD\|ISO\|IEC\|DoDI\|SAE' "$temp_file" || echo 0)
    local conflation=$(grep -ic 'medieval\|victorian\|edwardian\|regency\|rococo\|neoclassical\|empire\|19c\|20c\|pre-1600' "$temp_file" || echo 0)
    local tbd=$(grep -c 'TBD:RESEARCH' "$temp_file" || echo 0)
    local traceability=$(grep -c 'Traceability Matrix' "$temp_file" || echo 0)
    
    echo "Lines: $lines (target ≥300)"
    echo "Formulas: $formulas (target ≥15)"
    echo "Cross-refs: $refs (target ≥10)"
    echo "Standards: $standards (target ≥5)"
    echo "Conflation flags: $conflation (target 0)"
    echo "TBD markers: $tbd"
    echo "Traceability Matrix: $traceability"
    
    local pass=1
    [[ $lines -ge 300 ]] || { warn "FAIL: Lines < 300"; pass=0; }
    [[ $formulas -ge 15 ]] || { warn "FAIL: Formulas < 15"; pass=0; }
    [[ $refs -ge 10 ]] || { warn "FAIL: Refs < 10"; pass=0; }
    [[ $standards -ge 5 ]] || { warn "FAIL: Standards < 5"; pass=0; }
    [[ $conflation -eq 0 ]] || { warn "FAIL: Conflation flags > 0"; pass=0; }
    
    rm -f "$temp_file"
    
    if [[ $pass -eq 1 ]]; then
        success "Quality gate: PASS"
    else
        error "Quality gate: FAIL"
    fi
    complete_subtask
    return $pass
}

# Main remediation workflow for one document
remediate_document() {
    local doc_id=$1
    
    log "Starting remediation for $doc_id"
    
    # 1. Decompress
    local temp_file
    temp_file=$(decompress_doc "$doc_id")
    
    # 2. EDIT POINT: User must edit the file to add formulas/fix conflation
    warn "EDIT REQUIRED: Add formulas and fix conflation in $temp_file"
    warn "Press Enter when done editing..."
    read -r
    
    # 3. Re-chunk
    rechunk_doc "$doc_id" "$temp_file"
    
    # 4. Verify chunks
    verify_chunks "$doc_id"
    
    # 5. Compress back
    compress_doc "$doc_id"
    
    # 6. Update master index
    update_master_index "$doc_id"
    
    # 7. Quality gate check
    quality_gate_check "$doc_id"
    
    # 8. Git commit
    start_subtask "Git commit for $doc_id"
    git add "chunks/${doc_id}/" "FinishedWork/${doc_id}_*.md.gz" "chunks/MASTER_INDEX.json"
    git commit -m "remediation: ${doc_id} quality gates - formulas/conflation"
    complete_subtask
    
    success "Remediation complete for $doc_id"
}

# Display session status
show_status() {
    echo -e "\n${BLUE}=== AEGIS OUTFIT FABRICATOR - SESSION RESUME ===${NC}"
    echo "Project: $PROJECT_ROOT"
    echo "Python: $(python3 --version)"
    echo "Write tool: $WRITE_TOOL"
    echo ""
    echo "Key files:"
    cat RESUME_SESSION_AEGIS.md | head -40
    echo ""
    echo "Remediation tasks:"
    cat REMEDIATION_TASKS.md | head -60
}

# Main
main() {
    cd "$PROJECT_ROOT"
    
    show_status
    
    verify_write_tool
    start_heartbeat
    
    # Trap to stop heartbeat on exit
    trap stop_heartbeat EXIT INT TERM
    
    log "Session resume ready. Next actions:"
    echo "  1. Run: remediate_document DOC-06  (first formula injection task)"
    echo "  2. Or run individual commands:"
    echo "     decompress_doc DOC-06"
    echo "     rechunk_doc DOC-06 /tmp/DOC-06.md"
    echo "     verify_chunks DOC-06"
    echo "     quality_gate_check DOC-06"
    
    # Keep session alive for interactive use
    log "Session active. Heartbeat running. Use functions above for remediation."
    wait $HEARTBEAT_PID
}

# If sourced, make functions available; if executed, run main
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi