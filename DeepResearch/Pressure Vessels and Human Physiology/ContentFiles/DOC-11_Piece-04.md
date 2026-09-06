# DOC-11: Saturation Diving Decompression Kinetics
## Document 11 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 9301-9400 | Piece 4 of 9 | ~100 Lines

---

#### 11.4 The 16/24-Hour Decompression Day

**11.4.1 Operational Structure**

**US Navy Saturation Decompression Protocol:**
- **16 hours** of continuous decompression (ascent + stops)
- **8 hours** of **stabilization** (hold at current depth, no ascent)
- **Cycle repeats** until surface reached

**Why Not Continuous 24/7 Ascent?**

**Physiological Reasons:**
1. **Bubble Dissolution Kinetics:** Microbubbles form during ascent; 8-hr hold allows **dissolution** before next ascent increment
2. **Tissue Re-equilibration:** Slow compartments (fat) need time to reduce gradient
3. **Fatigue Management:** Continuous pressure change stresses physiology
4. **Sleep/Circadian:** 8-hr hold aligns with sleep period

**Mathematical Justification (Bubble Dissolution):**

**Bubble Dissolution Time (Epstein-Plesset):**
$$t_{diss} = \frac{R_0^2}{2D} \cdot \frac{C_{sat}}{C_{sat} - C_{\infty}}$$

For $R_0 = 10 \mu\text{m}$, $D_{He} = 2.5 \times 10^{-9} \text{ m}^2/\text{s}$, $C_{sat} \approx 2 \times C_{\infty}$:
$$t_{diss} \approx \frac{(10^{-5})^2}{2 \times 2.5 \times 10^{-9}} \cdot 2 = \frac{10^{-10}}{5 \times 10^{-9}} \cdot 2 = 0.04 \text{ s} \quad \text{(He)}$$

**For N₂ ($D_{N_2} = D_{He}/2.65$):**
$$t_{diss,N_2} \approx 0.04 \times 2.65 = 0.1 \text{ s}$$

**BUT: In tissue, diffusion distance is mm-cm, not µm.**
**Effective dissolution time in tissue:** **Hours** (perfusion-limited).

**8-hour hold = 3× safety factor on tissue bubble dissolution.**

**11.4.2 Decompression Day Schedule (Typical)**

| Time | Activity | Pressure |
|------|----------|----------|
| **06:00** | Wake, medical check | Current depth |
| **06:30** | Begin ascent (if not at stop) | Ascending |
| **12:00** | Lunch (at stop or ascending) | Per schedule |
| **18:00** | **End ascent for day** | **Hold depth** |
| **18:30** | Dinner, relax | Hold depth |
| **22:00** | Sleep | Hold depth |
| **06:00** | Repeat | — |

**During Hold (Stabilization):**
- **No ascent** — pressure constant
- **Gas mixture may change** (e.g., increase O₂, adjust He/N₂)
- **Light activity permitted** (no heavy exertion)
- **Monitoring:** Doppler ultrasound, symptom checks

**11.4.3 Impact on Total Calendar Time**

**Continuous Ascent (Theoretical):**
$$T_{cont} = \sum \frac{\Delta D}{R} = 182.5 \text{ hr} = 7.6 \text{ days}$$

**16/24 Schedule:**
$$T_{cal} = \frac{T_{cont}}{16} \times 24 = 1.5 \times T_{cont} = 1.5 \times 7.6 = \mathbf{11.4 \text{ days}}$$

**Calendar Days = 1.5 × Continuous Hours**

**From 1,000 fsw:** 182.5 hr → **12 calendar days**
**From 500 fsw:** 85 hr → **5.3 calendar days**
**From 200 fsw:** 49 hr → **3 calendar days**

**11.4.4 Exceptions & Variations**

**Emergency Decompression (Medical):**
- **Continuous ascent** at maximum safe rate
- **Accept higher DCS risk** to save life
- **Requires:** Chamber ready at surface for immediate recompression

**Heliox vs. Trimix Schedules:**
- **Heliox only:** Can use slightly faster rates (no N₂)
- **Trimix:** Standard 6/5/4/3 (N₂ limits shallow)

**COMEX (French) / Norwegian Schedules:**
- Similar 16/24 structure
- Slightly different depth breakpoints
- Some use **12/24** (12 hr deco / 12 hr hold) for shallower depths

---

*End of Piece 4 — DOC-11 Lines 9301-9400*
*Next: Piece 5 — Section 11.5 Heliox Thermal Management (85–95°F)*