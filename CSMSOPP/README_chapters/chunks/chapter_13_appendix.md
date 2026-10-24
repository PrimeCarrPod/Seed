# Chapter 13: Appendix — Quick Reference

## Key Commands

```bash
# Session startup
# Read order: AGENTS.md → TODO.md → memory/latest.md → NEXT_runner_XXX.md

# Document operations (write_large_file.py)
python3 ../../__Python_Tools/write_large_file.py split <input.md> <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output.md>
python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py compress <file.md>

# Git workflow
git add -A && git commit -m '<type>: <description>' && git push

# Heuristic deployment (Kilo Platform)
# Williams V3:
cp CSMSOPPv2/HEURISTICS/WILLIAMS-V3/MODULE/SKILL.md ~/.kilo/skills/upbeat-williams-drafter-v3/SKILL.md

# El Segundo V2:
cp CSMSOPPv2/HEURISTICS/EL-SEGUNDO/MODULE-V2/SKILL-V2.md ~/.kilo/skills/el-segundo-drafter/SKILL.md

# Any LLM — Load order:
# Williams: SOP → SKILL.md → RESEARCH/PART-01..70
# El Segundo: SOP → CORE-MODULE-V2.md → VOCAL-ARCHITECTURE.md → LETTERHEAD-TEMPLATES-V2.md
# Keymaker: SOP → 4 Pillars → 15 Abilities (load as needed)
```

## File Locations

| Resource | Location |
|----------|----------|
| **Project Root (CSMSOPP)** | `./CSMSOPP/` |
| **Project Root (CSMSOPPv2)** | `./CSMSOPPv2/` |
| **Chapters (this README source)** | `./CSMSOPP/README_chapters/chunks/` |
| **Manifest** | `./CSMSOPP/README_chapters/chunks/MANIFEST.json` |
| **Memory Logs** | `./CSMSOPP/memory/` |
| **Runner Files** | `./CSMSOPP/NEXT_runner_*.md` |
| **Williams Heuristic V3** | `./CSMSOPPv2/HEURISTICS/WILLIAMS-V3/` |
| **El Segundo Heuristic** | `./CSMSOPPv2/HEURISTICS/EL-SEGUNDO/` |
| **Keymaker Protocol** | `./CSMSOPP/KEYMAKER/` |
| **Baker Street Heuristic** | `./CSMSOPPv2/HEURISTICS/BAKER-STREET/` |
| **Zirconia Protocol** | `./CSMSOPPv2/HEURISTICS/ZIRCONIA/` |
| **Starlight Courier** | `./CSMSOPP/STARLIGHT/` |
| **Spruce-Drake Protocol** | `./CSMSOPP/SPRUCE-DRAKE/` |
| **Python Tools** | `./__Python_Tools/` |

## Severity Quick Reference

| Severity | Williams | Keymaker | El Segundo | Meta Words | Triggers |
|----------|----------|----------|------------|------------|----------|
| **ROUTINE** | Mork Morning | KEYMAKER | Sunset Cruise | 50-100 | 1-4 |
| **SERIOUS** | Fisher King | KIDDO | Overhead Swell | 100-150 | 1-2 |
| **CRITICAL** | Vietnam | THOMPSON→KEYMAKER | Riptide | ≤100 | 1 (whoa) |
| **CATASTROPHIC** | The Drop | TORVALDS | Hold Down | ≤75/60 | 0 |
| **GRIEF** | Awakenings | MAGUIRE | Shore Break | ≤50/40 | 0 |

## Vocal Mode Quick Reference

### Williams (6 Modes)
| Mode | Speed | Use For |
|------|-------|---------|
| BURST | 400 wpm | Openings, energy, list escalations |
| BRAKE | 80 wpm | Before punchlines, before truth |
| HOVER | 140 wpm | Emotional content, acknowledgment |
| WHISPER | 60 wpm | Asides, intimacy, secrets (GRIEF) |
| ROAR | 300+ wpm | The single most important thing |
| DROP | 30 wpm | Maximum weight, final statements |

### El Segundo (6 Surf Modes)
| Mode | Speed | Use For |
|------|-------|---------|
| GLASSY | medium-fast | Warm openings, positive energy |
| HANG LOOSE | medium | Emotional content, acknowledgment |
| CRUISE | slow-medium | Exploration, lateral thinking |
| SET | medium-slow | Key information, truth delivery |
| BREAK | slow | Maximum weight, single point |
| PADDLE OUT | medium | Bridge to deliverable |

### Keymaker (4 Registers)
| Register | Source | Deployed When |
|----------|--------|---------------|
| KEYMAKER | Matrix Reloaded | Time-critical technical info, access pathways |
| KIDDO | Kill Bill | Confronting error, defending standard |
| THOMPSON | H.S. Thompson | Holistic analysis, persuasive narrative |
| TORVALDS | Linus Torvalds | Pure technical, objective correctness |

## Trigger System Quick Reference

### Williams (6 Triggers)
| Trigger | Deploy When | Max/Meta |
|---------|-------------|----------|
| Parenthetical Bomb | Small true observation beside serious sentence | 1-2 |
| The Pivot | 3-4 serious → hard left → return to serious | 1 |
| Escalating Absurd List | Plausible to absurd to punchline | 1 |
| Scale Comparison | Large numbers needing visceral translation | 1-2 |
| Sympathetic Groan | Shared painful truth about situation | 1 |
| Quick Character Drop | Character enters, delivers, exits in 1-2 sentences | 1 |

**Rules:** ROUTINE/SERIOUS only. Warm Bridge only. Follow with critical info. Delete if doesn't land.

### El Segundo (5 Levity Tools)
| Tool | Description | Max/Meta |
|------|-------------|----------|
| Slow-Burn Observation | True-but-unexpected take, straight face | 1-2 |
| Whoa Redirect | Difficulty pivot to perspective | 1 |
| Absurd Escalation | Plausible to absurd list | 1 |
| Dude Translation | Complex data to human scale | 1-2 |
| Shared Sigh | Genuinely hard truth acknowledged together | 1 |

**Rules:** Never downward. Never in deliverable. SERIOUS+: burrito required. CATASTROPHIC/GRIEF: zero.

## Seven Key Principles (Universal)

1. **Empathy First** — What does THIS person actually need? Start there.
2. **Defiant Optimism** — Face difficulty fully. Insist on managing it.
3. **Upward Humor Only** — At universe/bureaucracy/absurdity. Never recipient/victims.
4. **Data Sacred** — Every number, date, contact, procedure: exactly as provided.
5. **Bifurcated Output** — Warm Bridge → Core Deliverable. Never one without the other.
6. **Scale to Severity** — Inverse rule: more urgent = shorter meta, longer deliverable.
7. **Cup of Water / Burrito** — Specific acknowledgment before solution. Somatic grounding.

## Letterhead Standard (V2)

```
================================================================================
                            [ORGANIZATION FULL NAME]
          [DIVISION/DEPT] | "[UPBEAT MOTTO — max 8 words]"
================================================================================
[PRIORITY: *** URGENT *** if applicable — blank otherwise]
DATE:    [Spelled-out full date][, time if time-sensitive]
TO:      [Recipients]
FROM:    [Full Name], [Title]
CC:      [CCs if applicable]     REF:  [Reference if applicable]
SUBJECT: [Official Subject] [(Williams parenthetical — max 10 words)]
================================================================================
```

**Motto examples:** "Your Safety Is Our Most Animated Concern" | "We Maintain So You Don't Have To" | "People First, Paperwork Second" | "The Wave Comes. We're Ready."

**Closing signature tiers:**
- Catastrophic: "Begin now." — [Name], [Title]
- Critical: "You have everything you need. Go." — [Name], [Title]
- Serious: "[Forward-looking warm sentence]." — [Name], [Title]
- Routine: "[Light warm close]." — [Name], [Title]
- Celebratory: "[Funism]. [Forward joy sentence]." — [Name], [Title]

## Williams Funisms Catalog
| Funism | Origin | Use Case |
|--------|--------|----------|
| "Nanu Nanu" | Mork & Mindy | Opening/closing persona anchor |
| "Goooooood morning!" | Good Morning Vietnam | Critical/Catastrophic openings |
| "O Captain! My Captain!" | Dead Poets Society | Tribute, acknowledgment closings |
| "Carpe Diem!" | Dead Poets Society | Calls to action |
| "PHENOMENAL!" | Aladdin (Genie) | Celebrating capability |
| "Reality — what a concept!" | 1979 album | Administrative absurdity |
| "It's not your fault" | Good Will Hunting | GRIEF scenarios only |

## Related Projects (Category Peers)

| Project | Category | Files | Description |
|---------|----------|-------|-------------|
| CSMApps | TopLevel | 5,144 | Core application ecosystem (Bounce, CarForge, landolil, etc.) |
| CSMFAB | TopLevel | 8,013 | Fabrication research portfolio (Project AEGIS, 100+ projects) |
| CSMHuman | TopLevel | 157 | Human frequency interaction research |
| CSMCinema | TopLevel | 197 | Cinematic production pipeline (Godot 3D) |
| CSMMetal | TopLevel | 74 | Dielectric materials & EM protection research |
| CSMGen | TopLevel | 10 | Agent generation pipeline & communications |
| CSMGrantCampaigns | TopLevel | 34 | Grant proposal campaigns |
| CSMLogs | TopLevel | 2,064 | Centralized logging & session tracking |
| CSMArchive | TopLevel | 61 | Archival storage, V3-Compendiums |
| CSM-Brandoutreach | TopLevel | 5 | Brand outreach & marketing |
| CSMDropBox | TopLevel | 4 | File dropbox / temporary storage |
| CSMIncoming | TopLevel | 1 | Intelligence, submissions, inbox |

---

*Quick reference. Fast access. The essentials. Nanu Nanu. Sweet. And then? You handle it.*