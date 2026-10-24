#!/usr/bin/env python3
"""
Convert README_Radio.md to high-quality HTML preserving markdown markup.
"""

import re
import sys

def markdown_to_html(md_text):
    """Convert markdown to HTML with high-quality styling."""
    
    html = md_text
    
    # Escape HTML special chars first (but preserve existing HTML)
    # We'll handle this carefully
    
    # Headers
    html = re.sub(r'^#### (.*?)$', r'<h4>\1</h4>', html, flags=re.MULTILINE)
    html = re.sub(r'^### (.*?)$', r'<h3>\1</h3>', html, flags=re.MULTILINE)
    html = re.sub(r'^## (.*?)$', r'<h2>\1</h2>', html, flags=re.MULTILINE)
    html = re.sub(r'^# (.*?)$', r'<h1>\1</h1>', html, flags=re.MULTILINE)
    
    # Bold
    html = re.sub(r'\*\*(.*?)\*\*', r'<strong>\1</strong>', html)
    
    # Italic
    html = re.sub(r'\*(.*?)\*', r'<em>\1</em>', html)
    
    # Inline code
    html = re.sub(r'`([^`]+)`', r'<code>\1</code>', html)
    
    # Code blocks (before paragraph processing)
    def replace_code_block(match):
        lang = match.group(1) if match.group(1) else ''
        code = match.group(2)
        return f'<pre><code class="language-{lang}">{code}</code></pre>'
    
    html = re.sub(r'```(\w*)\n(.*?)\n```', replace_code_block, html, flags=re.DOTALL)
    
    # Horizontal rules
    html = re.sub(r'^---$', r'<hr>', html, flags=re.MULTILINE)
    
    # Tables - simple conversion
    def convert_table(match):
        lines = match.group(0).strip().split('\n')
        if len(lines) < 2:
            return match.group(0)
        
        # Parse header
        header_cells = [cell.strip() for cell in lines[0].split('|') if cell.strip()]
        separator = lines[1]
        # Parse rows
        rows = []
        for line in lines[2:]:
            cells = [cell.strip() for cell in line.split('|') if cell.strip()]
            if cells:
                rows.append(cells)
        
        table_html = '<table>\n<thead>\n<tr>'
        for cell in header_cells:
            table_html += f'<th>{cell}</th>'
        table_html += '</tr>\n</thead>\n<tbody>\n'
        
        for row in rows:
            table_html += '<tr>'
            for cell in row:
                table_html += f'<td>{cell}</td>'
            table_html += '</tr>\n'
        table_html += '</tbody>\n</table>'
        return table_html
    
    # Convert tables (pipe-separated with header separator)
    html = re.sub(
        r'(\|.*\|[\r\n]+\|[-:| ]+\|[\r\n]+(?:\|.*\|[\r\n]*)+)',
        convert_table,
        html
    )
    
    # Links: [text](url)
    html = re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'<a href="\2">\1</a>', html)
    
    # Images: ![alt](url)
    html = re.sub(r'!\[([^\]]*)\]\(([^)]+)\)', r'<img src="\2" alt="\1">', html)
    
    # Blockquotes
    html = re.sub(r'^> (.*?)$', r'<blockquote>\1</blockquote>', html, flags=re.MULTILINE)
    
    # Lists - unordered
    html = re.sub(r'^\s*[-*] (.*?)$', r'<li>\1</li>', html, flags=re.MULTILINE)
    html = re.sub(r'(<li>.*?</li>\n)+', lambda m: '<ul>\n' + m.group(0) + '</ul>\n', html)
    
    # Lists - ordered
    html = re.sub(r'^\s*\d+\. (.*?)$', r'<li>\1</li>', html, flags=re.MULTILINE)
    html = re.sub(r'(<li>.*?</li>\n)+', lambda m: '<ol>\n' + m.group(0) + '</ol>\n', html)
    
    # Checkboxes
    html = re.sub(r'- \[ \] (.*?)$', r'<li class="task-item"><input type="checkbox" disabled> \1</li>', html, flags=re.MULTILINE)
    html = re.sub(r'- \[x\] (.*?)$', r'<li class="task-item"><input type="checkbox" checked disabled> \1</li>', html, flags=re.MULTILINE)
    
    # Paragraphs - wrap non-tagged lines
    lines = html.split('\n')
    result = []
    in_block = False
    block_tags = ('<h1', '<h2', '<h3', '<h4', '<h5', '<h6', '<ul', '<ol', '<table', '<pre', '<blockquote', '<hr', '</ul', '</ol', '</table', '</pre', '</blockquote')
    
    for line in lines:
        stripped = line.strip()
        if not stripped:
            result.append('')
            continue
        
        is_block = any(stripped.startswith(tag) for tag in block_tags)
        
        if is_block:
            if not in_block and result and result[-1] != '':
                result.append('')
            result.append(line)
            in_block = True
        else:
            if in_block:
                result.append('')
                in_block = False
            if not (line.startswith('<') and line.endswith('>')):
                result.append(f'<p>{line}</p>')
            else:
                result.append(line)
    
    html = '\n'.join(result)
    
    # Clean up multiple blank lines
    html = re.sub(r'\n{3,}', '\n\n', html)
    
    return html

def main():
    input_file = "/workspace/app/README_Radio.md"
    output_file = "/workspace/app/README_Radio.html"
    
    with open(input_file, 'r') as f:
        md_content = f.read()
    
    # Convert to HTML
    html_content = markdown_to_html(md_content)
    
    # Full HTML template
    full_html = f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>README Radio — Complete Project Documentation Compilation</title>
    <style>
        * {{
            box-sizing: border-box;
        }}
        body {{
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            line-height: 1.7;
            color: #24292e;
            max-width: 960px;
            margin: 0 auto;
            padding: 40px 20px;
            background: #ffffff;
        }}
        h1 {{
            font-size: 2.5em;
            font-weight: 600;
            color: #1a1a2e;
            border-bottom: 3px solid #0366d6;
            padding-bottom: 0.3em;
            margin-top: 3em;
            margin-bottom: 1em;
        }}
        h2 {{
            font-size: 1.75em;
            font-weight: 600;
            color: #2c3e50;
            border-bottom: 1px solid #eaecef;
            padding-bottom: 0.3em;
            margin-top: 2.5em;
            margin-bottom: 1em;
        }}
        h3 {{
            font-size: 1.35em;
            font-weight: 600;
            color: #34495e;
            margin-top: 2em;
            margin-bottom: 0.5em;
        }}
        h4 {{
            font-size: 1.15em;
            font-weight: 600;
            color: #34495e;
            margin-top: 1.5em;
            margin-bottom: 0.5em;
        }}
        p {{
            margin: 1em 0;
            text-align: justify;
        }}
        a {{
            color: #0366d6;
            text-decoration: none;
        }}
        a:hover {{
            text-decoration: underline;
        }}
        code {{
            font-family: 'SF Mono', 'Fira Code', 'Monaco', 'Consolas', monospace;
            font-size: 0.9em;
            background: #f6f8fa;
            padding: 0.2em 0.4em;
            border-radius: 3px;
            color: #e83e8c;
        }}
        pre {{
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 1em;
            border-radius: 6px;
            overflow-x: auto;
            margin: 1em 0;
            font-size: 0.85em;
            line-height: 1.5;
        }}
        pre code {{
            background: transparent;
            padding: 0;
            color: inherit;
            font-size: inherit;
        }}
        .language-bash, .language-shell, .language-sh {{
            background: #1e1e1e;
        }}
        .language-markdown, .language-md {{
            background: #1e1e1e;
        }}
        blockquote {{
            border-left: 4px solid #0366d6;
            padding: 0 1em;
            margin: 1em 0;
            color: #6a737d;
            background: #f6f8fa;
            border-radius: 0 6px 6px 0;
        }}
        blockquote p {{
            margin: 0.5em 0;
        }}
        table {{
            border-collapse: collapse;
            width: 100%;
            margin: 1.5em 0;
            font-size: 0.9em;
        }}
        th, td {{
            border: 1px solid #dfe2e5;
            padding: 8px 12px;
            text-align: left;
        }}
        th {{
            background: #f6f8fa;
            font-weight: 600;
        }}
        tr:nth-child(even) td {{
            background: #f6f8fa;
        }}
        ul, ol {{
            padding-left: 2em;
            margin: 1em 0;
        }}
        li {{
            margin: 0.5em 0;
        }}
        li.task-item {{
            list-style: none;
            display: flex;
            align-items: baseline;
            gap: 0.5em;
        }}
        li.task-item input[type="checkbox"] {{
            margin-right: 0.5em;
            transform: scale(1.2);
        }}
        hr {{
            border: none;
            border-top: 2px solid #e1e4e8;
            margin: 3em 0;
        }}
        img {{
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }}
        .project-header {{
            margin-top: 3em;
            padding-top: 1.5em;
            border-top: 2px solid #e1e4e8;
        }}
        .project-path {{
            font-size: 0.85em;
            color: #6a737d;
            font-family: monospace;
            margin-bottom: 1em;
        }}
        .meta-info {{
            background: #f6f8fa;
            border: 1px solid #e1e4e8;
            border-radius: 6px;
            padding: 1em;
            margin: 1em 0;
            font-size: 0.9em;
        }}
        .meta-info strong {{
            color: #24292e;
        }}
        @media print {{
            body {{
                padding: 20px;
            }}
            h1, h2, h3 {{
                page-break-after: avoid;
            }}
            pre, table {{
                page-break-inside: avoid;
            }}
        }}
        @media (max-width: 768px) {{
            body {{
                padding: 20px 15px;
            }}
            h1 {{ font-size: 2em; }}
            h2 {{ font-size: 1.5em; }}
            h3 {{ font-size: 1.25em; }}
            pre {{ font-size: 0.8em; }}
            table {{ font-size: 0.8em; }}
        }}
    </style>
</head>
<body>
    {html_content}
    <script>
        // Add copy buttons to code blocks
        document.querySelectorAll('pre code').forEach(block => {{
            const pre = block.parentElement;
            const btn = document.createElement('button');
            btn.textContent = 'Copy';
            btn.style.cssText = 'position:absolute;top:0.5em;right:0.5em;padding:0.2em 0.6em;font-size:0.7em;background:#0366d6;color:white;border:none;border-radius:3px;cursor:pointer;opacity:0.7;';
            btn.onmouseover = () => btn.style.opacity = '1';
            btn.onmouseout = () => btn.style.opacity = '0.7';
            btn.onclick = () => {{
                navigator.clipboard.writeText(block.textContent);
                btn.textContent = 'Copied!';
                setTimeout(() => btn.textContent = 'Copy', 2000);
            }};
            pre.style.position = 'relative';
            pre.appendChild(btn);
        }});
        
        // Add anchor links to headers
        document.querySelectorAll('h1, h2, h3, h4').forEach(header => {{
            const id = header.textContent.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
            header.id = id;
            const anchor = document.createElement('a');
            anchor.href = '#' + id;
            anchor.className = 'header-anchor';
            anchor.textContent = '#';
            anchor.style.cssText = 'margin-left:0.5em;color:#0366d6;text-decoration:none;opacity:0;float:left;';
            header.style.position = 'relative';
            header.appendChild(anchor);
            header.onmouseover = () => anchor.style.opacity = '1';
            header.onmouseout = () => anchor.style.opacity = '0';
        }});
    </script>
</body>
</html>'''
    
    with open(output_file, 'w') as f:
        f.write(full_html)
    
    print(f"Converted to HTML: {output_file}")
    print(f"Size: {len(full_html):,} bytes")

if __name__ == "__main__":
    main()
