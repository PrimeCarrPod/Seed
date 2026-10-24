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

BEGIN {
    print "=== REPO_INDEX_V6.csv Summary Report ==="
    print "Generated: " strftime("%Y-%m-%d %H:%M:%S")
    print ""
}

NR == 1 { next }

{
    n = parse_csv_line($0, fields)
    if (n >= 16) {
        state = fields[1]
        parent = fields[2]
        summary = fields[3]
        category = fields[4]
        project = fields[5]
        filecount = fields[7]
        has_readme = fields[9]
        
        total++
        if (summary != "" && summary != "N/A") with_summary++
        else without_summary++
        
        # Count by state
        states[state]++
        
        # Count by category
        categories[category]++
        
        # Top-level projects
        if (parent == "N/A" && category == "TopLevel") {
            toplevel++
            toplevel_projects[toplevel] = project " (" filecount " files)"
        }
        
        # Subprojects
        if (parent != "N/A" || (parent == "N/A" && category != "TopLevel")) {
            subprojects++
            parent_count[parent]++
        }
        
        # Has README
        if (has_readme == "Y") has_readme_count++
        
        # File count stats
        total_files += filecount + 0
        if (filecount + 0 > max_files) { max_files = filecount + 0; max_project = project }
    }
}

END {
    print "--- Overall Statistics ---"
    print "Total projects: " total
    print "With summaries: " with_summary
    print "Without summaries: " without_summary
    print "Top-level projects: " toplevel
    print "Sub-projects: " subprojects
    print "Projects with README: " has_readme_count
    print "Total files across all projects: " total_files
    print "Largest project: " max_project " (" max_files " files)"
    print ""
    
    print "--- By State ---"
    for (s in states) {
        print "  " s ": " states[s]
    }
    print ""
    
    print "--- Top-Level Projects ---"
    for (i = 1; i <= toplevel; i++) {
        print "  " toplevel_projects[i]
    }
    print ""
    
    print "--- Top Parent Projects (by subproject count) ---"
    # Sort parents by count
    n_parents = 0
    for (p in parent_count) {
        parents[++n_parents] = p
        counts[p] = parent_count[p]
    }
    # Simple bubble sort
    for (i = 1; i <= n_parents; i++) {
        for (j = i + 1; j <= n_parents; j++) {
            if (counts[parents[i]] < counts[parents[j]]) {
                temp = parents[i]; parents[i] = parents[j]; parents[j] = temp
            }
        }
    }
    for (i = 1; i <= n_parents && i <= 20; i++) {
        print "  " parents[i] ": " counts[parents[i]] " subprojects"
    }
    print ""
    
    print "--- By Category (top 20) ---"
    n_cats = 0
    for (c in categories) {
        cats[++n_cats] = c
        cat_counts[c] = categories[c]
    }
    for (i = 1; i <= n_cats; i++) {
        for (j = i + 1; j <= n_cats; j++) {
            if (cat_counts[cats[i]] < cat_counts[cats[j]]) {
                temp = cats[i]; cats[i] = cats[j]; cats[j] = temp
            }
        }
    }
    for (i = 1; i <= n_cats && i <= 20; i++) {
        print "  " cats[i] ": " cat_counts[cats[i]]
    }
}
