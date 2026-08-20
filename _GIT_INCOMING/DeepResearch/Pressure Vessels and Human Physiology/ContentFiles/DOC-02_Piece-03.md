# DOC-02: Historical Aerospace Pressurization Evolution (1920–1950)
## Document 2 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 1101-1200 | Piece 3 of 9 | ~100 Lines

---

#### 2.3 Commercial Deployment: Boeing 307 Stratoliner (1938–1940)

The Boeing 307 Stratoliner was the **world's first commercial airliner with a pressurized cabin**, entering scheduled service with Transcontinental & Western Air (TWA) in July 1940. It translated the XC-35 proof-of-concept into a production airliner, establishing the operational and economic viability of stratospheric flight.

**2.3.1 Design Specification (Boeing Model 307, 1935)**

| Parameter | Requirement | Basis |
|-----------|-------------|-------|
| **Passengers** | 33 day / 25 sleeper | TWA route analysis (NY-LA) |
| **Cruise Altitude** | 6,100 m (20,000 ft) | Above weather, favorable winds |
| **Cabin Altitude** | ≤ 3,650 m (12,000 ft) | Physiological: no supplemental O₂ needed |
| **ΔP Max** | 27.6 kPa (4.0 psi) | XC-35 proven; structural margin |
| **Range** | 2,100 km (1,300 mi) | Transcontinental with reserves |
| **Engines** | 4 × Wright GR-1820-G102A (1,100 hp) | Supercharged for altitude |
| **Pressurization** | 4 engine-driven compressors | Redundancy: 2 sufficient for ΔP |

**2.3.2 Fuselage Structural Design**

**Geometry:**
- Circular cross-section (diameter 3.48 m / 137 in) — **constant diameter for uniform stress**
- Length: 22.6 m (74 ft 4 in) pressurized section
- Skin: 24S-T Alclad, chemically milled thickness taper
  - Crown: 2.4 mm (0.095 in)
  - Sides: 2.2 mm (0.087 in)
  - Belly: 2.0 mm (0.079 in)
- Frames: 24S-T extrusions, 0.56 m spacing, 3.2 mm web
- Stringers: 48 × Z-section (30×50×3 mm), continuous through frames

**Hoop Stress Verification:**
$$\sigma_{\theta} = \frac{\Delta P \cdot r}{t} = \frac{27,600 \times 1.74}{0.0024} = 20.0 \text{ MPa (crown)}$$
$$\sigma_{\theta} = \frac{27,600 \times 1.74}{0.0020} = 24.0 \text{ MPa (belly)}$$
24S-T Yield: 324 MPa → **SF = 13.5 to 16.2** (static)

**Why Such High SF?**
1. **Buckling under combined loads** (bending + pressure) governs skin thickness
2. **Fatigue** not yet quantified for pressurization cycles
3. **Manufacturing minimum** for riveted Alclad ≈ 1.6 mm; 2.0+ mm for damage tolerance
4. **Door/Window cutouts** reduce net section → local stress ↑

**2.3.3 Window Engineering — Critical Innovation**

**Stratoliner Windows:**
- **Shape:** Elliptical (356 × 203 mm / 14 × 8 in), aspect ratio 1.75:1
- **Corner Radius:** 51 mm (2.0 in) — continuous curvature
- **Material:** Stretched acrylic (DuPont Lucite), 9.5 mm thick
- **Mounting:** Double-row riveted to fuselage frames (not skin), seal groove in frame
- **Count:** 12 per side (24 total) + 2 cockpit windshields
- **Stress Concentration:** FEA (modern) shows K_t = 2.1 at crown; K_t = 1.8 at sides

**Comparison with Contemporary Practice:**
| Aircraft | Window Shape | Corner Radius | K_t (Est.) | Outcome |
|----------|--------------|---------------|------------|---------|
| DC-3 (unpress) | Rectangular | 6 mm | 3.5+ | N/A (no ΔP) |
| Ju 52 (unpress) | Rectangular | 10 mm | 3.2 | N/A |
| **Boeing 307** | **Elliptical** | **51 mm** | **2.1** | **No fatigue issues** |
| Lockheed Constellation | Rounded Rectangular | 25 mm | 2.8 | Minor cracking at 15k cycles |
| **Boeing 377** | **Circular** | **∞** | **3.0** | **Conservative** |

**2.3.4 Pressurization System**

**Compressors:** 4 × Garrett AiResearch engine-driven centrifugal (1 per engine)
- Flow: 0.57 kg/s each at 6,100 m
- Pressure Ratio: 3.5:1
- Discharge Temperature: 180°C → precooled via heat exchanger

**Outflow Valves:** 2 × pneumatic (fore/aft), modulating
- Cabin Altitude Schedule: Sea level to 3,650 m linear with flight altitude
- Rate of Change Limit: 300 ft/min (91 m/min) climb, 500 ft/min (152 m/min) descent
- Emergency Dump: Pilot-activated, full open in 3 sec

**Humidity Control:** Condensate collection at belly sump, overboard drain
- No active humidification (passenger respiration sufficient)

**2.3.5 Operational History**

| Metric | Value | Significance |
|--------|-------|--------------|
| **First Flight** | 31 Dec 1938 | 14 months after XC-35 first flight |
| **Certification** | 16 Mar 1940 | First pressurized transport certified (CAA) |
| **Entry into Service** | 8 Jul 1940 (TWA) | NY-LA: 13 hr 40 min (vs. 18+ hr DC-3) |
| **Fleet Size** | 10 built (5 TWA, 3 Pan Am, 2 USAAF C-75) | Limited by WWII |
| **Pressurization Cycles** | ~500 per aircraft/year | 1940–1945: ~2,500 cycles total |
| **Max Cycles (C-75)** | ~8,000 (military service) | No pressure-related structural failures |
| **Cabin Altitude Complaints** | < 2% of passengers | Validated 3,650 m cabin altitude |

**2.3.6 Weight Analysis — Pressurization Penalty**

| Item | Weight [kg] | Notes |
|------|-------------|-------|
| **Structure Reinforcement** | +320 | Skin thickening, frame caps, bulkheads |
| **Pressurization System** | +280 | 4 compressors, ducting, valves, controls |
| **Seals & Insulation** | +150 | Door seals, window seals, crown insulation |
| **Total Penalty** | **+750 kg** | ~7% of empty weight (10,660 kg) |
| **Payload Gain** | +1,200 kg equivalent | Higher cruise → less fuel, more payload |
| **Net Benefit** | **+450 kg** | Positive ROI on weight |

**2.3.7 Lessons Learned → Constellation & Stratocruiser**

1. **Elliptical windows work** — but circular is better for fatigue (Constellation used rounded rectangles; Stratocruiser went circular)
2. **Cabin altitude 3,650 m acceptable** — but 2,400 m preferred for comfort (Stratocruiser targeted 2,400 m)
3. **Inflatable seals essential** — leather/rubber seals failed at -40°C (Stratocruiser used improved silicone)
4. **Compressor redundancy critical** — 2 of 4 sufficient (all subsequent: N+1 redundancy)
5. **Condensation management** — Crown insulation mandatory (all subsequent)

---

*End of Piece 3 — DOC-02 Lines 1101-1200*
*Next: Piece 4 — Section 2.4 Lockheed Constellation (1943)*