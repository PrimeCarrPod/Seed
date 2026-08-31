# THE GOLDEN FLEECE — GODOT 3D PRODUCTION BIBLE

## PART 01 OF 11: THE CALL

### Jason Isaac Brodsky (California 1976) — Conducier

**Engine:** Godot 4.x
**Scale:** 1 unit = 1 meter
**Coordinate System:** Y-up, Z-forward, X-right
**Target Platform:** Desktop/Console 3D rendering

---

# TABLE OF CONTENTS

1. SCENE LIST AND ENVIRONMENTS
2. CHARACTER ASSETS (High Detail — Close Camera)
3. PROPS AND SET PIECES (Medium Detail)
4. ENVIRONMENTAL ELEMENTS (Medium-Low Detail)
5. MATERIALS AND TEXTURES
6. LIGHTING SPECIFICATIONS
7. CAMERA DATA
8. SPECIAL EFFECTS
9. FABRIC OF TIME — UNIVERSE PATTERNS

---

# 1. SCENE LIST AND ENVIRONMENTS

---

## SCENE 1: THE ORDINARY WORLD

**Environment:** Iolcus Market Square — Pre-Dawn
**Skybox:** Pre-dawn gradient (see Lighting)
**Ground:** Cobblestone plaza (see Environment)
**Surrounding Structures:** Fish market (north), brick ovens (east), palace (south), open sea (west)
**Fog:** Linear fog, density 0.02, color #4A5568 (mist grey-blue)
**Ambient Temperature (visual):** Cool, damp, pre-dawn

---

## SCENE 2: THE KING WATCHES

**Environment:** Iolcus Market Square + Palace Balcony — Pre-Dawn
**Addition:** Palace balcony at 3.66m (12ft) height
**Fog:** Linear fog, density 0.015 (thinning)

---

## SCENE 3: THE HEIR WALKS

**Environment:** North Road approaching Market Square
**Addition:** Dirt road, 40m visible length
**Fog:** Linear fog, density 0.02

---

## SCENE 4: THE CONFRONTATION

**Environment:** Market Square — Center
**Fog:** Linear fog, density 0.01 (thinning as scene progresses)

---

## SCENE 5: THE COUNTER-CALL

**Environment:** Market Square — Center + Balcony
**Fog:** Linear fog, density 0.008

---

## SCENE 6: THE GODDESS APPEARS

**Environment:** Fisherman's Hut — Interior/Night
**Skybox:** Night sky, full moon
**Interior:** Small stone hut, thatched roof
**Fog:** None (interior scene)

---

## SCENE 7: THE DEBT

**Environment:** Fisherman's Hut — Interior
**Addition:** Triple light sources (Hecate's torches)
**Fog:** None

---

## SCENE 8: THE VISION

**Environment:** Abstract/Vision Space
**Addition:** Holographic-style projections of future elements
**Fog:** Volumetric, density 0.05, color #9F7AEA (vision purple)

---

# 2. CHARACTER ASSETS (High Detail — Close Camera)

---

## CHARACTER: JASON — PRIMARY HERO

### Model Specifications

**Height:** 1.80m (5'11")
**Proportions:** Heroic — slightly idealized Greek proportions
**Head Height:** 0.23m (from chin to crown)
**Shoulder Width:** 0.48m
**Hip Width:** 0.38m
**Arm Length:** 0.72m (shoulder to wrist)
**Leg Length:** 0.90m (hip to ground)
**Foot Length:** 0.28m (right, sandaled)
**Foot Length:** 0.27m (left, bare — slightly more calloused)

### Head and Face (EXTREME DETAIL — Close Camera)

**Head Shape:** Oval, slightly angular jaw
**Forehead:** Smooth, with subtle bone structure visible
**Eyebrows:** Thick, brown-gold, natural arch
**Eye Shape:** Almond, slightly upturned at outer corners
**Iris Color:** Blue-green (hex #4FD1C5), with golden flecks near pupil
**Pupil:** Round, black, with catchlight
**Sclera:** Slightly warm white, with subtle blood vessels at corners
**Eyelashes:** Medium length, dark brown
**Nose:** Straight, slight bump on bridge (lived-in)
**Nostrils:** Oval, slightly flared
**Mouth:** Medium width, full lower lip
**Lip Color:** Natural pink-brown (#D4956A)
**Teeth:** Visible when speaking, white with slight natural yellow
**Ears:** Close to head, visible lobes
**Facial Hair:** Clean-shaven (young)
**Skin Tone:** Warm Mediterranean (#D4A574)
**Skin Texture:** Subtle pores, slight weathering on cheeks and forehead
**Cheekbones:** Prominent but not sharp
**Jawline:** Defined, slight stubble shadow
**Chin:** Slight cleft
**Neck:** Muscular, visible tendons when turning head
**Adam's Apple:** Subtle

### Hair (EXTREME DETAIL — Close Camera)

**Style:** Medium length, slightly tousled, falls to 0.05m below ears
**Color:** Golden (#D4A017 at highlights, #B8860B at shadows)
**Texture:** Slight wave, fine-medium strand thickness
**Strand Detail:** Individual visible strands at edges
**Parting:** Natural center-ish, slightly messy
**Forehead:** Some strands fall across forehead
**Back:** Reaches collar, slightly damp from sea air
**Movement:** Physics-enabled, responds to wind and motion
**Specular:** Medium — healthy sheen

### Torso (HIGH DETAIL)

**Neck:** Muscular, 0.16m circumference
**Shoulders:** Broad, 0.48m across, defined deltoids
**Chest:** Defined pectorals, visible through robes
**Abdomen:** Toned, six-pack subtle (not bodybuilder)
**Back:** Defined latissimus dorsi, visible spine
**Waist:** 0.82m circumference
**Skin:** Warm Mediterranean (#D4A574), with subtle tan lines
**Skin Texture:** Subtle body hair on chest (golden, fine)
**Scars:** None (young, trained but not yet battle-scarred)
**Veins:** Subtle on forearms, hands

### Arms (HIGH DETAIL)

**Upper Arm:** Defined biceps/triceps, 0.32m circumference
**Elbow:** Visible joint structure
**Forearm:** Defined muscles, visible tendons when gripping
**Wrist:** 0.18m circumference, visible bones

### Hands (EXTREME DETAIL — Close Camera)

**Length:** 0.19m (wrist to middle finger tip)
**Width:** 0.09m across palm
**Fingers:** Long, calloused (trained with weapons)
**Knuckles:** Visible, slightly scarred
**Nails:** Short, clean, slight dirt under edges
**Palm Lines:** Deep life line, heart line, head line
**Calluses:** On palm base (sword grip), finger tips (archery)
**Skin:** Same tone as face, slightly darker on knuckles
**Veins:** Subtle on back of hand
**Joints:** Visible knuckle structure

### Legs (HIGH DETAIL)

**Thigh:** Defined quadriceps, 0.55m circumference
**Knee:** Visible joint structure
**Calf:** Defined gastrocnemius
**Shin:** Smooth, slight bruising (training)
**Ankle:** Visible ankle bone

### Feet (HIGH DETAIL — Close Camera)

**Right Foot (Sandaled):**
- Length: 0.28m
- Width: 0.10m
- Sandal: Leather straps, brown (#8B4513), worn
- Sole: 0.01m thick leather, visible wear pattern
- Straps: Cross over instep, wrap around ankle
- Buckle: Bronze, simple pin closure
- Toes: Partially visible, same skin tone

**Left Foot (Bare):**
- Length: 0.27m
- Width: 0.10m
- Skin: Same tone, more weathered
- Calluses: Heavy on heel, ball of foot
- Toes: Slightly splayed, natural
- Nails: Short, clean
- Dirt: Slight accumulation between toes
- Sole: Visible wear pattern, darker skin

### Outfit: Traveler's Robes (HIGH DETAIL)

**Material:** Wool, woven, slightly rough texture
**Color:** Brown (#6B4423 at base, #8B6914 at highlights)
**Weave:** Visible thread pattern, slight irregularities
**Neckline:** V-neck, 0.08m deep
**Sleeveless:** Armholes finished with simple stitching
**Length:** To mid-thigh (0.45m from shoulder)
**Belt:** Leather, 0.05m wide, brown (#5C3317)
- Buckle: Bronze, simple D-ring
- Pouch: Leather, empty, 0.10m x 0.08m
- Knife: Small, bronze blade (0.12m), wooden handle
**Hem:** Slightly frayed, road-worn
**Stains:** Dirt, dust, slight mud splatter
**Folds:** Physics-enabled, respond to movement
**Tears:** None (yet)

### Outfit: Sandal (Right Foot) (HIGH DETAIL)

**Material:** Leather, hand-stitched
**Color:** Brown (#8B4513)
**Sole:** 0.01m thick, visible wear pattern
**Straps:** 0.02m wide, three straps crossing instap
**Ankle Wrap:** Two straps, wrap once, tuck under
**Buckle:** Bronze pin, simple
**Wear:** Visible on heel, ball of foot
**Age:** Worn but well-maintained (father's sandal)

---

## CHARACTER: PELIAS — THE USURPER

### Model Specifications

**Height:** 1.83m (6'0")
**Proportions:** Once powerful, now diminished
**Head Height:** 0.24m
**Shoulder Width:** 0.46m (narrower than Jason)
**Build:** Slight slump, less muscle definition than Jason
**Age:** 50s (visible in face, hands, posture)

### Head and Face (EXTREME DETAIL — Close Camera)

**Head Shape:** Oval, slightly gaunt
**Forehead:** Wrinkled, deep lines (worry lines)
**Eyebrows:** Grey, thick, bushy, slight droop
**Eye Shape:** Slightly hooded, tired
**Iris Color:** Brown (#6B4423), bloodshot
**Sclera:** Yellowed, visible blood vessels
**Eyelashes:** Sparse, grey
**Nose:** Prominent, slight redness (drink? stress?)
**Nostrils:** Oval, visible nose hair
**Mouth:** Thin lips, slight frown (default expression)
**Lip Color:** Pale (#A0785A)
**Teeth:** Yellowed, one missing (upper left molar)
**Ears:** Protruding slightly, age-spotted
**Facial Hair:** Clean-shaven but with grey stubble shadow
**Skin Tone:** Pale Mediterranean (#C4A574)
**Skin Texture:** Wrinkled, age spots on cheeks, sagging at jawline
**Cheekbones:** Prominent (gaunt)
**Jawline:** Sagging, slight double chin
**Chin:** Slight cleft, age-spotted
**Neck:** Loose skin, visible tendons
**Adam Apple:** Prominent

### Hair (HIGH DETAIL)

**Style:** Short, thinning at crown
**Color:** Grey (#A0A0A0 at roots, #C0C0C0 at tips)
**Texture:** Fine, slightly oily
**Parting:** Left side, combed over (hiding thinning)
**Visible Scalp:** At crown
**Back:** Short, neat
**Sideburns:** Grey, slightly long

### Torso (MEDIUM DETAIL)

**Posture:** Slight slump, shoulders forward
**Neck:** Loose skin, prominent tendons
**Shoulders:** Narrower than Jason, less muscle
**Chest:** Slight sag, less defined
**Abdomen:** Slight paunch
**Waist:** 0.90m circumference (wider than Jason)
**Skin:** Pale, less weathered but more aged

### Hands (HIGH DETAIL — Close Camera)

**Length:** 0.19m
**Width:** 0.085m
**Fingers:** Long, slightly knobby (early arthritis)
**Knuckles:** Enlarged, slight swelling
**Nails:** Yellowed, thick, slightly overgrown
**Palm Lines:** Deep, wrinkled
**Age Spots:** Multiple on back of hands
**Veins:** Prominent, ropy
**Tremor:** Slight (visible in idle animation)
**Ring:** Gold signet ring on right index finger (king's ring)

### Outfit: Royal Robes (HIGH DETAIL)

**Material:** Silk, fine weave (but too big for him)
**Color:** Purple (#6B238E at base, #8B4599 at highlights)
**Weave:** Fine, royal quality, slight sheen
**Neckline:** Round, 0.06m deep, gold trim
**Sleeves:** Long, 0.70m, wide (too wide for his arms)
**Length:** To ankles (0.10m too long, slightly dragging)
**Belt:** Gold chain, 0.04m wide, hangs loose
**Hem:** Gold thread embroidery (sun motifs)
**Folds:** Heavy, physics-enabled, pooling at feet
**Fit:** Too large (were Aristaeus's robes)
**Shoulder Pads:** Slight, decorative, gold thread

### Outfit: Crown (HIGH DETAIL — Close Camera)

**Material:** Gold, hammered
**Color:** Gold (#FFD700 at highlights, #B8860B at shadows)
**Style:** Sun-rayed, 7 rays extending upward
**Ray Height:** 0.08m above band
**Band:** 0.06m tall, 0.20m diameter
**Gems:** None (simple, ancient design)
**Weight:** Visible in how Pelias adjusts it constantly
**Interior:** Lined with leather (visible when removed)
**Wear:** Slight tarnish on underside

---

## CHARACTER: HECATE — THE TRIPLE GODDESS

### Model Specifications

**Height:** 1.70m (5'7") base, variable (see below)
**Proportions:** Divine — idealized, slightly supernatural
**Head Height:** 0.22m
**Shoulder Width:** 0.40m
**Build:** Slender, otherworldly

### Triple-Faced Head (EXTREME DETAIL — Close Camera)

**Maiden Face (Forward):**
- Age: Appears 18
- Skin: Porcelain smooth, luminous (#F5E6D3)
- Eyes: Green (#4FD1C5), glowing faintly
- Hair: Black, flowing, 0.50m long
- Expression: Slight smile, knowing
- Lips: Full, red (#8B0000)

**Mother Face (Left):**
- Age: Appears 35
- Skin: Warm, maternal (#E8C9A0)
- Eyes: Blue (#63B3ED), wise, deep
- Hair: Brown, braided with flowers
- Expression: Serene, watching
- Lips: Medium, natural (#D4956A)

**Crone Face (Right):**
- Age: Appears 70
- Skin: Wrinkled but dignified (#C4A574)
- Eyes: Red (#E53E3E), piercing, all-seeing
- Hair: White, wild, 0.30m long
- Expression: Stern, knowing
- Lips: Thin, pale (#A0785A)

**Mask/Face Transition:**
- Faces blend at edges (supernatural)
- Slight glow at face boundaries
- Faces rotate based on who is speaking
- Default: Maiden face forward

### Torso (HIGH DETAIL)

**Neck:** Slender, graceful
**Shoulders:** Narrow, delicate
**Chest:** Small, modest
**Waist:** Slim, 0.65m circumference
**Skin:** Luminous, slightly translucent
**Material:** Appears to be living stone/flesh hybrid
**Texture:** Smooth with subtle marble veining

### Outfit: Robes (HIGH DETAIL)

**Material:** Shadow-stuff, seems to absorb light
**Color:** Black (#0A0A0A at base, #1A1A2E at highlights)
**Weave:** Seems to shift and move independently
**Neckline:** High, modest
**Sleeves:** Long, flowing, 0.80m
**Length:** Floor-length, trailing 0.10m
**Folds:** Physics-enabled, seem to move without wind
**Trim:** Subtle silver thread (star patterns)
**Movement:** Robes seem alive, responding to mood

### Three Torches (EXTREME DETAIL — Close Camera)

**Torch 1 (Green Flame):**
- Handle: Bronze, 0.40m long, 0.02m diameter
- Flame Height: 0.25m
- Flame Color: Green (#48BB78 at base, #68D399 at tip)
- Flame Type: Volumetric, particle-based
- Smoke: Minimal, green-tinted
- Light Cast: Green point light, range 5m, intensity 0.8

**Torch 2 (Blue Flame):**
- Handle: Bronze, 0.40m long, 0.02m diameter
- Flame Height: 0.25m
- Flame Color: Blue (#4299E1 at base, #63B3ED at tip)
- Flame Type: Volumetric, particle-based
- Smoke: Minimal, blue-tinted
- Light Cast: Blue point light, range 5m, intensity 0.8

**Torch 3 (Red Flame):**
- Handle: Bronze, 0.40m long, 0.02m diameter
- Flame Height: 0.25m
- Flame Color: Red (#E53E3E at base, #FC8181 at tip)
- Flame Type: Volumetric, particle-based
- Smoke: Minimal, red-tinted
- Light Cast: Red point light, range 5m, intensity 0.8

**Hold:** Torches held in left hand, grouped
**Motion:** Slight sway, flames respond to movement

---

# 3. PROPS AND SET PIECES (Medium Detail)

---

## PROP: THE FLEECE (Scene 8 Vision Only)

**Shape:** Irregular oval, approximately 0.60m x 0.40m
**Material:** Gold, luminous, seems to glow from within
**Color:** Gold (#FFD700 at highlights, #B8860B at shadows)
**Texture:** Soft, fibrous, individual fibers visible
**Weight:** Appears light, floating slightly
**Attachment:** Hangs from a branch (in vision)
**Glow:** Emissive material, intensity 0.5
**Physics:** Slight movement as if breathing

---

## SET: FISHERMAN'S HUT (Scene 6-8)

### Exterior

**Dimensions:** 4m x 3m footprint, 2.5m height
**Walls:** Stone, irregular, 0.30m thick
- Color: Grey (#708090)
- Texture: Rough, moss patches
- Material: Granite, fieldstone

**Roof:** Thatched, 0.20m thick
- Color: Straw (#D4A017)
- Texture: Layered, dried grass
- Pitch: 45 degrees

**Door:** Wooden, 0.90m x 1.80m
- Color: Weathered grey (#696969)
- Hardware: Iron hinges, simple latch
- Opening: Inward, creaking

**Window:** Small, 0.40m x 0.40m, no glass
- Wooden shutters, open

### Interior

**Floor:** Packed earth
- Color: Brown (#8B6914)
- Texture: Hard, uneven

**Furniture:**
- **Bed:** Wooden frame, straw mattress, 1.90m x 0.90m
- **Stool:** Wooden, three-legged, 0.30m height
- **Table:** Wooden, small, 0.60m x 0.40m
- **Shelf:** Wooden, holds clay pots (3 pots, various sizes)

**Lighting:** Single oil lamp (Scene 6), then Hecate's torches (Scene 7)
- Oil lamp: Small, clay, warm light (#FFA500), range 2m

**Walls:** Same stone as exterior, visible inside
- Hooks: Iron, holding fishing net, drying herbs

---

## SET: PALACE BALCONY (Scene 2, 5)

**Dimensions:** 3m wide, 1.5m deep, 3.66m above ground
**Material:** Marble, white with grey veining
- Color: White (#F5F5F5) with grey veins (#A0A0A0)
- Texture: Polished, smooth, slight weathering

**Railing:** Marble, 1.05m height
- Balusters: 12, each 0.08m diameter, 0.90m tall
- Top rail: 0.06m thick, carved with wave motif
- Base rail: 0.08m thick

**Floor:** Marble tiles, 0.30m x 0.30m, alternating white and grey

**Columns:** 4 Doric columns supporting roof overhang
- Height: 4m
- Diameter: 0.50m at base, 0.40m at top
- Fluting: 20 flutes per column
- Capitals: Simple echinus and abacus

**Access:** Wide doorway from throne room (visible in background)

---

## SET: MARKET SQUARE (All Scenes)

### Ground

**Material:** Cobblestone
**Stone Size:** 0.15m x 0.15m x 0.08m (average)
**Stone Color:** Grey-blue (#708090 at base, #5A6A7A at shadows)
**Texture:** Worn smooth, slight moss in cracks
**Pattern:** Irregular, radial from center point
**Center Point:** Slightly raised (0.02m), worn smooth

**Dimensions:** 30m x 20m (visible area)

### Fish Market (North Side)

**Stalls:** Wooden, 8 stalls, each 2m x 1m
- Color: Weathered grey (#696969)
- Canvas Awnings: Red and white striped (#FF0000 and #FFFFFF)
- Poles: Wooden, 2.5m height

**Fish on Display:**
- Mackerel: 0.30m length, silver-green
- Sardines: 0.15m length, silver
- Sea Bass: 0.40m length, grey-green
- On beds of ice (melting, water pooling)

**Details:** Scales on ground, fish guts in bucket, flies (particles)

### Brick Ovens (East Side)

**Ovens:** 3 domes, each 1.5m diameter, 1.2m height
- Material: Clay brick, mortared
- Color: Red-brown (#8B0000)
- Opening: 0.40m x 0.30m arch
- Smoke: Rising, grey, particle-based

**Bread:** Visible on wooden peels, golden brown
**Fuel:** Wood pile beside ovens, stacked 1m high

### Palace (South Side)

**Facade:** Stone, 10m wide, 8m visible height
- Color: White marble (#F5F5F5)
- Columns: 6 Doric columns, 6m height
- Entablature: Carved with sea motifs
- Steps: 5 steps, each 0.15m high, 0.30m deep

---

# 4. ENVIRONMENTAL ELEMENTS (Medium-Low Detail)

---

## THE DOG

**Breed:** Molossian (ancient Greek mastiff)
**Height:** 0.70m at shoulder
**Length:** 1.10m (nose to tail)
**Weight:** Appears heavy, muscular
**Coat:** Brown-black (#3D2B1F)
**Texture:** Short, coarse
**Ears:** Floppy, cropped (ancient practice)
**Tail:** Long, slight curl
**Eyes:** Brown (#6B4423)
**Movement:** Trotting, purposeful
**Collar:** Leather, simple, with bronze ring

---

## THE CART

**Type:** Two-wheeled, donkey cart (donkey not visible)
**Dimensions:** 1.50m x 1.00m bed, 0.60m height
**Wheels:** 0.90m diameter, wooden, 6 spokes
**Material:** Wood, oak
**Color:** Weathered brown (#6B4423)
**Texture:** Rough, worn, slight rot at base
**Load:** Empty (or few baskets)
**Sound:** Creaking, rattling (audio)

---

## FOG (Pre-Dawn)

**Type:** Linear fog
**Density:** 0.02 (Scene 1), decreasing through scenes
**Color:** #4A5568 (mist grey-blue)
**Height:** Ground-hugging, 2m max
**Movement:** Slow drift, west to east
**Interaction:** Responds to character movement slightly

---

## SEA (Background)

**Type:** Animated shader
**Color:** Deep blue (#1A365D at horizon, #2C5282 at shore)
**Waves:** Small, 0.10m height, gentle
**Movement:** Slow, rhythmic
**Reflection:** Subtle, catches dawn light
**Horizon:** Slightly hazy, blends with fog

---

# 5. MATERIALS AND TEXTURES

---

## MATERIAL: COBBLESTONE

**Base Color:** #708090
**Roughness:** 0.85
**Metallic:** 0.0
**Normal Map:** Medium depth, worn edges
**Detail:** Moss patches (green, #4A7C59, in cracks)
**Scale:** 0.15m x 0.15m per stone
**Variation:** +/- 15% brightness per stone

---

## MATERIAL: MARBLE (Palace)

**Base Color:** #F5F5F5
**Roughness:** 0.15
**Metallic:** 0.0
**Veins:** Grey (#A0A0A0), 0.01m wide, branching
**Reflection:** Slight, polished surface
**Weathering:** Slight pitting on lower sections

---

## MATERIAL: WOOL (Jason's Robes)

**Base Color:** #6B4423
**Roughness:** 0.95
**Metallic:** 0.0
**Weave:** Visible thread pattern, 0.002m spacing
**Folds:** Catch light at crests, deep shadow in valleys
**Stains:** Dirt (#5C3317) at hem, dust (#A0A0A0) on shoulders

---

## MATERIAL: SILK (Pelias's Robes)

**Base Color:** #6B238E
**Roughness:** 0.30
**Metallic:** 0.1
**Weave:** Fine, tight, slight sheen
**Folds:** Heavy, deep, pooling
**Embroidery:** Gold thread (#FFD700), 0.005m wide

---

## MATERIAL: LEATHER (Sandal, Belt)

**Base Color:** #8B4513
**Roughness:** 0.70
**Metallic:** 0.0
**Grain:** Visible, slight wear patterns
**Edges:** Slightly darker, worn
**Hardware:** Bronze (#CD7F32), metallic 0.8, roughness 0.4

---

## MATERIAL: GOLD (Crown, Fleece)

**Base Color:** #FFD700
**Roughness:** 0.20
**Metallic:** 0.95
**Reflection:** Strong, mirror-like
**Scratches:** Fine, on underside (crown)
**Emissive:** Fleece only, intensity 0.5, color #FFD700

---

## MATERIAL: SKIN (All Characters)

**Base Color:** #D4A574 (Jason), #C4A574 (Pelias), #F5E6D3 (Hecate Maiden)
**Roughness:** 0.60
**Metallic:** 0.0
**Subsurface Scattering:** Enabled, subtle
**Pores:** Visible at close range, slight bump
**Variation:** Darker on knuckles, elbows, knees
**Veins:** Subtle blue (#4299E1) at wrists, temples

---

## MATERIAL: HAIR (All Characters)

**Type:** Particle-based or card-based
**Strand Thickness:** 0.0005m
**Specular:** Medium
**Color Variation:** +/- 10% from base

---

## MATERIAL: SHADOW-STUFF (Hecate's Robes)

**Base Color:** #0A0A0A
**Roughness:** 1.0
**Metallic:** 0.0
**Emission:** None
**Absorption:** Seems to absorb light (shader trick)
**Movement:** Animated, seems alive
**Stars:** Subtle silver points (#C0C0C0), 0.001m, scattered

---

# 6. LIGHTING SPECIFICATIONS

---

## SCENE 1-5: PRE-DAWN MARKET SQUARE

**Sun:**
- Type: DirectionalLight3D
- Position: Below horizon (negative Y angle)
- Color: #FFE4B5 (warm dawn)
- Intensity: 0.3
- Angle: -5 degrees below horizon

**Sky:**
- Type: WorldEnvironment, gradient
- Top Color: #1A1A2E (deep blue)
- Horizon Color: #FFA07A (dawn pink-orange)
- Ground Color: #2D3748 (dark grey)

**Ambient:**
- Type: AmbientLight3D
- Color: #4A5568 (mist blue)
- Intensity: 0.2

**Fog:**
- Type: FogVolume
- Color: #4A5568
- Density: 0.02 (decreasing through scenes)

**Practical Lights:**
- Oil lamps in windows: PointLight3D, #FFA500, range 3m, intensity 0.5
- Oven fires: PointLight3D, #FF4500, range 4m, intensity 0.7

---

## SCENE 6-8: FISHERMAN'S HUT (Night)

**Moon:**
- Type: DirectionalLight3D
- Color: #B0C4DE (moonlight blue)
- Intensity: 0.15
- Angle: 45 degrees above horizon

**Interior Ambient:**
- Type: AmbientLight3D
- Color: #2D3748
- Intensity: 0.1

**Oil Lamp (Scene 6):**
- Type: PointLight3D
- Color: #FFA500
- Range: 2m
- Intensity: 0.6
- Position: 0.30m above table

**Hecate's Torches (Scene 7):**
- 3x PointLight3D
- Green: #48BB78, range 5m, intensity 0.8
- Blue: #4299E1, range 5m, intensity 0.8
- Red: #E53E3E, range 5m, intensity 0.8
- Position: 1.20m height, held in left hand
- Flicker: Animated intensity +/- 0.1

**Moonlight through Window:**
- Type: SpotLight3D
- Color: #B0C4DE
- Range: 5m
- Angle: 30 degrees
- Intensity: 0.3

---

## SCENE 8: VISION SPACE

**Ambient:**
- Type: AmbientLight3D
- Color: #9F7AEA (vision purple)
- Intensity: 0.4

**Holographic Projections:**
- Type: Emissive materials
- Color: Various (ship: #D4A017, dragon: #E53E3E, Medea: #4FD1C5)
- Intensity: 0.6
- Transparency: Alpha 0.7

**Fog:**
- Type: Volumetric Fog
- Color: #9F7AEA
- Density: 0.05

---

# 7. CAMERA DATA

---

## SCENE 1: THE ORDINARY WORLD

**Shot 1.1 — Establishing Wide:**
- Position: (0, 8, -15) looking at (0, 0, 0)
- FOV: 60 degrees
- Duration: 8 seconds
- Movement: Slow dolly in to (0, 6, -10)
- Focus: Entire market square

**Shot 1.2 — The Dog:**
- Position: (2, 0.5, 3) looking at dog
- FOV: 45 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Dog crossing, shallow DOF

**Shot 1.3 — The Cart:**
- Position: (-3, 1, 5) looking at cart
- FOV: 50 degrees
- Duration: 3 seconds
- Movement: Slow pan right
- Focus: Cart rattling

**Shot 1.4 — Pelias on Balcony:**
- Position: (0, 2, 8) looking at (0, 3.66, 0)
- FOV: 35 degrees
- Duration: 6 seconds
- Movement: Tilt up to reveal balcony
- Focus: Pelias, medium shot

---

## SCENE 2: THE KING WATCHES

**Shot 2.1 — The Distance:**
- Position: (0, 1.5, 0) looking at (0, 3.66, -5)
- FOV: 40 degrees
- Duration: 5 seconds
- Movement: Static
- Focus: Jason at balcony, 40 yards

**Shot 2.2 — Pelias Close:**
- Position: (0, 3.66, 2) looking at (0, 3.66, 0)
- FOV: 30 degrees
- Duration: 4 seconds
- Movement: Slow push in
- Focus: Pelias's face, extreme close-up

---

## SCENE 3: THE HEIR WALKS

**Shot 3.1 — The Approach:**
- Position: (-5, 1.5, -20) looking at Jason
- FOV: 50 degrees
- Duration: 6 seconds
- Movement: Static, Jason walks toward camera
- Focus: Jason, one sandal visible

**Shot 3.2 — Footsteps:**
- Position: (0, 0.1, 2) looking at feet
- FOV: 40 degrees
- Duration: 4 seconds
- Movement: Track with Jason's feet
- Focus: Left bare, right sandal, alternating

---

## SCENE 4: THE CONFRONTATION

**Shot 4.1 — Jason's Declaration:**
- Position: (2, 1.5, 3) looking at Jason
- FOV: 45 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Jason, medium close-up

**Shot 4.2 — Pelias Reaction:**
- Position: (0, 3.66, 1) looking at Pelias
- FOV: 35 degrees
- Duration: 3 seconds
- Movement: Quick zoom to face
- Focus: Pelias's eyes, fear

---

## SCENE 6: THE GODDESS APPEARS

**Shot 6.1 — The Hut Interior:**
- Position: (1, 1.2, 1) looking at Jason sleeping
- FOV: 50 degrees
- Duration: 5 seconds
- Movement: Slow pan around room
- Focus: Jason, then empty space where Hecate will appear

**Shot 6.2 — Hecate Appears:**
- Position: (-1, 1.5, 0) looking at Hecate
- FOV: 40 degrees
- Duration: 3 seconds
- Movement: Static, flash of light (transition)
- Focus: Hecate, triple face, torches

---

## SCENE 7: THE DEBT

**Shot 7.1 — Hecate Close:**
- Position: (0, 1.5, 1.5) looking at Hecate
- FOV: 30 degrees
- Duration: 8 seconds
- Movement: Slow orbit around Hecate
- Focus: Triple face rotating, torches

**Shot 7.2 — Jason's Response:**
- Position: (0.5, 1, 0.5) looking at Jason
- FOV: 40 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Jason, unafraid

---

## SCENE 8: THE VISION

**Shot 8.1 — Holographic Projections:**
- Position: (0, 2, -3) looking at projections
- FOV: 60 degrees
- Duration: 10 seconds
- Movement: Slow dolly around projections
- Focus: Ship, crew, dragon, fleece, Medea (all holographic)

**Shot 8.2 — Medea in Vision:**
- Position: (0, 1.5, 1) looking at Medea projection
- FOV: 35 degrees
- Duration: 4 seconds
- Movement: Static
- Focus: Medea's face, gold eyes

---

# 8. SPECIAL EFFECTS

---

## EFFECT: HECATE'S APPEARANCE (Scene 6)

**Type:** Particle burst + flash
**Particles:** 500, green/blue/red mixed
**Duration:** 0.5 seconds
**Emission:** Sphere, radius 0.5m
**Velocity:** Outward, 2m/s
**Lifetime:** 1.5 seconds
**Fade:** Alpha fade out
**Flash:** Full-screen white, 0.1 seconds, then color grade to triple torch colors

---

## EFFECT: TORCH FLAMES (Scene 7-8)

**Type:** Volumetric particles
**Particles:** 200 per torch
**Shape:** Cone, 0.05m base, 0.25m height
**Color:** Green (#48BB78), Blue (#4299E1), Red (#E53E3E)
**Animation:** Turbulent, noise-based
**Emission Rate:** 50 particles/second
**Lifetime:** 0.5 seconds
**Light Cast:** PointLight3D, flickering

---

## EFFECT: VISION PROJECTIONS (Scene 8)

**Type:** Holographic shader
**Material:** Emissive, transparent, scanning lines
**Animation:** Slow rotation, slight flicker
**Color:** Gold (#FFD700) for ship/fleece, red (#E53E3E) for dragon, teal (#4FD1C5) for Medea
**Transparency:** Alpha 0.7
**Scan Lines:** Horizontal, moving upward, 0.01m spacing

---

## EFFECT: FOG (Scene 1-5)

**Type:** Volumetric fog
**Density:** 0.02 decreasing to 0.005
**Color:** #4A5568
**Movement:** Slow drift, wind-driven
**Interaction:** Displaced by character movement

---

# 9. FABRIC OF TIME — UNIVERSE PATTERNS

---

## PATTERN: THE THREAD (Recurring Visual Motif)

**Appearance:** Thin luminous line, 0.001m diameter
**Color:** Gold (#FFD700) at full intensity, fading to #B8860B
**Material:** Emissive, self-illuminating
**Movement:** Weaves through scenes, connects elements
**Visibility:** Subtle, almost subliminal
**Locations:**
- Scene 1: Weaves through cobblestones
- Scene 2: Connects Pelias to throne
- Scene 3: Guides Jason's path
- Scene 4: Connects Jason to balcony
- Scene 5: Wraps around Pelias's hands
- Scene 6: Emerges from Hecate's torches
- Scene 7: Connects Hecate to Jason
- Scene 8: Weaves all vision elements together

---

## PATTERN: THE SANDAL RHYTHM (Audio-Visual Sync)

**Visual:** Footstep impacts create ripple rings
**Ring:** 0.05m diameter, expanding to 0.15m
**Color:** #D4A017 (gold), alpha fading
**Duration:** 0.5 seconds per step
**Timing:** Left foot (bare) = higher pitch + brighter ring
**Timing:** Right foot (sandal) = lower pitch + dimmer ring
**Purpose:** Visual representation of the Sandal Theme

---

## PATTERN: THE LOOM GRID (Background Element)

**Appearance:** Faint grid lines in the air
**Color:** #9F7AEA (vision purple), alpha 0.1
**Spacing:** 1m x 1m grid
**Visibility:** Only in certain lighting angles
**Movement:** Slow rotation, almost imperceptible
**Purpose:** Visual reminder that everything is woven

---

## PATTERN: THE FATES' THREADS (Background Element)

**Appearance:** Thin vertical lines descending from above
**Color:** White (#FFFFFF), alpha 0.05
**Diameter:** 0.0005m
**Spacing:** Random, 0.5m average
**Movement:** Slight sway, as if in breeze
**Quantity:** 100+ visible at any time
**Purpose:** Visual representation of the Fates spinning

---

## PATTERN: THE GOLDEN RATIO (Composition Guide)

**Appearance:** Not visible in final render, but used for composition
**Ratio:** 1.618:1
**Application:** Character placement, architectural proportions, camera framing
**Purpose:** Visual harmony, unconscious beauty

---

## PATTERN: THE WORLD AXIS (Vertical Element)

**Appearance:** Invisible line from sky to underworld
**Representation:** Column of light at dramatic moments
**Color:** White (#FFFFFF), alpha 0.1
**Diameter:** 0.5m
**Visibility:** Only at key transitions
**Purpose:** Visual connection between realms

---

# END OF GODOT 3D PART 01

*Jason Isaac Brodsky (California 1976) — Conducier*
*CSM Cinema — Godot 3D Production Bible — Part 01 of 11*
*The Call. All physical attributes for 3D element creation.*

---

*Next: Godot 3D Part 02 — The Assembly*
