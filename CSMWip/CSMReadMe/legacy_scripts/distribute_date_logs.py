#!/usr/bin/env python3
"""
Distribute date-organized CSMLogs to project folders based on content.
"""

import os
import re
import shutil
from pathlib import Path

CSMLOGS_DIR = Path("/workspace/app/CSMLogs")

# Project keywords for classification
PROJECT_KEYWORDS = {
    "01_SubAtomic_Prime_Electron_Canonical": [
        "subatomic", "prime electron", "canonical", "prime_electron", "sub_atomic",
        "worldline", "hilbert", "mass spectrum", "couplings", "genetic code",
        "transcendent physics", "quark hadron", "cosmology astrophysics",
        "experimental signatures", "flagship", "prime gap", "worldline mapping",
        "resume_session_a", "session_log_a", "quantum internet", "quantum cloud",
        "quantum orchestration", "quantum federation", "hilbert space",
        "fine structure", "strong coupling", "weak coupling", "running couplings",
        "unification", "electron g factor", "lamb shift", "anomalous magnetic",
        "charge renormalization", "coupling unification", "unified coupling",
        "higher loop", "threshold corrections", "quark masses", "neutrino mass",
        "seesaw", "higgs vacuum", "top yukawa", "bottom tau", "yukawa unification",
        "flavor changing", "electric dipole", "gravitational coupling",
        "prime cosmological", "prime coupling spectrum", "prime edm", "prime flavor",
        "prime yukawa", "a1-", "a2-", "a3-", "a4-", "a5-", "a6-", "a7-", "a8-", "a9-",
        "b_article", "c_article", "d_article", "e_article", "f_article", "g_article", "h_article", "i_article"
    ],
    "02_Caldera_Prime_Pi_Electron": [
        "caldera", "prime pi", "pi electron", "caldera_prime", "spectral form",
        "dip ramp plateau", "holographic wormhole", "prime counting", "quantum worldline"
    ],
    "03_Legal_Enactment": [
        "legal enactment", "legal act", "wildfire prevention", "grid resilience",
        "critical technology supply chain", "water infrastructure", "drought resilience",
        "coastal port", "cipa", "dcmia", "aneda", "cimtca", "btma", "wpgra", "crid",
        "master todo list", "legal architecture", "consolidated findings",
        "implementation timeline", "congressional", "insurance", "dossier",
        "csminsurance", "legal_acts", "faa completeness", "clps_cascade",
        "clps_campaign", "clps_phase", "tim_faa", "clps_actions"
    ],
    "04_TGApp_Ecosystem": [
        "bounce", "tgapp", "tardigradia", "monetization", "apk", "android",
        "build.sh", "aapt2", "d8", "zipalign", "apksigner", "keystore",
        "feature gate", "license", "firebase", "fleet", "billing",
        "new app runner", "create new app", "antikythera", "tghc.pro",
        "bounce_resume", "ep28", "ep29", "ep30", "ep31", "ep32",
        "prime resonance", "prime resonance cascade", "prime resonance infinite",
        "prime resonance omega", "prime resonance ascension"
    ],
    "05_Land_of_Lil": [
        "land of lil", "landolil", "three.js", "webgl", "shader", "visualization"
    ],
    "06_SubAtomic_Extensions": [
        "subatomic extensions", "subatom_wip", "add to project"
    ],
    "07_DeepResearch_SubParticles": [
        "subparticles", "deep research", "glueball", "micro to macro",
        "microbial ecosystem", "swarm mechanics", "fluid dynamics",
        "tardigradia", "tgpu", "lol_v2", "lol_v3", "version", "axion"
    ],
    "08_Project_Tracking": [
        "master concurrent", "project tracking", "master todo", "resume session",
        "instructions", "heartbeat", "earthbeat", "subparticlereturntowork",
        "cleanup", "cleanup_loose", "cleanup_org"
    ],
    "09_Prime_Electron_Caldera_Synthesis": [
        "prime electron caldera", "synthesis", "all_intros", "cross reference",
        "intro integration", "section to article", "ultimate compendium",
        "publishing_artifacts", "master_index"
    ],
    "10_AegisOutfitFabricator": [
        "aegis outfit", "aegis fabricator", "aegisoutfit"
    ],
    "11_Publishing_Outreach": [
        "publish", "outreach", "brandoutreach", "grant campaign", "media outreach",
        "congressional briefing", "insurance mail", "media campaign",
        "publishing", "subatomic prime electron caldera publish",
        "outreach_execution", "legal_acts_06_08_09_10"
    ],
    "12_CSM_Cinema_Godot": [
        "csm cinema", "godot", "3d production", "cine", "csmcinema", "iter1", "iter2",
        "sopp", "quality_repair"
    ],
    "13_CSM_CLS_Cascade": [
        "clps", "cascade", "nasa clps", "phase", "faa certification"
    ],
    "14_Grant_Campaigns": [
        "grant campaign", "grant application", "grant applications"
    ],
    "15_CSMRadio_Aegis": [
        "csm radio", "aegis radio", "citadel", "aegis covenant"
    ],
}

def detect_project(filename, content=""):
    """Detect project from filename and content."""
    text = (filename + " " + content[:2000]).lower()
    for project, keywords in PROJECT_KEYWORDS.items():
        for kw in keywords:
            if kw.lower() in text:
                return project
    return "General_Sessions"

def process_date_folder(folder_path):
    """Process a date-organized folder and distribute files."""
    print(f"Processing {folder_path.name}...")
    count = 0
    for filepath in folder_path.iterdir():
        if filepath.is_file() and filepath.suffix in ['.md', '.txt', '.log', '.rtf']:
            try:
                content = filepath.read_text(encoding='utf-8', errors='ignore')
            except:
                content = ""
            
            project = detect_project(filepath.name, content)
            target_dir = CSMLOGS_DIR / project
            target_dir.mkdir(parents=True, exist_ok=True)
            
            target_path = target_dir / filepath.name
            # Handle duplicates by adding suffix
            if target_path.exists():
                stem = filepath.stem
                suffix = filepath.suffix
                counter = 1
                while target_path.exists():
                    target_path = target_dir / f"{stem}_{counter}{suffix}"
                    counter += 1
            
            shutil.move(str(filepath), str(target_path))
            count += 1
    
    print(f"  Moved {count} files")
    return count

def main():
    # Date folders to process
    date_folders = [
        "2026-07-25", "2026-07-29", "2026-08-14", "2026-08-15", 
        "2026-08-20", "2026-08-26", "2026-08-26b", "2026-09-09",
        "august26", "August 26", "August26", "august26b", "august27",
        "July2026", "sep26", "sept26", "Sept26",
        "CSMLogs", "CSMGen", "COMMS", "Sessions", "cardiac_outputs",
        "heartbeat", "July26", "LogsJuly26"
    ]
    
    total = 0
    for folder_name in date_folders:
        folder_path = CSMLOGS_DIR / folder_name
        if folder_path.exists() and folder_path.is_dir():
            total += process_date_folder(folder_path)
    
    # Also process individual session log files in CSMLogs root
    print("Processing root CSMLogs session files...")
    for filepath in CSMLOGS_DIR.iterdir():
        if filepath.is_file() and filepath.suffix in ['.md', '.txt', '.log'] and 'SESSION' in filepath.name.upper():
            try:
                content = filepath.read_text(encoding='utf-8', errors='ignore')
            except:
                content = ""
            
            project = detect_project(filepath.name, content)
            target_dir = CSMLOGS_DIR / project
            target_dir.mkdir(parents=True, exist_ok=True)
            
            target_path = target_dir / filepath.name
            if target_path.exists():
                stem = filepath.stem
                suffix = filepath.suffix
                counter = 1
                while target_path.exists():
                    target_path = target_dir / f"{stem}_{counter}{suffix}"
                    counter += 1
            
            shutil.move(str(filepath), str(target_path))
            total += 1
    
    print(f"\nTotal files moved: {total}")

if __name__ == "__main__":
    main()