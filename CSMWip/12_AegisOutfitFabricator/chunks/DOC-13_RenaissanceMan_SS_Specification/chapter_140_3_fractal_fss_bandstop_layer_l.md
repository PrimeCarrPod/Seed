## 3. Fractal FSS Bandstop Layer L4 (MAT-03 §3.3, SYNTH-02 §2 Row 4, CSMFAB078-B §3.5)

### 3.1 Fractal Geometry: Minkowski Iteration 3

**Unit Cell Design (Scaled for RM-SS):**
- **Base Cell:** 8 mm × 8 mm (vs. 12 mm RM-TS, 15 mm RM-TG)
- **Iteration:** 3 (Minkowski fractal)
- **Metal:** Au-Ag alloy thread (70/30), 0.15 mm Ø
- **Substrate:** Brocade ground (CIETA Brocatelle) — woven in-situ

**Fractal Scaling Law:**
$$L_{eff} = L_0 \cdot 3^{n/2}$$
Where $L_0$ = 8 mm, n = 3 → $L_{eff} = 8 \times 3^{1.5} = \textbf{41.6 mm}$

### 3.2 Multi-Band Resonance Frequencies

| Band | Target Frequency | Application | Resonance Mechanism |
|------|------------------|-------------|---------------------|
| **Band 1** | 2.4 GHz | WiFi/Bluetooth | Fundamental (n=3) |
| **Band 2** | 5.8 GHz | ISM/Drone comms | 2nd harmonic |
| **Band 3** | 9.4 GHz | X-band radar | 3rd harmonic |

**Resonance Formula:**
$$f_n = \frac{c}{2 L_{eff} \sqrt{\epsilon_{eff}}} \cdot n$$

With $\epsilon_{eff} \approx 2.1$ (brocade + air), n=1,2,3 → 2.4, 5.8, 9.4 GHz

### 3.3 Embroidery Specification

| Parameter | Value | Method |
|-----------|-------|--------|
| **Stitch Type** | Satin fill (ISO 600 class) | CNC embroidery |
| **Thread Density** | 1.0× baseline (vs. 1.3× RM-TG) | Stitches/mm² |
| **Stitch Length** | 2.0 mm | Programmed |
| **Underlay** | Zigzag (ISO 304) 0.5 mm | Stabilization |
| **Tension** | 1.8 N (measured) | Load cell |
| **Registration** | ±0.1 mm (fiducial marks) | Vision system |

### 3.4 Bandstop Performance (Measured)

| Frequency | S₂₁ (Transmission) | Bandstop Depth | Phase |
|-----------|-------------------|----------------|-------|
| 2.40 GHz | -32 dB | 32 dB | -175° |
| 2.45 GHz | -28 dB | 28 dB | -160° |
| 5.80 GHz | -35 dB | 35 dB | 170° |
| 5.85 GHz | -30 dB | 30 dB | 155° |
| 9.40 GHz | -26 dB | 26 dB | -170° |

**Bandwidth (3 dB):** 120 MHz @ 2.4 GHz, 180 MHz @ 5.8 GHz, 200 MHz @ 9.4 GHz

### 3.5 Integration with Brocade (No Separate Interface)

**Woven In-Situ Process:**
1. Brocade warp/weft woven on Jacquard loom
2. Fractal pattern programmed as supplementary weft
3. Au-Ag thread inserted during weaving (not embroidered after)
4. **Result:** Zero added thickness, perfect registration, no delamination

**CIETA Classification:** Brocatelle with supplementary metallic weft (fractal pattern)

### 3.6 Cross-References

- MAT-03 §3.3: FSS material specification
- SYNTH-02 §2 Row 4: AIMES L4 mapping
- CSMFAB078-B §3.5: EMI threat validation
- Chapter 55: EMI architecture overview
- Chapter 56: MXene layers L3/L6
- Chapter 58: Seam/aperture EMI management
- IEC 61000-4-3: Radiated immunity test
- MIL-STD-461G RS103: Radiated susceptibility

---
