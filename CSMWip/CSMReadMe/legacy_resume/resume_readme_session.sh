#!/usr/bin/env bash
# ==============================================================================
# CSMReadMe — Session Resume & Next Project Selector
# Parses REPO_INDEX_V7.csv with awk, identifies projects needing deep READMEs,
# and recommends best candidates for next deep README generation
# ==============================================================================

set -euo pipefail

# --- Configuration ---
REPO_ROOT="/workspace/app"
REPO_INDEX_V7="${REPO_ROOT}/REPO_INDEX_V7.csv"
REPO_INDEX_V7_SUMMARY="${REPO_ROOT}/REPO_INDEX_V7_SUMMARY.md"
CSM_README_DIR="${REPO_ROOT}/CSMWip/CSMReadMe"
STATE_FILE="${CSM_README_DIR}/.session_state.json"
LOG_FILE="${CSM_README_DIR}/resume_session_$(date +%Y%m%d_%H%M%S).log"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# --- Logging ---
log() { echo -e "${BLUE}[$(date '+%H:%M:%S')]${NC} $*" | tee -a "$LOG_FILE"; }
success() { echo -e "${GREEN}[OK]${NC} $*" | tee -a "$LOG_FILE"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*" | tee -a "$LOG_FILE"; }
error() { echo -e "${RED}[ERR]${NC} $*" | tee -a "$LOG_FILE"; }
info() { echo -e "${CYAN}[INFO]${NC} $*" | tee -a "$LOG_FILE"; }
rec() { echo -e "${MAGENTA}[REC]${NC} $*" | tee -a "$LOG_FILE"; }

# --- Initialize ---
mkdir -p "$CSM_README_DIR"
TIMESTAMP="$(date -Iseconds)"
cat > "$STATE_FILE" <<EOF
{
  "last_completed": "README_DEEP_GENERATION_BATCH_6",
  "timestamp": "$TIMESTAMP",
  "repo_index_v7": "$REPO_INDEX_V7",
  "repo_index_v7_summary": "$REPO_INDEX_V7_SUMMARY",
  "completed_deep_readmes": [
    "10_Prime_Electron_Caldera_Synthesis",
    "02_Caldera_Prime_Pi_Electron",
    "11_TGApp",
    "12_AegisOutfitFabricator",
    "01_SubAtomic_Prime_Electron_Canonical",
    "03_Legal_Enactment"
  ],
  "next_candidates": []
}
EOF

log "=========================================="
log "CSMReadMe Resume Session — $(date)"
log "=========================================="
log "Repo root: $REPO_ROOT"
log "REPO_INDEX_V7: $REPO_INDEX_V7"
log "Summary: $REPO_INDEX_V7_SUMMARY"
log "Log: $LOG_FILE"

# --- Load Summary for Context ---
if [[ -f "$REPO_INDEX_V7_SUMMARY" ]]; then
    log "Loading REPO_INDEX_V7_SUMMARY.md context..."
    grep -A 2 "Deep README Enhancements" "$REPO_INDEX_V7_SUMMARY" | head -20
else
    warn "REPO_INDEX_V7_SUMMARY.md not found"
fi

# --- Parse REPO_INDEX_V7.csv with awk (handling quoted fields properly) ---
# CSV columns: State,ParentProject,Summary,Category,Project,Path,FileCount,HasTODO,HasREADME,HasNEXT,CreationDate,LastWorkedDate,DaysSinceUpdated,AI,Status,Notes
log ""
log "=== PARSING REPO_INDEX_V7.csv ==="

# Use a proper CSV parser approach: replace commas inside quotes first, then split
# The Summary field (column 3) is the only one with commas inside quotes
mapfile -t ALL_PROJECTS < <(awk '
{
    line=$0
    # Replace commas inside quotes with a placeholder
    in_quote=0
    result=""
    for(i=1;i<=length(line);i++) {
        c=substr(line,i,1)
        if(c=="\"") in_quote=!in_quote
        if(c=="," && in_quote) c="\001"  # Use SOH as placeholder
        result=result c
    }
    # Now split on commas (not placeholders)
    n=split(result, fields, ",")
    # Restore commas in fields
    for(i=1;i<=n;i++) {
        gsub(/\001/, ",", fields[i])
        gsub(/^"|"$/, "", fields[i])  # Remove surrounding quotes
    }
    
    # Fields after comma-in-quote fix:
    # 1=State, 2=ParentProject, 3=Summary, 4=Category, 5=Project, 6=Path, 7=FileCount, 8=HasTODO, 9=HasREADME, 10=HasNEXT, ...
    if (NR==1) next  # Skip header
    
    state=fields[1]
    category=fields[4]
    project=fields[5]
    path=fields[6]
    filecount=fields[7]
    hastodo=fields[8]
    hasreadme=fields[9]
    hasnext=fields[10]
    
    gsub(/^ *| *$/, "", project); gsub(/^ *| *$/, "", path)
    gsub(/^ *| *$/, "", state); gsub(/^ *| *$/, "", category)
    gsub(/^ *| *$/, "", filecount); gsub(/^ *| *$/, "", hastodo)
    gsub(/^ *| *$/, "", hasreadme); gsub(/^ *| *$/, "", hasnext)
    if (filecount == "") filecount=0
    if (hastodo == "") hastodo="false"; else if (hastodo ~ /Y|y/) hastodo="true"; else hastodo="false"
    if (hasreadme == "") hasreadme="N";
    if (hasnext == "") hasnext="false"; else if (hasnext ~ /Y|y/) hasnext="true"; else hasnext="false"
    
    # Only output if we have a valid project name
    if (project != "") {
        print project "|" path "|" state "|" category "|" filecount "|" hastodo "|" hasreadme "|" hasnext
    }
}' "$REPO_INDEX_V7")

log "Parsed ${#ALL_PROJECTS[@]} projects from CSV"

# --- Completed deep READMEs (avoid re-doing) ---
COMPLETED=(
    "10_Prime_Electron_Caldera_Synthesis"
    "02_Caldera_Prime_Pi_Electron"
    "11_TGApp"
    "12_AegisOutfitFabricator"
    "01_SubAtomic_Prime_Electron_Canonical"
    "03_Legal_Enactment"
    "05_BOUNCE"
    "LEGAL-ENACTMENT"
)

# --- Score each project ---
log ""
log "=== SCORING ALL PROJECTS ==="

declare -A SCORED
NEW_CANDIDATES=0
UPGRADE_CANDIDATES=0

for entry in "${ALL_PROJECTS[@]}"; do
    IFS='|' read -r project path state category filecount hastodo hasreadme hasnext <<< "$entry"
    
    # Skip if already completed
    skip=false
    for c in "${COMPLETED[@]}"; do
        [[ "$project" == "$c" ]] && skip=true
    done
    [[ "$skip" == "true" ]] && continue
    
    # Normalize path (strip leading ./)
    clean_path="${path#./}"
    
    # Sanitize project name for array key (replace special chars)
    safe_project=$(echo "$project" | sed 's/[^a-zA-Z0-9_-]/_/g' | sed 's/^_*//;s/_*$//')
    [[ -z "$safe_project" ]] && safe_project="UNKNOWN_$RANDOM"
    
    score=0
    
    # State bonus
    [[ "$state" == "Whole Project" ]] && score=$((score + 50))
    [[ "$state" == "Part of Another Project" ]] && score=$((score + 20))
    [[ "$state" == "Near-Whole Project" ]] && score=$((score + 30))
    
    # File count bonus
    if [[ "$filecount" -gt 1000 ]]; then score=$((score + 30))
    elif [[ "$filecount" -gt 500 ]]; then score=$((score + 20))
    elif [[ "$filecount" -gt 100 ]]; then score=$((score + 10))
    elif [[ "$filecount" -gt 50 ]]; then score=$((score + 5))
    fi
    
    # Category bonus
    case "$category" in
        CSMWip) score=$((score + 25)) ;;
        CSMFAB) score=$((score + 20)) ;;
        CSMPro) score=$((score + 15)) ;;
        CSMQuantum) score=$((score + 15)) ;;
        CSMPublished) score=$((score + 15)) ;;
        CSMMetal) score=$((score + 10)) ;;
        CSMGen) score=$((score + 10)) ;;
        CSMSubatomic*) score=$((score + 10)) ;;
        DeepResearch) score=$((score + 10)) ;;
        LEGAL-ENACTMENT) score=$((score + 10)) ;;
        TopLevel) score=$((score + 20)) ;;
        *) score=$((score + 5)) ;;
    esac
    
    # Infrastructure bonuses
    [[ "$hastodo" == "true" ]] && score=$((score + 10))
    [[ "$hasnext" == "true" ]] && score=$((score + 10))
    
    # Check for existing AGENTS.md, chunks, RESUME, NEXT_runner
    [[ -f "${REPO_ROOT}/${clean_path}/AGENTS.md" ]] && score=$((score + 10))
    [[ -d "${REPO_ROOT}/${clean_path}/chunks" || -d "${REPO_ROOT}/${clean_path}/Pieces" ]] && score=$((score + 10))
    [[ -f "${REPO_ROOT}/${clean_path}/RESUME_SESSION_"* ]] && score=$((score + 10))
    [[ -f "${REPO_ROOT}/${clean_path}/NEXT_runner_"* ]] && score=$((score + 10))
    
    # Track candidate type
    if [[ "$hasreadme" == "Y" ]]; then
        has_template=true
        score=$((score - 5))  # Small penalty for upgrade vs new
        UPGRADE_CANDIDATES=$((UPGRADE_CANDIDATES + 1))
    else
        has_template=false
        NEW_CANDIDATES=$((NEW_CANDIDATES + 1))
    fi
    
    SCORED["$safe_project"]="$score|$project|$clean_path|$state|$category|$filecount|$has_template"
done

log "New README candidates: $NEW_CANDIDATES"
log "Upgrade candidates: $UPGRADE_CANDIDATES"

# --- Sort and display top 20 ---
log ""
log "=== TOP 20 CANDIDATES FOR NEXT DEEP README ==="
echo ""

# Convert to array for sorting
sorted=()
for key in "${!SCORED[@]}"; do
    sorted+=("${SCORED[$key]}")
done

# Sort by score descending
IFS=$'\n' sorted=($(printf '%s\n' "${sorted[@]}" | sort -t'|' -k1 -nr))

rank=1
for entry in "${sorted[@]}"; do
    IFS='|' read -r score project path state category filecount has_template <<< "$entry"
    
    if [[ "$has_template" == "true" ]]; then
        display="${project} ${YELLOW}[has template README - upgrade candidate]${NC}"
        type_marker="UPGRADE"
    else
        display="${project} ${GREEN}[no README - new candidate]${NC}"
        type_marker="NEW"
    fi
    
    if [[ $score -ge 100 ]]; then score_color=$GREEN
    elif [[ $score -ge 70 ]]; then score_color=$YELLOW
    else score_color=$CYAN; fi
    
    printf "%2d. ${score_color}Score: %3d${NC} [%s] | %s\n" "$rank" "$score" "$type_marker" "$display"
    printf "     Path: %s | State: %s | Category: %s | Files: %s\n" "$path" "$state" "$category" "$filecount"
    
    # Show existing assets
    assets=()
    [[ -f "${REPO_ROOT}/${path}/TODO.md" ]] && assets+=("TODO.md")
    [[ -f "${REPO_ROOT}/${path}/AGENTS.md" ]] && assets+=("AGENTS.md")
    [[ -f "${REPO_ROOT}/${path}/README.md" ]] && assets+=("README.md")
    [[ -f "${REPO_ROOT}/${path}/RESUME_SESSION_"* ]] && assets+=("RESUME_SESSION")
    [[ -f "${REPO_ROOT}/${path}/NEXT_runner_"* ]] && assets+=("NEXT_runner")
    [[ -d "${REPO_ROOT}/${path}/chunks" || -d "${REPO_ROOT}/${path}/Pieces" ]] && assets+=("chunks/Pieces")
    if [[ ${#assets[@]} -gt 0 ]]; then
        printf "     Assets: %s\n" "$(IFS=,; echo "${assets[*]}")"
    fi
    echo ""
    rank=$((rank + 1))
    [[ $rank -gt 20 ]] && break
done

# --- Specific Recommendations ---
log ""
log "=== SPECIFIC RECOMMENDATIONS ==="

# Best Overall (highest scoring NEW)
best=""
best_score=-999
for entry in "${sorted[@]}"; do
    IFS='|' read -r score project path state category filecount has_template <<< "$entry"
    if [[ "$has_template" == "false" && $score -gt $best_score ]]; then
        best_score=$score
        best="$entry"
    fi
done

if [[ -n "$best" ]]; then
    IFS='|' read -r score project path state category filecount has_template <<< "$best"
    rec "🥇 BEST OVERALL (New README): $project (Score: $score)"
    rec "   Path: $path | $state | $category | $filecount files"
fi

# Best Upgrade Candidate
best_upgrade=""
best_upgrade_score=-999
for entry in "${sorted[@]}"; do
    IFS='|' read -r score project path state category filecount has_template <<< "$entry"
    if [[ "$has_template" == "true" && $score -gt $best_upgrade_score ]]; then
        best_upgrade_score=$score
        best_upgrade="$entry"
    fi
done

if [[ -n "$best_upgrade" ]]; then
    IFS='|' read -r score project path state category filecount has_template <<< "$best_upgrade"
    rec "🥈 BEST UPGRADE CANDIDATE: $project (Score: $score)"
    rec "   Path: $path | $state | $category | $filecount files"
fi

# Best CSMWip subproject
best_csmwip=""
best_csmwip_score=-999
for entry in "${sorted[@]}"; do
    IFS='|' read -r score project path state category filecount has_template <<< "$entry"
    if [[ "$path" == CSMWip/* && $score -gt $best_csmwip_score ]]; then
        best_csmwip_score=$score
        best_csmwip="$entry"
    fi
done

if [[ -n "$best_csmwip" ]]; then
    IFS='|' read -r score project path state category filecount has_template <<< "$best_csmwip"
    rec "🥉 BEST CSMWip SUBPROJECT: $project (Score: $score)"
fi

# Best high-file-count project (>1000 files)
best_large=""
best_large_score=-999
for entry in "${sorted[@]}"; do
    IFS='|' read -r score project path state category filecount has_template <<< "$entry"
    if [[ $filecount -gt 1000 && $score -gt $best_large_score ]]; then
        best_large_score=$score
        best_large="$entry"
    fi
done

if [[ -n "$best_large" ]]; then
    IFS='|' read -r score project path state category filecount has_template <<< "$best_large"
    rec "📦 BEST LARGE PROJECT (>1K files): $project (Score: $score, $filecount files)"
fi

# --- Quick Start Commands ---
log ""
log "=== QUICK START COMMANDS FOR TOP CANDIDATE ==="
if [[ -n "$best" ]]; then
    IFS='|' read -r score project path state category filecount has_template <<< "$best"
    echo ""
    echo "# Navigate to project"
    echo "cd \"${REPO_ROOT}/${path}\""
    echo ""
    echo "# Check existing structure"
    echo "ls -la"
    echo ""
    echo "# Read any existing docs"
    echo "cat TODO.md 2>/dev/null || echo 'No TODO.md'"
    echo "cat AGENTS.md 2>/dev/null || echo 'No AGENTS.md'"
    echo "cat RESUME_SESSION_* 2>/dev/null || echo 'No RESUME_SESSION'"
    echo "cat NEXT_runner_* 2>/dev/null || echo 'No NEXT_runner'"
    echo ""
    echo "# Reference deep README examples:"
    echo "cat ../../10_Prime_Electron_Caldera_Synthesis/README.md"
    echo "cat ../../02_Caldera_Prime_Pi_Electron/README.md"
    echo "cat ../../11_TGApp/README.md"
    echo "cat ../../12_AegisOutfitFabricator/README.md"
    echo "cat ../../01_SubAtomic_Prime_Electron_Canonical/README.md"
    echo "cat ../../03_Legal_Enactment/README.md"
fi

# --- Save Recommendations to State ---
TOP_CAND=$(echo "$best" | cut -d'|' -f2)
TOP_PATH=$(echo "$best" | cut -d'|' -f3)
TOP_SCORE=$(echo "$best" | cut -d'|' -f1)
BEST_UPG=$(echo "$best_upgrade" | cut -d'|' -f2)
BEST_UPG_PATH=$(echo "$best_upgrade" | cut -d'|' -f3)
BEST_CSM=$(echo "$best_csmwip" | cut -d'|' -f2)

cat > "${STATE_FILE}.recommendations" <<EOF
{
  "timestamp": "$TIMESTAMP",
  "top_candidate": "$TOP_CAND",
  "top_path": "$TOP_PATH",
  "top_score": $TOP_SCORE,
  "best_upgrade": "$BEST_UPG",
  "best_upgrade_path": "$BEST_UPG_PATH",
  "best_csmwip": "$BEST_CSM"
}
EOF

success "Recommendations saved to ${STATE_FILE}.recommendations"
success "Full log saved to $LOG_FILE"
log ""
log "=== RESUME COMPLETE ==="
log "To continue in next session, run this script again."
log "It will load REPO_INDEX_V7_SUMMARY.md and re-analyze."