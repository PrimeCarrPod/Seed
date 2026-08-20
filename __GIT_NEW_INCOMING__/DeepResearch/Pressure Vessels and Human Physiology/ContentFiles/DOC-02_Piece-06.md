# DOC-02: Historical Aerospace Pressurization Evolution (1920–1950)
## Document 2 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 1401-1500 | Piece 6 of 9 | ~100 Lines

---

#### 2.6 Structural Lessons & Regulatory Genesis (1937–1954)

The progression from XC-35 through Stratocruiser established the **structural vocabulary** of pressurized fuselage design. Simultaneously, regulatory frameworks evolved from ad-hoc approvals to codified standards. This section synthesizes the engineering lessons and traces the regulatory lineage.

**2.6.1 Structural Lesson 1: Pressure Vessel = Fuselage Skin**

The XC-35 proved the fuselage skin carries both **bending loads** (wing/fuselage interaction) and **pressure loads** (hoop stress). The combined stress state:

$$\sigma_{combined} = \sigma_{bending} \pm \sigma_{hoop}$$

At crown (max bending tension + hoop tension):
$$\sigma_{max} = \frac{M_{bend} \cdot y}{I} + \frac{\Delta P \cdot r}{t}$$

At belly (max bending compression + hoop tension):
$$\sigma_{min} = -\frac{M_{bend} \cdot y}{I} + \frac{\Delta P \cdot r}{t}$$

**Design Implication:** Skin thickness governed by **buckling in compression** (belly), not yield in tension (crown). This explains why belly skin is often thinner than crown — it's optimized for buckling with pressure tension offset.

**2.6.2 Structural Lesson 2: Window Geometry Determines Fatigue Life**

The progression: Square (Ju 52) → Rounded Rectangular (Farman) → Elliptical (XC-35/307) → Rounded Rectangular (Constellation) → **Circular (Stratocruiser/707/DC-8)**

**Stress Concentration Factor Evolution:**

| Geometry | K_t (Theory) | K_t (w/ Frame) | Crack Initiation Site |
|----------|--------------|----------------|----------------------|
| Square (sharp) | ∞ (singularity) | >10 | Corner rivet hole |
| Rounded Rect (r/t=0.1) | 3.5 | 3.2 | Corner rivet hole |
| Rounded Rect (r/t=0.2) | 2.8 | 2.5 | Corner rivet hole |
| Elliptical (a/b=1.75) | 2.1 | 1.9 | End of major axis |
| **Circular** | **3.0** | **2.0** | **Uniform — no preference** |

**Key Insight:** A circular hole has **higher theoretical K_t (3.0)** than elliptical (2.1), but **lower effective K_t with frames (2.0 vs 1.9)** because frame stiffness couples better to circular geometry. More importantly, **no stress gradient** means cracks don't preferentially initiate at corners — they initiate at **random material flaws**, giving statistical (Weibull) rather than deterministic fatigue life.

**2.6.3 Structural Lesson 3: Rivet Holes Are Fatigue Initiators**

Every window cutout requires rivet holes for frame attachment. The **rivet hole stress concentration** (K_t = 3.0 for open hole) combines with window K_t:

$$\sigma_{local} = K_{t,window} \times K_{t,rivet} \times \sigma_{nominal} \quad \text{(simplified)}$$

**Actual Interaction (FEA):**
- Circular window + rivet row: Peak at rivet hole nearest crown/belly (bending max)
- K_t,effective ≈ 3.5–4.0 at critical rivet
- **Solution:** **Cold-worked holes** (split sleeve expansion) → compressive residual stress → K_f ≈ 1.5
- **Alternative:** **Interference-fit fasteners** (Hi-Lok, Lockbolt) → same effect

**2.6.4 Structural Lesson 4: Pressure Bulkheads Are Critical Load Paths**

Fore and aft pressure bulkheads react the **axial pressure load**:
$$F_{axial} = \Delta P \cdot \pi r^2$$

For 377 (r = 1.83 m, ΔP = 34.5 kPa):
$$F_{axial} = 34,500 \times \pi \times 1.83^2 = 364 \text{ kN}$$

**Bulkhead Design Evolution:**
| Aircraft | Bulkhead Type | Thickness | Weight |
|----------|---------------|-----------|--------|
| XC-35 | Hemispherical cap | 3.2 mm | 45 kg |
| 307 | Hemispherical cap | 3.5 mm | 120 kg |
| Constellation | Hemispherical + conical | 3.5/4.0 mm | 280 kg |
| **377** | **Double-bubble cap** | **4.0/4.5 mm** | **520 kg** |
| 707 | Flat oval + tension ties | 4.5 mm + ties | 480 kg |

**Failure Mode:** Bulkhead rupture → rapid decompression → **fuselage unzipping** (pressure loads redistributed to skin → catastrophic)
- **Design Requirement:** Bulkhead must be **fail-safe** (multiple load paths) or **safe-life** with inspection

**2.6.5 Regulatory Genesis: From CAA to FAR 25**

**1938 — Civil Aeronautics Act:** Created Civil Aeronautics Authority (CAA), safety regulation mandate.

**1940 — CAR 4a (Civil Air Regulations):** First pressurization requirements:
- Cabin altitude ≤ 15,000 ft (4,570 m) at max operating altitude
- Pressure relief valves (positive & negative)
- **No fatigue requirements** — static strength only

**1945 — CAR 4b:** Added:
- Cabin altitude ≤ 10,000 ft (3,050 m) normal, 15,000 ft emergency
- Rate of change limits (500 ft/min)
- **Window/door testing:** 1.33× operating pressure static test

**1950 — CAR 4b Amendment:** Post-Constellation experience:
- **Window corner radius ≥ 1.5 in (38 mm)** mandated
- **Pressure test:** 1.5× operating pressure (proof test)
- **Fatigue evaluation:** "Consideration of repeated pressurization" (qualitative)

**1953 — CAR 4b Amendment 4b-5:** Pre-Comet, but influenced by Constellation cracking:
- **Mandatory window corner doubler plates** for designs > 10,000 cycles
- **Cabin altitude recorder** required (FDR parameter)

**1954 — Comet Disasters → Regulatory Revolution:**
- **UK ARB (Air Registration Board)** grounded Comet; convened **Cohen Committee**
- **US CAA** issued **Emergency AD 54-10-1**: Enhanced inspection for all pressurized transports
- **Result:** **CAR 4b replaced by FAR 25 (1958)** — first modern airworthiness standard

**2.6.6 FAR 25 Pressurization Requirements (1958 — Current Basis)**

**§25.365 Pressurized Compartment Loads:**
- Design pressure = max operating ΔP × 1.33 (or 1.5 for limit)
- Combined with flight loads (maneuver, gust, landing)

**§25.841 Pressurized Cabins:**
- (a) Cabin altitude ≤ 8,000 ft (2,440 m) at max operating altitude
- (b) Cabin altitude ≤ 15,000 ft (4,570 m) after any probable failure
- (c) Rate of change ≤ 500 ft/min (emergency: 2,000 ft/min)
- (d) **Positive/negative pressure relief valves** (automatic)
- (e) **Warning system** for cabin altitude > 10,000 ft

**§25.571 Damage Tolerance (Added 1978, Amendment 25-45):**
- **Fatigue evaluation** for all principal structural elements
- **Inspection program** based on damage tolerance analysis
- **Fail-safe or safe-life** with residual strength demonstration
- **This was the direct legislative descendant of the Comet investigation**

**2.6.7 The Missing Link: Fatigue Was Not Regulated Until 1958**

| Era | Fatigue Treatment | Basis |
|-----|-------------------|-------|
| 1937–1945 (XC-35, 307) | Ignored (static SF > 10) | "Infinite life" assumption |
| 1945–1954 (Connie, 377) | Qualitative ("consider") | Constellation cracking = warning |
| 1954–1958 (Post-Comet) | **Mandatory safe-life** | Cohen Committee → FAR 25 |
| 1978–Present | **Mandatory damage-tolerance** | FAR 25.571 / Amendment 25-45 |

**The Comet investigation (RAE Farnborough, 1954) established:**
1. **Safe-life design** (no cracks at design life) is insufficient for pressurized fuselages
2. **Damage tolerance** (cracks detected before critical) is required
3. **Window corners** are the critical detail
4. **Rivet holes** are the initiation sites
5. **Inspection intervals** must be derived from crack growth analysis

**These five findings are the DNA of every modern airliner fuselage.**

---

*End of Piece 6 — DOC-02 Lines 1401-1500*
*Next: Piece 7 — Section 2.7 Physiological Validation & Passenger Experience*