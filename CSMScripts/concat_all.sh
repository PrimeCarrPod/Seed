#!/bin/bash
# Concatenate all SubAtomic Prime Electron research files

OUTPUT="CSM_WORK_IN_PROGRESS/SubAtom_WIP/PRIME_ELECTRON_COMPLETE_RESEARCH.md"
echo "# PRIME ELECTRON RESEARCH — COMPLETE CONCATENATED DOCUMENT" > "$OUTPUT"
echo "## Generated: $(date -u +'%Y-%m-%d %H:%M:%S UTC')" >> "$OUTPUT"
echo "## Author: Jason Isaac Brodsky (California 1976, Author Conducier)" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "---" >> "$OUTPUT"
echo "" >> "$OUTPUT"

add_file() {
    local file="$1"
    local title="$2"
    if [[ -f "$file" ]]; then
        echo "" >> "$OUTPUT"
        echo "---" >> "$OUTPUT"
        echo "" >> "$OUTPUT"
        echo "## $title" >> "$OUTPUT"
        echo "" >> "$OUTPUT"
        cat "$file" >> "$OUTPUT"
        echo "" >> "$OUTPUT"
    fi
}

# Foundation
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/ULTRA_MASTER_TODO_LIST.md" "ULTRA MASTER TODO LIST"
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/REPOSITORY_ORGANIZATION_MANIFEST.md" "REPOSITORY ORGANIZATION MANIFEST"
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/METHODOLOGY_Prime_Gap_To_Worldline_Mapping.md" "METHODOLOGY"
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/FOUNDATION_Prime_Electron_One_Electron_Universe.md" "FOUNDATION"

# Flagships
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/FLAGSHIP_PrimeElectron_Framework.md" "FLAGSHIP: PRIME ELECTRON FRAMEWORK"
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/FLAGSHIP_Alpha_BasePi.md" "FLAGSHIP: BASE-PI"
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/FLAGSHIP_Alpha_From_Primes.md" "FLAGSHIP: ALPHA (DEPRECATED)"

# Articles 1-9
for article in A B C D E F G H I; do
    case $article in
        A) name="WORLDLINE TOPOLOGY"; pattern="A_Article*_Worldline" ;;
        B) name="MASS SPECTRUM"; pattern="B_Article*_MassSpectrum" ;;
        C) name="HILBERT SPACE"; pattern="C_Article*_HilbertSpace" ;;
        D) name="COUPLING CONSTANTS"; pattern="D_Article*_Couplings" ;;
        E) name="BIOLOGY/GENETICS"; pattern="E_Article*" ;;
        F) name="TRANSCENDENT PHYSICS"; pattern="F_Article*_TranscendentPhysics" ;;
        G) name="QUARK HADRON NUCLEAR"; pattern="G_Article*_QuarkHadronNuclear" ;;
        H) name="COSMOLOGY"; pattern="H_Article*_CosmologyAstrophysics" ;;
        I) name="EXPERIMENTAL SIGNATURES"; pattern="I_Article*_ExperimentalSignatures" ;;
    esac
    
    echo "" >> "$OUTPUT"
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "# ARTICLE $article: $name" >> "$OUTPUT"
    
    for f in CSM_WORK_IN_PROGRESS/SubAtom_WIP/$pattern/full/*.md; do
        add_file "$f" "$(basename "$f" .md)"
    done
done

# Supporting docs
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/ACTION_PLAN.md" "ACTION PLAN"
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/GRANT_APPLICATIONS.md" "GRANT APPLICATIONS"
add_file "CSM_WORK_IN_PROGRESS/SubAtom_WIP/EMAILS_FOR_OUTREACH.md" "EMAILS"

wc -l "$OUTPUT"
du -h "$OUTPUT"
echo "Done: $OUTPUT"
