# THE GOLDEN FLEECE — GODOT 3D PRODUCTION BIBLE

## PART 07 OF 11: THE SKY LOOM

### Jason Isaac Brodsky (California 1976) — Conducier

**Engine:** Godot 4.x
**Scale:** 1 unit = 1 meter
**Coordinate System:** Y-up, Z-forward, X-right

---

# 1. SCENE LIST AND ENVIRONMENTS

---

## SCENE 1: THE SKY

**Environment:** The Sky — Night
**Skybox:** Stars, constellations, close
**Ground:** Solid sky, translucent
**Fog:** None
**Ambient Temperature (visual):** Cold, celestial, infinite

---

## SCENE 2: THE TEST

**Environment:** The Sky — Night
**Same as Scene 1**

---

## SCENE 3: JASON'S FEAR

**Environment:** The Sky — Night
**Same as Scene 1**

---

## SCENE 4: THE WHITE THREAD

**Environment:** The Sky — Night
**Same as Scene 1**

---

# 2. CHARACTER ASSETS (High Detail — Close Camera)

---

## CHARACTER: ZEUS — THE KING OF GODS

### Model Specifications

**Height:** 2.10m (6'11")
**Proportions:** Divine — massive, commanding
**Head Height:** 0.27m
**Shoulder Width:** 0.58m
**Build:** Massive, divine
**Age:** Ageless

### Head and Face (EXTREME DETAIL — Close Camera)

**Head Shape:** Broad, powerful
**Forehead:** Strong, intelligent
**Eyebrows:** White, thick, expressive
**Eye Shape:** Large, piercing
**Iris Color:** Blue (#4299E1) — lightning
**Sclera:** White, clear
**Nose:** Broad, strong
**Mouth:** Wide, commanding
**Lip Color:** Grey (#708090)
**Teeth:** White, perfect
**Ears:** Close to head
**Facial Hair:** Long white beard, braided
**Skin Tone:** Pale divine (#F5E6D3)
**Skin Texture:** Perfect, luminous
**Cheekbones:** Prominent
**Jawline:** Strong, square
**Chin:** Long, bearded
**Neck:** Very muscular

### Hair (HIGH DETAIL)

**Style:** Long, flowing, 0.50m
**Color:** White (#F5F5F5)
**Texture:** Thick, wavy
**Movement:** Physics-enabled, wind-driven

### Outfit: Divine Robes (HIGH DETAIL)

**Material:** Storm clouds
**Color:** Grey (#4A5568)
**Style:** Flowing, regal
**Movement:** Always moving, storm-driven

### Prop: Thunderbolt (HIGH DETAIL — Close Camera)

**Type:** Divine thunderbolt
**Length:** 0.50m
**Material:** Lightning, divine
**Color:** White (#FFFFFF) with blue (#4299E1) edges
**Shape:** Jagged, irregular
**Glow:** Emissive, intensity 1.0
**Sound:** Thunder, 100 Hz

---

## CHARACTER: JASON — FACING FEAR

### Head and Face (EXTREME DETAIL — Close Camera)

**Changes from Part 06:**
- Expression: Afraid, then accepting
- Eyes: Blue-green, seeing fear
- Hair: Flowing in celestial wind

### The Fear: KING JASON

**Appearance:** Jason, but older, successful, alone
**Height:** 1.80m
**Build:** Powerful, kingly
**Crown:** Gold, heavy
**Expression:** Miserable despite success
**Throne:** Gold, empty court
**Key Difference:** Alone — no crew, no Medea, no friends

---

# 3. PROPS AND SET PIECES (Medium Detail)

---

## SET: THE SKY

### Ground

**Material:** Solid sky, translucent
**Color:** White (#F5F5F5) with blue tint (#87CEEB)
**Texture:** Cloud-like, semi-transparent
**Transparency:** Alpha 0.7
**Reflection:** Slight

### Constellations

**Type:** Particle-based, luminous
**Color:** White (#FFFFFF), gold (#FFD700)
**Count:** 1000+
**Size:** 0.001m to 0.01m
**Patterns:** Orion, Ursa Major, Pleiades, etc.
**Movement:** Slow rotation

### The Loom of the Sky

**Type:** Light and darkness, star and void
**Dimensions:** 15m x 8m x 10m height
**Material:** Light, darkness
**Color:** White (#F5F5F5), black (#0A0A0A)
**Structure:**
- Frame: Light beams, 5 vertical
- Beam: Darkness, horizontal
- Heddle: Starlight, threading
- Reed: Void, combing
**Threads:** Visible, 1000s, white
- Color: White (#F5F5F5)
- Material: Starlight, time
- Movement: Flowing, weaving

---

# 4. ENVIRONMENTAL ELEMENTS

---

## THE STARS

**Type:** Particle-based
**Color:** White (#FFFFFF), gold (#FFD700)
**Count:** 1000+
**Size:** 0.001m to 0.01m
**Movement:** Slow rotation
**Twinkle:** Animated, 1 Hz

---

## THE WIND

**Type:** Particle-based
**Direction:** Variable
**Speed:** Gentle, 1m/s
**Effect:** Hair moves, robes flow
**Sound:** Celestial music, 432 Hz

---

# 5. MATERIALS AND TEXTURES

---

## MATERIAL: SOLID SKY

**Base Color:** #87CEEB
**Roughness:** 0.30
**Metallic:** 0.0
**Transparency:** Alpha 0.7
**Reflection:** Slight

---

## MATERIAL: STARLIGHT

**Base Color:** #F5F5F5
**Roughness:** 0.10
**Metallic:** 0.0
**Emissive:** Yes, intensity 0.5
**Reflection:** Strong

---

## MATERIAL: DARKNESS

**Base Color:** #0A0A0A
**Roughness:** 1.0
**Metallic:** 0.0
**Absorption:** Seems to absorb light

---

# 6. LIGHTING SPECIFICATIONS

---

## SCENE 1-4: THE SKY

**Ambient:**
- Type: AmbientLight3D
- Color: #87CEEB (sky blue)
- Intensity: 0.4

**Starlight:**
- Type: Particle-based point lights
- Color: #FFFFFF
- Intensity: 0.2 each
- Count: 1000+

**Constellation Light:**
- Type: SpotLight3D
- Color: #FFD700
- Range: 20m
- Angle: 15 degrees
- Intensity: 0.5

**Loom Light:**
- Type: PointLight3D at loom
- Color: #F5F5F5
- Range: 10m
- Intensity: 0.8

---

# 7. CAMERA DATA

---

## SCENE 1: THE SKY

**Shot 1.1 — Establishing Wide:**
- Position: (0, 5, -20) looking at (0, 0, 0)
- FOV: 70 degrees
- Duration: 8 seconds
- Movement: Slow dolly in
- Focus: Solid sky, stars, constellations

**Shot 1.2 — Argo Floats:**
- Position: (5, 2, 10) looking at Argo
- FOV: 50 degrees
- Duration: 5 seconds
- Movement: Static
- Focus: Argo on sky

---

## SCENE 2: THE TEST

**Shot 2.1 — Zeus Appears:**
- Position: (0, 2, -10) looking at Zeus
- FOV: 45 degrees
- Duration: 6 seconds
- Movement: Slow push in
- Focus: Zeus, massive, thunderbolt

**Shot 2.2 — Crew Separated:**
- Position: (10, 2, 0) looking at crew
- FOV: 50 degrees
- Duration: 4 seconds
- Movement: Pan across crew
- Focus: Each alone, facing fear

---

## SCENE 3: JASON'S FEAR

**Shot 3.1 — King Jason:**
- Position: (2, 1.5, 2) looking at King Jason
- FOV: 35 degrees
- Duration: 5 seconds
- Movement: Static
- Focus: King Jason, alone, miserable

**Shot 3.2 — Jason Responds:**
- Position: (1, 1.5, 1) looking at Jason
- FOV: 30 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Jason's face, accepting

---

## SCENE 4: THE WHITE THREAD

**Shot 4.1 — The Loom:**
- Position: (0, 2, 10) looking at loom
- FOV: 50 degrees
- Duration: 6 seconds
- Movement: Slow dolly around loom
- Focus: Loom, light and darkness

**Shot 4.2 — White Thread:**
- Position: (0.5, 2, 2) looking at thread
- FOV: 25 degrees
- Duration: 4 seconds
- Movement: Slow push in
- Focus: White thread, extreme close-up

---

# 8. SPECIAL EFFECTS

---

## EFFECT: STARS TWINKLING

**Type:** Animation
**Frequency:** 1 Hz
**Intensity Variation:** +/- 0.1
**Count:** 1000+

---

## EFFECT: CONSTELLATION ROTATION

**Type:** Transform animation
**Movement:** Slow rotation
**Speed:** 0.1 degrees/second
**Center:** Celestial north

---

## EFFECT: LIGHTNING

**Type:** Particle burst
**Particles:** 100, lightning bolts
**Duration:** 0.2 seconds
**Emission:** From thunderbolt
**Velocity:** Random, 10m/s
**Lifetime:** 0.5 seconds
**Color:** White (#FFFFFF) with blue (#4299E1)
**Sound:** Thunder, 100 Hz

---

## EFFECT: FEAR VISION

**Type:** Post-process + projection
**Effect:** Sepia tone, slight blur
**Projection:** King Jason hologram
**Color:** Gold (#FFD700), alpha 0.8
**Duration:** 5 seconds

---

# 9. FABRIC OF TIME — UNIVERSE PATTERNS

---

## PATTERN: THE THREAD

**Locations:**
- Scene 1: Weaves through stars
- Scene 2: Connects Zeus to crew
- Scene 3: Connects Jason to fear
- Scene 4: Becomes the white thread

---

## PATTERN: THE STAR THEME

**Visual:** Starlight pulses
**Color:** #F5F5F5
**Frequency:** 1 Hz
**Intensity:** 0.3
**Location:** Stars, loom, thread

---

## PATTERN: THE LOOM GRID

**Appearance:** Faint grid lines
**Color:** #F5F5F5, alpha 0.1
**Spacing:** 1m x 1m
**Visibility:** Only in starlight

---

## PATTERN: THE FATES' THREADS

**Appearance:** Thin vertical lines
**Color:** White, alpha 0.05
**Quantity:** 100+
**Movement:** Slight sway

---

# END OF GODOT 3D PART 07

*Jason Isaac Brodsky (California 1976) — Conducier*
*CSM Cinema — Godot 3D Production Bible — Part 07 of 11*
*The Sky Loom. All physical attributes for 3D element creation.*

---

*Next: Godot 3D Parts 08-11*
