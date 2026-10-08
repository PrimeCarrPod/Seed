#!/bin/bash
# GitHub Handler SDK - Flexible piece management for any file type
# Usage: ./GitHub_handler_SDK.sh <command> [args...]
# Supports variable piece counts, any file type (Java, HTML, JS, Markdown, etc.)

set -e

# Default configuration
DEFAULT_PIECE_COUNT=10
DEFAULT_PIECE_DIR="pieces"
DEFAULT_SECTION_DIR="sections"
DEFAULT_ZIP_DIR="zip"
DEFAULT_ORGANIZED_BASE="CSM_WORK_IN_PROGRESS"

show_help() {
    cat <<EOF
GitHub Handler SDK - Flexible File Piece Manager

COMMANDS:
  split-file <file> <piece_count> [piece_dir]     Split a file into N pieces
  create-pieces <section> <title> <piece_count>   Create N empty piece files
  write-piece <section> <piece_num> <content>     Write content to specific piece
  concat <section> [title]                        Concatenate all pieces into master
  zip-pieces <section>                            Zip all pieces into archive
  verify <section>                                Verify pieces, concat, zip
  organize <section> [target_base]                Copy concat+zip to organized folders
  full-cycle <section> <title> <piece_count>      Complete cycle: create, concat, zip, organize
  commit-push <section> <msg>                     Commit all files and push
  list                                            List all pieces in project
  clean-pieces <section>                          Remove loose pieces from root
  split-source <source_file> <piece_count>        Split existing source file into pieces
  glue-pieces <section> <output_file>             Glue pieces back into single file

VARIABLES (environment or flags):
  PIECE_COUNT      Number of pieces (default: 10)
  PIECE_DIR        Directory for piece files (default: pieces)
  SECTION_DIR      Directory for concatenated files (default: sections)
  ZIP_DIR          Directory for zip archives (default: zip)
  ARTICLE_PREFIX   Prefix for piece files (default: sdk)
  ORGANIZED_BASE   Base for organized output (default: CSM_WORK_IN_PROGRESS)

EXAMPLES:
  # Split a large Java file into 15 pieces
  ./GitHub_handler_SDK.sh split-source MainActivity.java 15
  
  # Create 8 pieces for a section
  ./GitHub_handler_SDK.sh create-pieces 1 "HTML_Aspects" 8
  
  # Concatenate all pieces (auto-detects count)
  ./GitHub_handler_SDK.sh concat 1 "HTML_Aspects_ThreeJS"
  
  # Full cycle with 12 pieces
  ./GitHub_handler_SDK.sh full-cycle 2 "Android_Features" 12
  
  # Glue pieces back into original file
  ./GitHub_handler_SDK.sh glue-pieces 1 MainActivity.java

PIECE NAMING CONVENTION:
  <prefix>_s<NN>_<title>_piece_<NN>.md
  Example: sdk_s01_HTML_Aspects_piece_01.md

EOF
}

# Get configuration from env or defaults
get_config() {
    local section_num="$1"
    local piece_count="${PIECE_COUNT:-$DEFAULT_PIECE_COUNT}"
    local piece_dir="${PIECE_DIR:-$DEFAULT_PIECE_DIR}"
    local section_dir="${SECTION_DIR:-$DEFAULT_SECTION_DIR}"
    local zip_dir="${ZIP_DIR:-$DEFAULT_ZIP_DIR}"
    local prefix="${ARTICLE_PREFIX:-sdk}"
    local org_base="${ORGANIZED_BASE:-$DEFAULT_ORGANIZED_BASE}"
    
    echo "$section_num|$piece_count|$piece_dir|$section_dir|$zip_dir|$prefix|$org_base"
}

# Parse config string
parse_config() {
    local config="$1"
    IFS='|' read -r section_num piece_count piece_dir section_dir zip_dir prefix org_base <<< "$config"
    export SECTION_NUM="$section_num"
    export PIECE_COUNT="$piece_count"
    export PIECE_DIR="$piece_dir"
    export SECTION_DIR="$section_dir"
    export ZIP_DIR="$zip_dir"
    export PREFIX="$prefix"
    export ORG_BASE="$org_base"
}

split_file() {
    local source_file="$1"
    local piece_count="${2:-$DEFAULT_PIECE_COUNT}"
    local piece_dir="${3:-$DEFAULT_PIECE_DIR}"
    local prefix="${ARTICLE_PREFIX:-sdk}"
    
    if [[ ! -f "$source_file" ]]; then
        echo "Error: Source file not found: $source_file"
        exit 1
    fi
    
    mkdir -p "$piece_dir"
    
    local total_lines=$(wc -l < "$source_file")
    local lines_per_piece=$(( (total_lines + piece_count - 1) / piece_count ))
    local base_name=$(basename "$source_file" | sed 's/\.[^.]*$//')
    local ext="${source_file##*.}"
    
    echo "Splitting $source_file ($total_lines lines) into $piece_count pieces (~$lines_per_piece lines each)"
    
    split -l "$lines_per_piece" -d --additional-suffix=".${ext}" "$source_file" "${piece_dir}/${prefix}_${base_name}_part_"
    
    # Rename to sequential pieces
    local i=1
    for part in "${piece_dir}/${prefix}_${base_name}_part_"*; do
        if [[ -f "$part" ]]; then
            local new_name="${piece_dir}/${prefix}_${base_name}_piece_$(printf "%02d" "$i").${ext}"
            mv "$part" "$new_name"
            echo "  Created: $new_name"
            ((i++))
        fi
    done
    
    echo "Split complete: $((i-1)) pieces created in $piece_dir/"
}

create_pieces() {
    local section_num="$1"
    local title="$2"
    local piece_count="${3:-$DEFAULT_PIECE_COUNT}"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" || -z "$title" ]]; then
        echo "Usage: create-pieces <section> <title> [piece_count]"
        exit 1
    fi
    
    mkdir -p "$PIECE_DIR"
    
    local full_prefix="${PREFIX}_s$(printf "%02d" "$section_num")_${title}"
    
    for i in $(seq 1 "$PIECE_COUNT"); do
        local piece_file="${PIECE_DIR}/${full_prefix}_piece_$(printf "%02d" "$i").md"
        if [[ ! -f "$piece_file" ]]; then
            cat > "$piece_file" <<PIECE_EOF
# ${title} — Piece $(printf "%02d" "$i")/${PIECE_COUNT}
**Section:** ${section_num} | **Piece:** $(printf "%02d" "$i") of ${PIECE_COUNT}  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")

---

[Content for piece $(printf "%02d" "$i") goes here]

PIECE_EOF
            echo "Created: $piece_file"
        else
            echo "Exists: $piece_file (skipping)"
        fi
    done
    echo "Created ${PIECE_COUNT} piece files for Section ${section_num}: ${title}"
}

write_piece() {
    local section_num="$1"
    local piece_num="$2"
    local content="$3"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" || -z "$piece_num" || -z "$content" ]]; then
        echo "Usage: write-piece <section> <piece_num> <content>"
        exit 1
    fi
    
    # Find the piece file (flexible naming)
    local piece_files=(${PIECE_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*_piece_$(printf "%02d" "$piece_num").md)
    if [[ -f "${piece_files[0]}" ]]; then
        local piece_file="${piece_files[0]}"
        awk -v content="$content" '
            /^---$/ { printed=1; print; print content; next }
            printed { next }
            { print }
        ' "$piece_file" > "${piece_file}.tmp" && mv "${piece_file}.tmp" "$piece_file"
        echo "Updated: $piece_file"
    else
        echo "Error: Piece ${piece_num} not found for section ${section_num}"
        exit 1
    fi
}

concat_pieces() {
    local section_num="$1"
    local title_override="$2"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" ]]; then
        echo "Usage: concat <section> [title]"
        exit 1
    fi
    
    mkdir -p "$SECTION_DIR"
    
    # Find pieces (auto-detect count)
    local piece_files=(${PIECE_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*_piece_*.md)
    local actual_count=${#piece_files[@]}
    
    if [[ $actual_count -eq 0 ]]; then
        echo "Error: No pieces found for section $section_num"
        exit 1
    fi
    
    # Get title from first piece or use override
    local title="$title_override"
    if [[ -z "$title" && -f "${piece_files[0]}" ]]; then
        title=$(head -1 "${piece_files[0]}" | sed 's/# //' | sed 's/ — Piece.*//' | tr ' ' '_')
    fi
    title="${title:-Section_${section_num}}"
    
    local concat_file="${SECTION_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_${title}.md"
    
    echo "Concatenating $actual_count pieces for Section ${section_num} -> $concat_file"
    
    cat > "$concat_file" <<CONCAT_EOF
# ${title//_/ } — Complete Section
**Section:** ${section_num} | **Pieces:** ${actual_count}  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")

---

CONCAT_EOF
    
    # Sort pieces by piece number
    for piece_file in "${piece_files[@]}"; do
        echo "Adding $(basename "$piece_file")..."
        cat "$piece_file" >> "$concat_file"
        echo -e "\n---\n" >> "$concat_file"
    done
    
    local line_count=$(wc -l < "$concat_file")
    echo "Concatenated file: $concat_file ($line_count lines, $actual_count pieces)"
}

zip_pieces() {
    local section_num="$1"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" ]]; then
        echo "Usage: zip-pieces <section>"
        exit 1
    fi
    
    mkdir -p "$ZIP_DIR"
    
    local piece_files=(${PIECE_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*_piece_*.md)
    local actual_count=${#piece_files[@]}
    
    if [[ $actual_count -eq 0 ]]; then
        echo "Error: No pieces found for section $section_num"
        exit 1
    fi
    
    local zip_file="${ZIP_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_pieces.zip"
    
    echo "Zipping $actual_count pieces for Section ${section_num} -> $zip_file"
    zip -q "$zip_file" "${piece_files[@]}"
    echo "Created: $zip_file"
    unzip -l "$zip_file"
}

verify_section() {
    local section_num="$1"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" ]]; then
        echo "Usage: verify <section>"
        exit 1
    fi
    
    local piece_files=(${PIECE_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*_piece_*.md)
    local actual_count=${#piece_files[@]}
    
    local concat_files=(${SECTION_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*.md)
    local zip_file="${ZIP_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_pieces.zip"
    
    echo "=== Verification for Section ${section_num} ==="
    echo "Expected pieces: ${PIECE_COUNT} | Found: ${actual_count}"
    
    # Check pieces
    for i in $(seq 1 "$PIECE_COUNT"); do
        local found=0
        for pf in "${piece_files[@]}"; do
            if [[ "$pf" == *"_piece_$(printf "%02d" "$i")."* ]]; then
                found=1
                break
            fi
        done
        if [[ $found -eq 1 ]]; then
            echo "  Piece $i: ✅"
        else
            echo "  Piece $i: ❌ MISSING"
        fi
    done
    
    # Check concat
    if [[ -f "${concat_files[0]}" ]]; then
        local lines=$(wc -l < "${concat_files[0]}")
        echo "Concatenated: ${concat_files[0]} ($lines lines) ✅"
    else
        echo "Concatenated: MISSING ❌"
    fi
    
    # Check zip
    if [[ -f "$zip_file" ]]; then
        local zip_count=$(unzip -l "$zip_file" 2>/dev/null | grep -c "\.md$" || echo 0)
        echo "Zip file: $zip_file ($zip_count pieces) $([[ $zip_count -eq $actual_count ]] && echo "✅" || echo "❌")"
    else
        echo "Zip file: MISSING ❌"
    fi
}

organize_section() {
    local section_num="$1"
    local target_base="${2:-$ORG_BASE}"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" ]]; then
        echo "Usage: organize <section> [target_base]"
        exit 1
    fi
    
    local concat_files=(${SECTION_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*.md)
    local zip_file="${ZIP_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_pieces.zip"
    
    local org_full="${target_base}/sections"
    local org_zip="${target_base}/zip"
    
    mkdir -p "$org_full" "$org_zip"
    
    if [[ -f "${concat_files[0]}" ]]; then
        cp "${concat_files[0]}" "$org_full/"
        echo "Copied concat to $org_full/"
    fi
    
    if [[ -f "$zip_file" ]]; then
        cp "$zip_file" "$org_zip/"
        echo "Copied zip to $org_zip/"
    fi
    
    echo "Organization complete for Section ${section_num}"
}

split_source() {
    local source_file="$1"
    local piece_count="${2:-$DEFAULT_PIECE_COUNT}"
    local piece_dir="${PIECE_DIR:-$DEFAULT_PIECE_DIR}"
    local prefix="${ARTICLE_PREFIX:-sdk}"
    
    if [[ ! -f "$source_file" ]]; then
        echo "Error: Source file not found: $source_file"
        exit 1
    fi
    
    mkdir -p "$piece_dir"
    
    local total_lines=$(wc -l < "$source_file")
    local lines_per_piece=$(( (total_lines + piece_count - 1) / piece_count ))
    local base_name=$(basename "$source_file" | sed 's/\.[^.]*$//')
    local ext="${source_file##*.}"
    
    echo "Splitting $source_file ($total_lines lines) into $piece_count pieces (~$lines_per_piece lines each)"
    
    # Use split with numeric suffixes
    split -l "$lines_per_piece" -d --additional-suffix=".${ext}" "$source_file" "${piece_dir}/${prefix}_${base_name}_part_"
    
    # Rename to sequential pieces with proper naming
    local i=1
    for part in "${piece_dir}/${prefix}_${base_name}_part_"*; do
        if [[ -f "$part" ]]; then
            local new_name="${piece_dir}/${prefix}_${base_name}_piece_$(printf "%02d" "$i").${ext}"
            mv "$part" "$new_name"
            echo "  Created: $new_name"
            ((i++))
        fi
    done
    
    echo "Split complete: $((i-1)) pieces created in $piece_dir/"
    echo "Original: $source_file ($total_lines lines)"
}

glue_pieces() {
    local section_num="$1"
    local output_file="$2"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" || -z "$output_file" ]]; then
        echo "Usage: glue-pieces <section> <output_file>"
        exit 1
    fi
    
    local ext="${output_file##*.}"
    
    # Try multiple patterns to find pieces
    local piece_files=(${PIECE_DIR}/${PREFIX}_*_piece_*.${ext})
    
    # If no extension-specific pieces, try generic md
    if [[ ${#piece_files[@]} -eq 0 || ! -f "${piece_files[0]}" ]]; then
        piece_files=(${PIECE_DIR}/${PREFIX}_*_piece_*.md)
    fi
    
    # If still nothing, try section-specific pattern
    if [[ ${#piece_files[@]} -eq 0 || ! -f "${piece_files[0]}" ]]; then
        piece_files=(${PIECE_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*_piece_*.${ext})
    fi
    
    if [[ ${#piece_files[@]} -eq 0 || ! -f "${piece_files[0]}" ]]; then
        echo "Error: No pieces found for section $section_num with extension $ext"
        echo "Searched in: $PIECE_DIR/"
        exit 1
    fi
    
    # Sort by piece number
    IFS=$'\n' piece_files=($(printf '%s\n' "${piece_files[@]}" | sort -V))
    
    echo "Gluing ${#piece_files[@]} pieces into $output_file"
    
    > "$output_file"
    for piece_file in "${piece_files[@]}"; do
        cat "$piece_file" >> "$output_file"
    done
    
    local lines=$(wc -l < "$output_file")
    echo "Glued complete: $output_file ($lines lines)"
}

list_pieces() {
    echo "=== Pieces in $PIECE_DIR/ ==="
    for f in ${PIECE_DIR}/${PREFIX}_*_piece_*.md; do
        [[ -f "$f" ]] && echo "  $f"
    done
    echo ""
    echo "=== Concatenated in $SECTION_DIR/ ==="
    for f in ${SECTION_DIR}/${PREFIX}_*.md; do
        [[ -f "$f" ]] && echo "  $f ($(wc -l < "$f") lines)"
    done
    echo ""
    echo "=== Zip files in $ZIP_DIR/ ==="
    for f in ${ZIP_DIR}/${PREFIX}_*_pieces.zip; do
        [[ -f "$f" ]] && echo "  $f"
    done
}

clean_pieces() {
    local section_num="$1"
    local config=$(get_config "$section_num")
    parse_config "$config"
    
    if [[ -z "$section_num" ]]; then
        echo "Usage: clean-pieces <section>"
        exit 1
    fi
    
    local piece_files=(${PIECE_DIR}/${PREFIX}_s$(printf "%02d" "$section_num")_*_piece_*.md)
    
    echo "Removing loose pieces for Section ${section_num} from root..."
    for pf in "${piece_files[@]}"; do
        if [[ -f "$pf" ]]; then
            rm "$pf"
            echo "  Removed: $pf"
        fi
    done
    echo "Clean complete. Kept: concat file and zip file."
}

commit_and_push() {
    local section_num="$1"
    local msg="$2"
    if [[ -z "$section_num" || -z "$msg" ]]; then
        echo "Usage: commit-push <section> <message>"
        exit 1
    fi
    
    echo "Committing Section ${section_num}..."
    git add -A
    git commit -m "$msg"
    echo "Pushing to main..."
    git push origin main
}

# Main command dispatch
case "${1:-help}" in
    split-file) split_file "$2" "$3" "$4" ;;
    split-source) split_source "$2" "$3" ;;
    create-pieces) create_pieces "$2" "$3" "$4" ;;
    write-piece) write_piece "$2" "$3" "$4" ;;
    concat) concat_pieces "$2" "$3" ;;
    zip-pieces) zip_pieces "$2" ;;
    verify) verify_section "$2" ;;
    organize) organize_section "$2" "$3" ;;
    glue-pieces) glue_pieces "$2" "$3" ;;
    full-cycle) 
        create_pieces "$2" "$3" "$4"
        echo ">>> Please edit the ${4:-$DEFAULT_PIECE_COUNT} piece files now, then run:"
        echo ">>> ./GitHub_handler_SDK.sh concat $2 \"$3\""
        echo ">>> ./GitHub_handler_SDK.sh zip-pieces $2"
        echo ">>> ./GitHub_handler_SDK.sh verify $2"
        echo ">>> ./GitHub_handler_SDK.sh organize $2"
        echo ">>> ./GitHub_handler_SDK.sh commit-push $2 \"Add Section $2: $3 - ${4:-$DEFAULT_PIECE_COUNT} pieces, concat, zip\""
        ;;
    commit-push) commit_and_push "$2" "$3" ;;
    list) list_pieces ;;
    clean-pieces) clean_pieces "$2" ;;
    help|*) show_help ;;
esac