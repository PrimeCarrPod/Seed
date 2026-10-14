#!/usr/bin/env python3
"""
Slice CSMLogs.Incoming compilation logs into individual session logs by project.
"""

import os
import re
import shutil
from pathlib import Path
from datetime import datetime

INCOMING_DIR = Path("/workspace/app/CSMLogs.Incoming")
OUTPUT_DIR = Path("/workspace/app/CSMLogs")

# Project mapping based on keywords in logs
PROJECT_KEYWORDS = {
    "01_SubAtomic_Prime_Electron_Canonical": [
        "subatomic", "prime electron", "canonical", "prime_electron", "sub_atomic",
        "worldline", "hilbert", "mass spectrum", "couplings", "genetic code",
        "transcendent physics", "quark hadron", "cosmology astrophysics",
        "experimental signatures", "flagship", "prime gap", "worldline mapping",
        "subatomic prime electron"
    ],
    "02_Caldera_Prime_Pi_Electron": [
        "caldera", "prime pi", "pi electron", "caldera_prime", "spectral form",
        "dip ramp plateau", "holographic wormhole", "prime counting", "quantum worldline",
        "caldera prime pi"
    ],
    "03_Legal_Enactment": [
        "legal enactment", "legal act", "wildfire prevention", "grid resilience",
        "critical technology supply chain", "water infrastructure", "drought resilience",
        "coastal port", "cipa", "dcmia", "aneda", "cimtca", "btma", "wpgra", "crid",
        "master todo list", "legal architecture", "consolidated findings",
        "implementation timeline", "congressional", "insurance", "dossier",
        "csminsurance", "legal_acts"
    ],
    "04_TGApp_Ecosystem": [
        "bounce", "tgapp", "tardigradia", "monetization", "apk", "android",
        "build.sh", "aapt2", "d8", "zipalign", "apksigner", "keystore",
        "feature gate", "license", "firebase", "fleet", "billing",
        "new app runner", "create new app", "antikythera", "tghc.pro",
        "tgapp.wip", "tge_e1", "tge_e2", "tge_e3", "tge_e4"
    ],
    "05_Land_of_Lil": [
        "land of lil", "landolil", "three.js", "webgl", "shader", "visualization",
        "ultimate_land_o_lil"
    ],
    "06_SubAtomic_Extensions": [
        "subatomic extensions", "subatom_wip", "add to project"
    ],
    "07_DeepResearch_SubParticles": [
        "subparticles", "deep research", "glueball", "micro to macro",
        "microbial ecosystem", "swarm mechanics", "fluid dynamics",
        "tardigradia", "tgpu", "lol_v2", "lol_v3", "version", "axion",
        "subparticlesv3", "subparticlesv4", "particle physics"
    ],
    "08_Project_Tracking": [
        "master concurrent", "project tracking", "master todo", "resume session",
        "instructions", "heartbeat", "earthbeat", "subparticlereturntowork",
        "consolidated_wip", "csm_consolidated"
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
        "publishing", "subatomic prime electron caldera publish"
    ],
    "12_CSM_Cinema_Godot": [
        "csm cinema", "godot", "3d production", "cine"
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

# Session boundary markers for Kilo logs
SESSION_START_PATTERN = re.compile(r'Environment prepared[·\s]*\d+s?View details')
TIMESTAMP_PATTERN = re.compile(r'about \d+ (hours?|minutes?|seconds?) ago')
# Alternative pattern: timestamps like "5:54 PM" or "about X hours ago"
ALT_TIMESTAMP_PATTERN = re.compile(r'\d{1,2}:\d{2} (AM|PM)')

def detect_projects(text):
    """Detect which projects a log segment relates to."""
    text_lower = text.lower()
    detected = []
    for project, keywords in PROJECT_KEYWORDS.items():
        for kw in keywords:
            if kw.lower() in text_lower:
                detected.append(project)
                break
    return list(set(detected)) if detected else ["General_Sessions"]

def extract_rtf_text(rtf_content):
    """Extract plain text from RTF content."""
    text = rtf_content
    # Remove font table, color table, list tables
    text = re.sub(r'\{(\\fonttbl|\\colortbl|\\listtable|\\listoverridetable)[^}]*\}', '', text)
    # Remove RTF control words
    text = re.sub(r'\\[a-z]+\d*\s?', ' ', text)
    # Remove braces
    text = text.replace('{', '').replace('}', '')
    # Clean up whitespace
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def split_kilo_sessions(content):
    """Split Kilo session log format content into sessions."""
    # Try primary pattern first
    parts = SESSION_START_PATTERN.split(content)
    if len(parts) > 1:
        sessions = []
        for i, part in enumerate(parts[1:], 1):
            timestamp_match = TIMESTAMP_PATTERN.search(part)
            if not timestamp_match:
                timestamp_match = ALT_TIMESTAMP_PATTERN.search(part)
            timestamp = timestamp_match.group(0) if timestamp_match else f"session_{i}"
            sessions.append((timestamp, part.strip()))
        return sessions
    return None

def split_by_reasoning_blocks(content):
    """Split by 'Reasoning' blocks (alternative Kilo format)."""
    # Split by "Reasoning" followed by content
    parts = re.split(r'(?=Reasoning\s*\n)', content)
    sessions = []
    for i, part in enumerate(parts[1:], 1):  # Skip first empty/preamble
        if len(part.strip()) > 100:
            # Try to find a timestamp
            timestamp_match = TIMESTAMP_PATTERN.search(part)
            if not timestamp_match:
                timestamp_match = ALT_TIMESTAMP_PATTERN.search(part)
            timestamp = timestamp_match.group(0) if timestamp_match else f"reasoning_block_{i}"
            sessions.append((timestamp, part.strip()))
    return sessions if sessions else None

def process_as_single_doc(content, filepath, output_base):
    """Process content as a single document for detected projects."""
    projects = detect_projects(content)
    
    # Create filename from original file
    base_name = filepath.stem
    safe_name = re.sub(r'[^\w\s-]', '', base_name).strip()
    safe_name = re.sub(r'\s+', '_', safe_name)
    filename = f"{safe_name}.md"
    
    for project in projects:
        project_dir = output_base / project
        project_dir.mkdir(parents=True, exist_ok=True)
        output_path = project_dir / filename
        
        header = f"# Document: {filepath.name}\n"
        header += f"**Source:** {filepath.name}\n"
        header += f"**Projects:** {', '.join(projects)}\n"
        header += f"**Type:** Assignment/Runner/Reference Document\n"
        header += f"**Extracted:** {datetime.now().isoformat()}\n\n---\n\n"
        
        with open(output_path, 'w') as f:
            f.write(header + content)
    
    return len(projects)

def process_file(filepath, output_base):
    """Process a single log file and distribute sessions to project folders."""
    print(f"Processing {filepath.name}...")
    
    # Read file
    try:
        content = filepath.read_text(encoding='utf-8')
    except UnicodeDecodeError:
        try:
            content = filepath.read_text(encoding='latin-1')
        except:
            content = filepath.read_text(encoding='utf-8', errors='ignore')
    
    # Handle RTF/RTFD files
    if filepath.suffix in ['.rtf'] or 'rtfd' in str(filepath).lower():
        content = extract_rtf_text(content)
    
    # Skip if too small
    if len(content.strip()) < 200:
        print(f"  Skipping (too small)")
        return
    
    # Try to split as Kilo sessions
    sessions = split_kilo_sessions(content)
    
    if not sessions:
        # Try alternative splitting by Reasoning blocks
        sessions = split_by_reasoning_blocks(content)
    
    if sessions and len(sessions) > 1:
        print(f"  Found {len(sessions)} sessions")
        session_count = 0
        for timestamp, session_content in sessions:
            if len(session_content.strip()) < 100:
                continue
            
            projects = detect_projects(session_content)
            
            safe_timestamp = re.sub(r'[^\w\s-]', '', timestamp).strip()
            safe_timestamp = re.sub(r'\s+', '_', safe_timestamp)
            filename = f"session_{safe_timestamp}_{session_count}.md"
            
            for project in projects:
                project_dir = output_base / project
                project_dir.mkdir(parents=True, exist_ok=True)
                output_path = project_dir / filename
                
                header = f"# Session Log - {timestamp}\n"
                header += f"**Source:** {filepath.name}\n"
                header += f"**Projects:** {', '.join(projects)}\n"
                header += f"**Extracted:** {datetime.now().isoformat()}\n\n---\n\n"
                
                with open(output_path, 'w') as f:
                    f.write(header + session_content)
            
            session_count += 1
        print(f"  Wrote {session_count} session files")
    else:
        # Treat as single document (assignment/runner/reference)
        print(f"  Treating as single document")
        project_count = process_as_single_doc(content, filepath, output_base)
        print(f"  Assigned to {project_count} project(s)")

def main():
    # Process all files in incoming directory
    for filepath in INCOMING_DIR.iterdir():
        if filepath.is_file() and not filepath.name.startswith('.'):
            # Skip RTFD directories (they're bundles with TXT.rtf inside)
            if filepath.suffix == '.rtfd' or filepath.name.endswith('.rtfd'):
                if filepath.is_dir():
                    txt_file = filepath / "TXT.rtf"
                    if txt_file.exists():
                        process_file(txt_file, OUTPUT_DIR)
                continue
            process_file(filepath, OUTPUT_DIR)
    
    print("\nDone!")

if __name__ == "__main__":
    main()