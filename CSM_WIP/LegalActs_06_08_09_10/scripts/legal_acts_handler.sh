#!/bin/bash
# Legal Acts Handler — Utility for managing Legal Act piece files
# Usage: ./legal_acts_handler.sh <command> [args...]
# Supports Acts 06, 08, 09, 10 with 14 sections each
# Author: Jason Isaac Brodsky (California 1976) — Conducier

set -e

PROJECT_DIR="CSM_WIP/LegalActs_06_08_09_10"
PIECES_DIR="${PROJECT_DIR}/pieces"
FULL_DIR="${PROJECT_DIR}/full"
ZIP_DIR="${PROJECT_DIR}/zip"
LOG_DIR="${PROJECT_DIR}/logs"

# Act configuration
declare -A ACT_NAMES=(
    [06]="Wildfire-Prevention-Grid-Resilience"
    [08]="Critical-Technology-Supply-Chain"
    [09]="Water-Infrastructure-Drought-Resilience"
    [10]="Coastal-Port-Infrastructure"
)

declare -A ACT_TITLES=(
    [06]="Wildfire Prevention & Grid Resilience Act"
    [08]="Critical Technology Supply Chain Act"
    [09]="Water Infrastructure & Drought Resilience Act"
    [10]="Coastal Port Infrastructure Act"
)

# Section names
SECTIONS=(
    "BILL-TITLE-AND-NUMBER"
    "EXECUTIVE-SUMMARY"
    "FINDINGS-AND-DECLARATIONS"
    "TITLE-I"
    "TITLE-II"
    "TITLE-III"
    "TITLE-IV"
    "TITLE-V"
    "FUNDING-MECHANISMS"
    "IMPLEMENTATION-SCHEDULE"
    "REGULATORY-LANGUAGE"
    "ECONOMIC-IMPACT-STATEMENT"
    "ENFORCEMENT-AND-COMPLIANCE"
    "APPENDIX-REFERENCES"
)

show_help() {
    cat <<EOF
Legal Acts Handler — Piece File Manager for Acts 06, 08, 09, 10

COMMANDS:
  create-act <act_num>                          Create all piece files for an act
  create-section <act_num> <section_num>        Create 12 piece files for a section
  write-piece <act_num> <section_num> <piece_num> <content>  Write content to piece
  concat-section <act_num> <section_num>        Concatenate 12 pieces into section
  zip-section <act_num> <section_num>           Zip 12 pieces into archive
  verify-section <act_num> <section_num>        Verify piece count, concat, zip
  organize-act <act_num>                        Copy all sections to LEGAL-ENACTMENT/
  full-section <act_num> <section_num>          Complete section cycle
  full-act <act_num>                            Complete entire act (14 sections)
  commit-push <act_num> <msg>                   Commit and push to main
  list                                          List all pieces
  clean-section <act_num> <section_num>         Remove loose pieces after verify
  help                                          Show this help

EXAMPLES:
  ./legal_acts_handler.sh create-act 06
  ./legal_acts_handler.sh create-section 06 00
  ./legal_acts_handler.sh write-piece 06 00 01 "Content here..."
  ./legal_acts_handler.sh concat-section 06 00
  ./legal_acts_handler.sh zip-section 06 00
  ./legal_acts_handler.sh verify-section 06 00
  ./legal_acts_handler.sh full-section 06 00
  ./legal_acts_handler.sh full-act 06
  ./legal_acts_handler.sh commit-push 06 "Add Act 06: Wildfire Prevention"
  ./legal_acts_handler.sh list

EOF
}

get_act_dir() {
    local act_num="$1"
    printf "%s" "${PROJECT_DIR}/Act_$(printf "%02d" "$act_num")"
}

get_section_prefix() {
    local act_num="$1"
    local section_num="$2"
    printf "%s" "act$(printf "%02d" "$act_num")_sec$(printf "%02d" "$section_num")"
}

create_act() {
    local act_num="$1"
    if [[ -z "$act_num" ]]; then
        echo "Usage: create-act <act_num>"
        exit 1
    fi
    
    local act_dir=$(get_act_dir "$act_num")
    mkdir -p "$act_dir"
    
    echo "=== Creating all pieces for Act $(printf "%02d" "$act_num") — ${ACT_TITLES[$act_num]} ==="
    
    for sec_idx in "${!SECTIONS[@]}"; do
        local sec_num=$(printf "%02d" "$sec_idx")
        echo "  Creating section $sec_num — ${SECTIONS[$sec_idx]}..."
        create_section_pieces "$act_num" "$sec_idx"
    done
    
    echo ""
    echo "=== Act $(printf "%02d" "$act_num") complete: 14 sections × 12 pieces = 168 piece files ==="
}

create_section_pieces() {
    local act_num="$1"
    local section_idx="$2"
    local section_name="${SECTIONS[$section_idx]}"
    local section_num=$(printf "%02d" "$section_idx")
    local prefix=$(get_section_prefix "$act_num" "$section_idx")
    local act_dir=$(get_act_dir "$act_num")
    local sec_dir="${act_dir}/${section_num}-${section_name}"
    
    mkdir -p "$sec_dir"
    
    for i in {1..12}; do
        local piece_file="${sec_dir}/${prefix}_piece_$(printf "%02d" "$i").md"
        if [[ ! -f "$piece_file" ]]; then
            cat > "$piece_file" <<PIECE_EOF
# ${section_name//_/ } — Piece $(printf "%02d" "$i")/12
## Act $(printf "%02d" "$act_num"): ${ACT_TITLES[$act_num]} — Section ${section_num}
**Piece:** $(printf "%02d" "$i") of 12  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")

---

[Content for piece $(printf "%02d" "$i") of section ${section_name//_/ } goes here]

PIECE_EOF
        fi
    done
    echo "    Created 12 pieces in ${section_num}-${section_name}/"
}

create_section() {
    local act_num="$1"
    local section_idx="$2"
    if [[ -z "$act_num" || -z "$section_idx" ]]; then
        echo "Usage: create-section <act_num> <section_idx (0-13)>"
        exit 1
    fi
    create_section_pieces "$act_num" "$section_idx"
}

write_piece() {
    local act_num="$1"
    local section_idx="$2"
    local piece_num="$3"
    local content="$4"
    if [[ -z "$act_num" || -z "$section_idx" || -z "$piece_num" || -z "$content" ]]; then
        echo "Usage: write-piece <act_num> <section_idx> <piece_num> <content>"
        exit 1
    fi
    
    local section_name="${SECTIONS[$section_idx]}"
    local section_num=$(printf "%02d" "$section_idx")
    local prefix=$(get_section_prefix "$act_num" "$section_idx")
    local act_dir=$(get_act_dir "$act_num")
    local sec_dir="${act_dir}/${section_num}-${section_name}"
    local piece_file="${sec_dir}/${prefix}_piece_$(printf "%02d" "$piece_num").md"
    
    if [[ -f "$piece_file" ]]; then
        awk -v content="$content" '
            /^---$/ { printed=1; print; print content; next }
            printed { next }
            { print }
        ' "$piece_file" > "${piece_file}.tmp" && mv "${piece_file}.tmp" "$piece_file"
        echo "Updated: $piece_file"
    else
        echo "Error: $piece_file not found — run create-section first"
        exit 1
    fi
}

concat_section() {
    local act_num="$1"
    local section_idx="$2"
    if [[ -z "$act_num" || -z "$section_idx" ]]; then
        echo "Usage: concat-section <act_num> <section_idx>"
        exit 1
    fi
    
    local section_name="${SECTIONS[$section_idx]}"
    local section_num=$(printf "%02d" "$section_idx")
    local prefix=$(get_section_prefix "$act_num" "$section_idx")
    local act_dir=$(get_act_dir "$act_num")
    local sec_dir="${act_dir}/${section_num}-${section_name}"
    local concat_file="${act_dir}/${section_num}-${section_name}.md"
    
    echo "Concatenating section ${section_num} (${section_name//_/ }) for Act $(printf "%02d" "$act_num")..."
    
    cat > "$concat_file" <<CONCAT_EOF
# ${section_name//_/ } — Act $(printf "%02d" "$act_num"): ${ACT_TITLES[$act_num]}
## Section ${section_num} of 14
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Structure:** 12 pieces concatenated  
**Target:** ≥350 lines

---

CONCAT_EOF
    
    for i in {1..12}; do
        local piece_file="${sec_dir}/${prefix}_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            echo "Adding piece $i..."
            cat "$piece_file" >> "$concat_file"
            echo -e "\n---\n" >> "$concat_file"
        else
            echo "WARNING: Missing piece $i ($piece_file)"
        fi
    done
    
    local line_count=$(wc -l < "$concat_file")
    echo "Concatenated: $concat_file ($line_count lines)"
    
    if [[ $line_count -lt 350 ]]; then
        echo "WARNING: Line count $line_count < 350 target"
    else
        echo "SUCCESS: Line count $line_count ≥ 350 target"
    fi
}

zip_section() {
    local act_num="$1"
    local section_idx="$2"
    if [[ -z "$act_num" || -z "$section_idx" ]]; then
        echo "Usage: zip-section <act_num> <section_idx>"
        exit 1
    fi
    
    local section_name="${SECTIONS[$section_idx]}"
    local section_num=$(printf "%02d" "$section_idx")
    local prefix=$(get_section_prefix "$act_num" "$section_idx")
    local act_dir=$(get_act_dir "$act_num")
    local sec_dir="${act_dir}/${section_num}-${section_name}"
    local zip_file="${act_dir}/${section_num}-${section_name}_pieces.zip"
    
    echo "Zipping section ${section_num} (${section_name//_/ }) for Act $(printf "%02d" "$act_num")..."
    
    local piece_files=()
    for i in {1..12}; do
        local piece_file="${sec_dir}/${prefix}_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            piece_files+=("$piece_file")
        else
            echo "ERROR: Missing piece $i"
            exit 1
        fi
    done
    
    cd "$act_dir"
    zip -q "$zip_file" "${piece_files[@]#${act_dir}/}"
    cd - > /dev/null
    
    echo "Created: $zip_file"
    unzip -l "$zip_file"
}

verify_section() {
    local act_num="$1"
    local section_idx="$2"
    if [[ -z "$act_num" || -z "$section_idx" ]]; then
        echo "Usage: verify-section <act_num> <section_idx>"
        exit 1
    fi
    
    local section_name="${SECTIONS[$section_idx]}"
    local section_num=$(printf "%02d" "$section_idx")
    local prefix=$(get_section_prefix "$act_num" "$section_idx")
    local act_dir=$(get_act_dir "$act_num")
    local sec_dir="${act_dir}/${section_num}-${section_name}"
    local concat_file="${act_dir}/${section_num}-${section_name}.md"
    local zip_file="${act_dir}/${section_num}-${section_name}_pieces.zip"
    
    echo "=== Verification: Act $(printf "%02d" "$act_num") Section ${section_num} (${section_name//_/ }) ==="
    
    local piece_count=0
    for i in {1..12}; do
        if [[ -f "${sec_dir}/${prefix}_piece_$(printf "%02d" "$i").md" ]]; then
            ((piece_count++))
        fi
    done
    echo "Pieces: $piece_count/12"
    
    if [[ -f "$concat_file" ]]; then
        local lines=$(wc -l < "$concat_file")
        echo "Concatenated: $concat_file ($lines lines)"
        [[ $lines -ge 350 ]] && echo "  ✅ Meets ≥350 target" || echo "  ❌ Below 350 target"
    else
        echo "Concatenated: MISSING"
    fi
    
    if [[ -f "$zip_file" ]]; then
        local zip_count=$(unzip -l "$zip_file" | grep -c "\.md$" || echo 0)
        echo "Zip: $zip_file ($zip_count files)"
        [[ $zip_count -eq 12 ]] && echo "  ✅ Contains 12 pieces" || echo "  ❌ Does not contain 12 pieces"
    else
        echo "Zip: MISSING"
    fi
}

organize_act() {
    local act_num="$1"
    if [[ -z "$act_num" ]]; then
        echo "Usage: organize-act <act_num>"
        exit 1
    fi
    
    local act_dir=$(get_act_dir "$act_num")
    local act_name="${ACT_NAMES[$act_num]}"
    local target_dir="LEGAL-ENACTMENT/$(printf "%02d" "$act_num")-${act_name}"
    
    echo "=== Organizing Act $(printf "%02d" "$act_num") → $target_dir ==="
    mkdir -p "$target_dir"
    
    for sec_idx in "${!SECTIONS[@]}"; do
        local section_name="${SECTIONS[$sec_idx]}"
        local section_num=$(printf "%02d" "$sec_idx")
        local concat_file="${act_dir}/${section_num}-${section_name}.md"
        local zip_file="${act_dir}/${section_num}-${section_name}_pieces.zip"
        
        if [[ -f "$concat_file" ]]; then
            cp "$concat_file" "$target_dir/"
            echo "  Copied: ${section_num}-${section_name}.md"
        fi
        
        if [[ -f "$zip_file" ]]; then
            cp "$zip_file" "$target_dir/"
            echo "  Copied: ${section_num}-${section_name}_pieces.zip"
        fi
    done
    
    echo "=== Act $(printf "%02d" "$act_num") organized to $target_dir ==="
}

full_section() {
    local act_num="$1"
    local section_idx="$2"
    if [[ -z "$act_num" || -z "$section_idx" ]]; then
        echo "Usage: full-section <act_num> <section_idx>"
        exit 1
    fi
    
    local section_name="${SECTIONS[$section_idx]}"
    local section_num=$(printf "%02d" "$section_idx")
    
    echo "=== Full Section Cycle: Act $(printf "%02d" "$act_num") Section ${section_num} (${section_name//_/ }) ==="
    
    create_section "$act_num" "$section_idx"
    echo ">>> Please edit the 12 piece files now, then run:"
    echo ">>> ./legal_acts_handler.sh concat-section $act_num $section_idx"
    echo ">>> ./legal_acts_handler.sh zip-section $act_num $section_idx"
    echo ">>> ./legal_acts_handler.sh verify-section $act_num $section_idx"
}

full_act() {
    local act_num="$1"
    if [[ -z "$act_num" ]]; then
        echo "Usage: full-act <act_num>"
        exit 1
    fi
    
    echo "=== Full Act Cycle: Act $(printf "%02d" "$act_num") — ${ACT_TITLES[$act_num]} ==="
    
    for sec_idx in "${!SECTIONS[@]}"; do
        echo ""
        echo "--- Section $(printf "%02d" "$sec_idx"): ${SECTIONS[$sec_idx]} ---"
        full_section "$act_num" "$sec_idx"
    done
    
    echo ""
    echo "=== Act $(printf "%02d" "$act_num") all 14 sections created ==="
    echo ">>> Next: Edit all piece files, then run concat/zip/verify for each section"
    echo ">>> Then: ./legal_acts_handler.sh organize-act $act_num"
    echo ">>> Then: ./legal_acts_handler.sh commit-push $act_num \"Add Act $(printf "%02d" "$act_num"): ${ACT_NAMES[$act_num]}\""
}

list_pieces() {
    echo "=== Legal Acts Pieces ==="
    for act_num in 06 08 09 10; do
        local act_dir=$(get_act_dir "$act_num")
        if [[ -d "$act_dir" ]]; then
            echo ""
            echo "Act $(printf "%02d" "$act_num"): ${ACT_TITLES[$act_num]}"
            find "$act_dir" -name "*.md" -type f | while read f; do
                local lines=$(wc -l < "$f")
                echo "  $f ($lines lines)"
            done
        fi
    done
}

clean_section() {
    local act_num="$1"
    local section_idx="$2"
    if [[ -z "$act_num" || -z "$section_idx" ]]; then
        echo "Usage: clean-section <act_num> <section_idx>"
        exit 1
    fi
    
    local section_name="${SECTIONS[$section_idx]}"
    local section_num=$(printf "%02d" "$section_idx")
    local prefix=$(get_section_prefix "$act_num" "$section_idx")
    local act_dir=$(get_act_dir "$act_num")
    local sec_dir="${act_dir}/${section_num}-${section_name}"
    
    echo "Removing loose pieces for Act $(printf "%02d" "$act_num") Section ${section_num}..."
    for i in {1..12}; do
        local piece_file="${sec_dir}/${prefix}_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            rm "$piece_file"
            echo "  Removed: $piece_file"
        fi
    done
    echo "Clean complete. Kept: concat file and zip file."
}

commit_and_push() {
    local act_num="$1"
    local msg="$2"
    if [[ -z "$act_num" || -z "$msg" ]]; then
        echo "Usage: commit-push <act_num> <message>"
        exit 1
    fi
    
    echo "Committing Act $(printf "%02d" "$act_num")..."
    git add -A
    git commit -m "$msg"
    echo "Pushing to main..."
    git push origin main
    echo "=== Act $(printf "%02d" "$act_num") pushed to main ==="
}

# Main command dispatch
case "${1:-help}" in
    create-act) create_act "$2" ;;
    create-section) create_section "$2" "$3" ;;
    write-piece) write_piece "$2" "$3" "$4" "$5" ;;
    concat-section) concat_section "$2" "$3" ;;
    zip-section) zip_section "$2" "$3" ;;
    verify-section) verify_section "$2" "$3" ;;
    organize-act) organize_act "$2" ;;
    full-section) full_section "$2" "$3" ;;
    full-act) full_act "$2" ;;
    commit-push) commit_and_push "$2" "$3" ;;
    list) list_pieces ;;
    clean-section) clean_section "$2" "$3" ;;
    help|*) show_help ;;
esac
