# THE GOLDEN FLEECE — GODOT 3D PRODUCTION BIBLE

## PART 09 OF 11: THE EARTH LOOM

### Jason Isaac Brodsky (California 1976) — Conducier

**Engine:** Godot 4.x
**Scale:** 1 unit = 1 meter
**Coordinate System:** Y-up, Z-forward, X-right

---

# 1. SCENE LIST AND ENVIRONMENTS

---

## SCENE 1: GAIA

**Environment:** Gaia's Cavern — Underground
**Skybox:** None (underground)
**Ground:** Soil, roots, stone
**Fog:** Density 0.06, color #2D5016
**Ambient Temperature (visual):** Warm, damp, growing

---

## SCENE 2: THE GREEN THREAD

**Environment:** Gaia's Cavern — Underground
**Same as Scene 1**

---

# 2. CHARACTER ASSETS (High Detail — Close Camera)

---

## CHARACTER: GAIA — THE MOTHER OF EVERYTHING

### Model Specifications

**Height:** Variable (ageless)
**Proportions:** Divine — motherly, ancient
**Head Height:** 0.23m
**Shoulder Width:** 0.42m
**Build:** Full, strong, maternal
**Age:** Ageless

### Head and Face (EXTREME DETAIL — Close Camera)

**Head Shape:** Oval, perfect
**Forehead:** Smooth, ancient
**Eyebrows:** Green (#4A7C59), leafy
**Eye Shape:** Large, knowing
**Iris Color:** Brown (#6B4423) — soil
**Sclera:** White, clear
**Nose:** Broad, strong
**Mouth:** Wide, warm
**Lip Color:** Brown (#6B4423)
**Teeth:** White, strong
**Ears:** Close to head, adorned with flowers
**Facial Hair:** None
**Skin Tone:** Brown (#6B4423)
**Skin Texture:** Bark-like at edges, smooth at center
**Cheekbones:** Prominent
**Jawline:** Strong, maternal
**Chin:** Round, strong

### Hair (HIGH DETAIL)

**Style:** Long, flowing, 1.00m
**Color:** Green (#4A7C59)
**Texture:** Leaves, grass, vines
**Flowers:** Poppies, daisies, violets growing
**Movement:** Physics-enabled, growing

### Torso (HIGH DETAIL)

**Shoulders:** Broad, strong
**Chest:** Full, maternal
**Abdomen:** Soft, strong
**Arms:** Strong, bark-skinned
**Hands:** Strong, soil under nails

### Outfit: Living Robes (HIGH DETAIL)

**Material:** Living plants, soil, stone
**Color:** Green (#4A7C59), brown (#6B4423), grey (#708090)
**Style:** Flowing, growing
**Movement:** Always growing, changing

---

# 3. PROPS AND SET PIECES (Medium Detail)

---

## SET: GAIA'S CAVERN

### Dimensions

**Width:** 40m
**Height:** 25m
**Depth:** 60m

### Walls

**Material:** Roots, soil, stone
**Color:** Brown (#6B4423), green (#4A7C59), grey (#708090)
**Texture:** Organic, growing, living

### Roots

**Material:** Tree roots
**Color:** Brown (#6B4423)
**Size:** 0.10m to 1m diameter
**Length:** 10m to 50m
**Movement:** Slow growth, visible

### The Loom of the Earth

**Type:** Roots, stone, soil
**Dimensions:** 12m x 6m x 9m height
**Material:** Living roots, stone, soil
**Color:** Brown (#6B4423), green (#4A7C59), grey (#708090)
**Structure:**
- Frame: Roots, 5 vertical
- Beam: Stone, horizontal
- Heddle: Root, threading
- Reed: Stone, combing
**Threads:** Visible, 1000s, green
- Color: Green (#4A7C59)
- Material: Growth, time
- Movement: Flowing, growing

---

# 4. ENVIRONMENTAL ELEMENTS

---

## THE SOIL

**Type:** Particle-based
**Color:** Brown (#6B4423)
**Count:** 1000+
**Movement:** Falling, settling

---

## THE SEEDS

**Type:** Small objects
**Color:** Brown (#6B4423)
**Count:** 100+
**Size:** 0.005m to 0.02m
**Movement:** Sprouting, growing

---

# 5. MATERIALS AND TEXTURES

---

## MATERIAL: SOIL

**Base Color:** #6B4423
**Roughness:** 0.90
**Metallic:** 0.0
**Texture:** Granular, damp
**Variation:** +/- 15% color

---

## MATERIAL: ROOT

**Base Color:** #6B4423
**Roughness:** 0.85
**Metallic:** 0.0
**Texture:** Fibrous, rough
**Bark:** Peeling, layered

---

## MATERIAL: STONE

**Base Color:** #708090
**Roughness:** 0.80
**Metallic:** 0.0
**Texture:** Rough, ancient
**Moss:** Green patches

---

## MATERIAL: LIVING PLANTS

**Base Color:** #4A7C59
**Roughness:** 0.70
**Metallic:** 0.0
**Texture:** Smooth, waxy
**Growth:** Animated, slow

---

# 6. LIGHTING SPECIFICATIONS

---

## SCENE 1-2: GAIA'S CAVERN

**Ambient:**
- Type: AmbientLight3D
- Color: #2D5016 (green-brown)
- Intensity: 0.3

**Earthlight:**
- Type: PointLight3D
- Color: #4A7C59 (green)
- Range: 15m
- Intensity: 0.5
- Position: Center of cavern

**Root Lights:**
- Type: PointLight3D
- Color: #6B4423 (warm brown)
- Range: 3m
- Intensity: 0.2
- Count: 20

**Fog:**
- Type: Linear fog
- Color: #2D5016
- Density: 0.06

---

# 7. CAMERA DATA

---

## SCENE 1: GAIA

**Shot 1.1 — The Cavern:**
- Position: (0, 2, -15) looking at cavern
- FOV: 60 degrees
- Duration: 8 seconds
- Movement: Slow dolly in
- Focus: Cavern, roots, soil, Gaia

**Shot 1.2 — Gaia:**
- Position: (2, 2, 2) looking at Gaia
- FOV: 40 degrees
- Duration: 6 seconds
- Movement: Static
- Focus: Gaia, face, maternal

**Shot 1.3 — The Loom:**
- Position: (0, 2, 10) looking at loom
- FOV: 50 degrees
- Duration: 5 seconds
- Movement: Slow dolly around loom
- Focus: Loom, roots, threads

---

## SCENE 2: THE GREEN THREAD

**Shot 2.1 — Jason Touches:**
- Position: (1, 1.5, 2) looking at Jason's hand
- FOV: 30 degrees
- Duration: 4 seconds
- Movement: Slow push in
- Focus: Jason's hand on loom

**Shot 2.2 — The Vision:**
- Position: (0, 2, 0) looking at Jason
- FOV: 35 degrees
- Duration: 6 seconds
- Movement: Static
- Focus: Jason's face, vision

**Shot 2.3 — The Green Thread:**
- Position: (0.5, 2, 1) looking at thread
- FOV: 25 degrees
- Duration: 4 seconds
- Movement: Slow push in
- Focus: Green thread, extreme close-up

---

# 8. SPECIAL EFFECTS

---

## EFFECT: ROOT GROWTH

**Type:** Animation
**Movement:** Roots growing, extending
**Speed:** 0.01m/second (visible)
**Color:** Brown (#6B4423)

---

## EFFECT: SEED SPROUTING

**Type:** Animation
**Movement:** Seeds sprouting, growing
**Speed:** 0.005m/second
**Color:** Green (#4A7C59)

---

## EFFECT: SOIL FALLING

**Type:** Particle-based
**Particles:** 1000, soil
**Duration:** Continuous
**Emission:** From cavern ceiling
**Velocity:** Downward, 0.5m/s
**Lifetime:** 3 seconds
**Color:** Brown (#6B4423)

---

# 9. FABRIC OF TIME — UNIVERSE PATTERNS

---

## PATTERN: THE THREAD

**Locations:**
- Scene 1: Weaves through roots
- Scene 2: Becomes the green thread

---

## PATTERN: THE SEED THEME

**Visual:** Green growth
**Color:** #4A7C59
**Frequency:** 1 Hz
**Intensity:** 0.3
**Location:** Roots, loom, thread

---

## PATTERN: THE LOOM GRID

**Appearance:** Faint grid lines
**Color:** #4A7C59, alpha 0.1
**Spacing:** 1m x 1m
**Visibility:** Only in earthlight

---

## PATTERN: THE FATES' THREADS

**Appearance:** Thin vertical lines
**Color:** White, alpha 0.05
**Quantity:** 100+
**Movement:** Slight sway

---

# END OF GODOT 3D PART 09

*Jason Isaac Brodsky (California 1976) — Conducier*
*CSM Cinema — Godot 3D Production Bible — Part 09 of 11*
*The Earth Loom. All physical attributes for 3D element creation.*

---

*Next: Godot 3D Parts 10-11*
