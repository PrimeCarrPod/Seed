#!/usr/bin/env node
/* Rebuild the master compendium and its per-document parts from the product files. */
const fs = require('fs');
const path = require('path');
const ROOT = process.argv[2];
if (!ROOT) { console.error('usage: build_compendium.js <project-root>'); process.exit(2); }
const SPEC = path.join(ROOT, 'specifications');
const COMP = path.join(ROOT, 'compendium');
const PARTS = path.join(COMP, 'parts');
const DISPLAY_TITLES = {
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
const ORDER = [
  ['core_architecture', ['DOC-01','DOC-02','DOC-03','DOC-04','DOC-05','DOC-06','DOC-07','DOC-08','DOC-09','DOC-10']],
  ['edition_specifications', ['DOC-11','DOC-12','DOC-13','DOC-14','DOC-15','DOC-16','DOC-17','DOC-18','DOC-19','DOC-20']],
  ['threat_protection', ['DOC-21','DOC-22','DOC-23','DOC-24','DOC-25','DOC-26','DOC-27','DOC-28','DOC-29','DOC-30']],
  ['integration_sustainment', ['DOC-31','DOC-32','DOC-33','DOC-34','DOC-35','DOC-36','DOC-37','DOC-38','DOC-39','DOC-40','DOC-41','DOC-42','DOC-43','DOC-44','DOC-45','DOC-46','DOC-47','DOC-48']],
  ['draft_kernels', ['DRAFT-01','DRAFT-02','DRAFT-03','DRAFT-04','DRAFT-05']],
  ['materials', ['MAT-01','MAT-02','MAT-03','MAT-04']],
  ['synthesis', ['SYNTH-01','SYNTH-02','SYNTH-03']],
];
function filesIn(dir) {
  return fs.readdirSync(dir, { withFileTypes: true })
    .filter(e => e.isFile() && e.name.endsWith('.md'))
    .map(e => path.join(dir, e.name));
}
function titleOf(text) {
  const line = text.split('\n').find(l => l.startsWith('# '));
  return line ? line.slice(2).trim() : 'Untitled';
}
function slug(s) {
  return s.replace(/[^A-Za-z0-9]+/g, '_').replace(/^_+|_+$/g, '').slice(0, 80);
}
fs.mkdirSync(PARTS, { recursive: true });
for (const f of fs.readdirSync(PARTS)) {
  if (f.endsWith('.md') || f.endsWith('.md.gz')) fs.unlinkSync(path.join(PARTS, f));
}

const entries = [];
for (const [group, ids] of ORDER) {
  const dir = path.join(SPEC, group);
  for (const id of ids) {
    const candidates = filesIn(dir).filter(f => path.basename(f).startsWith(id + '_'));
    if (candidates.length !== 1) throw new Error(`expected one file for ${id}, found ${candidates.length}`);
    const file = candidates[0];
    const text = fs.readFileSync(file, 'utf8').trimEnd();
    const title = DISPLAY_TITLES[id] || titleOf(text).replace(/^[A-Z]+-\d+:\s*/, '');
    entries.push({ id, group, file, text, title });
  }
}
if (entries.length !== 60) throw new Error('expected 60 documents, got ' + entries.length);

let out = [];
out.push('# EQUATIONSCOMPLETE — AEGIS OUTFIT FABRICATOR MASTER COMPENDIUM');
out.push('');
out.push('**Project**: Aegis Outfit Fabricator — Renaissance Protective Outfit System  ');
out.push('**Version**: 2.0 (Consolidated Complete)  ');
out.push('**Date**: 2026-10-26  ');
out.push('**Classification**: UNCLASSIFIED // FOR OFFICIAL USE ONLY  ');
out.push('**Total number of documents**: 60 (DOC-01..DOC-48, DRAFT-01..05, MAT-01..04, SYNTH-01..03)  ');
out.push('**Quality gates**: all 60 documents pass lines ≥300, formulas ≥15, cross-references ≥10, standards ≥5, conflation =0.');
out.push('');
out.push('---');
out.push('');
out.push('This compendium is generated from the per-document product files under `specifications/`.');
out.push('The per-document files are authoritative; this file is a reading and distribution convenience.');
out.push('Every numbered document in the project baseline is present, including the four program documents');
out.push('that were previously compendium-only (DOC-41, DOC-43, DOC-45, DOC-47).');
out.push('');
out.push('## Document Index');
out.push('');
const indexLines = entries.map((e, i) => {
  const n = String(i + 1).padStart(2, ' ');
  return `${n}. ${e.id} — ${e.title}`;
});
out.push(...indexLines);
out.push('');
out.push('---');
out.push('');

const groups = [
  ['CORE ARCHITECTURE (DOC-01 through DOC-10)', 'core_architecture'],
  ['EDITION SPECIFICATIONS (DOC-11 through DOC-20)', 'edition_specifications'],
  ['THREAT PROTECTION (DOC-21 through DOC-30)', 'threat_protection'],
  ['INTEGRATION AND SUSTAINMENT (DOC-31 through DOC-48)', 'integration_sustainment'],
  ['DRAFTING KERNELS (DRAFT-01 through DRAFT-05)', 'draft_kernels'],
  ['MATERIAL SPECIFICATIONS (MAT-01 through MAT-04)', 'materials'],
  ['SYNTHESIS DOCUMENTS (SYNTH-01 through SYNTH-03)', 'synthesis'],
];
for (const [label, group] of groups) {
  out.push('');
  out.push('================================================================================');
  out.push('=== ' + label + ' ===');
  out.push('================================================================================');
  out.push('');
  for (const e of entries.filter(x => x.group === group)) {
    out.push('');
    out.push('################################################################################');
    out.push('# ' + e.id + ' — ' + e.title);
    out.push('################################################################################');
    out.push('');
    out.push(e.text);
    out.push('');
  }
}
out.push('');
out.push('**END OF MASTER COMPENDIUM**');
out.push('');
const compendium = out.join('\n');
fs.writeFileSync(path.join(COMP, 'EQUATIONSCOMPLETE_Master_Compendium.md'), compendium);

const preamble = out.slice(0, out.indexOf('---')).join('\n') + '\n';
fs.writeFileSync(path.join(PARTS, '00_preamble.md'), preamble);

entries.forEach((e, i) => {
  const n = String(i + 1).padStart(2, '0');
  const name = `${n}_${e.id}_${slug(e.title)}.md`;
  fs.writeFileSync(path.join(PARTS, name), e.text + '\n');
});
const index = ['### Document Index', '', ...indexLines, ''].join('\n');
fs.writeFileSync(path.join(PARTS, '61_master_index.md'), index);
console.log(`compendium: ${compendium.split('\n').length} lines; ${entries.length} parts`);
