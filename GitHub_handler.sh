#!/bin/bash
# GitHub Handler - Utility for managing article piece files
# Usage: ./GitHub_handler.sh <command> [args...]
# Supports Article 1 (A1), Article 2 (A2), Article 3 (A3), Article 4 (A4), etc.

set -e

# Default to Article 3 for backward compatibility
DEFAULT_ARTICLE="3"

get_article_config() {
    local article_num="$1"
    local article_prefix=""
    local organized_full=""
    local organized_zip=""
    
    # Determine which article series based on number range
    if [[ $article_num -ge 1 && $article_num -le 40 ]]; then
        # Could be Article 1, 2, 3, or 4 - need explicit prefix
        # Default to Article 3 for backward compat, but allow override via env
        article_prefix="${ARTICLE_PREFIX:-article3}"
        local article_letter="C"
        local article_name="HilbertSpace"
        if [[ "$article_prefix" == "article1" ]]; then
            article_letter="A"
            article_name="Worldline"
        elif [[ "$article_prefix" == "article2" ]]; then
            article_letter="B"
            article_name="MassSpectrum"
        elif [[ "$article_prefix" == "article4" ]]; then
            article_letter="D"
            article_name="Couplings"
        fi
        organized_full="CSM_WORK_IN_PROGRESS/SubAtom_WIP/${article_letter}_Article${article_letter#?}_${article_name}/full"
        organized_zip="CSM_WORK_IN_PROGRESS/SubAtom_WIP/${article_letter}_Article${article_letter#?}_${article_name}/zip"
    else
        echo "Error: Article number must be 1-40"
        exit 1
    fi
    
    echo "$article_prefix|$organized_full|$organized_zip"
}

show_help() {
    cat <<EOF
GitHub Handler - Article Piece File Manager

COMMANDS:
  create-pieces <article_num> <title> [prefix]  Create 12 empty piece files for new article
  write-piece <article_num> <piece_num> <content>  Write content to specific piece
  concat <article_num> [title]                  Concatenate 12 pieces into master file
  zip-pieces <article_num>                      Zip 12 pieces into archive
  verify <article_num>                          Verify piece count, concat lines, zip contents
  organize <article_num>                        Copy concat+zip to organized folders
  full-cycle <article_num> <title> [prefix]     Complete cycle: create, concat, zip, organize, commit
  commit-push <article_num> <msg>               Commit all files and push DIRECTLY TO MAIN
  push-main                                     Push current branch directly to main
  merge-session                                 Merge session branch to main (legacy)
  list                                          List all article pieces in root
  clean-pieces <article_num>                    Remove loose pieces from root (after verify)

PREFIXES (optional, defaults to article3):
  article1  - Article 1: Worldline Topology (A1-XX)
  article2  - Article 2: Mass Spectrum (A2-XX)
  article3  - Article 3: Hilbert Space (A3-XX)
  article4  - Article 4: Coupling Constants (A4-XX)

EXAMPLES:
  ./GitHub_handler.sh create-pieces 1 "Fine_Structure_Constant_Prime_Gaps" article4
  ./GitHub_handler.sh concat 1
  ./GitHub_handler.sh zip-pieces 1
  ./GitHub_handler.sh verify 1
  ./GitHub_handler.sh organize 1
  ./GitHub_handler.sh commit-push 1 "Add A4-01: Fine_Structure_Constant_Prime_Gaps"
  ./GitHub_handler.sh push-main
  ./GitHub_handler.sh full-cycle 1 "Fine_Structure_Constant_Prime_Gaps" article4

EOF
}

create_pieces() {
    local article_num="$1"
    local title="$2"
    local prefix="${3:-${ARTICLE_PREFIX:-article3}}"
    if [[ -z "$article_num" || -z "$title" ]]; then
        echo "Usage: create-pieces <article_num> <title> [prefix]"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    local full_prefix="${prefix}_${article_letter}-$(printf "%02d" "$article_num")"
    for i in {1..12}; do
        local piece_file="${full_prefix}_piece_$(printf "%02d" "$i").md"
        if [[ ! -f "$piece_file" ]]; then
            cat > "$piece_file" <<PIECE_EOF
# ${title} — Piece $(printf "%02d" "$i")/12
## Article ${article_letter#a}: ${article_letter}-$(printf "%02d" "$article_num") — ${title//_/ }
**Piece:** $(printf "%02d" "$i") of 12  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")

---

[Content for piece $(printf "%02d" "$i") goes here]

PIECE_EOF
            echo "Created: $piece_file"
        else
            echo "Exists: $piece_file (skipping)"
        fi
    done
    echo "Created 12 piece files for ${article_letter}-$(printf "%02d" "$article_num")"
}

write_piece() {
    local article_num="$1"
    local piece_num="$2"
    local content="$3"
    local prefix="${4:-${ARTICLE_PREFIX:-article3}}"
    if [[ -z "$article_num" || -z "$piece_num" || -z "$content" ]]; then
        echo "Usage: write-piece <article_num> <piece_num> <content> [prefix]"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    local full_prefix="${prefix}_${article_letter}-$(printf "%02d" "$article_num")"
    local piece_file="${full_prefix}_piece_$(printf "%02d" "$piece_num").md"
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

concat_pieces() {
    local article_num="$1"
    local title_override="$2"
    local prefix="${ARTICLE_PREFIX:-article3}"
    if [[ -z "$article_num" ]]; then
        echo "Usage: concat <article_num> [title]"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    local full_prefix="${prefix}_${article_letter}-$(printf "%02d" "$article_num")"
    local concat_file="${article_letter}-$(printf "%02d" "$article_num")_${title_override:-Quantum_Article}.md"
    
    # Get title from first piece
    local first_piece="${full_prefix}_piece_01.md"
    local title="Quantum_Article"
    if [[ -f "$first_piece" ]]; then
        title=$(head -1 "$first_piece" | sed 's/# //' | sed 's/ — Piece.*//' | tr ' ' '_')
    fi
    concat_file="${article_letter}-$(printf "%02d" "$article_num")_${title}.md"
    
    echo "Concatenating pieces for ${article_letter}-$(printf "%02d" "$article_num") -> $concat_file"
    
    cat > "$concat_file" <<CONCAT_EOF
# ${title//_/ } — Complete Article
## Article ${article_letter#a}: ${article_letter}-$(printf "%02d" "$article_num") — ${title//_/ }
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Structure:** 12 pieces concatenated  
**Target:** ≥350 lines

---

CONCAT_EOF
    
    for i in {1..12}; do
        local piece_file="${full_prefix}_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            echo "Adding piece $i..."
            cat "$piece_file" >> "$concat_file"
            echo -e "\n---\n" >> "$concat_file"
        else
            echo "WARNING: Missing piece $i ($piece_file)"
        fi
    done
    
    local line_count=$(wc -l < "$concat_file")
    echo "Concatenated file: $concat_file ($line_count lines)"
    
    if [[ $line_count -lt 350 ]]; then
        echo "WARNING: Line count $line_count < 350 target"
    else
        echo "SUCCESS: Line count $line_count ≥ 350 target"
    fi
}

zip_pieces() {
    local article_num="$1"
    local prefix="${ARTICLE_PREFIX:-article3}"
    if [[ -z "$article_num" ]]; then
        echo "Usage: zip-pieces <article_num>"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    local full_prefix="${prefix}_${article_letter}-$(printf "%02d" "$article_num")"
    local zip_file="${full_prefix}_pieces.zip"
    
    echo "Zipping pieces for ${article_letter}-$(printf "%02d" "$article_num") -> $zip_file"
    
    local piece_files=()
    for i in {1..12}; do
        local piece_file="${full_prefix}_piece_$(printf "%02d" "$i").md"
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

verify_article() {
    local article_num="$1"
    local prefix="${ARTICLE_PREFIX:-article3}"
    if [[ -z "$article_num" ]]; then
        echo "Usage: verify <article_num>"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    local full_prefix="${prefix}_${article_letter}-$(printf "%02d" "$article_num")"
    local concat_file="${article_letter}-$(printf "%02d" "$article_num")_*.md"
    local zip_file="${full_prefix}_pieces.zip"
    
    # Get organized paths
    local article_name="HilbertSpace"
    local article_letter_dir="C"
    if [[ "$prefix" == "article1" ]]; then article_name="Worldline"; article_letter_dir="A"; fi
    if [[ "$prefix" == "article2" ]]; then article_name="MassSpectrum"; article_letter_dir="B"; fi
    if [[ "$prefix" == "article3" ]]; then article_name="HilbertSpace"; article_letter_dir="C"; fi
    if [[ "$prefix" == "article4" ]]; then article_name="Couplings"; article_letter_dir="D"; fi
    local org_full="CSM_WORK_IN_PROGRESS/SubAtom_WIP/${article_letter_dir}_Article${article_letter_dir}_${article_name}/full"
    local org_zip="CSM_WORK_IN_PROGRESS/SubAtom_WIP/${article_letter_dir}_Article${article_letter_dir}_${article_name}/zip"
    
    echo "=== Verification for ${article_letter}-$(printf "%02d" "$article_num") ==="
    
    # Check pieces
    local piece_count=0
    for i in {1..12}; do
        if [[ -f "${full_prefix}_piece_$(printf "%02d" "$i").md" ]]; then
            ((piece_count++))
        fi
    done
    echo "Pieces in root: $piece_count/12"
    
    # Check concat
    local concat_files=($concat_file)
    if [[ -f "${concat_files[0]}" ]]; then
        local lines=$(wc -l < "${concat_files[0]}")
        echo "Concatenated: ${concat_files[0]} ($lines lines)"
        [[ $lines -ge 350 ]] && echo "  ✅ Meets ≥350 target" || echo "  ❌ Below 350 target"
    else
        echo "Concatenated: MISSING"
    fi
    
    # Check zip
    if [[ -f "$zip_file" ]]; then
        local zip_count=$(unzip -l "$zip_file" | grep -c "\.md$" || echo 0)
        echo "Zip file: $zip_file ($zip_count pieces)"
        [[ $zip_count -eq 12 ]] && echo "  ✅ Contains 12 pieces" || echo "  ❌ Does not contain 12 pieces"
    else
        echo "Zip file: MISSING"
    fi
    
    # Check organized
    local org_full_file="${org_full}/${article_letter}-$(printf "%02d" "$article_num")_*.md"
    local org_full_files=($org_full_file)
    if [[ -f "${org_full_files[0]}" ]]; then
        echo "Organized full: ${org_full_files[0]} ✅"
    else
        echo "Organized full: MISSING"
    fi
    
    local org_zip_file="${org_zip}/${full_prefix}_pieces.zip"
    if [[ -f "$org_zip_file" ]]; then
        echo "Organized zip: $org_zip_file ✅"
    else
        echo "Organized zip: MISSING"
    fi
}

organize_article() {
    local article_num="$1"
    local prefix="${ARTICLE_PREFIX:-article3}"
    if [[ -z "$article_num" ]]; then
        echo "Usage: organize <article_num>"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    local full_prefix="${prefix}_${article_letter}-$(printf "%02d" "$article_num")"
    local concat_file="${article_letter}-$(printf "%02d" "$article_num")_*.md"
    local concat_files=($concat_file)
    local zip_file="${full_prefix}_pieces.zip"
    
    local article_name="HilbertSpace"
    local article_letter_dir="C"
    if [[ "$prefix" == "article1" ]]; then article_name="Worldline"; article_letter_dir="A"; fi
    if [[ "$prefix" == "article2" ]]; then article_name="MassSpectrum"; article_letter_dir="B"; fi
    if [[ "$prefix" == "article3" ]]; then article_name="HilbertSpace"; article_letter_dir="C"; fi
    if [[ "$prefix" == "article4" ]]; then article_name="Couplings"; article_letter_dir="D"; fi
    local org_full="CSM_WORK_IN_PROGRESS/SubAtom_WIP/${article_letter_dir}_Article${article_letter_dir}_${article_name}/full"
    local org_zip="CSM_WORK_IN_PROGRESS/SubAtom_WIP/${article_letter_dir}_Article${article_letter_dir}_${article_name}/zip"
    
    mkdir -p "$org_full" "$org_zip"
    
    if [[ -f "${concat_files[0]}" ]]; then
        cp "${concat_files[0]}" "$org_full/"
        echo "Copied concat to organized full/"
    fi
    
    if [[ -f "$zip_file" ]]; then
        cp "$zip_file" "$org_zip/"
        echo "Copied zip to organized zip/"
    fi
    
    echo "Organization complete for ${article_letter}-$(printf "%02d" "$article_num")"
}

list_articles() {
    echo "=== Article Pieces in Root Directory ==="
    for prefix in article1 article2 article3 article4; do
        for f in ${prefix}_A*-piece_*.md; do
            [[ -f "$f" ]] && echo "  $f"
        done
    done
    echo ""
    echo "=== Concatenated Files in Root ==="
    for f in A*-*_*.md; do
        [[ -f "$f" ]] && echo "  $f ($(wc -l < "$f") lines)"
    done
    echo ""
    echo "=== Zip Files in Root ==="
    for prefix in article1 article2 article3 article4; do
        for f in ${prefix}_A*-pieces.zip; do
            [[ -f "$f" ]] && echo "  $f"
        done
    done
}

clean_pieces() {
    local article_num="$1"
    local prefix="${ARTICLE_PREFIX:-article3}"
    if [[ -z "$article_num" ]]; then
        echo "Usage: clean-pieces <article_num>"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    local full_prefix="${prefix}_${article_letter}-$(printf "%02d" "$article_num")"
    
    echo "Removing loose pieces for ${article_letter}-$(printf "%02d" "$article_num") from root..."
    for i in {1..12}; do
        local piece_file="${full_prefix}_piece_$(printf "%02d" "$i").md"
        if [[ -f "$piece_file" ]]; then
            rm "$piece_file"
            echo "  Removed: $piece_file"
        fi
    done
    echo "Clean complete. Kept: concat file and zip file."
}

commit_and_push() {
    local article_num="$1"
    local msg="$2"
    local prefix="${ARTICLE_PREFIX:-article3}"
    if [[ -z "$article_num" || -z "$msg" ]]; then
        echo "Usage: commit-push <article_num> <message>"
        exit 1
    fi
    local article_letter="A3"
    if [[ "$prefix" == "article1" ]]; then article_letter="A1"; fi
    if [[ "$prefix" == "article2" ]]; then article_letter="A2"; fi
    if [[ "$prefix" == "article3" ]]; then article_letter="A3"; fi
    if [[ "$prefix" == "article4" ]]; then article_letter="A4"; fi
    
    echo "Committing ${article_letter}-$(printf "%02d" "$article_num")..."
    git add -A
    git commit -m "$msg"
    echo "Pushing directly to main..."
    git push origin main
}

push_main() {
    echo "Pushing to main..."
    git push origin main
}

merge_session_to_main() {
    echo "=== Merging session branch to main ==="
    
    # Ensure we're on session branch
    git checkout session/prime-electron-research-360
    
    # Push latest session branch
    echo "Pushing session branch..."
    git push origin session/prime-electron-research-360
    
    # Switch to main and pull latest
    echo "Switching to main and pulling latest..."
    git checkout main
    git pull origin main
    
    # Merge session branch
    echo "Merging session/prime-electron-research-360 into main..."
    git merge session/prime-electron-research-360 --no-edit
    
    # Push to main
    echo "Pushing to main..."
    git push origin main
    
    echo "=== Merge complete ==="
}

# Main command dispatch
case "${1:-help}" in
    create-pieces) create_pieces "$2" "$3" "$4" ;;
    write-piece) write_piece "$2" "$3" "$4" "$5" ;;
    concat) concat_pieces "$2" "$3" ;;
    zip-pieces) zip_pieces "$2" ;;
    verify) verify_article "$2" ;;
    organize) organize_article "$2" ;;
    full-cycle) 
        create_pieces "$2" "$3" "$4"
        echo ">>> Please edit the 12 piece files now, then run:"
        echo ">>> ./GitHub_handler.sh concat $2"
        echo ">>> ./GitHub_handler.sh zip-pieces $2"
        echo ">>> ./GitHub_handler.sh verify $2"
        echo ">>> ./GitHub_handler.sh organize $2"
        local article_letter="A3"
        if [[ "$4" == "article1" ]]; then article_letter="A1"; fi
        if [[ "$4" == "article2" ]]; then article_letter="A2"; fi
        if [[ "$4" == "article3" ]]; then article_letter="A3"; fi
        if [[ "$4" == "article4" ]]; then article_letter="A4"; fi
        echo ">>> ./GitHub_handler.sh commit-push $2 \"Add ${article_letter}-$(printf "%02d" "$2"): $3 - 12 pieces, concat, zip\""
        ;;
    commit-push) commit_and_push "$2" "$3" ;;
    push-main) push_main ;;
    merge-session) merge_session_to_main ;;
    list) list_articles ;;
    clean-pieces) clean_pieces "$2" ;;
    help|*) show_help ;;
esac