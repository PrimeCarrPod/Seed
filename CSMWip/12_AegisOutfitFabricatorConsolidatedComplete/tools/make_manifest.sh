#!/usr/bin/env bash
# make_manifest.sh — regenerate MANIFEST.sha256 for every file in this folder.
#
# Skips .git and the manifest itself. Include the .gz twins so storage copies stay
# verifiable.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

find . -type f \
  ! -path './.git/*' \
  ! -name 'MANIFEST.sha256' \
  -print0 \
  | sort -z \
  | xargs -0 sha256sum > MANIFEST.sha256

printf 'wrote MANIFEST.sha256 (%s files)\n' "$(wc -l < MANIFEST.sha256)"
