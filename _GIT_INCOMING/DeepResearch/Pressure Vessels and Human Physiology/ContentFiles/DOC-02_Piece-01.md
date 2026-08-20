# DOC-02: Historical Aerospace Pressurization Evolution (1920–1950)
## Document 2 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 901-1800 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document traces the historical progression of aerospace pressurization from isolated cockpit capsules (1920) through the monocoque fuselage integration paradigm shift (1937) to the first commercial pressurized airliners (1940–1947). The evolution is analyzed through the lens of structural mechanics, physiological necessity, and the iterative engineering lessons that established modern damage-tolerance philosophy. Primary focus on the Packard-Le Père LUSAC-11, Engineering Division USD-9A, Junkers Ju 49, Farman F.1000, Chizhevski BOK-1, Lockheed XC-35, Boeing 307 Stratoliner, Lockheed Constellation, and Boeing 377 Stratocruiser. Each aircraft is examined for its pressure vessel architecture, operational envelope, structural innovation, and physiological impact on crew/passengers. The document establishes the technical lineage connecting early experimental capsules to the Comet-era fatigue discoveries that reshaped aerospace engineering.

**Keywords:** Cabin pressurization history, monocoque pressure vessel, Boeing 307 Stratoliner, Lockheed XC-35, high-altitude physiology, hypoxic threshold, pressure capsule evolution, commercial aviation pressurization

---

### 2. HISTORICAL PROGRESSION OF AEROSPACE AND HYPOBARIC PRESSURIZATION

#### 2.1 Early Experimental Capsules and Monocoque Integration

The physiological imperative for cabin pressurization arises from the fundamental relationship between barometric pressure and alveolar oxygen tension. The alveolar gas equation:

$$P_{A}O_2 = F_{I}O_2 (P_B - P_{H_2O}) - \frac{P_{A}CO_2}{RQ}$$

At 10,000 m (33,000 ft), $P_B \approx 26.4 \text{ kPa}$. With $F_{I}O_2 = 0.21$, $P_{H_2O} = 6.3 \text{ kPa}$, $P_{A}CO_2 = 5.3 \text{ kPa}$, $RQ = 0.8$:
$$P_{A}O_2 = 0.21(26.4 - 6.3) - \frac{5.3}{0.8} = 4.2 - 6.6 = -2.4 \text{ kPa} \quad \text{(physiologically impossible)}$$

Without pressurization, consciousness is lost in 30–60 seconds at 10,000 m. This drove the earliest pressure vessel development.

**2.1.1 Packard-Le Père LUSAC-11 (1920) — First Enclosed Oxygen-Enriched Cockpit**

- **Configuration:** Single-engine biplane fighter, modified for high-altitude reconnaissance
- **Pressure Vessel:** Isolated cockpit enclosure, not integrated with fuselage structure
- **Pressurization:** Oxygen-enriched atmosphere (not true pressurization — maintained sea-level $P_{O_2}$ via O₂ addition at ambient pressure)
- **Max Altitude:** 7,600 m (25,000 ft) demonstrated
- **Structure:** Steel tube frame with fabric covering; cockpit enclosure = aluminum sheet on wooden frame
- **Pressure Differential:** ~0 kPa (supplemental O₂ only, no $\Delta P$ structural load)
- **Physiology:** Pilot breathed 100% O₂ via mask; no cabin $\Delta P$ → no structural fatigue
- **Significance:** Proved high-altitude flight feasible with oxygen supplementation; identified need for true pressurization above 8,000 m

**2.1.2 Engineering Division USD-9A (1921) — First Dedicated Pressurized Cockpit Module**

- **Configuration:** Modified USD-9 biplane with purpose-built pressure capsule
- **Pressure Vessel:** Cylindrical capsule enclosing pilot only, mounted within fuselage
- **Pressurization:** Engine-driven supercharger maintained $\Delta P \approx 15 \text{ kPa}$ (2.2 psi)
- **Max Altitude:** 8,500 m (28,000 ft) with cabin altitude ~3,000 m (10,000 ft)
- **Structure:** Welded steel capsule, 3 mm wall, hemispherical ends; weight penalty: +180 kg
- **Pressure Differential:** 15 kPa internal → hoop stress $\sigma_{\theta} = \frac{\Delta P \cdot r}{t} \approx 25 \text{ MPa}$ (steel yield ~250 MPa, SF ~10)
- **Life Support:** Chemical CO₂ absorption (soda lime), O₂ replenishment from liquid storage
- **Operational Issues:** Capsule condensation, CO₂ buildup on long flights, seal leakage at temperature extremes
- **Significance:** First true pressure vessel for human occupancy in aircraft; established capsule-in-fuselage architecture

**2.1.3 Junkers Ju 49 (1931) — German High-Altitude Research Platform**

- **Configuration:** Single-engine low-wing monoplane, pressurized cabin for 2 crew
- **Pressure Vessel:** Riveted aluminum alloy (Duralumin) cylindrical cabin, integrated with fuselage center section
- **Pressurization:** Engine-driven centrifugal compressor, $\Delta P \approx 25 \text{ kPa}$ (3.6 psi)
- **Max Altitude:** 12,500 m (41,000 ft) — world record 1931
- **Structure:** Cabin as structural load-bearing element (semi-monocoque); frames at 0.5 m spacing, stringers
- **Window Geometry:** Circular portholes (diameter 200 mm) — **critical: no square corners**
- **Pressure Differential at Ceiling:** ~45 kPa (6.5 psi) → $\sigma_{\theta} \approx 120 \text{ MPa}$ (Duralumin yield ~280 MPa)
- **Life Support:** Liquid O₂, regenerative CO₂ scrubber (LiOH cartridges), heated cabin
- **Fatigue Experience:** 50+ pressurization cycles; no structural failures observed
- **Significance:** First integrated semi-monocoque pressurized cabin; circular windows from stress analysis

**2.1.4 Farman F.1000 (1932) — French Stratospheric Attempt**

- **Configuration:** Four-engine high-wing monoplane, pressurized cabin for 4 crew
- **Pressure Vessel:** Welded steel cylindrical cabin, non-structural (carried by airframe)
- **Pressurization:** Engine-driven Roots blowers, target $\Delta P = 40 \text{ kPa}$ (5.8 psi)
- **Max Altitude:** 10,000 m (33,000 ft) achieved (target 12,000 m not reached)
- **Structure:** Cabin weight 1,200 kg; heavy steel construction limited altitude performance
- **Windows:** Rectangular with rounded corners (radius 25 mm) — **intermediate geometry**
- **Operational Issues:** Compressor reliability, seal failures at -50°C, excessive weight
- **Significance:** Demonstrated weight penalty of non-structural pressure capsule; influenced monocoque thinking

**2.1.5 Chizhevski BOK-1 (1936) — Soviet High-Altitude Bomber Prototype**

- **Configuration:** Twin-engine mid-wing, pressurized cabin for 3 crew + gunner
- **Pressure Vessel:** Riveted aluminum (AMg6 alloy) cabin, partially load-bearing
- **Pressurization:** Turbo-supercharger bleed air, $\Delta P \approx 30 \text{ kPa}$ (4.3 psi)
- **Max Altitude:** 14,000 m (46,000 ft) design; 12,500 m achieved
- **Structure:** Cabin frames integrated with wing spar carry-through; stringer-stiffened skin
- **Windows:** Circular (diameter 150 mm) and one rectangular navigation window (rounded corners, r=30 mm)
- **Innovation:** First use of **pressure-sealed control cable pass-throughs** (bellows seals)
- **Fatigue Testing:** 200 ground pressurization cycles to 1.5× operating pressure
- **Significance:** Military pressurized bomber concept; integrated pressure boundary with primary structure

---

*End of Piece 1 — DOC-02 Lines 901-1000*
*Next: Piece 2 — Section 2.2 Monocoque Paradigm Shift: Lockheed XC-35*