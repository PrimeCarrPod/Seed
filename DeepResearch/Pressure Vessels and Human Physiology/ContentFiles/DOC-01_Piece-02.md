# DOC-01: PVHO Taxonomic Framework & Operational Parameters
## Document 1 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 101-200 | Piece 2 of 9 | ~100 Lines

---

#### 1.2 Operational Continuum Taxonomy (Seven PVHO Classes)

The operational continuum of PVHOs encompasses seven distinct taxonomic classes, each occupying a unique region of the pressure-time-gas composition phase space. Classification is determined by the primary pressure differential direction (internal vs. external), operational pressure range, cycle frequency, and physiological management strategy.

**Class I: Deep-Sea Submersibles (External Pressure Dominant)**
- **Pressure Range:** 0.1–110 MPa (10–11,000 msw / 33–36,000 fsw)
- **Differential:** $\Delta P = P_{ext} - P_{int} \approx P_{ext}$ (internal maintained at 101.3 kPa)
- **Cycle Profile:** Single compression per mission (hours to days), slow decompression
- **Structure:** Thick-walled sphere or cylinder (t/r > 0.1), titanium, maraging steel, or syntactic foam composites
- **Examples:** *Trieste* (1960, 109 MPa), *Deepsea Challenger* (2012, 110 MPa), *Limiting Factor* (2019, 110 MPa repeatable), *Alvin* (1964/2013 upgrade, 65 MPa)
- **Physiology:** 1 atm internal → no inert gas saturation, no decompression obligation
- **Life Support:** Closed-circuit CO₂ scrubbing (LiOH/soda lime), O₂ replenishment, thermal management against 2–4°C seawater
- **Viewport:** Conical acrylic (PMMA) or sapphire, external pressure sealing geometry

**Class II: Diving Bells (External Pressure, Wet/Dry Interface)**
- **Pressure Range:** 0.1–70 MPa (10–7,000 msw)
- **Differential:** $\Delta P = P_{ext} - P_{int} \approx P_{ext}$ (internal = ambient at depth)
- **Cycle Profile:** Rapid compression (minutes), extended dwell (hours), controlled decompression
- **Structure:** Open-bottom cylinder, internal pressure = hydrostatic at depth
- **Examples:** Closed bells (saturation diving), open bells (air diving to 50 msw), rescue bells (Submarine Rescue Vehicle)
- **Physiology:** Occupants saturated at ambient pressure → full decompression obligation
- **Life Support:** Surface-supplied gas (umbilical), heated breathing gas, CO₂ scrubbing internal
- **Transfer:** Lock-on to saturation habitat (Class VII) via trunking

**Class III: Personnel Transfer Capsules (Hyperbaric Shuttle)**
- **Pressure Range:** 0.1–70 MPa (matches saturation depth)
- **Differential:** $\Delta P = P_{int} - P_{ext}$ (internal = saturation pressure, external = 1 atm surface)
- **Cycle Profile:** Single pressurization at depth, transfer under pressure, depressurization at surface facility
- **Structure:** Cylindrical with hemispherical ends, designed for internal pressure at depth-equivalent
- **Examples:** Submarine Rescue Chamber (SRC), Pressurized Rescue Module (PRM), Hyperbaric Evacuation System (HES)
- **Physiology:** Maintains saturation pressure throughout transfer → no additional decompression
- **Life Support:** Self-contained (24–72 hr), LiOH CO₂ scrubbing, O₂ makeup, thermal, communications
- **Interface:** Flanged mating with saturation habitat and surface decompression chamber

**Class IV: Hyperbaric Medical Chambers (Internal Pressure Dominant, Cyclic)**
- **Pressure Range:** 101–600 kPa (1–6 ATA / 0–50 msw equivalent)
- **Differential:** $\Delta P = P_{int} - P_{ext}$ (external = 1 atm)
- **Cycle Profile:** High-frequency cyclic (daily treatments, 90–120 min cycles, 20–40 sessions)
- **Structure:** Cylindrical multiplace (ASME PVHO-1), acrylic viewports, rectangular door plugs
- **Examples:** Multiplace chambers (6–28 occupants), monoplace acrylic tubes, Topside chambers (saturation support)
- **Physiology:** Intermittent exposure → no saturation, acute oxygen toxicity management critical
- **Life Support:** Air or O₂ breathing via BIBS (Built-In Breathing System), air breaks, temperature control
- **Fire Risk:** Elevated pO₂ (up to 2.8 ATA O₂) → strict material controls, deluge systems

**Class V: High-Altitude Aircraft (Internal Pressure Dominant, Cyclic)**
- **Pressure Range:** 75–101 kPa internal (cabin altitude 0–2,400 m / 0–8,000 ft)
- **Differential:** $\Delta P = P_{int} - P_{ext}$ up to 60 kPa (8.7 psi) at cruise
- **Cycle Profile:** One cycle per flight (pressurize at climb, depressurize at descent), 10⁴–10⁵ cycles lifetime
- **Structure:** Monocoque/semi-monocoque aluminum or composite fuselage, integral pressure vessel
- **Examples:** Commercial airliners (B787: 101 kPa cabin at 13 km), business jets, military transports
- **Physiology:** Hypobaric hypoxia prevention, DCS risk minimal at cabin altitude < 2,400 m
- **Life Support:** Bleed air / electric compressors, outflow valves, ozone converters, humidity control
- **Fatigue:** Primary design driver — cyclic hoop stress, damage-tolerance mandated (Comet legacy)

**Class VI: Extravehicular Mobility Units — EMUs (Anthropomorphic, Hypobaric)**
- **Pressure Range:** 20.7–40 kPa internal (3.0–5.8 psi / 150–300 mmHg)
- **Differential:** $\Delta P = P_{int} - P_{ext} \approx P_{int}$ (external = vacuum ~10⁻¹⁴ Pa)
- **Cycle Profile:** Per-EVA cycle (6–8 hr), 25–50 cycles per suit lifetime
- **Structure:** Softgoods pressure bladder (urethane nylon) + restraint layer (Dacron/Vectran), joints = bellows/convolutes
- **Examples:** NASA EMU (ISS/Shuttle, 30 kPa), Russian Orlan (40 kPa), Chinese Feitian, SpaceX EVA suit (Axiom), Collins Aerospace xEMU
- **Physiology:** 100% O₂ atmosphere, pre-breathe denitrogenation mandatory, DCS risk at transition
- **Life Support:** PLSS (Portable Life Support System) — LiOH/swing-bed CO₂, sublimator heat rejection, LCVG cooling
- **Mobility:** Joint torque vs. pressure trade space — primary design constraint

**Class VII: Saturation Habitat Complexes (Internal Pressure = Ambient, Long-Duration)**
- **Pressure Range:** 0.1–70 MPa (matches operational depth)
- **Differential:** $\Delta P = P_{int} - P_{ext} \approx 0$ at depth (pressurized to ambient)
- **Cycle Profile:** Single compression (12–24 hr), dwell (days to weeks), single decompression (days)
- **Structure:** Multi-chamber cylindrical complex (living, transfer, hygiene, machinery), internal pressure = hydrostatic
- **Examples:** *Aquarius* (NOAA, 20 msw), *Hydrolab*, *Conshelf*, commercial saturation systems (Oceaneering, TechnipFMC), naval submarine rescue chambers
- **Physiology:** Full saturation → fixed decompression time independent of dwell duration
- **Life Support:** Heliox/Trimix breathing gas, thermal management (85–95°F / 29–35°C), CO₂ scrubbing, trace contaminant control, sanitation, food prep
- **Transfer:** Lock-on to Class II (bell) and Class III (transfer capsule)

---

*End of Piece 2 — DOC-01 Lines 101-200*
*Next: Piece 3 — Section 1.3 Pressure Differential Thresholds & Safety Factors*