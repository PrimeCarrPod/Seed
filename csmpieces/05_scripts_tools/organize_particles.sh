#!/bin/bash
# Organize all particle documents into structured library

SRC="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_ce94de82-0027-4c65-8007-804a488f0140/Subatomic/SubAtomic.Edu/SubParticlesV1"
DST="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_ce94de82-0027-4c65-8007-804a488f0140/Subatomic/OrganizedLibrary/Particles"

cd "$SRC"

# Array of particle topics
topics=(
"Axion Deep Dive Emulation"
"Baryon Deep Dive_ One-Particle Universe"
"Boson Deep Dive Architecture Emulation"
"Boson Deep Dive_ A Universe"
"Dark Matter Deep Dive Simulation"
"Deep Dive_ Benevolent Neutralinos"
"Deep Dive_ One-Quark Universe Architecture"
"Deep Dive_ Tau Neutrino Universe"
"Deep Dive_ Tau Particle Benevolence"
"Electron Neutrino Deep Dive"
"Emulating Unique Electron Properties"
"Gauge Boson Deep Dive Request"
"Gluon Deep Dive Emulation Request"
"Graviton Deep Dive Technical Report"
"Hadrons Deep Dive Request"
"Higgs Boson Deep Dive Emulation"
"Kaon Deep Dive_ A Computational Model"
"Lepton Deep Dive_ One-Lepton Universe"
"Magneton Deep Dive_ Benevolent Monopole"
"Muon Deep Dive_ One-Particle Universe"
"Muon Neutrino Deep Dive Simulation"
"Neutron Deep Dive_ One-Nucleon Universe"
"OEU_ Benevolent Particle Overpressure"
"Particle Fusion Deep Dive Request"
"Photon Deep Dive Request"
"Pines Demon_ Electron Oscillation Discovery"
"Pion Deep Dive_ One-Pion Universe"
"Proton Deep Dive Emulation"
"Scalar Boson Deep Dive Request"
"Seven-Dimensional Universe Research Request"
"Strong Force Deep Dive Request"
"Vibrational Transference Deep Dive"
"W Z Boson Deep Dive Simulation"
)

for topic in "${topics[@]}"; do
    echo "Processing: $topic"
    
    # v1.0 - original PDF (seed document)
    cp "v1.0$topic.pdf" "$DST/$topic/v1.0/" 2>/dev/null
    
    # v2.0 - markdown and PDF
    cp "v1.0$topic V2.0.md" "$DST/$topic/v2.0/" 2>/dev/null
    cp "v1.0$topic V2.0.pdf" "$DST/$topic/v2.0/" 2>/dev/null
    
    # v1to2 versioning - markdown and PDF
    cp "v1.0$topic v1to2 Versioning.md" "$DST/$topic/v1to2/" 2>/dev/null
    cp "v1.0$topic v1to2 Versioning.pdf" "$DST/$topic/v1to2/" 2>/dev/null
done

# Copy the 4 PDFs without V2.0 to cross-cutting folders
echo "Processing cross-cutting PDFs..."
cp "Glueball Single Electron Theory Synthesis.pdf" "$DST/../CrossCutting/GlueballTheory/v1.0/"
cp "Micro to Macro Particle Physics.pdf" "$DST/../CrossCutting/MicroToMacro/v1.0/"
cp "Microbial Ecosystem Food Chains.pdf" "$DST/../CrossCutting/MicrobialEcosystem/v1.0/"
cp "Swarm Mechanics and Fluid Dynamics.pdf" "$DST/../CrossCutting/SwarmMechanics/v1.0/"

echo "Done copying from SubParticlesV1"