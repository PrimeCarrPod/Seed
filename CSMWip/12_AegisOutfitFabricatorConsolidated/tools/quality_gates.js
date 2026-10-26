#!/usr/bin/env node
/* Quality-gate report for the consolidated Aegis Outfit Fabricator corpus.
 *
 * Gates per document, as defined by the source project:
 *   lines      >= 300
 *   formulas   >= 15  ($$...$$, $...$, ```math, \begin{, \frac)
 *   xrefs      >= 10  (Research / SYNTH / MAT- / DRAFT- / CSMFAB078)
 *   standards  >= 5   (CIETA ASTM NIJ NFPA MIL-STD ISO IEC DoDI SAE)
 *   conflation == 0   (period terms such as medieval / victorian / rococo)
 *
 * The conflation check excludes:
 *   - lines that document the gate itself ("conflation", "grep -i",
 *     "quality gate");
 *   - image-prompt exclusion blocks (a "Negative Prompts" heading up to the
 *     closing fence), which intentionally list forbidden terms.
 * "regency" and "empire" are omitted because they collide with unrelated
 * words in this corpus (for example "agency").
 *
 * Each document is measured in its own child process (limits use ~4 MB, which
 * keeps small-array semantics for the script's own arrays).
 *
 * Usage: node tools/quality_gates.js [--markdown]
 */
const fs = require('fs');
const path = require('path');
const { execFileSync } = require('child_process');

const ROOT = path.resolve(__dirname, '..');
const SPEC = path.join(ROOT, 'specifications');
const MEASURE = path.join(__dirname, 'quality_gates_doc.js');

function collect(dir, out) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      collect(p, out);
    }
    if (entry.name.endsWith('.md')) {
      out.push(p);
    }
  }
  return out;
}

function main() {
  const files = collect(SPEC, [])
    .filter((p) => p.split(path.sep).indexOf('chapters') === -1)
    .sort();

  let limit = '--max-old-space-size=64';
  if (process.argv.indexOf('--fast') !== -1) {
    limit = '--max-old-space-size=4096';
  }

  const rows = [];
  for (const file of files) {
    const rel = path.relative(SPEC, file).split(path.sep).join('/');
    const out = execFileSync(process.execPath, [limit, '--single-threaded', MEASURE, file], { encoding: 'utf8' });
    rows.push({ rel, res: JSON.parse(out) });
  }

  const passing = rows.filter((r) => r.res.pass).length;
  const markdown = process.argv.indexOf('--markdown') !== -1;

  if (markdown) {
    console.log('| Document | Lines | Formulas | Xrefs | Standards | Conflation | Gate |');
    console.log('|----------|-------|----------|-------|-----------|------------|------|');
    for (const r of rows) {
      const fails = Object.keys(r.res.checks).filter((k) => !r.res.checks[k]);
      const cell = r.res.pass ? 'PASS' : 'FAIL (' + fails.join(', ') + ')';
      console.log(
        '| `' + r.rel + '` | ' + r.res.lines + ' | ' + r.res.formulas + ' | ' + r.res.xrefs +
        ' | ' + r.res.standards + ' | ' + r.res.conflation + ' | ' + cell + ' |'
      );
    }
    console.log('\n**' + passing + '/' + rows.length + ' documents pass all five gates.**');
    return;
  }

  const width = rows.reduce((w, r) => Math.max(w, r.rel.length), 0);
  console.log('document'.padEnd(width) + '  lines  fml  xref  std  cfl  gate');
  for (const r of rows) {
    const fails = Object.keys(r.res.checks).filter((k) => !r.res.checks[k]).join(',');
    const cell = r.res.pass ? 'PASS' : 'FAIL ' + fails;
    console.log(
      r.rel.padEnd(width) + '  ' + String(r.res.lines).padStart(5) + '  ' +
      String(r.res.formulas).padStart(3) + '  ' + String(r.res.xrefs).padStart(4) + '  ' +
      String(r.res.standards).padStart(3) + '  ' + String(r.res.conflation).padStart(3) + '  ' + cell
    );
  }
  console.log('');
  console.log(passing + '/' + rows.length + ' documents pass all five gates');
}

main();
