#!/bin/bash
# GitHub Handler - Utility for managing article piece files
# Usage: ./GitHub_handler.sh <command> [args...]

set -e

ARTICLE_PREFIX="article3"
PIECES_DIR="."
ORGANIZED_FULL="CSM_WORK_IN_PROGRESS/SubAtom_WIP/C_Article3_HilbertSpace/full"
ORGANIZED_ZIP="CSM_WORK_IN_PROGRESS/SubAtom_WIP/C_Article3_HilbertSpace/zip"

show_help() {
    cat <<EOF
GitHub Handler - Article Piece File Manager

COMMANDS:
  create-pieces <article_num> <title>     Create 12 empty piece files for new article
  write-piece <article_num> <piece_num> <content>  Write content to specific piece
  concat <article_num>                    Concatenate 12 pieces into master file
  zip-pieces <article_num>                Zip 12 pieces into archive
  verify <article_num>                    Verify piece count, concat lines, zip contents
  organize <article_num>                  Copy concat+zip to organized folders
  full-cycle <article_num> <title>        Complete cycle: create, concat, zip, organize, commit
  commit-push <article_num> <msg>         Commit all files and push to session branch
  push-session                            Push session branch to origin
  merge-to-main                           Merge session branch to main (reset + fast-forward)
  list                                    List all article pieces in root
  clean-pieces <article_num>              Remove loose pieces from root (after verify)

EXAMPLES:
  ./GitHub_handler.sh create-pieces 20 "Quantum_Internet_Prime_Gaps"
  ./GitHub_handler.sh concat 20
  ./GitHub_handler.sh zip-pieces 20
  ./GitHub_handler.sh verify 20
  ./GitHub_handler.sh organize 20
  ./GitHub_handler.sh commit-push 20 "Add A3-20: Quantum_Internet_Prime_Gaps"
  ./GitHub_handler.sh push-session
  ./GitHub_handler.sh merge-to-main
  ./GitHub_handler.sh full-cycle 20 "Quantum_Internet_Prime_Gaps"

EOF
}

create_pieces() {
    local article_num="$1"
    local title="$2"
    if [[ -z "$article_num" || -z "$title" ]]; then
        echo "Usage: create-pieces <article_num> <title>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    for i in {1..12}; do
        local piece_file="${prefix}_piece_$(printf "%02d" "$i").md"
        if [[ ! -f "$piece_file" ]]; then
            cat > "$piece_file" <<PIECE_EOF
# ${title} — Piece $(printf "%02d" "$i")/12
## Article 3: A3-$(printf "%02d" "$article_num") — ${title//_/ }
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
    echo "Created 12 piece files for A3-$(printf "%02d" "$article_num")"
}

write_piece() {
    local article_num="$1"
    local piece_num="$2"
    local content="$3"
    if [[ -z "$article_num" || -z "$piece_num" || -z "$content" ]]; then
        echo "Usage: write-piece <article_num> <piece_num> <content>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    local piece_file="${prefix}_piece_$(printf "%02d" "$piece_num").md"
    if [[ -f "$piece_file" ]]; then
        # Replace content after the header
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
    if [[ -z "$article_num" ]]; then
        echo "Usage: concat <article_num>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    local concat_file="A3-$(printf "%02d" "$article_num")_${2:-Quantum_Article}.md"
    
    # Get title from first piece
    local first_piece="${prefix}_piece_01.md"
    local title="Quantum_Article"
    if [[ -f "$first_piece" ]]; then
        title=$(head -1 "$first_piece" | sed 's/# //' | sed 's/ — Piece.*//' | tr ' ' '_')
    fi
    concat_file="A3-$(printf "%02d" "$article_num")_${title}.md"
    
    echo "Concatenating pieces for A3-$(printf "%02d" "$article_num") -> $concat_file"
    
    cat > "$concat_file" <<CONCAT_EOF
# ${title//_/ } — Complete Article
## Article 3: A3-$(printf "%02d" "$article_num") — ${title//_/ }
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")  
**Structure:** 12 pieces concatenated  
**Target:** ≥350 lines

---

CONCAT_EOF
    
    for i in {1..12}; do
        local piece_file="${prefix}_piece_$(printf "%02d" "$i").md"
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
    if [[ -z "$article_num" ]]; then
        echo "Usage: zip-pieces <article_num>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    local zip_file="${prefix}_pieces.zip"
    
    echo "Zipping pieces for A3-$(printf "%02d" "$article_num") -> $zip_file"
    
    local piece_files=()
    for i in {1..12}; do
        local piece_file="${prefix}_piece_$(printf "%02d" "$i").md"
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
    if [[ -z "$article_num" ]]; then
        echo "Usage: verify <article_num>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    local concat_file="A3-$(printf "%02d" "$article_num")_*.md"
    local zip_file="${prefix}_pieces.zip"
    
    echo "=== Verification for A3-$(printf "%02d" "$article_num") ==="
    
    # Check pieces
    local piece_count=0
    for i in {1..12}; do
        if [[ -f "${prefix}_piece_$(printf "%02d" "$i").md" ]]; then
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
    local org_full="${ORGANIZED_FULL}/A3-$(printf "%02d" "$article_num")_*.md"
    local org_files=($org_full)
    if [[ -f "${org_files[0]}" ]]; then
        echo "Organized full: ${org_files[0]} ✅"
    else
        echo "Organized full: MISSING"
    fi
    
    local org_zip="${ORGANIZED_ZIP}/${prefix}_pieces.zip"
    if [[ -f "$org_zip" ]]; then
        echo "Organized zip: $org_zip ✅"
    else
        echo "Organized zip: MISSING"
    fi
}

organize_article() {
    local article_num="$1"
    if [[ -z "$article_num" ]]; then
        echo "Usage: organize <article_num>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    local concat_file="A3-$(printf "%02d" "$article_num")_*.md"
    local concat_files=($concat_file)
    local zip_file="${prefix}_pieces.zip"
    
    mkdir -p "$ORGANIZED_FULL" "$ORGANIZED_ZIP"
    
    if [[ -f "${concat_files[0]}" ]]; then
        cp "${concat_files[0]}" "$ORGANIZED_FULL/"
        echo "Copied concat to organized full/"
    fi
    
    if [[ -f "$zip_file" ]]; then
        cp "$zip_file" "$ORGANIZED_ZIP/"
        echo "Copied zip to organized zip/"
    fi
    
    echo "Organization complete for A3-$(printf "%02d" "$article_num")"
}

list_articles() {
    echo "=== Article Pieces in Root Directory ==="
    for f in ${ARTICLE_PREFIX}_A3-*_piece_*.md; do
        [[ -f "$f" ]] && echo "  $f"
    done
    echo ""
    echo "=== Concatenated Files in Root ==="
    for f in A3-*_*.md; do
        [[ -f "$f" ]] && echo "  $f ($(wc -l < "$f") lines)"
    done
    echo ""
    echo "=== Zip Files in Root ==="
    for f in ${ARTICLE_PREFIX}_A3-*_pieces.zip; do
        [[ -f "$f" ]] && echo "  $f"
    done
}

clean_pieces() {
    local article_num="$1"
    if [[ -z "$article_num" ]]; then
        echo "Usage: clean-pieces <article_num>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    
    echo "Removing loose pieces for A3-$(printf "%02d" "$article_num") from root..."
    for i in {1..12}; do
        local piece_file="${prefix}_piece_$(printf "%02d" "$i").md"
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
    if [[ -z "$article_num" || -z "$msg" ]]; then
        echo "Usage: commit-push <article_num> <message>"
        exit 1
    fi
    local prefix="${ARTICLE_PREFIX}_A3-$(printf "%02d" "$article_num")"
    
    echo "Committing A3-$(printf "%02d" "$article_num")..."
    git add -A
    git commit -m "$msg"
    echo "Pushing to session branch..."
    git push origin session/prime-electron-research-360
}

push_session() {
    echo "Pushing session branch to origin..."
    git push origin session/prime-electron-research-360
}

merge_to_main() {
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
    
    # Merge session branch (should be fast-forward if session was reset to main first)
    echo "Merging session/prime-electron-research-360 into main..."
    git merge session/prime-electron-research-360 --no-edit
    
    # Push to main
    echo "Pushing to main..."
    git push origin main
    
    echo "=== Merge complete ==="
}

# Main command dispatch
case "${1:-help}" in
    create-pieces) create_pieces "$2" "$3" ;;
    write-piece) write_piece "$2" "$3" "$4" ;;
    concat) concat_pieces "$2" "$3" ;;
    zip-pieces) zip_pieces "$2" ;;
    verify) verify_article "$2" ;;
    organize) organize_article "$2" ;;
    full-cycle) 
        create_pieces "$2" "$3"
        echo ">>> Please edit the 12 piece files now, then run:"
        echo ">>> ./GitHub_handler.sh concat $2"
        echo ">>> ./GitHub_handler.sh zip-pieces $2"
        echo ">>> ./GitHub_handler.sh verify $2"
        echo ">>> ./GitHub_handler.sh organize $2"
        echo ">>> ./GitHub_handler.sh commit-push $2 \"Add A3-$(printf "%02d" "$2"): $3 - 12 pieces, concat, zip\""
        ;;
    commit-push) commit_and_push "$2" "$3" ;;
    push-session) push_session ;;
    merge-to-main) merge_to_main ;;
    list) list_articles ;;
    clean-pieces) clean_pieces "$2" ;;
    help|*) show_help ;;
esac