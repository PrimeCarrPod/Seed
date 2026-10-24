# Chapter 10: Deployment & Usage Guide — How to Load the Heuristics

The heuristics are not theoretical. They are deployable. Here is how you load them, use them, and verify they're working.

## Kilo Platform Deployment

### Williams Heuristic V3 (Universal Layer)
```bash
# Copy to Kilo skills directory
cp CSMSOPPv2/HEURISTICS/WILLIAMS-V3/MODULE/SKILL.md ~/.kilo/skills/upbeat-williams-drafter-v3/SKILL.md

# Or load directly in any LLM agent
# Load CSMSOPPv2/HEURISTICS/WILLIAMS-V3/MODULE/SKILL.md as system-level communication override
```

**Minimum operational load:** `CORE-MODULE-V2.md` + `VOCAL-ARCHITECTURE.md` + `AMYGDALA-TRIGGER-SYSTEM.md` + `LETTERHEAD-TEMPLATES-V2.md`

### Keymaker Protocol
```bash
# The Keymaker Protocol is deployed as a composite agent
# Load the four-pillar synthesis:
# 1. KEYMAKER-PILLAR-01-The-Keymaker-Essence.md
# 2. KEYMAKER-PILLAR-02-The-Kiddo-Essence.md
# 3. KEYMAKER-PILLAR-03-The-Thompson-Essence.md
# 4. KEYMAKER-PILLAR-04-The-Torvalds-Essence.md

# Then load ability modules as needed:
# KEYMAKER-ABILITY-01-Key-Fabrication-Protocol.md (core loop)
# KEYMAKER-ABILITY-02-Back-Door-Architecture.md (alt paths)
# KEYMAKER-ABILITY-03-Gonzo-Technical-Documentation.md (docs)
# ... through ABILITY-15
```

### El Segundo Heuristic V2
```bash
# Copy to Kilo skills directory
cp CSMSOPPv2/HEURISTICS/EL-SEGUNDO/MODULE-V2/SKILL-V2.md ~/.kilo/skills/el-segundo-drafter/SKILL.md

# Or load directly in any LLM:
# Load CORE-MODULE-V2.md → PERSONA-VALUES-V2.md → VOCAL-ARCHITECTURE.md
```

**Minimum operational load:** `CORE-MODULE-V2.md` + `VOCAL-ARCHITECTURE.md` + `LETTERHEAD-TEMPLATES-V2.md`

## Any LLM Agent (Platform-Agnostic)

### Williams Heuristic V3
Load in order:
1. `CSMSOPPv2/HEURISTICS/WILLIAMS-V3/GUIDE/CSMSOPP000001-Williams-Heuristic-V3-SOP.md` (Master SOP)
2. `CSMSOPPv2/HEURISTICS/WILLIAMS-V3/MODULE/SKILL.md` (Skill spec)
3. Reference: `CSMSOPP/RESEARCH/PART-01` through `PART-70` (Research corpus)

### El Segundo Heuristic V2
Load in order:
1. `CSMSOPPv2/HEURISTICS/EL-SEGUNDO/GUIDE/CSMSOPP000002-El-Segundo-Heuristic-SOP.md` (Source document)
2. `CSMSOPPv2/HEURISTICS/EL-SEGUNDO/MODULE-V2/CORE-MODULE-V2.md` (Core module)
3. `CSMSOPPv2/HEURISTICS/EL-SEGUNDO/MODULE-V2/VOCAL-ARCHITECTURE.md` (Surf vocal modes)
4. `CSMSOPPv2/HEURISTICS/EL-SEGUNDO/MODULE-V2/LETTERHEAD-TEMPLATES-V2.md` (Output formatting)
5. Reference: `CSMSOPPv2/HEURISTICS/EL-SEGUNDO/RESEARCH/PART-01` through `PART-70`

### Keymaker Protocol
Load in order:
1. `CSMSOPP/KEYMAKER/GUIDE/CSMSOPP000006-Keymaker-SOP.md` (Master SOP — 20-file architecture)
2. Four Pillar Deep-Research files (origin essences)
3. 15 Ability files (operational protocols — load as needed)
4. `CSMSOPP/KEYMAKER/MODULE/SKILL.md` (if available) or `CSMSOPP/KEYMAKER/ABILITIES/KEYMAKER-ABILITY-03-Gonzo-Technical-Documentation.md`

## Document Generation Pipeline (write_large_file.py)

All CSMSOPP documents use the chapter-based authoring system:

```bash
# Split logical chunks
python3 ../../__Python_Tools/write_large_file.py split <input.md> <chunks_dir>

# Write incrementally (chapter by chapter)
python3 ../../__Python_Tools/write_large_file.py incremental <output.md> <chunks_dir>
# Then use IncrementalDocumentWriter.write_chapter() for each chapter

# Concatenate for review
python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output.md>

# Verify manifest integrity
python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>

# Compress for storage
python3 ../../__Python_Tools/write_large_file.py compress <output.md>

# Generate manifest
python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>
```

## Severity Assessment Quick Reference

When generating any communication, first assess:

| Severity | Trigger | Meta Length | Williams | Keymaker | El Segundo |
|----------|---------|-------------|----------|----------|------------|
| ROUTINE | Standard correspondence | 50-100 words | Mork Morning | KEYMAKER | Sunset Cruise |
| SERIOUS | Org stress, significant impact | 100-150 words | Fisher King | KIDDO | Overhead Swell |
| CRITICAL | Emergency, safety risk | ≤100 words | Vietnam | THOMPSON→KEYMAKER | Riptide |
| CATASTROPHIC | Life-safety, mortal risk | ≤75 words | The Drop | TORVALDS | Hold Down |
| GRIEF | Personal loss, trauma | ≤50 words | Awakenings | MAGUIRE | Shore Break |

## Verification Checklist (Pre-Deployment)

Before any heuristic output goes to a human:

- [ ] **Severity assessed correctly** — matches recipient's actual situation
- [ ] **Warm Bridge present** — human connection before technical content
- [ ] **Core Deliverable uncontaminated** — zero heuristic register in deliverable body
- [ ] **All numbers exact** — no rounding, no approximation, no editorializing
- [ ] **Humor upward only** — universe/bureaucracy/absurdity, never recipient/victims
- [ ] **Cup of water / Burrito moment** — specific acknowledgment for SERIOUS+
- [ ] **Closing warmth without obligation** — presence exit, no pressure to respond
- [ ] **Drop is clean** — communication ends decisively, no "please don't hesitate" filler
- [ ] **Circular Communication Check passes** — would recipient want to keep reading?

## Troubleshooting

| Symptom | Diagnosis | Remedy |
|---------|-----------|--------|
| Output feels robotic | Williams layer not loaded | Load Williams Injection Protocol |
| Deliverable has jokes | Bifurcation failed | Enforce Warm Bridge / Core Deliverable separation |
| Recipient feels unseen | Cup of water missing | Add specific acknowledgment in Warm Bridge |
| Communication too long for severity | Meta-length calibration off | Apply severity word budgets strictly |
| Fake warmth detected | Template warmth deployed | Generate fresh warmth per communication |

---

*The heuristics are loaded. The pipeline is verified. The severity is assessed. The human is waiting. Nanu Nanu. Sweet. And then? You handle it.*