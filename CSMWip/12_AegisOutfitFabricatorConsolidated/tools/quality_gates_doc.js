#!/usr/bin/env node
/* Measure one document against the five quality gates and print JSON.
 * Invoked by tools/quality_gates.js in a child process.
 *
 * Conflation rule: count the project's period terms (medieval, victorian,
 * edwardian, rococo, neoclassical, pre-1600) but ignore
 *   - image-prompt exclusion blocks ("Negative Prompts" heading followed by a
 *     fenced list), which intentionally list them;
 *   - lines that document the gate itself ("quality gate", "conflation",
 *     "grep -i").
 *
 * Usage: node tools/quality_gates_doc.js <file.md>
 */
const fs = require('fs');

const FORMULA_MARKERS = ['$$', '```math', '\\begin{', '\\frac'];
const XREF_MARKERS = ['Research', 'SYNTH', 'MAT-', 'DRAFT-', 'CSMFAB078'];
const STANDARD_MARKERS = ['CIETA', 'ASTM', 'NIJ', 'NFPA', 'MIL-STD', 'ISO', 'IEC', 'DoDI', 'SAE'];
const CONFLATION_MARKERS = ['medieval', 'victorian', 'edwardian', 'rococo', 'neoclassical', 'pre-1600'];
const FENCE = '```';

function occurrences(haystack, needle, ignoreCase) {
  let h = haystack;
  let n = needle;
  if (ignoreCase) {
    h = h.toLowerCase();
    n = n.toLowerCase();
  }
  return h.split(n).length - 1;
}

function sumMarkers(text, markers, ignoreCase) {
  let total = 0;
  for (const marker of markers) {
    total += occurrences(text, marker, ignoreCase);
  }
  return total;
}

function inlineMath(text) {
  const dollars = text.split('$').length - 1;
  const doubles = text.split('$$').length - 1;
  return Math.floor((dollars - doubles * 2) / 2);
}

/* Remove every "Negative Prompts" block: heading up to the closing fence. */
function withoutNegativeBlocks(text) {
  let out = text;
  let head = out.toLowerCase().indexOf('negative prompt');
  while (head >= 0) {
    const fenceStart = out.indexOf(FENCE, head);
    const fenceClose = fenceStart < 0 ? -1 : out.indexOf(FENCE, fenceStart + FENCE.length);
    const end = fenceClose < 0 ? out.length : fenceClose + FENCE.length;
    out = out.slice(0, head) + out.slice(end);
    head = out.toLowerCase().indexOf('negative prompt');
  }
  return out;
}

/* Count period terms on the lines that do not document the gate itself. */
function conflationHits(text) {
  const cleaned = withoutNegativeBlocks(text);
  const lines = cleaned.split('\n');
  let hits = 0;
  for (const line of lines) {
    const selfRef = occurrences(line, 'quality gate', true) > 0 ||
      occurrences(line, 'conflation', true) > 0 ||
      occurrences(line, 'grep -i', true) > 0;
    if (!selfRef) {
      hits += sumMarkers(line, CONFLATION_MARKERS, true);
    }
  }
  return hits;
}

function measure(file) {
  const text = fs.readFileSync(file, 'utf8');
  const lines = text.split('\n');
  const formulas = sumMarkers(text, FORMULA_MARKERS, false) + inlineMath(text);
  const xrefs = sumMarkers(text, XREF_MARKERS, false);
  const standards = sumMarkers(text, STANDARD_MARKERS, true);
  const conflation = conflationHits(text);
  const checks = {
    lines: lines.length >= 300,
    formulas: formulas >= 15,
    xrefs: xrefs >= 10,
    standards: standards >= 5,
    conflation: conflation === 0,
  };
  const pass = Object.keys(checks).every((k) => checks[k]);
  return { lines: lines.length, formulas, xrefs, standards, conflation, checks, pass };
}

process.stdout.write(JSON.stringify(measure(process.argv[2])));
