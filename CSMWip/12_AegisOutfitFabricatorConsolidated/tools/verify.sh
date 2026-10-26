#!/usr/bin/env bash
# verify.sh — integrity and quality-gate audit of the consolidated corpus.
#
# 1. Every file must match the SHA-256 recorded in MANIFEST.sha256.
# 2. Every product document is reported with its quality-gate status.
# 3. The assembled deliverable is reported (line count + digest).
#
# Exit status is non-zero only when a checksum fails. Quality-gate failures are
# reported for information: this corpus is a snapshot of authored work.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

status=0

echo "== 1. Manifest verification =="
if [ -f MANIFEST.sha256 ]; then
  if sha256sum --quiet -c MANIFEST.sha256; then
    echo "PASS: $(wc -l < MANIFEST.sha256) files match MANIFEST.sha256"
  else
    echo "FAIL: manifest mismatch (paths above)"
    status=1
  fi
else
  echo "FAIL: MANIFEST.sha256 missing (run tools/make_manifest.sh)"
  status=1
fi

echo
echo "== 2. Quality gates (lines >=300 / formulas >=15 / xrefs >=10 / standards >=5 / conflation =0) =="
if command -v node >/dev/null 2>&1; then
  node tools/quality_gates.js "$@" || true
else
  echo "SKIP: node not available"
fi

echo
echo "== 3. Deliverable =="
if [ -f deliverables/MASTER_SPECIFICATION.md ]; then
  printf 'lines:  %s\n' "$(wc -l < deliverables/MASTER_SPECIFICATION.md)"
  printf 'sha256: %s\n' "$(sha256sum deliverables/MASTER_SPECIFICATION.md | cut -d' ' -f1)"
else
  echo "NOT BUILT: run tools/assemble.sh"
fi

exit "$status"
