#!/bin/bash
# Concatenate all masters into single document

MASTERS="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_ce94de82-0027-4c65-8007-804a488f0140/Subatomic/OrganizedLibrary/ConcatenatedMasters"
OUT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_ce94de82-0027-4c65-8007-804a488f0140/Subatomic/OrganizedLibrary"
OUTPUT="$OUT/masters_of_the_single_electron_world_line_universe.md"

# Order: Electron-first, then rest alphabetically
electron_files=(
"Emulating_Unique_Electron_Properties_MASTER.md"
"Electron_Neutrino_Deep_Dive_MASTER.md"
"Pines_Demon__Electron_Oscillation_Discovery_MASTER.md"
)

# Get remaining files
all_files=($(ls "$MASTERS"/*.md | xargs -n1 basename | sort))
remaining=()
for f in "${all_files[@]}"; do
    skip=0
    for ef in "${electron_files[@]}"; do
        if [ "$f" = "$ef" ]; then skip=1; fi
    done
    [ $skip -eq 0 ] && remaining+=("$f")
done

# Start output
cat > "$OUTPUT" <<'EOF'
# MASTERS OF THE SINGLE ELECTRON WORLD LINE UNIVERSE
## Complete Concatenation of All Particle Deep Dives
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")
**Structure:** Electron-first sequence → All other particles → Consolidated Citations

---

EOF

# Process electron files first
for f in "${electron_files[@]}"; do
    if [ -f "$MASTERS/$f" ]; then
        echo "Adding: $f"
        echo -e "\n\n# ═══════════════════════════════════════════════════════════════\n# $f\n# ═══════════════════════════════════════════════════════════════\n" >> "$OUTPUT"
        cat "$MASTERS/$f" >> "$OUTPUT"
    fi
done

# Process remaining files
for f in "${remaining[@]}"; do
    echo "Adding: $f"
    echo -e "\n\n# ═══════════════════════════════════════════════════════════════\n# $f\n# ═══════════════════════════════════════════════════════════════\n" >> "$OUTPUT"
    cat "$MASTERS/$f" >> "$OUTPUT"
done

# Extract and consolidate all citations at the end
echo -e "\n\n# ═══════════════════════════════════════════════════════════════\n# CONSOLIDATED CITATIONS & REFERENCES (ALL DOCUMENTS)\n# ═══════════════════════════════════════════════════════════════\n" >> "$OUTPUT"

# Extract PART V from each master
for f in "${electron_files[@]}" "${remaining[@]}"; do
    if [ -f "$MASTERS/$f" ]; then
        # Extract everything after "PART V:" or "CITATIONS"
        awk '/^# PART V:|^# CITATIONS/ {p=1} p {print}' "$MASTERS/$f" >> "$OUTPUT"
        echo -e "\n---\n" >> "$OUTPUT"
    fi
done

# Add universal references
cat >> "$OUTPUT" <<'EOF'

## Universal References (All Documents)

### Fundamental Constants & Standards
- CODATA 2022: Fundamental Physical Constants (NIST)
- FLAG 2024: Flavour Lattice Averaging Group - Lattice QCD Results
- PDG 2024: Particle Data Group Review of Particle Physics
- NuFIT 5.3: Neutrino Oscillation Parameters Global Fit

### Experimental Results 2022-2026
- LHC Run 3 (2022-2026): ATLAS, CMS, LHCb, ALICE results
- LIGO O4 (2023-2026): Gravitational Wave Observations
- KATRIN 2024: Neutrino Mass Constraints
- NIF 2022: Ignition Achievement
- HAYSTAC Phase II (2023): Quantum Squeezed States for Axion Search
- ORGAN 2023: Millikelvin Axion Haloscope at 26 GHz
- CASPEr-electric 2024: Axion-Nucleon Coupling Search
- JWST 2023-2024: Galaxy Morphology Constraints on Fuzzy Dark Matter
- IceCube 2023: Tau Neutrino Detection
- Pines' Demon 2023: Acoustic Plasmon Discovery
- Fermilab g-2 2023: Muon Anomalous Magnetic Moment

### Theoretical Frameworks
- Wheeler 1940: One-Electron Universe Hypothesis
- Gielerak 2020: Ontological Foundations of One-Particle Universe
- Dyson-Schwinger Equations (2022-2024 advances)
- AdS/CFT Correspondence Applications
- SMEFT: Standard Model Effective Field Theory
- Lattice QCD: FLAG 2024 Averages

### Simulation & Computational
- WebGPU Specification (W3C 2023+)
- WGSL Compute Shader Language
- Three.js r150+ / WebGL2
- Chart.js for Real-time Metrics

### Cross-Cutting Research Sources
- __GIT_NEW_INCOMING__/DeepResearch/ContentFiles (17 Swarm/Fluid Docs)
- __GIT_NEW_INCOMING__/DeepResearch/CONTENT.PDF/ContentFiles (100+ Physics/Geophysics Docs)

---

*End of Masters of the Single Electron World Line Universe*
*Total: 33 Master Documents Concatenated*
*Electron-First Ordering | All Citations Consolidated*
EOF

echo "Done! Output: $OUTPUT"
wc -l "$OUTPUT"