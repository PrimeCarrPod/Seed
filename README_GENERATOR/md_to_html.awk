#!/usr/bin/awk -f
BEGIN {
    print "<!DOCTYPE html>"
    print "<html lang=\"en\">"
    print "<head>"
    print "    <meta charset=\"UTF-8\">"
    print "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
    print "    <title>README Radio \u2014 Complete Project Documentation Compilation</title>"
    print "    <style>"
    print "        * { box-sizing: border-box; }"
    print "        body {"
    print "            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;"
    print "            line-height: 1.7; color: #24292e; max-width: 960px; margin: 0 auto; padding: 40px 20px; background: #ffffff;"
    print "        }"
    print "        h1 { font-size: 2.5em; font-weight: 600; color: #1a1a2e; border-bottom: 3px solid #0366d6; padding-bottom: 0.3em; margin-top: 3em; margin-bottom: 1em; }"
    print "        h2 { font-size: 1.75em; font-weight: 600; color: #2c3e50; border-bottom: 1px solid #eaecef; padding-bottom: 0.3em; margin-top: 2.5em; margin-bottom: 1em; }"
    print "        h3 { font-size: 1.35em; font-weight: 600; color: #34495e; margin-top: 2em; margin-bottom: 0.5em; }"
    print "        h4 { font-size: 1.15em; font-weight: 600; color: #34495e; margin-top: 1.5em; margin-bottom: 0.5em; }"
    print "        p { margin: 1em 0; text-align: justify; }"
    print "        a { color: #0366d6; text-decoration: none; }"
    print "        a:hover { text-decoration: underline; }"
    print "        code { font-family: 'SF Mono', 'Fira Code', 'Monaco', 'Consolas', monospace; font-size: 0.9em; background: #f6f8fa; padding: 0.2em 0.4em; border-radius: 3px; color: #e83e8c; }"
    print "        pre { background: #2d2d2d; color: #f8f8f2; padding: 1em; border-radius: 6px; overflow-x: auto; margin: 1em 0; font-size: 0.85em; line-height: 1.5; }"
    print "        pre code { background: transparent; padding: 0; color: inherit; font-size: inherit; }"
    print "        blockquote { border-left: 4px solid #0366d6; padding: 0 1em; margin: 1em 0; color: #6a737d; background: #f6f8fa; border-radius: 0 6px 6px 0; }"
    print "        table { border-collapse: collapse; width: 100%; margin: 1.5em 0; font-size: 0.9em; }"
    print "        th, td { border: 1px solid #dfe2e5; padding: 8px 12px; text-align: left; }"
    print "        th { background: #f6f8fa; font-weight: 600; }"
    print "        tr:nth-child(even) td { background: #f6f8fa; }"
    print "        ul, ol { padding-left: 2em; margin: 1em 0; }"
    print "        li { margin: 0.5em 0; }"
    print "        li.task-item { list-style: none; display: flex; align-items: baseline; gap: 0.5em; }"
    print "        li.task-item input[type=\"checkbox\"] { margin-right: 0.5em; transform: scale(1.2); }"
    print "        hr { border: none; border-top: 2px solid #e1e4e8; margin: 3em 0; }"
    print "        img { max-width: 100%; height: auto; border-radius: 4px; }"
    print "        .project-path { font-size: 0.85em; color: #6a737d; font-family: monospace; margin-bottom: 1em; }"
    print "        .meta-info { background: #f6f8fa; border: 1px solid #e1e4e8; border-radius: 6px; padding: 1em; margin: 1em 0; font-size: 0.9em; }"
    print "        @media print { body { padding: 20px; } h1, h2, h3 { page-break-after: avoid; } pre, table { page-break-inside: avoid; } }"
    print "        @media (max-width: 768px) { body { padding: 20px 15px; } h1 { font-size: 2em; } h2 { font-size: 1.5em; } h3 { font-size: 1.25em; } pre { font-size: 0.8em; } table { font-size: 0.8em; } }"
    print "    </style>"
    print "</head>"
    print "<body>"
    in_code = 0
    code_buffer = ""
    code_lang = ""
    in_table = 0
    table_lines = 0
    table_buffer = ""
}

# Detect code block start
/^```/ {
    if (!in_code) {
        in_code = 1
        code_lang = substr($0, 4)
        gsub(/^[ \t]+|[ \t]+$/, "", code_lang)
        if (code_lang == "") code_lang = "text"
        code_buffer = ""
    } else {
        # End code block
        in_code = 0
        # Escape HTML in code
        gsub(/&/, "&", code_buffer)
        gsub(/</, "<", code_buffer)
        gsub(/>/, ">", code_buffer)
        printf "<pre><code class=\"language-%s\">%s</code></pre>\n", code_lang, code_buffer
        code_lang = ""
        code_buffer = ""
    }
    next
}

in_code {
    if (code_buffer != "") code_buffer = code_buffer "\n"
    code_buffer = code_buffer $0
    next
}

# Headers
/^# / {
    gsub(/^# /, "")
    gsub(/&/, "&"); gsub(/</, "<"); gsub(/>/, ">")
    print "<h1>" $0 "</h1>"
    next
}
/^## / {
    gsub(/^## /, "")
    gsub(/&/, "&"); gsub(/</, "<"); gsub(/>/, ">")
    print "<h2>" $0 "</h2>"
    next
}
/^### / {
    gsub(/^### /, "")
    gsub(/&/, "&"); gsub(/</, "<"); gsub(/>/, ">")
    print "<h3>" $0 "</h3>"
    next
}
/^#### / {
    gsub(/^#### /, "")
    gsub(/&/, "&"); gsub(/</, "<"); gsub(/>/, ">")
    print "<h4>" $0 "</h4>"
    next
}

# Horizontal rule
/^---$/ {
    print "<hr>"
    next
}

# Blockquote
/^> / {
    gsub(/^> /, "")
    gsub(/&/, "&"); gsub(/</, "<"); gsub(/>/, ">")
    # Bold
    gsub(/\*\*(.*?)\*\*/, "<strong>\\1</strong>")
    # Italic
    gsub(/\*(.*?)\*/, "<em>\\1</em>")
    # Inline code
    gsub(/`([^`]+)`/, "<code>\\1</code>")
    # Links
    gsub(/\[([^\]]+)\]\(([^)]+)\)/, "<a href=\"\\2\">\\1</a>")
    print "<blockquote><p>" $0 "</p></blockquote>"
    next
}

# Table detection - pipe separated
/^\|.*\|$/ {
    if (!in_table) {
        in_table = 1
        table_buffer = ""
        table_lines = 0
    }
    table_lines++
    if (table_buffer != "") table_buffer = table_buffer "\n"
    table_buffer = table_buffer $0
    next
}

in_table && !/^\|.*\|$/ {
    # End of table
    in_table = 0
    # Parse table
    n = split(table_buffer, lines, "\n")
    if (n >= 2) {
        print "<table>"
        # Header
        split(lines[1], headers, "|")
        print "<thead><tr>"
        for (i = 2; i <= length(headers); i++) {
            if (headers[i] != "") {
                h = headers[i]
                gsub(/^[ \t]+|[ \t]+$/, "", h)
                gsub(/&/, "&", h); gsub(/</, "<", h); gsub(/>/, ">", h)
                print "<th>" h "</th>"
            }
        }
        print "</tr></thead>"
        print "<tbody>"
        # Rows
        for (i = 3; i <= n; i++) {
            split(lines[i], cells, "|")
            print "<tr>"
            for (j = 2; j <= length(cells); j++) {
                if (cells[j] != "") {
                    c = cells[j]
                    gsub(/^[ \t]+|[ \t]+$/, "", c)
                    gsub(/&/, "&", c); gsub(/</, "<", c); gsub(/>/, ">", c)
                    print "<td>" c "</td>"
                }
            }
            print "</tr>"
        }
        print "</tbody>"
        print "</table>"
    }
    table_buffer = ""
    table_lines = 0
    # Process current line normally
    # fall through
}

# Unordered list
/^[-*] / {
    gsub(/^[-*] /, "")
    gsub(/&/, "&"); gsub(/</, "<"); gsub(/>/, ">")
    # Bold
    gsub(/\*\*(.*?)\*\*/, "<strong>\\1</strong>")
    # Italic
    gsub(/\*(.*?)\*/, "<em>\\1</em>")
    # Inline code
    gsub(/`([^`]+)`/, "<code>\\1</code>")
    # Links
    gsub(/\[([^\]]+)\]\(([^)]+)\)/, "<a href=\"\\2\">\\1</a>")
    # Checkboxes
    if ($0 ~ /^\[ \] /) {
        gsub(/^\[ \] /, "")
        print "<li class=\"task-item\"><input type=\"checkbox\" disabled> " $0 "</li>"
    } else if ($0 ~ /^\[x\] /) {
        gsub(/^\[x\] /, "")
        print "<li class=\"task-item\"><input type=\"checkbox\" checked disabled> " $0 "</li>"
    } else {
        print "<li>" $0 "</li>"
    }
    next
}

# Ordered list
/^[0-9]+\. / {
    gsub(/^[0-9]+\. /, "")
    gsub(/&/, "&"); gsub(/</, "<"); gsub(/>/, ">")
    gsub(/\*\*(.*?)\*\*/, "<strong>\\1</strong>")
    gsub(/\*(.*?)\*/, "<em>\\1</em>")
    gsub(/`([^`]+)`/, "<code>\\1</code>")
    gsub(/\[([^\]]+)\]\(([^)]+)\)/, "<a href=\"\\2\">\\1</a>")
    print "<li>" $0 "</li>"
    next
}

# Inline processing for regular lines
{
    # Skip empty lines
    if ($0 == "") {
        print ""
        next
    }
    
    # Skip if already HTML block
    if ($0 ~ /^<(h[1-6]|table|pre|blockquote|ul|ol|hr|li)/) {
        print $0
        next
    }
    
    line = $0
    gsub(/&/, "&", line)
    gsub(/</, "<", line)
    gsub(/>/, ">", line)
    
    # Bold
    gsub(/\*\*(.*?)\*\*/, "<strong>\\1</strong>", line)
    # Italic
    gsub(/\*(.*?)\*/, "<em>\\1</em>", line)
    # Inline code
    gsub(/`([^`]+)`/, "<code>\\1</code>", line)
    # Links
    gsub(/\[([^\]]+)\]\(([^)]+)\)/, "<a href=\"\\2\">\\1</a>", line)
    # Images
    gsub(/!\[([^\]]*)\]\(([^)]+)\)/, "<img src=\"\\2\" alt=\"\\1\">", line)
    
    # Wrap in paragraph if not a block element
    if (line !~ /^<(h[1-6]|table|pre|blockquote|ul|ol|hr|li|img|p|div)/) {
        print "<p>" line "</p>"
    } else {
        print line
    }
}

END {
    # Close table if still open
    if (in_table && table_buffer != "") {
        n = split(table_buffer, lines, "\n")
        if (n >= 2) {
            print "<table>"
            split(lines[1], headers, "|")
            print "<thead><tr>"
            for (i = 2; i <= length(headers); i++) {
                if (headers[i] != "") {
                    h = headers[i]
                    gsub(/^[ \t]+|[ \t]+$/, "", h)
                    gsub(/&/, "&", h); gsub(/</, "<", h); gsub(/>/, ">", h)
                    print "<th>" h "</th>"
                }
            }
            print "</tr></thead>"
            print "<tbody>"
            for (i = 3; i <= n; i++) {
                split(lines[i], cells, "|")
                print "<tr>"
                for (j = 2; j <= length(cells); j++) {
                    if (cells[j] != "") {
                        c = cells[j]
                        gsub(/^[ \t]+|[ \t]+$/, "", c)
                        gsub(/&/, "&", c); gsub(/</, "<", c); gsub(/>/, ">", c)
                        print "<td>" c "</td>"
                    }
                }
                print "</tr>"
            }
            print "</tbody>"
            print "</table>"
        }
    }
    print "</body>"
    print "</html>"
}
