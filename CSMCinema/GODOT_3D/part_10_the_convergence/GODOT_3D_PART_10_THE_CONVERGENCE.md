# THE GOLDEN FLEECE — GODOT 3D PRODUCTION BIBLE

## PART 10 OF 11: THE CONVERGENCE

### Jason Isaac Brodsky (California 1976) — Conducier

**Engine:** Godot 4.x
**Scale:** 1 unit = 1 meter
**Coordinate System:** Y-up, Z-forward, X-right

---

# 1. SCENE LIST AND ENVIRONMENTS

---

## SCENE 1: THE PATTERN AWAKES

**Environment:** Iolcus — Temple of Hecate — Dawn
**Skybox:** Dawn gradient, gold and pink
**Ground:** Cobblestone plaza
**Fog:** None
**Ambient Temperature (visual):** Warm, golden, new

---

## SCENE 2: THE GODS ARRIVE

**Environment:** Iolcus — Temple of Hecate — Dawn
**Same as Scene 1**

---

## SCENE 3: THE GODS RELEASE

**Environment:** Iolcus — Temple of Hecate — Dawn
**Same as Scene 1**

---

## SCENE 4: THE SCHOOL

**Environment:** Iolcus — Temple of Hecate — Day
**Same as Scene 1, later**

---

# 2. CHARACTER ASSETS (High Detail — Close Camera)

---

## CHARACTER: JASON — THE CENTER

### Head and Face (EXTREME DETAIL — Close Camera)

**Changes from Part 09:**
- Expression: Peaceful, joyful, complete
- Eyes: Blue-green, seeing everything
- Hair: Golden, slightly longer
- Skin: Luminous, divine-touched

### Outflow: Teacher's Robes (HIGH DETAIL)

**Material:** Wool, clean
**Color:** Brown (#6B4423)
**Belt:** Leather, brown (#5C3317)
- Seven threads: All colors, glowing

---

## CHARACTER: MEDEA — LOVE

### Head and Face (EXTREME DETAIL — Close Camera)

**Changes from Part 09:**
- Expression: Peaceful, joyful, complete
- Eyes: Gold, loving
- Hair: Black, flowing
- Skin: Luminous, divine

### Outfit: Queen's Robes (HIGH DETAIL)

**Material:** Silk, white
**Color:** White (#F5F5F5)
**Belt:** Gold cord, 0.02m

---

## ALL THE GODS — CHORUS OF MANY

### Zeus (HIGH DETAIL)
- Height: 2.10m
- Color: White robes, blue lightning
- Expression: Released, peaceful

### Poseidon (HIGH DETAIL)
- Height: 2.00m
- Color: Blue robes, trident
- Expression: Released, calm

### Hades (HIGH DETAIL)
- Height: 1.95m
- Color: Black robes, crown
- Expression: Released, kind

### Athena (HIGH DETAIL)
- Height: 1.75m
- Color: Bronze armor, red cape
- Expression: Released, wise

### Hecate (HIGH DETAIL)
- Height: 1.70m
- Color: Black robes, triple face
- Expression: Released, guiding

### Apollo (HIGH DETAIL)
- Height: 1.85m
- Color: Gold robes, lyre
- Expression: Released, singing

### Artemis (HIGH DETAIL)
- Height: 1.70m
- Color: Silver robes, bow
- Expression: Released, wild

### Aphrodite (HIGH DETAIL)
- Height: 1.68m
- Color: Pink robes, beautiful
- Expression: Released, loving

### Ares (HIGH DETAIL)
- Height: 1.90m
- Color: Red armor, sword
- Expression: Released, calm

### Hephaestus (HIGH DETAIL)
- Height: 1.75m
- Color: Bronze apron, hammer
- Expression: Released, creating

### Hermes (HIGH DETAIL)
- Height: 1.78m
- Color: White robes, winged sandals
- Expression: Released, messenger

### Demeter (HIGH DETAIL)
- Height: 1.70m
- Color: Green robes, wheat
- Expression: Released, growing

### Dionysus (HIGH DETAIL)
- Height: 1.80m
- Color: Purple robes, grapevine
- Expression: Released, celebrating

### Hera (HIGH DETAIL)
- Height: 1.75m
- Color: Royal purple, crown
- Expression: Released, queenly

---

# 3. PROPS AND SET PIECES (Medium Detail)

---

## SET: TEMPLE OF HECATE

### Exterior

**Dimensions:** 10m x 8m, 6m height
**Columns:** 4 Doric columns
**Door:** Bronze, 2m x 3m
**Steps:** 3 steps, 0.15m high each

### Interior

**Dimensions:** 8m x 6m, 5m height
**Altar:** Stone, 1m x 0.5m x 0.8m
**Torches:** 3 bronze torches, 1.5m height
**Floor:** Stone, worn
**Walls:** Carved with Hecate symbols

---

## SET: THE TREE OF HOPE

### Specifications

**Height:** 15m
**Trunk Diameter:** 2m
**Canopy Diameter:** 12m
**Material:** Oak, living
**Color:** Brown trunk (#6B4423), green leaves (#4A7C59)
**Glow:** Faint gold, intensity 0.3
**Particles:** Gold dust, rising

---

## SET: MARKET SQUARE (Later)

### Ground

**Material:** Cobblestone
**Color:** Grey-blue (#708090)
**Dimensions:** 30m x 20m

### Surrounding Structures

**Fish Market:** 8 stalls, canvas awnings
**Brick Ovens:** 3 domes, smoke rising
**Palace:** White marble, columns

---

# 4. ENVIRONMENTAL ELEMENTS

---

## THE PEOPLE OF IOLCUS

**Count:** 50+
**Variation:** Various ages, builds, outfits
**Clothing:** Simple Greek robes, various colors
**Movement:** Gathering, watching, celebrating

---

## THE GOLD DUST

**Type:** Particle-based
**Color:** #FFD700
**Count:** 1000+
**Size:** 0.001m to 0.005m
**Movement:** Rising, drifting
**Lifetime:** Continuous
**Light Cast:** Faint, range 0.5m

---

# 5. MATERIALS AND TEXTURES

---

## MATERIAL: COBBLESTONE

**Base Color:** #708090
**Roughness:** 0.85
**Metallic:** 0.0
**Texture:** Worn, smooth, moss in cracks

---

## MATERIAL: MARBLE (Palace, Temple)

**Base Color:** #F5F5F5
**Roughness:** 0.15
**Metallic:** 0.0
**Texture:** Polished, smooth

---

## MATERIAL: TREE BARK

**Base Color:** #6B4423
**Roughness:** 0.85
**Metallic:** 0.0
**Texture:** Rough, furrowed, moss patches

---

## MATERIAL: LEAVES

**Base Color:** #4A7C59
**Roughness:** 0.70
**Metallic:** 0.0
**Texture:** Smooth, waxy
**Transparency:** Alpha 0.9 (backlit)

---

# 6. LIGHTING SPECIFICATIONS

---

## SCENE 1-3: DAWN

**Sun:**
- Type: DirectionalLight3D
- Color: #FFD700 (golden dawn)
- Intensity: 0.8
- Angle: 10 degrees above horizon

**Sky:**
- Type: WorldEnvironment, gradient
- Top Color: #FF6B6B (pink-red)
- Horizon Color: #FFD700 (gold)
- Ground Color: #6B4423 (brown)

**Ambient:**
- Type: AmbientLight3D
- Color: #FFD700 (gold)
- Intensity: 0.4

**Tree Light:**
- Type: PointLight3D at tree
- Color: #FFD700 (gold)
- Range: 20m
- Intensity: 0.6

**God Lights:**
- Type: PointLight3D per god
- Color: Various (Zeus: #4299E1, Poseidon: #1A365D, Hades: #4A5568, etc.)
- Range: 5m
- Intensity: 0.4

---

## SCENE 4: DAY

**Sun:**
- Type: DirectionalLight3D
- Color: #FFF8DC (warm day)
- Intensity: 1.0
- Angle: 45 degrees above horizon

**Sky:**
- Type: WorldEnvironment, gradient
- Top Color: #1E90FF (sky blue)
- Horizon Color: #87CEEB (light blue)
- Ground Color: #6B4423 (brown)

**Ambient:**
- Type: AmbientLight3D
- Color: #87CEEB (sky blue)
- Intensity: 0.3

---

# 7. CAMERA DATA

---

## SCENE 1: THE PATTERN AWAKES

**Shot 1.1 — Establishing Wide:**
- Position: (0, 10, -25) looking at (0, 0, 0)
- FOV: 60 degrees
- Duration: 8 seconds
- Movement: Slow dolly in
- Focus: Temple, tree, dawn

**Shot 1.2 — The Pattern Speaks:**
- Position: (0, 2, 5) looking at tree
- FOV: 40 degrees
- Duration: 6 seconds
- Movement: Static
- Focus: Tree, golden dust, light

---

## SCENE 2: THE GODS ARRIVE

**Shot 2.1 — Gods Descend:**
- Position: (10, 5, -10) looking at temple
- FOV: 55 degrees
- Duration: 8 seconds
- Movement: Slow pan across sky
- Focus: All gods descending

**Shot 2.2 — Zeus Angry:**
- Position: (2, 2, 2) looking at Zeus
- FOV: 35 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Zeus, face, thunderbolt

---

## SCENE 3: THE GODS RELEASE

**Shot 3.1 — Release:**
- Position: (0, 2, 10) looking at gods
- FOV: 50 degrees
- Duration: 8 seconds
- Movement: Slow dolly around gods
- Focus: Gods releasing, light

**Shot 3.2 — Jason Speaks:**
- Position: (1, 1.5, 2) looking at Jason
- FOV: 35 degrees
- Duration: 5 seconds
- Movement: Static
- Focus: Jason, face, peaceful

---

## SCENE 4: THE SCHOOL

**Shot 4.1 — The People Gather:**
- Position: (0, 3, -15) looking at temple
- FOV: 55 degrees
- Duration: 6 seconds
- Movement: Slow dolly in
- Focus: People, temple, Jason teaching

**Shot 4.2 — Jason's Last Lesson:**
- Position: (1, 1.5, 2) looking at Jason
- FOV: 30 degrees
- Duration: 5 seconds
- Movement: Static
- Focus: Jason, face, complete

---

# 8. SPECIAL EFFECTS

---

## EFFECT: GODS DESCENDING

**Type:** Particle burst + transform
**Particles:** 100 per god, divine light
**Duration:** 2 seconds
**Emission:** From sky
- Velocity: Downward, 5m/s
- Lifetime: 3 seconds
- Color: Various per god

---

## EFFECT: GOLD DUST

**Type:** Particle-based
**Particles:** 1000, gold
**Duration:** Continuous
- Emission: From tree
- Velocity: Upward, 0.5m/s
- Lifetime: 5 seconds
- Color: #FFD700

---

## EFFECT: PATTERN SPEAKING

**Type:** Shader + audio
**Effect:** Tree glows, pulses
**Frequency:** 1 Hz
**Color:** #FFD700
**Intensity:** 0.5

---

# 9. FABRIC OF TIME — UNIVERSE PATTERNS

---

## PATTERN: THE THREAD

**Locations:**
- Scene 1: Weaves through tree
- Scene 2: Connects gods to earth
- Scene 3: Connects all gods together
- Scene 4: Connects Jason to students

---

## PATTERN: THE CONVERGENCE THEME

**Visual:** All colors
**Frequency:** 1 Hz
**Intensity:** 0.5
**Location:** Tree, gods, people

---

## PATTERN: THE LOOM GRID

**Appearance:** Faint grid lines
**Color:** #FFD700, alpha 0.1
**Spacing:** 1m x 1m
**Visibility:** Only in dawn light

---

## PATTERN: THE FATES' THREADS

**Appearance:** Thin vertical lines
**Color:** White, alpha 0.05
**Quantity:** 100+
**Movement:** Slight sway

---

# END OF GODOT 3D PART 10

*Jason Isaac Brodsky (California 1976) — Conducier*
*CSM Cinema — Godot 3D Production Bible — Part 10 of 11*
*The Convergence. All physical attributes for 3D element creation.*

---

*Next: Godot 3D Part 11 — The Completion*
