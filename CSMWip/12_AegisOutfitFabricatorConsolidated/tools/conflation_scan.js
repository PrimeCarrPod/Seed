#!/usr/bin/env node
/* Explain where conflation-flag hits come from in one or more documents.
 * Usage: node tools/conflation_scan.js <file.md> [...]
 */
const fs = require('fs');

const TERMS = ['medieval', 'victorian', 'edwardian', 'rococo', 'neoclassical', 'pre-1600'];
const occurrences = (haystack, needle) => haystack.toLowerCase().split(needle.toLowerCase()).length - 1;

for (const file of process.argv.slice(2)) {
  const lines = fs.readFileSync(file, 'utf8').split('\n');
  let open = -1;
  let total = 0;
  let inBlocks = 0;
  let selfRef = 0;
  let outside = 0;
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    const isFence = line.trim().slice(0, 3) === '```';
    const isHead = occurrences(line, 'negative prompt') > 0;
    if (isHead && open < 0) {
      open = i;
    }
    if (isFence && open >= 0 && i > open) {
      open = -1;
    }
    const hits = TERMS.reduce((n, t) => n + occurrences(line, t), 0);
    total += hits;
    if (open >= 0) {
      inBlocks += hits;
    } else if (occurrences(line, 'quality gate') + occurrences(line, 'conflation') + occurrences(line, 'grep -i') > 0) {
      selfRef += hits;
    } else {
      outside += hits;
    }
  }
  console.log(JSON.stringify({ file: file, total, inBlocks, selfRef, outside }));
}
