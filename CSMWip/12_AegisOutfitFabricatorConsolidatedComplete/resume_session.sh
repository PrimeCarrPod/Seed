#!/usr/bin/env bash
# resume_session.sh — reproducible completion / verification pass.
#
# Run from anywhere:
#   bash /path/to/12_AegisOutfitFabricatorConsolidatedComplete/resume_session.sh
#
# It rebuilds the generated artifacts from the product files, refreshes the .gz
# twins, regenerates the checksum manifest, and runs the quality-gate audit.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

echo "== Aegis Outfit Fabricator — complete specification set =="
echo "root: $ROOT"
echo

if ! command -v node >/dev/null 2>&1; then
  echo "ERROR: node is required (quality gates and compendium builder)."
  exit 1
fi
if ! command -v gzip >/dev/null 2>&1; then
  echo "ERROR: gzip is required (storage twins)."
  exit 1
fi

echo "== 1. Rebuild compendium and parts =="
node tools/build_compendium.js .

echo
echo "== 2. Assemble master deliverable =="
bash tools/assemble.sh

echo
echo "== 3. Refresh gzip twins =="
count=0
while IFS= read -r -d '' f; do
  gzip -9 -c "$f" > "$f.gz"
  count=$((count + 1))
done < <(find . -type f -name '*.md' \
  ! -path './.git/*' \
  ! -path './deliverables/*' \
  ! -name 'MANIFEST.sha256' -print0)
echo "refreshed $count .gz twins"

echo
echo "== 4. Regenerate manifest =="
bash tools/make_manifest.sh

echo
echo "== 5. Verify manifest, gates, and deliverable =="
bash tools/verify.sh

echo
echo "Completion pass finished."
