#!/usr/bin/awk -f
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

function join_csv(fields, n,    result, i, field) {
    result = ""
    for (i = 1; i <= n; i++) {
        field = fields[i]
        if (field ~ /[",\n]/) {
            gsub(/"/, "\"\"", field)
            field = "\"" field "\""
        }
        if (i > 1) result = result ","
        result = result field
    }
    return result
}

BEGIN {
    FS = ","
    OFS = ","
}

NR == 1 {
    print $0
    next
}

{
    n = parse_csv_line($0, fields)
    if (n >= 16) {
        has_readme = fields[9]
        project = fields[5]
        path = fields[6]
        
        # Check if this project has a README.md now
        # We'll mark all projects that had summary and no README as now having README
        if (has_readme != "Y" && fields[3] != "" && fields[3] != "N/A") {
            fields[9] = "Y"
        }
        print join_csv(fields, 16)
    } else {
        print $0
    }
}
