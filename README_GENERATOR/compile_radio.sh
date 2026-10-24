#!/bin/bash

OUTPUT_FILE="/workspace/app/README_Radio.md"
INDEX_FILE="/workspace/app/REPO_INDEX_V7.csv"

echo "# README Radio — Complete Project Documentation Compilation" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "*Generated: $(date)*" >> "$OUTPUT_FILE"
echo "*Source: REPO_INDEX_V7.csv (460 projects)*" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Parse CSV and find all projects with README.md
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
        gsub(/^"/, "", project); gsub(/"$/, "", project)
        gsub(/^"/, "", path); gsub(/"$/, "", path)
        
        # Check if README exists
        cmd = "test -f " path "/README.md && echo " project "|" path
        system(cmd)
    }
}
' "$INDEX_FILE" | while IFS='|' read -r name path; do
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
