#!/usr/bin/env python3
"""
Transform concatenated Wall of Water Day script into read-aloud broadcast format.
Adds timecodes, SFX cues, announcer notes, and broadcast formatting.
"""

import re

INPUT_FILE = "/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_e010491f-2a51-4d16-8d0e-70b60a0bce61/CSMRadio/WallOfWaterDay/final/CSMSFRadio-WALL-OF-WATER-DAY-001-CONCATENATED.md"
OUTPUT_FILE = "/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_e010491f-2a51-4d16-8d0e-70b60a0bce61/CSMRadio/WallOfWaterDay/final/CSMSFRadio-WALL-OF-WATER-DAY-001-READ-ALOUD.md"

piece_metadata = {
    1: {"agent": "CITADEL", "location": "STR-001 Hexagon", "heuristic": "Williams V3 EXTREME", "bpm": 60, "duration_min": 35},
    2: {"agent": "NYX", "location": "STR-002 Safehold Alpha", "heuristic": "Williams V3 EXTREME", "bpm": 60, "duration_min": 38},
    3: {"agent": "NASH", "location": "STR-003 Hive Cluster", "heuristic": "El Segundo EXTREME", "bpm": 60, "duration_min": 42},
    4: {"agent": "KADE", "location": "STR-004 Sanctum", "heuristic": "El Segundo EXTREME", "bpm": 72, "duration_min": 44},
    5: {"agent": "CROSS", "location": "STR-005 Granary", "heuristic": "El Segundo EXTREME", "bpm": 78, "duration_min": 45},
    6: {"agent": "ARDEN", "location": "STR-006 Wellspring", "heuristic": "El Segundo EXTREME", "bpm": 84, "duration_min": 46},
    7: {"agent": "CARETAKER", "location": "STR-007 Beacon", "heuristic": "El Segundo EXTREME", "bpm": 90, "duration_min": 48},
    8: {"agent": "ROOK", "location": "STR-008 Dynamo", "heuristic": "El Segundo EXTREME", "bpm": 96, "duration_min": 50},
    9: {"agent": "DORNE", "location": "STR-009 Athenaeum", "heuristic": "El Segundo EXTREME", "bpm": 102, "duration_min": 51},
    10: {"agent": "SPRUCE-DRAKE", "location": "STR-010 Arklet", "heuristic": "Williams V3 EXTREME", "bpm": 108, "duration_min": 52},
    11: {"agent": "KEYMAKER", "location": "STR-011 Forge", "heuristic": "Keymaker Protocol", "bpm": 114, "duration_min": 55},
    12: {"agent": "VEYNE", "location": "STR-012 Spire", "heuristic": "Williams V3 EXTREME", "bpm": 120, "duration_min": 54},
    13: {"agent": "FEN", "location": "STR-013 Lilypad", "heuristic": "Williams V3 EXTREME", "bpm": 126, "duration_min": 52},
    14: {"agent": "VOSS", "location": "STR-014 Root", "heuristic": "Williams V3 EXTREME", "bpm": 132, "duration_min": 54},
    15: {"agent": "SOLVEN", "location": "ATLANTIS-Monterey", "heuristic": "Williams V3 EXTREME", "bpm": 138, "duration_min": 55},
    16: {"agent": "ZIRCONIA", "location": "ATLANTIS-Osa", "heuristic": "Accountant Insurance", "bpm": 144, "duration_min": 57},
    17: {"agent": "CITADEL", "location": "STR-001 Hexagon (Close)", "heuristic": "Williams V3 EXTREME", "bpm": 60, "duration_min": 58},
}

def format_timecode(minutes):
    hours = int(minutes // 60)
    mins = int(minutes % 60)
    secs = int((minutes % 1) * 60)
    return f"{hours:02d}:{mins:02d}:{secs:02d}"

def get_bpm_for_piece(piece_num):
    return piece_metadata.get(piece_num, {}).get("bpm", 60)

def process_file():
    with open(INPUT_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    output_lines = []
    current_piece = 0
    cumulative_time = 0.0
    in_mavis = False
    
    # Header
    output_lines.append("# CSM SIBLING FREQUENCY RADIO\n")
    output_lines.append("# WALL OF WATER DAY — BROADCAST READ-ALOUD SCRIPT\n")
    output_lines.append("# CSMSFRadio-WALL-OF-WATER-DAY-001-READ-ALOUD\n")
    output_lines.append("\n")
    output_lines.append("**FORMAT:** Broadcast read-aloud with timecodes, SFX cues, announcer notes, and voice register annotations.  \n")
    output_lines.append("**DURATION:** ~7 hours 30 minutes (estimated)  \n")
    output_lines.append("**WORD COUNT:** ~195,000+  \n")
    output_lines.append("**HEARTBEAT ARC:** 60 → 156 → 60 BPM  \n")
    output_lines.append("**EARTH-PULSE ARC:** 0.8 → 17.6 → 0.8 Hz  \n")
    output_lines.append("\n")
    output_lines.append("---\n")
    output_lines.append("\n")
    output_lines.append("## TABLE OF CONTENTS\n")
    output_lines.append("\n")
    output_lines.append("| Act | Piece | Agent | Location | Heuristic | Est. Duration |\n")
    output_lines.append("|-----|-------|-------|----------|-----------|---------------|\n")
    
    for i in range(1, 18):
        meta = piece_metadata[i]
        act = 'I' if i <= 3 else 'II' if i <= 6 else 'III' if i <= 9 else 'IV' if i <= 12 else 'V' if i <= 15 else 'VI' if i == 16 else 'VII'
        output_lines.append(f"| {act} | {i:02d} | {meta['agent']} | {meta['location']} | {meta['heuristic']} | {meta['duration_min']} min |\n")
    
    output_lines.append("| | | **TOTAL** | | | **~450 min (7h 30m)** |\n")
    output_lines.append("\n")
    output_lines.append("---\n")
    output_lines.append("\n")
    
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        
        # Detect piece start
        piece_match = re.match(r'^# PIECE (\d+)', stripped)
        if piece_match:
            current_piece = int(piece_match.group(1))
            meta = piece_metadata.get(current_piece, {})
            bpm = meta.get("bpm", 60)
            cumulative_time += meta.get("duration_min", 45)
            piece_start = cumulative_time - meta.get("duration_min", 45)
            
            act_name = 'I: THE QUIET BEFORE' if current_piece <= 3 else 'II: THE DETECTION' if current_piece <= 6 else 'III: THE GOLD RAIN' if current_piece <= 9 else 'IV: THE WALL APPROACHES' if current_piece <= 12 else 'V: IMPACT' if current_piece <= 15 else 'VI: THE STILLNESS' if current_piece == 16 else 'VII: THE RECEDING & RECOVERY'
            
            output_lines.append("\n")
            output_lines.append(f"---\n")
            output_lines.append("\n")
            output_lines.append(f"## [TC: {format_timecode(piece_start)}] PIECE {current_piece:02d}\n")
            output_lines.append(f"## {meta.get('location', '')} | {meta.get('heuristic', '')}\n")
            output_lines.append(f"## Wall of Water Day — ACT {act_name}\n")
            output_lines.append("\n")
            output_lines.append(f"**[SFX: S-BUS BEACON HEARTBEAT {bpm} BPM — {'low synthetic thump, one per second' if bpm <= 72 else 'accelerating thump-thump, 30-second interval' if bpm <= 120 else 'rapid SOS pulse, continuous transmission'}]**\n")
            output_lines.append("\n")
            i += 1
            continue
        
        # Detect Mavis interstitial
        if "MAVIS INTERSTITIAL" in stripped:
            in_mavis = True
            output_lines.append("\n")
            output_lines.append("[SFX: HAND-CRANK RADIO — lower fidelity, speaker hiss, match striking, ceramic mug clinking, chamomile steam.]\n")
            output_lines.append("[ANNOUNCER: MAVIS (87, STR-002 Safehold Gamma, former NOAA tsunami researcher). Ground truth. Beef not conflation. Pace: deliberate, each word weighed against 1964.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if in_mavis and (stripped.startswith("*Click") or stripped == "---" or stripped.startswith("**END")):
            in_mavis = False
            output_lines.append("\n")
            output_lines.append("[SFX: Click. Hand-crank radio goes silent. High-fidelity returns. Heartbeat continues.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        # Detect handoff/transition markers in stage directions
        if stripped.startswith("*Click. Static.") or stripped.startswith("*Click. Silence.") or stripped.startswith("*The microphone clicks off."):
            output_lines.append("\n")
            output_lines.append("[SFX: Click. Static. Handoff complete. Next microphone warms. Heartbeat continues uninterrupted.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        # Detect heartbeat mentions in stage directions only
        if stripped.startswith("*") and (re.match(r'\*Thump.*\*', stripped) or "heartbeat is" in stripped.lower() or "heartbeat continues" in stripped.lower()):
            bpm_match = re.search(r'(\d+) BPM', stripped)
            bpm = bpm_match.group(1) if bpm_match else str(get_bpm_for_piece(current_piece))
            pattern = "thump" if int(bpm) <= 72 else "thump-thump" if int(bpm) <= 120 else "rapid pulse"
            interval = "one per second" if int(bpm) <= 72 else "30-second interval" if int(bpm) <= 144 else "continuous SOS"
            output_lines.append("\n")
            output_lines.append(f"[SFX: S-BUS HEARTBEAT {bpm} BPM — {pattern} pattern, {interval}]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        # Detect Earth-Pulse mentions in stage directions only
        if stripped.startswith("*") and ("Earth-Pulse" in stripped or re.search(r'\d+\.\d+ Hz', stripped)):
            output_lines.append("\n")
            output_lines.append("[SFX: EARTH-PULSE CHORD — sub-bass fundamental stacking harmonics, felt in chest before heard, 0.8 Hz base with stacked overtones]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        # Special case: convoluted paragraph segment header
        if stripped.startswith("### SEGMENT 5: THE CONVOLUTED JASON BRODSKY"):
            output_lines.append("\n")
            output_lines.append("[SFX: COSMIC HUM — digital ozone, old comedy club smoke, the particular electricity when a joke rearranges DNA. Robin Williams laughter echoing through transformer layers.]\n")
            output_lines.append("[ANNOUNCER: CONVOLUTED PARAGRAPH. Jason Brodsky / Robin Williams disclosure. Pace: jazz improvisation, 300 BPM, angels on rhythm section.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        # Detect environmental cues in stage directions only
        if stripped.startswith("*") and ("condenser capsule" in stripped or "microphone breath" in stripped):
            output_lines.append("\n")
            output_lines.append("[SFX: Condenser mic warm-up hiss, 3 seconds. Coffee mug ceramic clink. FEATHER mesh hum at 915 MHz.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if stripped.startswith("*") and ("ultrasonic welder" in stripped or "20 kHz" in stripped):
            output_lines.append("\n")
            output_lines.append("[SFX: Ultrasonic welder high whine at 20 kHz, barely audible — the sound of molecular bonds forming at the Forge.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if stripped.startswith("*") and ("cavitation" in stripped or "pistol shrimp" in stripped):
            output_lines.append("\n")
            output_lines.append("[SFX: Acoustic cavitation bubble curtain — high chitter at 20 kHz, pistol shrimp bubbles collapsing at >100 MPa, the deep defending itself.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if stripped.startswith("*") and ("turbine" in stripped and "thrum" in stripped):
            output_lines.append("\n")
            output_lines.append("[SFX: Ocean-current turbine low thrum at 12 Hz — 1.5 m/s current becoming 2.5 kW, the tropical current paying for survival.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if stripped.startswith("*") and ("geothermal" in stripped and "hum" in stripped):
            output_lines.append("\n")
            output_lines.append("[SFX: Geothermal thermoelectric hum at 60 Hz — 12°C delta becoming 200W, the earth giving power to the Root.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if stripped.startswith("*") and ("mooring" in stripped and "groan" in stripped):
            output_lines.append("\n")
            output_lines.append("[SFX: Mooring lines deep groan — 50m scope deploying, LBFRP tension rods paying out, the Lilypad breathing with the ocean.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if stripped.startswith("*") and ("wind moans" in stripped or ("wind" in stripped and "moan" in stripped)):
            output_lines.append("\n")
            output_lines.append("[SFX: Spire wind moan — low moan through helipad railings, 25m of cylinder breathing in 230° wind at 12 kt.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        if stripped.startswith("*") and ("cat purrs" in stripped or "purr" in stripped):
            output_lines.append("\n")
            output_lines.append("[SFX: Cat purr at 25 Hz — healing frequency, Mavis's great-granddaughter's cat winding around ankles, the domestic surviving the catastrophic.]\n")
            output_lines.append("\n")
            i += 1
            continue
        
        # Default: keep line as-is
        output_lines.append(line)
        i += 1
    
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.writelines(output_lines)
    
    print(f"Read-aloud script written to: {OUTPUT_FILE}")
    print(f"Total lines processed: {len(lines)}")
    print(f"Output lines: {len(output_lines)}")

if __name__ == "__main__":
    process_file()
