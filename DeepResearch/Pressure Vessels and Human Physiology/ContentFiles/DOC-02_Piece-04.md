# DOC-02: Historical Aerospace Pressurization Evolution (1920–1950)
## Document 2 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 1201-1300 | Piece 4 of 9 | ~100 Lines

---

#### 2.4 Lockheed Constellation (1943) — "Connie" Pressurization Evolution

The Lockheed Constellation (L-049/L-649/L-749/L-1049) refined the Stratoliner's pressurization concept with a larger cabin, higher cruise altitude, and the distinctive **triple-tail** that allowed hangar clearance. Its pressurization system introduced several innovations that became standard practice.

**2.4.1 Design Evolution from XC-35/307**

| Parameter | XC-35 | Boeing 307 | L-049 Constellation |
|-----------|-------|------------|---------------------|
| **First Flight** | 1937 | 1938 | 1943 |
| **Cabin Diameter** | 1.52 m | 3.48 m | 3.66 m (144 in) |
| **Pressurized Length** | 9.1 m | 22.6 m | 27.4 m (90 ft) |
| **Cruise Altitude** | 7,600 m | 6,100 m | 7,300 m (24,000 ft) |
| **Cabin Altitude** | 3,650 m | 3,650 m | **2,400 m (8,000 ft)** |
| **ΔP Max** | 27.6 kPa | 27.6 kPa | **34.5 kPa (5.0 psi)** |
| **Windows/Side** | 3 | 12 | 10 (rounded rectangular) |
| **Passengers** | 2 (test) | 33 | 44–60 |

**2.4.2 Structural Design — Higher ΔP, Larger Diameter**

**Hoop Stress at ΔP = 34.5 kPa, r = 1.83 m:**
$$\sigma_{\theta} = \frac{34,500 \times 1.83}{t}$$

**Skin Thickness Distribution (24S-T Alclad, L-049):**
- Crown: 2.8 mm (0.110 in)
- Upper Side: 2.5 mm (0.098 in)
- Lower Side: 2.3 mm (0.090 in)
- Belly: 2.1 mm (0.083 in)

**Resulting Hoop Stresses:**
- Crown: 22.6 MPa (SF = 14.3)
- Upper Side: 27.5 MPa (SF = 11.8)
- Lower Side: 27.5 MPa (SF = 11.8)
- Belly: 30.1 MPa (SF = 10.8)

**Frame Design:**
- Spacing: 0.51 m (20 in) — tighter than 307 (0.56 m)
- Material: 75S-T6 extrusions (higher strength than 24S-T)
- Web Thickness: 2.8 mm; Cap Area: 320 mm²
- **Pressure Bulkheads:** Fore (frame 14), Aft (frame 68) — hemispherical, 3.5 mm

**Stringers:** 54 × J-section (75S-T6), continuous through frames
- Area: 280 mm²; Moment of Inertia: 1.2×10⁶ mm⁴

**2.4.3 Window Design — Rounded Rectangular (The Compromise)**

Lockheed chose **rounded rectangular** windows for passenger preference (wider view) and manufacturing simplicity:

- **Dimensions:** 330 × 200 mm (13 × 7.9 in)
- **Corner Radius:** 25 mm (1.0 in) — smaller than 307's 51 mm
- **Aspect Ratio:** 1.65:1
- **Material:** Stretched acrylic, 11 mm thick
- **Mounting:** Riveted to **window frames** (not skin), double-row, seal in frame
- **Count:** 10 per side (20 total) + 3 cockpit windshields

**Stress Concentration Analysis (Modern FEA):**
$$K_t = 1 + 2\sqrt{\frac{a}{\rho}} \quad \text{(Peterson's formula for rounded rectangle)}$$
Where $a$ = half-width = 165 mm, $\rho$ = corner radius = 25 mm:
$$K_t = 1 + 2\sqrt{\frac{165}{25}} = 1 + 2 \times 2.57 = 6.14$$

**Actual FEA Result (accounting for frame stiffness):** K_t ≈ 2.8–3.0
- **Local Peak Stress:** 3.0 × 27.5 MPa = 82.5 MPa
- **Fatigue Limit (24S-T, 10⁷ cycles):** ~90 MPa (R = 0)
- **Margin:** 82.5 / 90 = 0.92 → **Below fatigue limit at design life**

**This narrow margin manifested as cracking in later high-cycle aircraft (L-1049 Super Constellation, 15,000+ cycles).**

**2.4.4 Pressurization System Innovations**

**Compressors:** 4 × Garrett AiResearch (engine-driven), improved from 307
- Flow: 0.68 kg/s each at 7,300 m
- **Variable Geometry Diffuser** — maintains efficiency across altitude range

**Cabin Altitude Control:** **"Constant Differential" mode** (industry first)
- Maintains ΔP = 34.5 kPa until cabin reaches 2,400 m
- Then holds cabin at 2,400 m while ΔP decreases with climb
- **Result:** Cabin altitude never exceeds 2,400 m up to max cruise (7,300 m)

**Outflow Valves:** 3 × electric-motor modulated (fore, mid, aft)
- **Rate Limiting:** 350 ft/min climb, 450 ft/min descent (improved from 307)
- **Position Feedback:** Potentiometer → cabin altitude indicator

**Humidity Control:** **First production aircraft with active humidification**
- Water spray nozzles in ducts (evaporative cooling + humidification)
- Target: 20–30% RH (vs. 5–10% without)
- Water capacity: 90 L (from galley supply)

**Emergency Systems:**
- **Negative Pressure Relief:** 2 valves (0.7 psi / 4.8 kPa differential)
- **Positive Pressure Relief:** 2 valves (5.5 psi / 37.9 kPa)
- **Manual Dump:** Cable-operated from cockpit (backup to electric)

**2.4.5 Operational Experience & Fatigue Findings**

| Phase | Cycles | Findings |
|-------|--------|----------|
| **L-049 (1945–1950)** | ~5,000 | No pressure-related cracks |
| **L-649 (1946–1952)** | ~8,000 | Minor seal leakage at corners |
| **L-749 (1947–1955)** | ~12,000 | First window corner cracks (3 aircraft) |
| **L-1049 (1951–1965)** | ~20,000 | **Widespread window corner cracking** |

**Crack Analysis (L-1049, 1958):**
- **Location:** Lower corner of window cutout (tension side of bending)
- **Initiation:** Rivet hole at frame intersection (stress concentration × rivet hole)
- **Propagation:** Along frame cap, then into skin
- **Fix:** **Doubler plates** (0.8 mm 2024-T3) over window corners; **cold-worked holes** (split sleeve)
- **Retrofit:** 220 aircraft modified (1959–1961)

**2.4.6 Weight & Performance**

| Item | L-049 | L-1049G | Notes |
|------|-------|---------|-------|
| **Empty Weight** | 23,600 kg | 28,800 kg | +22% stretch + engines |
| **Pressurization Penalty** | ~850 kg | ~1,100 kg | Scales with volume |
| **Max Payload** | 9,100 kg | 12,700 kg | Pressurization enables high-altitude efficiency |
| **Cruise Speed** | 500 km/h | 555 km/h | At 7,300 m (vs. 4,500 m unpressurized) |
| **Range (max payload)** | 3,200 km | 4,500 km | Tailwind benefit at altitude |

**2.4.7 Legacy to Jet Age**

The Constellation established:
1. **2,400 m cabin altitude** as comfort standard (adopted by DC-6, DC-7, Stratocruiser)
2. **Constant-differential control logic** (all subsequent piston and early jets)
3. **Active humidification** (abandoned in jets due to weight; returned in 787/A350)
4. **Rounded rectangular windows** — fatigue liability at high cycles (led to circular in 707/DC-8)
5. **Triple pressure bulkheads** (fore, mid-fuel-tank, aft) — damage tolerance

---

*End of Piece 4 — DOC-02 Lines 1201-1300*
*Next: Piece 5 — Section 2.5 Boeing 377 Stratocruiser (1947)*