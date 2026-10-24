#!/bin/bash

OUTPUT_FILE="/workspace/app/README_Radio.md"

echo "# README Radio — Complete Project Documentation Compilation" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "*Generated: $(date)*" >> "$OUTPUT_FILE"
echo "*Source: All generated README.md files (423 projects)*" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Find all README.md files in project directories (not in README_chunks)
find /workspace/app -name "README.md" -type f \
    -not -path "*/README_chunks/*" \
    -not -path "*/.git/*" \
    | sort | while IFS= read -r readme; do
    
    # Get project name from path
    project_dir=$(dirname "$readme")
    project_name=$(basename "$project_dir")
    
    # Skip if it's the output file itself
    if [ "$readme" = "$OUTPUT_FILE" ]; then
        continue
    fi
    
    echo "Adding: $project_name ($project_dir)"
    
    # Get relative path
    rel_path="${project_dir#/workspace/app/}"
    
    echo "" >> "$OUTPUT_FILE"
    echo "## $project_name" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo "*Path: /workspace/app/$rel_path*" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    cat "$readme" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo "---" >> "$OUTPUT_FILE"
done

echo "Compilation complete: $OUTPUT_FILE"
wc -l "$OUTPUT_FILE"
