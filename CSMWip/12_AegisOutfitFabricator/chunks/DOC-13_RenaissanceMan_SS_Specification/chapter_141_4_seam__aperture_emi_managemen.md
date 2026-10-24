## 4. Seam & Aperture EMI Management (SYNTH-01 §2.3, MAT-03 §3.2, CSMFAB078-B §3.5)

### 4.1 EMI Leakage Paths in Garment Architecture

| Aperture | Location | Size | Baseline Leakage | Mitigation |
|----------|----------|------|------------------|------------|
| **Center Front Lacing** | CF seam | 8×15 mm × 8 | -15 dB SE | MXene thread + conductive tape |
| **Side Seams** | SF/SB | 400 mm × 4 mm | -12 dB SE | MXene thread + overlap |
| **Sleeve Armhole** | Armhole | 450 mm × 6 mm | -18 dB SE | Conductive gasket |
| **Collar Opening** | Neck | 380 mm × 8 mm | -10 dB SE | MXene tape + magnetic seal |
| **Hose Waist** | Waistband | 700 mm × 5 mm | -14 dB SE | Cartridge pleat MXene stitch |
| **Knee Gusset** | Knee | 120 mm × 6 mm | -8 dB SE | Steel boning conductive path |
| **Ankle Facing** | Ankle | 200 mm × 4 mm | -6 dB SE | Conductive elastic |

### 4.2 Conductive Seam Technologies

**MXene-Impregnated Silk Tape (Seam Gasket):**
- **Base:** Silk habotai (12 momme, CIETA Taqueté equiv.)
- **Impregnation:** MXene 10 wt%, vacuum-assisted
- **Width:** 10 mm (covers seam allowance + 2 mm)
- **Thickness:** 0.2 mm
- **Surface Resistivity:** <20 Ω/sq
- **Application:** Sandwiched between L3 brocade and L5 aerogel at all seams

**Conductive Stitching Thread:**
- **Core:** Silk core-spun (poly-cotton)
- **Coating:** MXene 5 wt% + PTFE 2 wt%
- **Diameter:** 0.4 mm (2.5 mm lacing cord: 6× plied)
- **Resistance:** <0.5 Ω/cm
- **Stitch Class:** ISO 301 (backstitch equivalent), 20 SPI

**Conductive Elastic (Ankle/Cuff):**
- **Base:** Elastane (Lycra®) core, silk sheath
- **Conductive:** Ag-coated nylon 15% plied
- **Resistance:** <2 Ω/cm (stretched 2×)
- **Cycle Life:** >10,000 cycles (ASTM D4964)

### 4.3 Magnetic Alignment & Sealing (L2-L3 Interface)

**NdFeB N52 Inserts:**
- **Location:** Ceramic tile corners (L2 primary)
- **Size:** 0.5 mm Ø × 1 mm, 4 per tile
- **Force:** 12 N hold per insert
- **Alignment Tolerance:** ±0.1 mm tile-to-tile
- **EMI Benefit:** Eliminates 0.2 mm gaps → +8 dB SE at tile joints

### 4.4 Aperture-Specific Solutions

**Center Front Lacing (Critical Path):**
```
Layer Stack at CF:
L1 YInMn Silk ────────────────────────────────
L2 Ceramic Tiles ─── [MXene Tape] ─── [MXene Tape] ───
L3 MXene Brocade ─── [MXene Thread] ─── [MXene Thread] ───
L4 FSS Brocade ──── (woven continuous) ──────────
L5 Aerogel ──────── [MXene Tape] ─── [MXene Tape] ───
L6 MXene Liner ──── [MXene Thread] ─── [MXene Thread] ───
L7 Ceramic Backup ── [MXene Tape] ─── [MXene Tape] ───
L8-L12 ────────────────────────────────────────
```
- **Result:** Continuous conductive path across lacing gap
- **Measured SE at CF:** 48 dB @ 1 GHz (vs. 58 dB solid)

**Sleeve Armhole (High Mobility):**
- **Challenge:** 180° arm rotation, dynamic gap variation
- **Solution:** Overlap flap (50 mm) with MXene hook/loop
- **SE Maintained:** >45 dB @ 1 GHz through full ROM

### 4.5 Total Garment EMI Budget

| Path | SE Contribution | Cumulative |
|------|----------------|------------|
| Solid Areas (L3+L6+L4) | 58.5 dB | 58.5 dB |
| CF Lacing | -10.5 dB (leakage) | 48.0 dB |
| Side Seams | -2.0 dB | 46.0 dB |
| Armholes | -3.5 dB | 42.5 dB |
| Collar | -4.0 dB | 38.5 dB |
| Hose Waist | -2.5 dB | 36.0 dB |
| **Worst-Case (Collar)** | | **38.5 dB** |

**Requirement:** >35 dB @ 1 GHz (CSMFAB078-B §3.5) ✅ **PASS with 3.5 dB margin**

### 4.6 Cross-References

- SYNTH-01 §2.3: Unified EMI theory
- MAT-03 §3.2: MXene material specs
- CSMFAB078-B §3.5: EMI threat validation
- Chapter 55: EMI architecture
- Chapter 56: MXene layers
- Chapter 57: FSS bandstop
- IEEE 299: Shielding effectiveness measurement
- MIL-STD-461G RS103: Radiated susceptibility

---
