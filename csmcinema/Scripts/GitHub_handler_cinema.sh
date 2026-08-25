#!/bin/bash
# GitHub Handler for CSM Cinema - Manages screenplay piece files
# Usage: ./GitHub_handler_cinema.sh <command> [args...]

set -e

CINEMA_ROOT="csmcinema"
PIECES_PER_PART=11
ITERATIONS=7

get_iteration_paths() {
    local iteration="$1"
    local part="$2"
    local base="${CINEMA_ROOT}/WIP/Iteration_${iteration}"
    local part_dir="${base}/Part_$(printf "%02d" "$part")"
    local pieces_dir="${part_dir}/pieces"
    local full_dir="${base}/full"
    local zip_dir="${base}/zip"
    local logs_dir="${CINEMA_ROOT}/Logs"
    
    echo "$pieces_dir|$full_dir|$zip_dir|$logs_dir|$part_dir"
}

show_help() {
    cat <<EOF
CSM Cinema GitHub Handler - Screenplay Piece Manager

COMMANDS:
  create-part <iteration> <part> <title>     Create 11 empty piece files for a part
  write-piece <iteration> <part> <piece> <content>  Write content to specific piece
  concat-part <iteration> <part> [title]     Concatenate 11 pieces into master file
  zip-part <iteration> <part>                Zip 11 pieces into archive
  verify-part <iteration> <part>             Verify piece count, concat lines, zip contents
  organize-part <iteration> <part>           Copy concat+zip to organized folders
  full-cycle-part <iteration> <part> <title> Complete cycle for one part
  create-iteration <iteration> <title>       Create all 11 parts for an iteration
  concat-iteration <iteration>               Concatenate all parts in iteration
  verify-iteration <iteration>               Verify entire iteration
  commit-push <message>                      Commit all files and push to main
  push-main                                  Push current branch to main
  list                                       List all cinema files
  clean-part <iteration> <part>              Remove loose pieces from root (after verify)

STRUCTURE:
  Iteration 1-7, each with 11 Parts (1-11)
  Each Part = 11 pieces + 1 concat + 1 zip
  Target: ~180 minutes read time per part (~27,000 words)

EXAMPLES:
  ./GitHub_handler_cinema.sh create-part 1 1 "The_Call_To_Adventure"
  ./GitHub_handler_cinema.sh concat-part 1 1
  ./GitHub_handler_cinema.sh zip-part 1 1
  ./GitHub_handler_cinema.sh verify-part 1 1
  ./GitHub_handler_cinema.sh organize-part 1 1
  ./GitHub_handler_cinema.sh create-iteration 1 "First_Draft_Williams_ElSegundo"
  ./GitHub_handler_cinema.sh commit-push "Add Iteration 1: First Draft - 11 Parts"

EOF
}

create_part_pieces() {
    local iteration="$1"
    local part="$2"
    local title="$3"
    if [[ -z "$iteration" || -z "$part" || -z "$title" ]]; then
        echo "Usage: create-part <iteration> <part> <title>"
        exit 1
    fi
    
    local paths=$(get_iteration_paths "$iteration" "$part")
    local pieces_dir=$(echo "$paths" | cut -d'|' -f1)
    local part_dir=$(echo "$paths" | cut -d'|' -f5)
    
    mkdir -p "$pieces_dir"
    
    for i in $(seq 1 $PIECES_PER_PART); do
        local piece_file="${pieces_dir}/Part_$(printf "%02d" "$part")_piece_$(printf "%02d" "$i").md"
        if [[ ! -f "$piece_file" ]]; then
            cat > "$piece_file" <<PIECE_EOF
# ${title//_/ } — Part $(printf "%02d" "$part")/11 — Piece $(printf "%02d" "$i")/11
## Iteration $iteration | CSM Cinema | Jason Isaac Brodsky (California 1976)
**Iteration:** $iteration of 7  
**Part:** $(printf "%02d" "$part") of 11  
**Piece:** $(printf "%02d" "$i") of 11  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Target Read Time:** ~180 minutes per part (cumulative across pieces)  
**Heuristics:** Williams Extreme (CSMSOPP) + El Segundo Extreme (CSMSOPPv2)  
**Research Sources:** JsnBAI Misinterpretation, Greek Fates, Jason & Argonauts  

---

[Content for Part $(printf "%02d" "$part"), Piece $(printf "%02d" "$i") goes here]

PIECE_EOF
            echo "Created: $piece_file"
        else
            echo "Exists: $piece_file (skipping)"
        fi
    done
    echo "Created $PIECES_PER_PART piece files for Iteration $iteration, Part $(printf "%02d" "$part")"
}

write_piece() {
    local iteration="$1"
    local part="$2"
    local piece="$3"
    local content="$4"
    if [[ -z "$iteration" || -z "$part" || -z "$piece" || -z "$content" ]]; then
        echo "Usage: write-piece <iteration> <part> <piece> <content>"
        exit 1
    fi
    
    local paths=$(get_iteration_paths "$iteration" "$part")
    local pieces_dir=$(echo "$paths" | cut -d'|' -f1)
    local piece_file="${pieces_dir}/Part_$(printf "%02d" "$part")_piece_$(printf "%02d" "$piece").md"
    
    if [[ -f "$piece_file" ]]; then
        awk -v content="$content" '
            /^---$/ { printed=1; print; print content; next }
            printed { next }
            { print }
        ' "$piece_file" > "${piece_file}.tmp" && mv "${piece_file}.tmp" "$piece_file"
        echo "Updated: $piece_file"
    else
        echo "Error: $piece_file not found"
        exit 1
    fi
}

concat_part() {
    local iteration="$1"
    local part="$2"
    local title_override="$3"
    if [[ -z "$iteration" || -z "$part" ]]; then
        echo "Usage: concat-part <iteration> <part> [title]"
        exit 1
    fi
    
    local paths=$(get_iteration_paths "$iteration" "$part")
    local pieces_dir=$(echo "$paths" | cut -d'|' -f1)
    local full_dir=$(echo "$paths" | cut -d'|' -f2)
    local part_dir=$(echo "$paths" | cut -d'|' -f5)
    
    mkdir -p "$full_dir"
    
    local first_piece="${pieces_dir}/Part_$(printf "%02d" "$part")_piece_01.md"
    local title="Cinema_Part_$(printf "%02d" "$part")"
    if [[ -f "$first_piece" ]]; then
        title=$(head -1 "$first_piece" | sed 's/# //' | sed 's/ — Part.*//' | tr ' ' '_')
    fi
    if [[ -n "$title_override" ]]; then
        title="$title_override"
    fi
    
    local concat_file="${full_dir}/Iteration_$(printf "%02d" "$iteration")_Part_$(printf "%02d" "$part")_${title}.md"
    
    echo "Concatenating pieces for Iteration $iteration, Part $(printf "%02d" "$part") -> $concat_file"
    
    cat > "$concat_file" <<CONCAT_EOF
# ${title//_/ } — Complete Part
## Iteration $iteration of 7 | Part $(printf "%02d" "$part") of 11 | CSM Cinema
**Author:** Jason Isaac Brodsky (California 1976)  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Structure:** 11 pieces concatenated  
**Target Read Time:** ~180 minutes  
**Heuristics:** Williams Extreme + El Segundo Extreme  
**Research:** JsnBAI Misinterpretation | Greek Fates | Jason & Argonauts  

---

CONCAT_EOF
    
    for i in $(seq 1 $PIECES_PER_PART); do
        local piece_file="${pieces_dir}/Part_$(printf "%02d" "$part")_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            echo "Adding piece $i..."
            cat "$piece_file" >> "$concat_file"
            echo -e "\n---\n" >> "$concat_file"
        else
            echo "WARNING: Missing piece $i ($piece_file)"
        fi
    done
    
    local line_count=$(wc -l < "$concat_file")
    local word_count=$(wc -w < "$concat_file")
    echo "Concatenated file: $concat_file ($line_count lines, $word_count words)"
    
    # Target ~27,000 words for 180 min read time
    if [[ $word_count -lt 20000 ]]; then
        echo "WARNING: Word count $word_count < 20,000 target for 180 min read"
    else
        echo "SUCCESS: Word count $word_count meets target"
    fi
}

zip_part() {
    local iteration="$1"
    local part="$2"
    if [[ -z "$iteration" || -z "$part" ]]; then
        echo "Usage: zip-part <iteration> <part>"
        exit 1
    fi
    
    local paths=$(get_iteration_paths "$iteration" "$part")
    local pieces_dir=$(echo "$paths" | cut -d'|' -f1)
    local zip_dir=$(echo "$paths" | cut -d'|' -f3)
    
    mkdir -p "$zip_dir"
    
    local zip_file="${zip_dir}/Iteration_$(printf "%02d" "$iteration")_Part_$(printf "%02d" "$part")_pieces.zip"
    
    echo "Zipping pieces for Iteration $iteration, Part $(printf "%02d" "$part") -> $zip_file"
    
    local piece_files=()
    for i in $(seq 1 $PIECES_PER_PART); do
        local piece_file="${pieces_dir}/Part_$(printf "%02d" "$part")_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            piece_files+=("$piece_file")
        else
            echo "ERROR: Missing piece $i ($piece_file)"
            exit 1
        fi
    done
    
    zip -q "$zip_file" "${piece_files[@]}"
    echo "Created: $zip_file"
    unzip -l "$zip_file"
}

verify_part() {
    local iteration="$1"
    local part="$2"
    if [[ -z "$iteration" || -z "$part" ]]; then
        echo "Usage: verify-part <iteration> <part>"
        exit 1
    fi
    
    local paths=$(get_iteration_paths "$iteration" "$part")
    local pieces_dir=$(echo "$paths" | cut -d'|' -f1)
    local full_dir=$(echo "$paths" | cut -d'|' -f2)
    local zip_dir=$(echo "$paths" | cut -d'|' -f3)
    
    echo "=== Verification for Iteration $iteration, Part $(printf "%02d" "$part") ==="
    
    # Check pieces
    local piece_count=0
    for i in $(seq 1 $PIECES_PER_PART); do
        if [[ -f "${pieces_dir}/Part_$(printf "%02d" "$part")_piece_$(printf "%02d" "$i").md" ]]; then
            ((piece_count++))
        fi
    done
    echo "Pieces in pieces/: $piece_count/$PIECES_PER_PART"
    
    # Check concat
    local concat_files=(${full_dir}/Iteration_$(printf "%02d" "$iteration")_Part_$(printf "%02d" "$part")_*.md)
    if [[ -f "${concat_files[0]}" ]]; then
        local lines=$(wc -l < "${concat_files[0]}")
        local words=$(wc -w < "${concat_files[0]}")
        echo "Concatenated: ${concat_files[0]} ($lines lines, $words words)"
        [[ $words -ge 20000 ]] && echo "  ✅ Meets ≥20,000 word target" || echo "  ❌ Below 20,000 word target"
    else
        echo "Concatenated: MISSING"
    fi
    
    # Check zip
    local zip_file="${zip_dir}/Iteration_$(printf "%02d" "$iteration")_Part_$(printf "%02d" "$part")_pieces.zip"
    if [[ -f "$zip_file" ]]; then
        local zip_count=$(unzip -l "$zip_file" | grep -c "\.md$" || echo 0)
        echo "Zip file: $zip_file ($zip_count pieces)"
        [[ $zip_count -eq $PIECES_PER_PART ]] && echo "  ✅ Contains $PIECES_PER_PART pieces" || echo "  ❌ Does not contain $PIECES_PER_PART pieces"
    else
        echo "Zip file: MISSING"
    fi
}

organize_part() {
    local iteration="$1"
    local part="$2"
    if [[ -z "$iteration" || -z "$part" ]]; then
        echo "Usage: organize-part <iteration> <part>"
        exit 1
    fi
    
    local paths=$(get_iteration_paths "$iteration" "$part")
    local full_dir=$(echo "$paths" | cut -d'|' -f2)
    local zip_dir=$(echo "$paths" | cut -d'|' -f3)
    local part_dir=$(echo "$paths" | cut -d'|' -f5)
    
    local concat_files=(${full_dir}/Iteration_$(printf "%02d" "$iteration")_Part_$(printf "%02d" "$part")_*.md)
    local zip_file="${zip_dir}/Iteration_$(printf "%02d" "$iteration")_Part_$(printf "%02d" "$part")_pieces.zip"
    
    # Also copy to part_dir for easy access
    if [[ -f "${concat_files[0]}" ]]; then
        cp "${concat_files[0]}" "$part_dir/"
        echo "Copied concat to part directory"
    fi
    
    if [[ -f "$zip_file" ]]; then
        cp "$zip_file" "$part_dir/"
        echo "Copied zip to part directory"
    fi
    
    echo "Organization complete for Iteration $iteration, Part $(printf "%02d" "$part")"
}

create_iteration() {
    local iteration="$1"
    local title="$2"
    if [[ -z "$iteration" || -z "$title" ]]; then
        echo "Usage: create-iteration <iteration> <title>"
        exit 1
    fi
    
    echo "Creating Iteration $iteration: $title (11 parts)..."
    for part in {1..11}; do
        local part_titles=(
            "The_Call_To_Adventure"
            "The_Assembly_Of_Heroes"
            "The_Crossing_First_Threshold"
            "The_Road_Of_Trials"
            "The_Meeting_With_The_Goddess"
            "The_Temptation_Away_From_Path"
            "The_Atonement_With_Father"
            "The_Apotheosis"
            "The_Ultimate_Boon"
            "The_Refusal_Of_Return"
            "The_Magic_Flight_Return"
        )
        local part_title="${part_titles[$((part-1))]}"
        create_part_pieces "$iteration" "$part" "${part_title}_${title}"
    done
    echo "Created all 11 parts for Iteration $iteration"
}

concat_iteration() {
    local iteration="$1"
    if [[ -z "$iteration" ]]; then
        echo "Usage: concat-iteration <iteration>"
        exit 1
    fi
    
    local base="${CINEMA_ROOT}/WIP/Iteration_${iteration}"
    local full_dir="${base}/full"
    local master_file="${full_dir}/Iteration_$(printf "%02d" "$iteration")_Complete_Screenplay.md"
    
    echo "Concatenating all parts for Iteration $iteration -> $master_file"
    
    cat > "$master_file" <<MASTER_EOF
# CSM Cinema — Iteration $iteration Complete Screenplay
## Jason Isaac Brodsky (California 1976) | Conducier
**Iteration:** $iteration of 7  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Structure:** 11 Parts × 11 Pieces = 121 Pieces  
**Target Read Time:** ~180 minutes × 11 = ~33 hours  
**Heuristics:** Williams Extreme (CSMSOPP) + El Segundo Extreme (CSMSOPPv2)  
**Research Sources:** 
- JsnBAI Misinterpretation Screenplay Research
- Greek Fates And Global Parallels
- Jason and the Argonauts Myth Inquiry  

**Framework:** 11-part Hero's Journey interwoven with Greek Fates (Clotho/Lachesis/Atropos) 
as narrative architects. Jason/Argonauts myth refracted through 11 lenses.
Audio cues embedded for production. Williams/El Segundo provide tonal architecture.

---

MASTER_EOF
    
    for part in {1..11}; do
        local part_files=(${full_dir}/Iteration_$(printf "%02d" "$iteration")_Part_$(printf "%02d" "$part")_*.md)
        if [[ -f "${part_files[0]}" ]]; then
            echo "Adding Part $part..."
            cat "${part_files[0]}" >> "$master_file"
            echo -e "\n\n=== PART $(printf "%02d" "$part") END ===\n\n" >> "$master_file"
        else
            echo "WARNING: Missing Part $part"
        fi
    done
    
    local line_count=$(wc -l < "$master_file")
    local word_count=$(wc -w < "$master_file")
    echo "Master screenplay: $master_file ($line_count lines, $word_count words)"
}

verify_iteration() {
    local iteration="$1"
    if [[ -z "$iteration" ]]; then
        echo "Usage: verify-iteration <iteration>"
        exit 1
    fi
    
    echo "=== Verification for Iteration $iteration (All 11 Parts) ==="
    for part in {1..11}; do
        verify_part "$iteration" "$part"
        echo ""
    done
    
    # Check master
    local base="${CINEMA_ROOT}/WIP/Iteration_${iteration}"
    local full_dir="${base}/full"
    local master_files=(${full_dir}/Iteration_$(printf "%02d" "$iteration")_Complete_Screenplay.md)
    if [[ -f "${master_files[0]}" ]]; then
        local lines=$(wc -l < "${master_files[0]}")
        local words=$(wc -w < "${master_files[0]}")
        echo "Master Screenplay: ${master_files[0]} ($lines lines, $words words)"
    else
        echo "Master Screenplay: MISSING"
    fi
}

list_cinema() {
    echo "=== CSM Cinema Files ==="
    for iteration in {1..7}; do
        local base="${CINEMA_ROOT}/WIP/Iteration_${iteration}"
        if [[ -d "$base" ]]; then
            echo "Iteration $iteration:"
            for part in {1..11}; do
                local pieces_dir="${base}/Part_$(printf "%02d" "$part")/pieces"
                if [[ -d "$pieces_dir" ]]; then
                    local count=$(ls "$pieces_dir"/*.md 2>/dev/null | wc -l)
                    echo "  Part $(printf "%02d" "$part"): $count pieces"
                fi
            done
        fi
    done
}

clean_part() {
    local iteration="$1"
    local part="$2"
    if [[ -z "$iteration" || -z "$part" ]]; then
        echo "Usage: clean-part <iteration> <part>"
        exit 1
    fi
    
    local paths=$(get_iteration_paths "$iteration" "$part")
    local pieces_dir=$(echo "$paths" | cut -d'|' -f1)
    
    echo "Removing loose pieces for Iteration $iteration, Part $(printf "%02d" "$part") from pieces/..."
    for i in $(seq 1 $PIECES_PER_PART); do
        local piece_file="${pieces_dir}/Part_$(printf "%02d" "$part")_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            rm "$piece_file"
            echo "  Removed: $piece_file"
        fi
    done
    echo "Clean complete. Kept: concat file in full/ and zip file in zip/"
}

commit_and_push() {
    local msg="$1"
    if [[ -z "$msg" ]]; then
        echo "Usage: commit-push <message>"
        exit 1
    fi
    
    echo "Committing CSM Cinema changes..."
    git add -A
    git commit -m "$msg"
    echo "Pushing to main..."
    git push origin main
}

push_main() {
    echo "Pushing to main..."
    git push origin main
}

# Main command dispatch
case "${1:-help}" in
    create-part) create_part_pieces "$2" "$3" "$4" ;;
    write-piece) write_piece "$2" "$3" "$4" "$5" ;;
    concat-part) concat_part "$2" "$3" "$4" ;;
    zip-part) zip_part "$2" "$3" ;;
    verify-part) verify_part "$2" "$3" ;;
    organize-part) organize_part "$2" "$3" ;;
    full-cycle-part) 
        create_part_pieces "$2" "$3" "$4"
        echo ">>> Please edit the 11 piece files now, then run:"
        echo ">>> ./GitHub_handler_cinema.sh concat-part $2 $3"
        echo ">>> ./GitHub_handler_cinema.sh zip-part $2 $3"
        echo ">>> ./GitHub_handler_cinema.sh verify-part $2 $3"
        echo ">>> ./GitHub_handler_cinema.sh organize-part $2 $3"
        ;;
    create-iteration) create_iteration "$2" "$3" ;;
    concat-iteration) concat_iteration "$2" ;;
    verify-iteration) verify_iteration "$2" ;;
    commit-push) commit_and_push "$2" ;;
    push-main) push_main ;;
    list) list_cinema ;;
    clean-part) clean_part "$2" "$3" ;;
    help|*) show_help ;;
esac