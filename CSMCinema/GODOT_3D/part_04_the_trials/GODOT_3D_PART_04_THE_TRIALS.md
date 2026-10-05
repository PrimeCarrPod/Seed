# THE GOLDEN FLEECE — GODOT 3D PRODUCTION BIBLE

## PART 04 OF 11: THE TRIALS

### Jason Isaac Brodsky (California 1976) — Conducier

**Engine:** Godot 4.x
**Scale:** 1 unit = 1 meter
**Coordinate System:** Y-up, Z-forward, X-right

---

# 1. SCENE LIST AND ENVIRONMENTS

---

## SCENE 1: THE BULLS

**Environment:** Plains of Ares — Midday
**Skybox:** Clear midday, harsh sun
**Ground:** Black volcanic soil, cracked
**Fog:** Heat shimmer, density 0.01
**Ambient Temperature (visual):** Hot, volcanic, dangerous

---

## SCENE 2: THE TEETH

**Environment:** Plains of Ares — Midday
**Same as Scene 1**

---

## SCENE 3: MEDEA'S CHOICE

**Environment:** Hecate's Temple — Night
**Skybox:** Interior, torchlit
**Fog:** None

---

## SCENE 4: THE VISION

**Environment:** Abstract/Vision Space
**Fog:** Volumetric, density 0.05, color #9F7AEA

---

# 2. CHARACTER ASSETS (High Detail — Close Camera)

---

## CHARACTER: JASON — TRANSFORMED BY FIRE

### Head and Face (EXTREME DETAIL — Close Camera)

**Changes from Part 03:**
- Skin: More weathered, soot-stained
- Hair: Singed tips more pronounced
- Eyes: Changed, seen fire, determination
- Expression: Absolute confidence

### Outfit: Burned Robes (HIGH DETAIL)

**Burn Marks:**
- Hem: 0.10m of burning, blackened
- Sleeves: Singed edges, 0.05m
- Color: Brown (#6B4423) with black burns (#1A1A1A)
- Smell: Smoke (visual representation)

---

## PROP: THE FIRE-BREATHING BULLS (EXTREME DETAIL)

### Model Specifications

**Height:** 1.80m at shoulder
**Length:** 2.50m (nose to tail)
**Width:** 0.80m
**Weight:** Appears massive, 800 kg

### Head

**Shape:** Massive, bull-like
**Horns:** Two, curved, 0.50m length, bronze
**Eyes:** Red (#E53E3E), glowing
**Nostrils:** Large, flared, fire breathes from here
**Muzzle:** Bronze, metallic
**Teeth:** Visible, sharp, bronze

### Body

**Material:** Bronze, forged
**Color:** Bronze (#CD7F32) with orichalcum (#B8860B) veins
**Texture:** Hammered, visible forge marks
**Legs:** Four, powerful, bronze hooves
**Hooves:** 0.15m diameter, leave scorched prints
**Tail:** Short, bronze, whip-like

### Fire Breath

**Type:** Particle-based
**Color:** Orange (#FF4500) at base, red (#E53E3E) at tip
**Height:** 3m flame
**Duration:** 2 seconds
**Frequency:** Every 5 seconds
**Light Cast:** PointLight3D, orange, range 10m, intensity 1.0
**Sound:** Roaring, 80 Hz + hissing

---

## PROP: THE DRAGON'S TEETH

### Model Specifications

**Shape:** Black diamond, 0.05m x 0.03m x 0.02m
**Color:** Black (#0A0A0A) with purple veins (#4A1A6B)
**Material:** Obsidian, glowing
**Glow:** Emissive, purple, intensity 0.3
**Count:** 100+ in field
**Sowing:** Scattered in soil rows

---

## PROP: THE SPARTOI (Warriors from Teeth)

### Model Specifications

**Height:** 1.80m (when sprung)
**Build:** Armored, ancient
**Material:** Bronze, ancient
**Color:** Bronze (#CD7F32) with patina (#4A7C59)
**Weapons:** Bronze swords, spears
**Movement:** Confused, aggressive
**Lifetime:** 30 seconds before dissolving

---

# 3. PROPS AND SET PIECES (Medium Detail)

---

## SET: PLAINS OF ARES

### Ground

**Material:** Volcanic soil
**Color:** Black (#1A1A1A)
**Texture:** Cracked, 0.05m deep cracks
**Heat:** Shimmer effect, 0.5m above ground
**Smoke:** Rising from cracks, grey
**Fires:** Small fires burning, scattered

### Subterranean Pens

**Material:** Stone, black
**Color:** Black (#0A0A0A)
**Opening:** 2m x 1.5m arch
**Depth:** 5m visible
**Heat:** Rising from below

---

# 4. ENVIRONMENTAL ELEMENTS

---

## THE PLOW

**Material:** Wood, oak
**Color:** Brown (#8B4513)
**Blade:** Bronze, 0.30m
**Length:** 1.50m
**Handle:** Wood, leather-wrapped

---

## THE FIELD

**Dimensions:** 400m x 400m
**Rows:** 20 rows, 20m apart
**Soil:** Plowed, loose, black
**Fires:** 10 small fires, scattered
**Smoke:** Grey, rising

---

# 5. MATERIALS AND TEXTURES

---

## MATERIAL: VOLCANIC SOIL

**Base Color:** #1A1A1A
**Roughness:** 0.90
**Metallic:** 0.0
**Cracks:** 0.05m deep, darker (#0A0A0A)
**Heat:** Shimmer shader, 0.5m above
**Smoke:** Particle-based, grey

---

## MATERIAL: BRONZE (Bulls, Weapons)

**Base Color:** #CD7F32
**Roughness:** 0.40
**Metallic:** 0.85
**Hammer Marks:** Visible, 0.01m spacing
**Orichalcum Veins:** #B8860B, 0.005m wide
**Patina:** Green (#4A7C59) in recesses

---

## MATERIAL: OBSIDIAN (Teeth)

**Base Color:** #0A0A0A
**Roughness:** 0.10
**Metallic:** 0.0
**Veins:** Purple (#4A1A6B), 0.002m wide
**Glow:** Emissive, purple, intensity 0.3
**Transparency:** Slight, alpha 0.9

---

# 6. LIGHTING SPECIFICATIONS

---

## SCENE 1-2: PLAINS OF ARES

**Sun:**
- Type: DirectionalLight3D
- Color: #FF4500 (harsh, volcanic)
- Intensity: 1.5
- Angle: 80 degrees above horizon

**Heat Shimmer:**
- Type: Post-process shader
- Intensity: 0.3
- Height: 0.5m above ground

**Fires:**
- 10x PointLight3D
- Color: #FF4500
- Range: 5m
- Intensity: 0.8
- Flicker: Animated, +/- 0.2

**Ambient:**
- Type: AmbientLight3D
- Color: #4A1A6B (purple tint)
- Intensity: 0.2

---

# 7. CAMERA DATA

---

## SCENE 1: THE BULLS

**Shot 1.1 — The Field:**
- Position: (0, 10, -30) looking at field
- FOV: 60 degrees
- Duration: 6 seconds
- Movement: Slow dolly in
- Focus: Entire field, bulls emerging

**Shot 1.2 — The Bulls Emerge:**
- Position: (5, 2, 5) looking at bulls
- FOV: 45 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Bulls emerging, fire breath

**Shot 1.3 — Jason Walks:**
- Position: (0, 1.5, 3) looking at Jason
- FOV: 40 degrees
- Duration: 6 seconds
- Movement: Track with Jason
- Focus: Jason walking, empty-handed

**Shot 1.4 — The Touch:**
- Position: (1, 1.5, 1) looking at Jason's hand
- FOV: 30 degrees
- Duration: 3 seconds
- Movement: Slow push in
- Focus: Jason's hand on bull's muzzle, extreme close-up

---

## SCENE 2: THE TEETH

**Shot 2.1 — The Sowing:**
- Position: (0, 2, 5) looking at Jason
- FOV: 40 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Jason sowing teeth

**Shot 2.2 — The Warriors Spring:**
- Position: (3, 1.5, 3) looking at field
- FOV: 45 degrees
- Duration: 5 seconds
- Movement: Static
- Focus: Warriors springing from earth

**Shot 2.3 — The Stone:**
- Position: (0, 1, 2) looking at Jason
- FOV: 35 degrees
- Duration: 3 seconds
- Movement: Static
- Focus: Jason throwing stone

---

# 8. SPECIAL EFFECTS

---

## EFFECT: FIRE BREATH

**Type:** Particle-based
**Particles:** 300 per breath
**Shape:** Cone, 0.10m base, 3m height
**Color:** Orange (#FF4500) to red (#E53E3E)
**Duration:** 2 seconds
**Light Cast:** PointLight3D, range 10m, intensity 1.0
**Sound:** Roaring + hissing

---

## EFFECT: HEAT SHIMMER

**Type:** Post-process shader
**Intensity:** 0.3
**Height:** 0.5m above ground
**Distortion:** UV displacement, 0.02m amplitude
**Speed:** Slow, 0.5 Hz

---

## EFFECT: WARRIORS SPRINGING

**Type:** Particle burst + transform
**Particles:** 50, soil chunks
**Duration:** 1 second
**Emission:** From ground
**Velocity:** Upward + outward, 3m/s
**Lifetime:** 2 seconds
**Warriors:** Transform from 0m to 1.80m height
**Duration:** 2 seconds
**Easing:** Ease-out

---

## EFFECT: WARRIORS DISSOLVING

**Type:** Particle fade
**Duration:** 5 seconds
**Effect:** Alpha fade to 0
**Particles:** Bronze particles, 0.001m
**Count:** 1000 per warrior
**Movement:** Scatter outward
**Lifetime:** 3 seconds

---

# 9. FABRIC OF TIME — UNIVERSE PATTERNS

---

## PATTERN: THE THREAD

**Locations:**
- Scene 1: Weaves through bulls' bronze
- Scene 2: Connects teeth to soil
- Scene 3: Wraps around vial
- Scene 4: Weaves through vision

---

## PATTERN: THE FIRE THEME

**Visual:** Fire pulses
**Color:** #FF4500
**Frequency:** 1 Hz
**Intensity:** 0.5
**Location:** Bulls' nostrils, field fires

---

## PATTERN: THE LOOM GRID

**Appearance:** Faint grid lines
**Color:** #9F7AEA, alpha 0.1
**Spacing:** 1m x 1m
**Visibility:** Only in heat shimmer

---

## PATTERN: THE FATES' THREADS

**Appearance:** Thin vertical lines
**Color:** White, alpha 0.05
**Quantity:** 100+
**Movement:** Slight sway

---

# END OF GODOT 3D PART 04

*Jason Isaac Brodsky (California 1976) — Conducier*
*CSM Cinema — Godot 3D Production Bible — Part 04 of 11*
*The Trials. All physical attributes for 3D element creation.*

---

*Next: Godot 3D Parts 05-11*
