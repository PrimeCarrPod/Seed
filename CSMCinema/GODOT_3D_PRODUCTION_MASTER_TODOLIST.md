# CSMCINEMA — GODOT 3D PRODUCTION MASTER TODOLIST

## Jason Isaac Brodsky (California 1976) — Conducier
**Created:** 2026-08-31
**Status:** ACTIVE — Ready to begin production

---

# PHASE 1: PROJECT SETUP (Week 1)

## 1.1 Create Godot Project
- [ ] Create Godot 4.2+ project named "GoldenFleece"
- [ ] Set renderer to Forward+
- [ ] Create folder structure:
  - [ ] /scenes/ (11 part scenes)
  - [ ] /characters/ (all character scenes)
  - [ ] /environments/ (shared environments)
  - [ ] /props/ (reusable props)
  - [ ] /materials/ (shared materials)
  - [ ] /scripts/ (GDScript files)
  - [ ] /audio/ (music, SFX, voice)
  - [ ] /animations/ (animation libraries)
  - [ ] /shaders/ (custom shaders)
  - [ ] /particles/ (VFX presets)

## 1.2 Configure Project Settings
- [ ] Resolution: 1920x1080 (target), 3840x2160 (final)
- [ ] Frame rate: 24 fps (cinematic)
- [ ] Shadows: Enabled, 2048x2048 cascades
- [ ] SSAO: Enabled
- [ ] Glow: Enabled (for divine elements)
- [ ] Volumetric fog: Enabled

---

# PHASE 2: CORE SYSTEMS (Week 2)

## 2.1 Character System
- [ ] Create BaseCharacter scene (inherited by all)
  - [ ] MeshInstance3D (body)
  - [ ] Skeleton3D (bones)
  - [ ] AnimationPlayer
  - [ ] AnimationTree (blend shapes)
  - [ ] LookAtController (head tracking)
  - [ ] FootstepSystem (audio + sandal rhythm)

## 2.2 Camera System
- [ ] Create CameraRig scene (per shot)
  - [ ] Camera3D
  - [ ] AnimationPlayer (camera moves)
  - [ ] LookAtTarget (focus point)
  - [ ] DOFController (depth of field)
  - [ ] TransitionManager (scene cuts)

## 2.3 Narration System
- [ ] Create NarratorController
  - [ ] AudioStreamPlayer (voice)
  - [ ] SubtitleDisplay (text)
  - [ ] SceneTrigger (activates on cue)
  - [ ] BunrakuOverlay (visible narrator)

---

# PHASE 3: ENVIRONMENT BUILDING (Weeks 3-5)

## Priority Order (reuse environments):
- [ ] 1. Iolcus Market Square (Parts 1, 2, 10, 11)
- [ ] 2. Hecate's Temple (Parts 1, 3, 5, 10, 11)
- [ ] 3. Mount Pelion (Part 2)
- [ ] 4. Open Sea (Parts 5, 6)
- [ ] 5. Colchis Harbor (Part 3)
- [ ] 6. Plains of Ares (Part 4)
- [ ] 7. Underwater Cavern (Part 6)
- [ ] 8. The Sky (Part 7)
- [ ] 9. Underworld (Part 8)
- [ ] 10. Gaia's Cavern (Part 9)

## Each environment includes:
- [ ] Terrain/mesh from bible specs
- [ ] Lighting setup from bible specs
- [ ] Fog settings from bible specs
- [ ] Prop placement from bible specs
- [ ] Particle systems from bible specs

---

# PHASE 4: CHARACTER BUILDING (Weeks 4-7)

## Priority Order:
- [ ] 1. Jason (hero, appears in all 11 parts)
- [ ] 2. Medea (heroine, appears in 8 parts)
- [ ] 3. Pelias (Part 1)
- [ ] 4. Hecate (Parts 1, 3, 5, 10, 11)
- [ ] 5. Argus, Heracules, Orpheus, Castor/Pollux, Atalanta (Part 2)
- [ ] 6. Aetes (Parts 3, 5)
- [ ] 7. Poseidon (Part 6)
- [ ] 8. Zeus (Part 7)
- [ ] 9. Hades, Persephone (Part 8)
- [ ] 10. Gaia (Part 9)
- [ ] 11. Kore, The Child (Part 11)

## Each character build process:
- [ ] Model: Blender → glTF 2.0 → Godot
- [ ] Rig: Skeleton3D with body, face, finger, hair bones
- [ ] Materials: Use bible hex codes exactly
- [ ] Animation: Mixamo + custom

---

# PHASE 5: PROP BUILDING (Weeks 5-8)

## Priority Props:
- [ ] 1. The Argo (Part 2, 5) — most complex prop
- [ ] 2. The Fleece (Parts 4, 5, 11) — emissive, alive
- [ ] 3. Throne of Knives (Part 3)
- [ ] 4. Throne of Bone (Part 8)
- [ ] 5. The Seven Looms (Parts 6-9)
- [ ] 6. Hecate's Torches (Parts 1, 3, 5, 10, 11)
- [ ] 7. Weapons (swords, bow, spear, trident, thunderbolt)
- [ ] 8. The Lyre (Part 2)
- [ ] 9. The Vial (Part 3, 5)

---

# PHASE 6: SCENE ASSEMBLY (Weeks 8-12)

## Build Order:
- [ ] Part 01: The Call (6 scenes)
- [ ] Part 02: The Assembly (6 scenes)
- [ ] Part 03: The Threshold (5 scenes)
- [ ] Part 04: The Trials (4 scenes)
- [ ] Part 05: The Pursuit (4 scenes)
- [ ] Part 06: The Deep Loom (4 scenes)
- [ ] Part 07: The Sky Loom (4 scenes)
- [ ] Part 08: The Underworld (3 scenes)
- [ ] Part 09: The Earth Loom (2 scenes)
- [ ] Part 10: The Convergence (4 scenes)
- [ ] Part 11: The Completion (7 scenes)

## Each scene build:
- [ ] Load environment
- [ ] Place characters per bible positions
- [ ] Add props per bible specs
- [ ] Set lighting per bible specs
- [ ] Add camera per bible shots
- [ ] Add particles/VFX per bible specs
- [ ] Add audio (narration, music, SFX)
- [ ] Add transitions to next scene
- [ ] Test and iterate

---

# PHASE 7: SCRIPTING (Weeks 6-14, concurrent)

## Core Scripts:
- [ ] NarrativeManager.gd (orchestrates all 11 parts)
- [ ] CharacterController.gd (movement, animation)
- [ ] CameraDirector.gd (per-shot camera control)
- [ ] AudioEngine.gd (music, SFX, voice mixing)
- [ ] VFXController.gd (particles, shaders)
- [ ] UIManager.gd (subtitles, menus)
- [ ] SaveLoadManager.gd (checkpoints)

## Bunraku Narrator Scripts:
- [ ] NarratorOne.gd (scene describer)
- [ ] NarratorTwo.gd (Williams voice)
- [ ] NarratorThree.gd (El Segundo voice)
- [ ] FatesChorus.gd (four voices)

---

# PHASE 8: ANIMATION (Weeks 8-14)

## Character Animation:
- [ ] Jason: 50+ animations (walk, run, fight, talk, gesture)
- [ ] Medea: 40+ animations
- [ ] All other characters: 20+ each
- [ ] Crowd animations: 10+ (idle, walk, cheer)

## Camera Animation:
- [ ] 500+ shots across all 11 parts
- [ ] Each shot: position, rotation, FOV keyframed
- [ ] Smooth transitions between shots

---

# PHASE 9: AUDIO (Weeks 10-16)

## Music:
- [ ] 11 leitmotifs (one per part)
- [ ] 100+ variations
- [ ] Full orchestral score (or synthesized)
- [ ] Dynamic mixing (intensity follows action)

## Sound Effects:
- [ ] Footsteps (bare + sandal, 10 variations each)
- [ ] Fire breath, bull roars, dragon hisses
- [ ] Water (sea, river, underwater)
- [ ] Wind (mountain, sky, celestial)
- [ ] Combat (swords, bows, impacts)
- [ ] Magic (looms, threads, visions)

## Voice:
- [ ] Narrator One (scene describer)
- [ ] Narrator Two (Williams voice)
- [ ] Narrator Three (El Segundo voice)
- [ ] Four Fates voices
- [ ] Jason, Medea, all character dialogue

---

# PHASE 10: VFX & SHADERS (Weeks 12-16)

## Custom Shaders:
- [ ] FabricOfTime.gdshader (thread visualization)
- [ ] LoomGrid.gdshader (background pattern)
- [ ] WaterUnderwater.gdshader (Part 6)
- [ ] StarTheme.gdshader (Part 7)
- [ ] ShadowStuff.gdshader (Hecate's robes)
- [ ] SkinSSS.gdshader (subsurface scattering)
- [ ] GoldEmissive.gdshader (fleece, divine)
- [ ] VisionHologram.gdshader (Part 1, 8)

## Particle Systems:
- [ ] GoldDust (rising particles)
- [ ] TorchFlames (3 colors)
- [ ] Bioluminescence (underwater)
- [ ] WhaleSong (ripple rings)
- [ ] RootGrowth (growing vines)
- [ ] ThreadWeaving (loom visualization)
- [ ] GodsDescending (divine light)
- [ ] WarriorsDissolving (Spartoi)

---

# PHASE 11: RENDERING & EXPORT (Weeks 16-18)

## Render Settings:
- [ ] Resolution: 3840x2160 (4K)
- [ ] Frame rate: 24 fps
- [ ] Format: PNG sequence (lossless)
- [ ] Codec: ProRes 4444 (post-production)
- [ ] Color space: sRGB

## Export Per Scene:
- [ ] Render each scene separately
- [ ] Composite in video editor
- [ ] Add final color grading
- [ ] Add subtitles
- [ ] Master audio mix
- [ ] Final export: MP4, MKV, or DCP

---

# PHASE 12: POST-PRODUCTION (Weeks 18-20)

## Video Editing:
- [ ] Assemble all 11 parts
- [ ] Color grade for cinematic look
- [ ] Add transitions
- [ ] Add subtitles
- [ ] Final cut

## Audio Post:
- [ ] Master all audio levels
- [ ] Add reverb for cavern scenes
- [ ] Add underwater filtering
- [ ] Final stereo mix
- [ ] 5.1 surround mix (optional)

---

# TOOLS NEEDED

| Purpose | Tool | Status |
|---------|------|--------|
| 3D Modeling | Blender 3.6+ | ⏳ Needed |
| Texturing | Substance Painter / Quixel Mixer | ⏳ Needed |
| Animation | Blender + Mixamo | ⏳ Needed |
| Audio | Audacity / Reaper | ⏳ Needed |
| Voice | AI generation / human recording | ⏳ Needed |
| Video Editing | DaVinci Resolve | ⏳ Needed |
| Version Control | Git + GitHub | ✅ Active |
| Project Management | Notion / Trello | ⏳ Needed |

---

# ESTIMATED TIMELINE

| Phase | Duration | Weeks | Status |
|-------|----------|-------|--------|
| 1. Project Setup | 1 week | 1 | ⏳ Pending |
| 2. Core Systems | 1 week | 2 | ⏳ Pending |
| 3. Environments | 3 weeks | 3-5 | ⏳ Pending |
| 4. Characters | 4 weeks | 4-7 | ⏳ Pending |
| 5. Props | 3 weeks | 5-8 | ⏳ Pending |
| 6. Scene Assembly | 4 weeks | 8-12 | ⏳ Pending |
| 7. Scripting | 8 weeks | 6-14 | ⏳ Pending |
| 8. Animation | 6 weeks | 8-14 | ⏳ Pending |
| 9. Audio | 6 weeks | 10-16 | ⏳ Pending |
| 10. VFX & Shaders | 4 weeks | 12-16 | ⏳ Pending |
| 11. Rendering | 2 weeks | 16-18 | ⏳ Pending |
| 12. Post-Production | 2 weeks | 18-20 | ⏳ Pending |

**Total: ~20 weeks (5 months) for solo developer**
**Total: ~10 weeks (2.5 months) for small team (3-5 people)**

---

# IMMEDIATE NEXT STEP

**Start with Phase 1: Create the Godot project and build Part 01, Scene 1 (The Ordinary World).**

This gives you:
1. A working foundation
2. Proof of concept
3. Reusable systems for all other parts

---

# COMPLETED CSMCINEMA DOCUMENTS

## All Iterations:
- [x] Iteration 1: Full docs (base) — 11 parts
- [x] Iteration 2: SOPP expansion — 121 pieces
- [x] Iteration 3: Screenplay format — 121 scenes
- [x] Iteration 4: Screenplay format — 121 scenes
- [x] Iteration 5: Screenplay format — 121 scenes
- [x] Iteration 6: Screenplay format — 121 scenes
- [x] Iteration 7: Screenplay format — 121 scenes

## Read-Aloud Versions:
- [x] Iteration 2 Read-Aloud
- [x] Iteration 3 Read-Aloud
- [x] Iteration 4 Read-Aloud
- [x] Iteration 5 Read-Aloud
- [x] Iteration 6 Read-Aloud
- [x] Iteration 7 Read-Aloud

## Master Scripts:
- [x] V1 Master Movie Script (867 lines)
- [x] V2 Master Script (2,468 lines)
- [x] V2 Addendum (4,480 lines)
- [x] V2 Read-Aloud (~2,000 lines)
- [x] V2 Master Script V2 (3,025 lines)

## Godot 3D Production Bible:
- [x] Part 01: The Call (1,101 lines)
- [x] Part 02: The Assembly (993 lines)
- [x] Part 03: The Threshold (661 lines)
- [x] Part 04: The Trials (419 lines)
- [x] Part 05: The Pursuit (648 lines)
- [x] Part 06: The Deep Loom (566 lines)
- [x] Part 07: The Sky Loom (433 lines)
- [x] Part 08: The Underworld (617 lines)
- [x] Part 09: The Earth Loom (373 lines)
- [x] Part 10: The Convergence (503 lines)
- [x] Part 11: The Completion (704 lines)

## Grand Total: ~35,000+ lines of CSMCinema content

---

*Jason Isaac Brodsky (California 1976) — Conducier*
*CSMCinema — Godot 3D Production Master Todolist*
*Status: ACTIVE — Ready to begin production*
