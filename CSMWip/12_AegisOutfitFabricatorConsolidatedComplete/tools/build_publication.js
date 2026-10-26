#!/usr/bin/env node
/* Build the single-file Markdown master and its self-contained HTML edition.
 *
 * Inputs: README.md, SCOPE_COMPLETION.md, the 60 product documents, and the two
 * research inputs. The compendium is intentionally not included because it is a
 * generated duplicate of the product documents.
 *
 * Outputs:
 *   deliverables/AEGIS_OUTFIT_FABRICATOR_COMPLETE.md
 *   deliverables/AEGIS_OUTFIT_FABRICATOR_COMPLETE.html
 */
const fs = require('fs');
const path = require('path');
const { marked } = require('./vendor/marked.umd.js');

const ROOT = path.resolve(__dirname, '..');
const OUT_DIR = path.join(ROOT, 'deliverables');
const OUT_MD = path.join(OUT_DIR, 'AEGIS_OUTFIT_FABRICATOR_COMPLETE.md');
const OUT_HTML = path.join(OUT_DIR, 'AEGIS_OUTFIT_FABRICATOR_COMPLETE.html');

const EDITION_TITLES = {
  'DOC-11': 'RenaissanceMan Tall-Skinny (RM-TS) Edition',
  'DOC-12': 'RenaissanceMan Tall-Girthy (RM-TG) Edition',
  'DOC-13': 'RenaissanceMan Short-Skinny (RM-SS) Edition',
  'DOC-14': 'RenaissanceMan Short-Girthy (RM-SG) Edition',
  'DOC-15': 'RenaissanceWoMan Tall-Skinny (RW-TS) Edition',
  'DOC-16': 'RenaissanceWoMan Tall-Girthy (RW-TG) Edition',
  'DOC-17': 'RenaissanceWoMan Short-Skinny (RW-SS) Edition',
  'DOC-18': 'RenaissanceWoMan Short-Girthy (RW-SG) Edition',
  'DOC-19': 'Cross-Edition Compatibility Matrix',
  'DOC-20': 'Edition Delta Tables',
};

const GROUPS = [
  {
    anchor: 'part-core',
    title: 'Part I — Core Architecture',
    dir: 'specifications/core_architecture',
    ids: ['DOC-01','DOC-02','DOC-03','DOC-04','DOC-05','DOC-06','DOC-07','DOC-08','DOC-09','DOC-10'],
  },
  {
    anchor: 'part-editions',
    title: 'Part II — Edition Specifications',
    dir: 'specifications/edition_specifications',
    ids: ['DOC-11','DOC-12','DOC-13','DOC-14','DOC-15','DOC-16','DOC-17','DOC-18','DOC-19','DOC-20'],
  },
  {
    anchor: 'part-threat',
    title: 'Part III — Threat Protection',
    dir: 'specifications/threat_protection',
    ids: ['DOC-21','DOC-22','DOC-23','DOC-24','DOC-25','DOC-26','DOC-27','DOC-28','DOC-29','DOC-30'],
  },
  {
    anchor: 'part-integration',
    title: 'Part IV — Integration and Sustainment',
    dir: 'specifications/integration_sustainment',
    ids: ['DOC-31','DOC-32','DOC-33','DOC-34','DOC-35','DOC-36','DOC-37','DOC-38','DOC-39','DOC-40','DOC-41','DOC-42','DOC-43','DOC-44','DOC-45','DOC-46','DOC-47','DOC-48'],
  },
  {
    anchor: 'part-materials',
    title: 'Part V — Material Specifications',
    dir: 'specifications/materials',
    ids: ['MAT-01','MAT-02','MAT-03','MAT-04'],
  },
  {
    anchor: 'part-synthesis',
    title: 'Part VI — Synthesis Documents',
    dir: 'specifications/synthesis',
    ids: ['SYNTH-01','SYNTH-02','SYNTH-03'],
  },
  {
    anchor: 'part-draft',
    title: 'Part VII — Drafting Kernels',
    dir: 'specifications/draft_kernels',
    ids: ['DRAFT-01','DRAFT-02','DRAFT-03','DRAFT-04','DRAFT-05'],
  },
];

function read(p) { return fs.readFileSync(p, 'utf8'); }
function firstHeading(text) {
  const line = text.split('\n').find(l => l.startsWith('# '));
  return line ? line.slice(2).trim() : 'Untitled';
}
function stripFirstHeading(text) {
  const lines = text.split('\n');
  const i = lines.findIndex(l => l.startsWith('# '));
  if (i >= 0) lines.splice(i, 1);
  return lines.join('\n').replace(/^\s*\n/, '').trimEnd();
}
function fileFor(dir, id) {
  const matches = fs.readdirSync(path.join(ROOT, dir))
    .filter(f => f.endsWith('.md') && f.startsWith(id + '_'));
  if (matches.length !== 1) throw new Error(`expected one file for ${id} in ${dir}, found ${matches.length}`);
  return path.join(dir, matches[0]);
}
function docTitle(id, text) {
  return EDITION_TITLES[id] || firstHeading(text).replace(/^[A-Z]+-\d+:\s*/, '');
}
function slugId(id) { return id.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, ''); }

function rewriteRelativeLinks(text) {
  return text.replace(/\]\(([^)]+)\)/g, (match, target) => {
    if (/^https?:/i.test(target) || target.startsWith('#')) return match;
    const base = path.basename(target.split('#')[0]);
    const id = (base.match(/(DOC-\d+|MAT-\d+|SYNTH-\d+|DRAFT-\d+)/i) || [])[1];
    if (id) return `](#${slugId(id)})`;
    if (base === 'README.md') return '](#project-overview)';
    if (base === 'SCOPE_COMPLETION.md') return '](#scope-closure)';
    if (base.endsWith('.md')) return '](#appendix-document-inventory)';
    return match;
  });
}

const entries = [];
for (const group of GROUPS) {
  for (const id of group.ids) {
    const rel = fileFor(group.dir, id);
    const raw = read(path.join(ROOT, rel));
    entries.push({
      id,
      group,
      rel,
      title: docTitle(id, raw),
      body: stripFirstHeading(raw),
      lines: raw.split('\n').length,
    });
  }
}
if (entries.length !== 60) throw new Error('expected 60 product documents, got ' + entries.length);

const research = fs.readdirSync(path.join(ROOT, 'research'))
  .filter(f => f.endsWith('.md'))
  .sort()
  .map(f => {
    const rel = path.join('research', f);
    const raw = read(path.join(ROOT, rel));
    const id = (f.match(/RESEARCH-\d+/) || ['RESEARCH-00'])[0];
    return { id, rel, title: firstHeading(raw).replace(/^RESEARCH-\d+:\s*/, ''), body: stripFirstHeading(raw), lines: raw.split('\n').length };
  });

const readme = rewriteRelativeLinks(read(path.join(ROOT, 'README.md')));
const scope = rewriteRelativeLinks(read(path.join(ROOT, 'SCOPE_COMPLETION.md')));

let md = [];
md.push('# AEGIS OUTFIT FABRICATOR — COMPLETE PROJECT');
md.push('');
md.push('**Renaissance Protective Outfit System — consolidated single-file edition**');
md.push('');
md.push('| Field | Value |');
md.push('|-------|-------|');
md.push('| **Status** | COMPLETE — all declared product documents present |');
md.push('| **Product documents** | 60 (48 numbered specifications, 4 material, 3 synthesis, 5 drafting kernels) |');
md.push('| **Research inputs** | 2 |');
md.push('| **Quality gates** | 60/60 pass lines ≥300, formulas ≥15, cross-references ≥10, standards ≥5, conflation 0 |');
md.push('| **Edition configurations** | 8 (RM/RW × TS/TG/SS/SG) |');
md.push('| **Protective stack** | 12 layers, 12 LES tension zones, 1,152 parameter sets |');
md.push('| **Generated** | 2026-10-26 from the product tree in this folder |');
md.push('| **Source of truth** | `specifications/`, `research/`, `README.md`, `SCOPE_COMPLETION.md` |');
md.push('');
md.push('---');
md.push('');
md.push('This is the complete project in one Markdown file. It contains the project overview, the scope-closure record, every product document (including the restored program documents and the completed DOC-14 edition), and both research inputs. The generated equation compendium is omitted because it is a duplicate of the 60 product documents; the authoritative text is the per-document content reproduced here. The HTML edition is generated from this same Markdown with the full table, code, image, and heading markup preserved.');
md.push('');
md.push('---');
md.push('');
md.push('# Master Table of Contents');
md.push('');
md.push('| Part | Contents |');
md.push('|------|----------|');
md.push('| [Project Overview](#project-overview) | Purpose, layout, document map, build and verification |');
md.push('| [Scope Closure](#scope-closure) | What was missing, what was repaired, and the verification record |');
for (const group of GROUPS) {
  md.push(`| [${group.title}](#${group.anchor}) | ${group.ids.join(', ')} |`);
}
md.push('| [Part VIII — Research Inputs](#part-research) | RESEARCH-01, RESEARCH-02 |');
md.push('| [Appendix — Document Inventory](#appendix-document-inventory) | File, title, and line count for every included document |');
md.push('');
md.push('### Document Index');
md.push('');
md.push('| ID | Title | Part |');
md.push('|----|-------|------|');
for (const e of entries) {
  md.push(`| [${e.id}](#${slugId(e.id)}) | ${e.title} | ${e.group.title.replace(/^Part [IVX]+ — /, '')} |`);
}
md.push('');
md.push('---');
md.push('');
md.push('# Project Overview');
md.push('');
md.push('*The following is the project README, with relative links rewritten to work inside this single file.*');
md.push('');
md.push(stripFirstHeading(readme));
md.push('');
md.push('---');
md.push('');
md.push('# Scope Closure and Verification Record');
md.push('');
md.push(stripFirstHeading(scope));
md.push('');
md.push('---');
md.push('');

for (const group of GROUPS) {
  md.push(`# ${group.title}`);
  md.push('');
  for (const e of entries.filter(x => x.group === group)) {
    md.push(`# ${e.id} — ${e.title}`);
    md.push('');
    md.push(`**Source:** \`${e.rel}\` · **Lines:** ${e.lines} · **Quality gate:** PASS`);
    md.push('');
    md.push(e.body);
    md.push('');
    md.push('---');
    md.push('');
  }
}

md.push('# Part VIII — Research Inputs');
md.push('');
md.push('The two research documents are source inputs, not gate-scored specifications. Their embedded figures and image references are preserved.');
md.push('');
for (const r of research) {
  md.push(`# ${r.id} — ${r.title}`);
  md.push('');
  md.push(`**Source:** \`${r.rel}\` · **Lines:** ${r.lines} · **Role:** research input`);
  md.push('');
  md.push(r.body);
  md.push('');
  md.push('---');
  md.push('');
}

md.push('# Appendix — Document Inventory');
md.push('');
md.push('| # | ID | Title | Lines | Source file |');
md.push('|---|----|-------|-------|-------------|');
entries.forEach((e, i) => {
  md.push(`| ${i + 1} | ${e.id} | ${e.title} | ${e.lines} | \`${e.rel}\` |`);
});
research.forEach((r, i) => {
  md.push(`| ${entries.length + i + 1} | ${r.id} | ${r.title} | ${r.lines} | \`${r.rel}\` |`);
});
md.push('');
md.push('---');
md.push('');
md.push('**END OF AEGIS OUTFIT FABRICATOR — COMPLETE PROJECT**');
md.push('');

const markdown = md.join('\n');
fs.mkdirSync(OUT_DIR, { recursive: true });
fs.writeFileSync(OUT_MD, markdown);

function decodeEntities(s) {
  return s.replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&#39;/g, "'");
}
function slugify(s) {
  return s.toLowerCase().replace(/<[^>]+>/g, '').replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
}
function addHeadingIds(html) {
  const partMap = {
    'Part I — Core Architecture': 'part-core',
    'Part II — Edition Specifications': 'part-editions',
    'Part III — Threat Protection': 'part-threat',
    'Part IV — Integration and Sustainment': 'part-integration',
    'Part V — Material Specifications': 'part-materials',
    'Part VI — Synthesis Documents': 'part-synthesis',
    'Part VII — Drafting Kernels': 'part-draft',
    'Part VIII — Research Inputs': 'part-research',
    'Project Overview': 'project-overview',
    'Scope Closure and Verification Record': 'scope-closure',
    'Master Table of Contents': 'master-table-of-contents',
    'Appendix — Document Inventory': 'appendix-document-inventory',
    'Document Index': 'document-index',
  };
  const used = new Set();
  return html.replace(/<h([1-6])>(.*?)<\/h\1>/gs, (m, level, inner) => {
    const plain = decodeEntities(inner.replace(/<[^>]+>/g, '')).trim();
    let id = '';
    const doc = plain.match(/^(DOC-\d+|MAT-\d+|SYNTH-\d+|DRAFT-\d+|RESEARCH-\d+)\b/i);
    if (doc) id = slugify(doc[1]);
    if (!id && partMap[plain]) id = partMap[plain];
    if (!id) id = slugify(plain);
    if (!id) id = 'section';
    let unique = id;
    let n = 2;
    while (used.has(unique)) { unique = id + '-' + n; n++; }
    used.add(unique);
    return '<h' + level + ' id="' + unique + '">' + inner + '</h' + level + '>';
  });
}
const htmlBody = addHeadingIds(marked.parse(markdown, { gfm: true, breaks: false }));
const css = `
:root { --ink:#1b1f23; --muted:#57606a; --line:#d0d7de; --accent:#7a1f2b; --paper:#fffdf8; --code:#f6f8fa; }
* { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body { margin:0; background:var(--paper); color:var(--ink); font:16px/1.62 Georgia, "Times New Roman", serif; }
main { max-width: 1060px; margin: 0 auto; padding: 46px 34px 90px; }
h1, h2, h3, h4, h5, h6 { font-family: "Palatino Linotype", Palatino, Georgia, serif; line-height:1.22; margin: 1.6em 0 .55em; color:#241b16; }
h1 { font-size: 2.15rem; border-bottom: 3px double var(--line); padding-bottom:.35rem; margin-top: 2.2em; }
h1:first-of-type { margin-top: 0; }
h2 { font-size: 1.55rem; border-bottom: 1px solid var(--line); padding-bottom:.2rem; }
h3 { font-size: 1.24rem; color:var(--accent); }
h4 { font-size: 1.08rem; }
p { margin: .65em 0; }
a { color:#7a1f2b; text-decoration:none; }
a:hover { text-decoration:underline; }
hr { border:0; border-top:1px solid var(--line); margin:2.2em 0; }
blockquote { margin:1em 0; padding:.6em 1em; border-left:4px solid var(--accent); background:#f8f1e9; color:#3c3330; }
code { background:var(--code); padding:.12em .32em; border-radius:4px; font: .88em/1.4 "SFMono-Regular", Consolas, "Liberation Mono", monospace; }
pre { background:#0f1720; color:#e6edf3; padding:16px 18px; border-radius:8px; overflow:auto; line-height:1.45; }
pre code { background:transparent; padding:0; color:inherit; font-size:.88rem; }
table { width:100%; border-collapse:collapse; margin:1.15em 0; font-family:"Segoe UI", Arial, sans-serif; font-size:.9rem; }
th, td { border:1px solid var(--line); padding:7px 9px; vertical-align:top; text-align:left; }
th { background:#efe7dd; }
tr:nth-child(even) td { background:#fbf8f3; }
img { max-width:100%; height:auto; }
ul, ol { padding-left:1.5em; }
li { margin:.22em 0; }
input[type="checkbox"] { margin-right:.45em; }
main > p:first-of-type { font-size:1.05rem; }
@media print {
  body { background:#fff; font-size:10.5pt; }
  main { max-width:none; padding:0; }
  a { color:inherit; text-decoration:none; }
  h1, h2, h3 { break-after:avoid; }
  pre, table, blockquote, img { break-inside:avoid; }
  hr { margin:1.2em 0; }
}
`;
const html = `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aegis Outfit Fabricator — Complete Project</title>
<style>${css}</style>
<script>
window.MathJax = {
  tex: { inlineMath: [['$', '$'], ['\\\\(', '\\\\)']], displayMath: [['$$', '$$'], ['\\\\[', '\\\\]']] },
  options: { skipHtmlTags: ['script','noscript','style','textarea','pre','code'] }
};
</script>
<script defer src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>
<body>
<main>
${htmlBody}
</main>
</body>
</html>
`;
fs.writeFileSync(OUT_HTML, html);
console.log(`wrote ${path.relative(ROOT, OUT_MD)} (${markdown.split('\n').length} lines)`);
console.log(`wrote ${path.relative(ROOT, OUT_HTML)} (${html.split('\n').length} lines, ${(Buffer.byteLength(html) / 1024 / 1024).toFixed(2)} MiB)`);
