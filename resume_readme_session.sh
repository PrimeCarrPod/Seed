#!/usr/bin/env bash
# ==============================================================================
# CSMReadMe — Session Resume & Next Project Selector (Simplified)
# Recognizes REPO_INDEX_V7_SUMMARY.md, identifies projects without proper READMEs,
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
cat > "$STATE_FILE" <<EOF
{
  "last_completed": "README_DEEP_GENERATION_BATCH_6",
  "timestamp": "$(date -Iseconds)",
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

# --- Known Candidates from Manual Analysis ---
# Based on our investigation, these are the top candidates for deep README generation
# Format: "Project|Path|State|Category|FileCount|HasTODO|HasAGENTS|HasChunks|HasRESUME|HasNEXT"
CANDIDATES=(
    # No README yet (HasREADME=N/empty) - High Priority
    "01_SubAtomic_Prime_Electron_Canonical|CSMWip/01_SubAtomic_Prime_Electron_Canonical|Part of Another Project|CSMWip|680|true|false|false|false|false"
    "03_Legal_Enactment|CSMWip/03_Legal_Enactment|Part of Another Project|CSMWip|569|false|false|false|false|false"
    "09_Project_Tracking|CSMWip/09_Project_Tracking|Part of Another Project|CSMWip|10|false|false|false|false|false"
    "CSMMinesMagnets|CSMWip/CSMMinesMagnets|Part of Another Project|CSMWip|122|false|false|false|false|false"
    "Kilo_Session_20261007_Consolidation|CSMWip/Kilo_Session_20261007_Consolidation|Part of Another Project|CSMWip|1063|false|false|false|false|false"
    "CSMWipScripts|CSMWipScripts|Whole Project|CSMWipScripts|33|false|false|false|false|false"
    "CSM_WORK_IN_PROGRESS|CSM_WORK_IN_PROGRESS|Whole Project|CSM_WORK_IN_PROGRESS|10|false|false|false|false|false"
    
    # Has Template README (HasREADME=Y) - Upgrade Candidates (High Value)
    "CSMApps|CSMApps|Whole Project|TopLevel|5144|true|true|true|true|true"
    "CSMFAB|CSMFAB|Whole Project|TopLevel|5000|true|true|true|true|true"
    "CSMPro|CSMPro|Whole Project|TopLevel|5000|true|true|true|true|true"
    "CSMMetal|CSMMetal|Whole Project|TopLevel|500|true|true|true|true|true"
    "CSMQuantum|CSMQuantum|Whole Project|TopLevel|500|true|true|true|true|true"
    "CSMPublished|CSMPublished|Whole Project|TopLevel|500|true|true|true|true|true"
    "CSMRadio|CSMRadio|Whole Project|TopLevel|500|true|true|true|true|true"
    "CSMReach|CSMReach|Whole Project|TopLevel|500|true|true|true|true|true"
    "CSMSOPP|CSMSOPP|Whole Project|TopLevel|500|true|true|true|true|true"
    "CSMArchive|CSMArchive|Whole Project|TopLevel|61|false|false|true|false|false"
    "CSM-Brandoutreach|CSM-Brandoutreach|Whole Project|TopLevel|100|false|false|true|false|false"
    "CSMDropBox|CSMDropBox|Whole Project|TopLevel|100|false|false|true|false|false"
    "CSMGen|CSMGen|Whole Project|TopLevel|100|false|false|true|false|false"
    "CSMGrantCampaigns|CSMGrantCampaigns|Whole Project|TopLevel|100|false|false|true|false|false"
    "CSMHuman|CSMHuman|Whole Project|TopLevel|100|false|false|true|false|false"
    "CSMLogs|CSMLogs|Whole Project|TopLevel|100|false|false|true|false|false"
    "CSMPrePublish|CSMPrePublish|Whole Project|TopLevel|100|false|false|true|false|false"
    "CSMProtonics|CSMProtonics|Whole Project|TopLevel|100|true|true|true|true|true"
    "CSMSubatomic082026|CSMSubatomic082026|Whole Project|TopLevel|100|false|false|true|false|false"
    "DeepResearch|DeepResearch|Whole Project|TopLevel|100|false|false|true|false|false"
    "PrimeBookOne|PrimeBookOne|Whole Project|TopLevel|100|false|false|true|false|false"
    "__PUBLISH_CSM__|__PUBLISH_CSM__|Whole Project|TopLevel|100|false|false|true|false|false"
    "__Python_Tools|__Python_Tools|Whole Project|TopLevel|100|false|false|true|false|false"
    "TardigradiaTGPU|TardigradiaTGPU|Whole Project|TopLevel|100|false|false|true|false|false"
    "landing-page|landing-page|Whole Project|TopLevel|100|false|false|true|false|false"
    "RESTART_PACKAGE|RESTART_PACKAGE|Whole Project|TopLevel|100|false|false|true|false|false"
    "scripts|scripts|Whole Project|TopLevel|100|false|false|true|false|false"
    ".sdk|.sdk|Whole Project|TopLevel|100|false|false|true|false|false"
)

# Completed deep READMEs (avoid re-doing)
COMPLETED=(
    "10_Prime_Electron_Caldera_Synthesis"
    "02_Caldera_Prime_Pi_Electron"
    "11_TGApp"
    "12_AegisOutfitFabricator"
    "01_SubAtomic_Prime_Electron_Canonical"
    "03_Legal_Enactment"
)

log ""
log "=== SCORING CANDIDATES FOR NEXT DEEP README ==="

# Score each candidate
declare -A SCORED
for entry in "${CANDIDATES[@]}"; do
    IFS='|' read -r project path state category filecount hastodo hasagents haschunks hasresume hasnext <<< "$entry"
    
    # Skip if already completed
    skip=false
    for c in "${COMPLETED[@]}"; do
        [[ "$project" == "$c" ]] && skip=true
    done
    [[ "$skip" == "true" ]] && continue
    
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
    [[ "$hasagents" == "true" ]] && score=$((score + 10))
    [[ "$haschunks" == "true" ]] && score=$((score + 10))
    [[ "$hasresume" == "true" ]] && score=$((score + 10))
    [[ "$hasnext" == "true" ]] && score=$((score + 10))
    
    # Penalty for already having template README (upgrade vs new)
    # We'll mark these with a flag
    has_template=false
    if [[ -f "${REPO_ROOT}/${path}/README.md" ]] && [[ "$hasagents" == "true" ]]; then
        has_template=true
        score=$((score - 5))  # Small penalty for upgrade vs new
    fi
    
    SCORED["$project"]="$score|$project|$path|$state|$category|$filecount|$has_template"
done

# Sort and display top 15
log ""
log "=== TOP 15 CANDIDATES FOR NEXT DEEP README ==="
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
    else
        display="${project} ${GREEN}[no README - new candidate]${NC}"
    fi
    
    if [[ $score -ge 100 ]]; then score_color=$GREEN
    elif [[ $score -ge 70 ]]; then score_color=$YELLOW
    else score_color=$CYAN; fi
    
    printf "%2d. ${score_color}Score: %3d${NC} | %s\n" "$rank" "$score" "$display"
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
    [[ $rank -gt 15 ]] && break
done

# --- Specific Recommendations ---
log ""
log "=== SPECIFIC RECOMMENDATIONS ==="

# Best Overall (highest scoring non-template)
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
cat > "${STATE_FILE}.recommendations" <<'EOF'
{
  "timestamp": "$(date -Iseconds)",
  "top_candidate": "$(echo "$best" | cut -d'|' -f2)",
  "top_path": "$(echo "$best" | cut -d'|' -f3)",
  "top_score": $(echo "$best" | cut -d'|' -f1),
  "best_upgrade": "$(echo "$best_upgrade" | cut -d'|' -f2)",
  "best_upgrade_path": "$(echo "$best_upgrade" | cut -d'|' -f3)",
  "best_csmwip": "$(echo "$best_csmwip" | cut -d'|' -f2)"
}
EOF

success "Recommendations saved to ${STATE_FILE}.recommendations"
success "Full log saved to $LOG_FILE"
log ""
log "=== RESUME COMPLETE ==="
log "To continue in next session, run this script again."
log "It will load REPO_INDEX_V7_SUMMARY.md and re-analyze."

EOF
chmod +x /workspace/app/resume_readme_session.sh