# THE GOLDEN FLEECE — GODOT 3D PRODUCTION BIBLE

## PART 06 OF 11: THE DEEP LOOM

### Jason Isaac Brodsky (California 1976) — Conducier

**Engine:** Godot 4.x
**Scale:** 1 unit = 1 meter
**Coordinate System:** Y-up, Z-forward, X-right

---

# 1. SCENE LIST AND ENVIRONMENTS

---

## SCENE 1: THE THINNING

**Environment:** Open Sea — Night
**Skybox:** Stars dimming, darkness
**Water:** Glowing, bioluminescent
**Fog:** Volumetric, density 0.05
**Ambient Temperature (visual):** Cold, deep, ancient

---

## SCENE 2: THE DESCENT

**Environment:** Underwater Cavern — Deep
**Skybox:** None (underwater)
**Water:** Clear, cold, pressure
**Fog:** Underwater fog, density 0.1
**Ambient Temperature (visual):** Cold, ancient, divine

---

## SCENE 3: POSEIDON

**Environment:** Underwater Cavern — Deep
**Same as Scene 2**

---

## SCENE 4: THE BLUE THREAD

**Environment:** Underwater Cavern — Deep
**Same as Scene 2**

---

# 2. CHARACTER ASSETS (High Detail — Close Camera)

---

## CHARACTER: POSEIDON — THE GOD OF THE SEA

### Model Specifications

**Height:** 2.00m (6'7")
**Proportions:** Divine — massive, powerful
**Head Height:** 0.26m
**Shoulder Width:** 0.55m
**Build:** Massive, divine
**Age:** Ageless

### Head and Face (EXTREME DETAIL — Close Camera)

**Head Shape:** Broad, powerful
**Forehead:** Strong, coral growing
**Eyebrows:** Thick, blue-green, expressive
**Eye Shape:** Large, deep
**Iris Color:** Blue (#1A365D) — the deep sea
**Sclera:** White, clear
**Nose:** Broad, strong
**Mouth:** Wide, commanding
**Lip Color:** Blue-grey (#708090)
**Teeth:** White, strong
**Ears:** Close to head, adorned with shells
**Facial Hair:** Long blue beard, braided with shells
**Skin Tone:** Blue-grey (#708090)
**Skin Texture:** Smooth, scales at temples
**Cheekbones:** Prominent
**Jawline:** Strong, square
**Chin:** Long, bearded
**Neck:** Very muscular

### Hair (HIGH DETAIL)

**Style:** Long, flowing, 0.60m
**Color:** Blue-green (#1A365D)
**Texture:** Thick, seaweed-like
**Adornments:** Shells, coral, pearls

### Torso (HIGH DETAIL)

**Shoulders:** Extremely broad, muscular
**Chest:** Massive, defined
**Abdomen:** Powerful, eight-pack
**Arms:** Enormous, scarred
**Hands:** Huge, webbed fingers

### Outfit: Divine Robes (HIGH DETAIL)

**Material:** Water, living
**Color:** Blue (#1A365D)
**Style:** Flowing, liquid
**Movement:** Always moving, never still

### Prop: The Trident (EXTREME DETAIL — Close Camera)

**Type:** Divine trident
**Length:** 2.50m
**Material:** Bronze, divine
**Color:** Bronze (#CD7F32)
**Prongs:** Three, 0.30m length, sharp
**Shaft:** 2.20m, 0.03m diameter
**Decoration:** Pearls, coral embedded
**Glow:** Faint blue, intensity 0.3

---

## CHARACTER: JASON — THE ONE WHO DESCENDS

### Head and Face (EXTREME DETAIL — Close Camera)

**Changes from Part 05:**
- Skin: Wet, slightly blue from cold
- Hair: Wet, flowing
- Eyes: Changed, seen the deep
- Expression: Awed, humbled

### Outfit: Wet Robes (HIGH DETAIL)

**Material:** Wool, wet
**Color:** Brown (#6B4423), darker when wet
**Belt:** Leather, brown (#5C3317)
- Six threads: Gold, silver, white, black, green, blue
- Threads glow faintly

---

# 3. PROPS AND SET PIECES (Medium Detail)

---

## SET: UNDERWATER CAVERN

### Dimensions

**Width:** 50m
**Height:** 30m
**Depth:** 20m below sea floor
**Shape:** Irregular dome

### Walls

**Material:** Coral, rock, pearl
**Color:** White (#F5F5F5), pink (#FFB6C1), grey (#708090)
**Texture:** Organic, growing, living
**Light:** Bioluminescent, blue-green

### The Loom of the Sea (EXTREME DETAIL — Close Camera)

**Type:** Coral, bone, pearl loom
**Dimensions:** 10m x 5m x 8m height
**Material:** Living coral, whale bone, pearl
**Color:** White coral (#F5F5F5), grey bone (#708090), pink pearl (#FFB6C1)
**Structure:**
- Frame: Whale bone, 5 vertical beams
- Beam: Coral, horizontal
- Heddle: Pearl, threading
- Reed: Bone, combing
**Threads:** Visible, 1000s, blue
- Color: Blue (#1A365D)
- Material: Water, light, time
- Movement: Flowing, weaving
**Sound:** 11.11 Hz hum

### Marine Life

**Fish:** 100+, bioluminescent
**Color:** Blue, green, purple
**Size:** 0.05m to 0.50m
**Movement:** Swimming, schooling
**Light:** Bioluminescent, point lights

**Whales:** 2, distant
**Size:** 10m
**Color:** Grey (#708090)
**Movement:** Slow, graceful
**Sound:** Whale song, 20 Hz

**Coral:** 100s of formations
**Color:** White, pink, purple, orange
**Size:** 0.10m to 2m
**Type:** Brain coral, staghorn, fan coral

**Jellyfish:** 10, floating
**Color:** Translucent blue
**Size:** 0.30m bell
**Movement:** Drifting, pulsing

---

## SET: OPEN SEA (Surface)

### Water

**Type:** Animated shader
**Color:** Black (#0A0A0A) at depth, blue (#1A365D) at surface
**Bioluminescence:** Blue-green particles, 1000+
**Movement:** Slow, rhythmic

### Stars

**Type:** Particle-based, dimming
**Color:** White (#FFFFFF)
**Count:** 1000+
**Movement:** Fading, one by one

---

# 4. ENVIRONMENTAL ELEMENTS

---

## THE WATER COLUMN

**Type:** Animated shader
**Color:** Blue (#1A365D) at top, black (#0A0A0A) at bottom
**Visibility:** 50m
**Particles:** Plankton, 1000+
**Movement:** Slow drift

---

## THE PRESSURE

**Type:** Post-process effect
**Effect:** Slight blur at edges
**Intensity:** 0.1
**Color:** Blue tint

---

## THE BIOLUMINESCENCE

**Type:** Particle-based
**Color:** Blue-green (#4FD1C5)
**Count:** 1000+
**Size:** 0.001m to 0.01m
**Movement:** Drifting, pulsing
**Light Cast:** Point lights, range 1m, intensity 0.3

---

# 5. MATERIALS AND TEXTURES

---

## MATERIAL: CORAL

**Base Color:** #F5F5F5 (white), #FFB6C1 (pink), #9F7AEA (purple)
**Roughness:** 0.80
**Metallic:** 0.0
**Texture:** Organic, porous, growing
**Bioluminescence:** Faint, blue-green

---

## MATERIAL: PEARL

**Base Color:** #FFB6C1
**Roughness:** 0.10
**Metallic:** 0.2
**Reflection:** Strong, iridescent
**Transparency:** Slight, alpha 0.9
**Layers:** Visible, nacre

---

## MATERIAL: WHALE BONE

**Base Color:** #708090
**Roughness:** 0.70
**Metallic:** 0.0
**Texture:** Smooth, worn, ancient
**Age:** Yellowed, cracked

---

## MATERIAL: WATER (Underwater)

**Base Color:** #1A365D
**Roughness:** 0.10
**Metallic:** 0.0
**Transparency:** Alpha 0.7
**Refraction:** Enabled, IOR 1.33
**Fog:** Volumetric, density 0.1

---

## MATERIAL: GOLD (Threads)

**Base Color:** #FFD700
**Roughness:** 0.20
**Metallic:** 0.95
**Reflection:** Strong, mirror-like
**Emissive:** Yes, intensity 0.3

---

# 6. LIGHTING SPECIFICATIONS

---

## SCENE 1: THE THINNING (Surface)

**Moon:**
- Type: DirectionalLight3D
- Color: #B0C4DE (moonlight)
- Intensity: 0.1
- Angle: 45 degrees above horizon

**Stars:**
- Type: Particle-based point lights
- Color: #FFFFFF
- Intensity: 0.1 each
- Count: 1000+
- Movement: Fading

**Ambient:**
- Type: AmbientLight3D
- Color: #1A365D (deep blue)
- Intensity: 0.1

**Bioluminescence:**
- Type: Particle-based point lights
- Color: #4FD1C5
- Intensity: 0.3 each
- Count: 1000+

---

## SCENE 2-4: UNDERWATER

**Ambient:**
- Type: AmbientLight3D
- Color: #1A365D (deep blue)
- Intensity: 0.2

**Bioluminescence:**
- Type: Particle-based point lights
- Color: #4FD1C5
- Intensity: 0.5 each
- Count: 1000+

**God Rays:**
- Type: Volumetric shafts from above
- Color: #1A365D
- Intensity: 0.2

**Loom Light:**
- Type: PointLight3D at loom
- Color: #1A365D
- Range: 10m
- Intensity: 0.8

---

# 7. CAMERA DATA

---

## SCENE 1: THE THINNING

**Shot 1.1 — Stars Dimming:**
- Position: (0, 5, 0) looking up
- FOV: 60 degrees
- Duration: 6 seconds
- Movement: Slow tilt up
- Focus: Stars fading

**Shot 1.2 — Water Glowing:**
- Position: (0, -2, 0) looking down
- FOV: 50 degrees
- Duration: 4 seconds
- Movement: Slow tilt down
- Focus: Bioluminescence

---

## SCENE 2: THE DESCENT

**Shot 2.1 — Descending:**
- Position: (0, 0, 10) looking down
- FOV: 45 degrees
- Duration: 8 seconds
- Movement: Slow dolly down
- Focus: Argo descending

**Shot 2.2 — Cavern Opens:**
- Position: (0, -15, 0) looking forward
- FOV: 55 degrees
- Duration: 6 seconds
- Movement: Slow push in
- Focus: Cavern, coral, light

---

## SCENE 3: POSEIDON

**Shot 3.1 — Poseidion Appears:**
- Position: (5, -10, 5) looking at Poseidon
- FOV: 40 degrees
- Duration: 6 seconds
- Movement: Static
- Focus: Poseidon, massive, trident

**Shot 3.2 — The Trident:**
- Position: (2, -10, 2) looking at trident
- FOV: 30 degrees
- Duration: 3 seconds
- Movement: Slow push in
- Focus: Trident, extreme close-up

---

## SCENE 4: THE BLUE THREAD

**Shot 4.1 — The Loom:**
- Position: (0, -10, 10) looking at loom
- FOV: 50 degrees
- Duration: 6 seconds
- Movement: Slow dolly around loom
- Focus: Loom, threads, weaving

**Shot 4.2 — Jason Touches:**
- Position: (1, -10, 2) looking at Jason's hand
- FOV: 30 degrees
- Duration: 4 seconds
- Movement: Slow push in
- Focus: Jason's hand on loom, extreme close-up

**Shot 4.3 — The Vision:**
- Position: (0, -10, 0) looking at Jason
- FOV: 35 degrees
- Duration: 6 seconds
- Movement: Static
- Focus: Jason's face, vision

**Shot 4.4 — The Blue Thread:**
- Position: (0.5, -10, 1) looking at thread
- FOV: 25 degrees
- Duration: 4 seconds
- Movement: Slow push in
- Focus: Blue thread, extreme close-up

---

# 8. SPECIAL EFFECTS

---

## EFFECT: STARS DIMMING

**Type:** Particle fade
**Duration:** 6 seconds
**Effect:** Alpha fade to 0
**Particles:** 1000+
**Timing:** Sequential, north to south

---

## EFFECT: WATER GLOWING

**Type:** Particle burst
**Particles:** 1000, bioluminescent
**Duration:** Continuous
**Emission:** From water volume
**Velocity:** Slow drift, 0.1m/s
**Lifetime:** Continuous
**Color:** Blue-green (#4FD1C5)

---

## EFFECT: DESCENT

**Type:** Transform animation
**Movement:** Argo descends 20m
**Duration:** 8 seconds
**Easing:** Smooth, ease-in-out
**Bubbles:** Particle-based, rising

---

## EFFECT: WHALE SONG

**Type:** Audio + visual
**Sound:** 20 Hz whale song
**Visual:** Ripple rings from whales
**Color:** Blue (#1A365D)
**Frequency:** 1 Hz

---

## EFFECT: LOOM WEAVING

**Type:** Shader-based
**Effect:** Threads moving, weaving
**Speed:** Slow, 0.5 Hz
**Color:** Blue (#1A365D)
**Movement:** Horizontal, vertical, interlacing

---

# 9. FABRIC OF TIME — UNIVERSE PATTERNS

---

## PATTERN: THE THREAD

**Locations:**
- Scene 1: Fading with stars
- Scene 2: Weaves through water
- Scene 3: Connects Poseidon to loom
- Scene 4: Becomes the blue thread

---

## PATTERN: THE SEA THEME

**Visual:** Bioluminescent particles
**Color:** #4FD1C5
**Movement:** Drifting, pulsing
**Location:** Water, cavern, loom

---

## PATTERN: THE LOOM GRID

**Appearance:** Faint grid lines
**Color:** #1A365D, alpha 0.1
**Spacing:** 1m x 1m
**Visibility:** Only in bioluminescence

---

## PATTERN: THE FATES' THREADS

**Appearance:** Thin vertical lines
**Color:** White, alpha 0.05
**Quantity:** 100+
**Movement:** Slight sway

---

# END OF GODOT 3D PART 06

*Jason Isaac Brodsky (California 1976) — Conducier*
*CSM Cinema — Godot 3D Production Bible — Part 06 of 11*
*The Deep Loom. All physical attributes for 3D element creation.*

---

*Next: Godot 3D Parts 07-11*
