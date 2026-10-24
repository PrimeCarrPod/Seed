#!/bin/bash

OUTPUT_FILE="/workspace/app/README_Radio.md"
INDEX_FILE="/workspace/app/REPO_INDEX_V7.csv"

echo "# README Radio — Complete Project Documentation Compilation" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "*Generated: $(date)*" >> "$OUTPUT_FILE"
echo "*Source: REPO_INDEX_V7.csv — 423 projects with generated README.md*" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Use awk to parse CSV and find projects with HasREADME=Y
awk -F',' '
function parse_csv_line(line,    fields, n, i, in_quote, field, c) {
    n = 0
    in_quote = 0
    field = ""
    for (i = 1; i <= length(line); i++) {
        c = substr(line, i, 1)
        if (c == "\"") {
            if (in_quote && i < length(line) && substr(line, i+1, 1) == "\"") {
                field = field "\""
                i++
            } else {
                in_quote = !in_quote
            }
        } else if (c == "," && !in_quote) {
            fields[++n] = field
            field = ""
        } else {
            field = field c
        }
    }
    fields[++n] = field
    return n
}

NR > 1 {
    n = parse_csv_line($0, fields)
    if (n >= 16) {
        project = fields[5]
        path = fields[6]
        has_readme = fields[9]
        
        gsub(/^"/, "", project); gsub(/"$/, "", project)
        gsub(/^"/, "", path); gsub(/"$/, "", path)
        
        if (has_readme == "Y") {
            print project "|" path
        }
    }
}
' "$INDEX_FILE" | sort -u | while IFS='|' read -r name path; do
    if [ -n "$name" ] && [ -f "$path/README.md" ]; then
        echo "Adding: $name"
        echo "" >> "$OUTPUT_FILE"
        echo "## $name" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "*Path: $path*" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        cat "$path/README.md" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
        echo "---" >> "$OUTPUT_FILE"
    fi
done

echo "Compilation complete: $OUTPUT_FILE"
wc -l "$OUTPUT_FILE"
