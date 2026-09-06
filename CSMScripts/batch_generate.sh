#!/bin/bash
# Batch generator for Acts 11, 12, 13
# Author: Jason Isaac Brodsky (California 1976) — Conducier

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GENERATOR="$SCRIPT_DIR/generate_act_content.py"

echo "========================================"
echo "Aegis Govt Acts - Batch Generator"
echo "Author: Jason Isaac Brodsky (California 1976) — Conducier"
echo "========================================"
echo ""

# Generate Act 11 (Workforce Green Jobs Act)
echo "=== ACT 11: Workforce Development and Green Jobs Act ==="
for sec in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14; do
    echo "--- Generating Section $sec ---"
    python3 "$GENERATOR" act11 "$sec"
done
echo ""

# Generate Act 12 (Energy Storage Grid Flexibility Act)
echo "=== ACT 12: Energy Storage and Grid Flexibility Act ==="
for sec in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14; do
    echo "--- Generating Section $sec ---"
    python3 "$GENERATOR" act12 "$sec"
done
echo ""

# Generate Act 13 (Critical Minerals Security Act)
echo "=== ACT 13: Critical Minerals Security and Domestic Supply Chain Act ==="
for sec in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14; do
    echo "--- Generating Section $sec ---"
    python3 "$GENERATOR" act13 "$sec"
done
echo ""

echo "========================================"
echo "All acts generated successfully!"
echo "========================================"
