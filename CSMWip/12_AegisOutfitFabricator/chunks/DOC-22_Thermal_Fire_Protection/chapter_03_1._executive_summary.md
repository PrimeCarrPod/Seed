## 1. Executive Summary

### 1.1 Document Scope

This specification defines the **thermal/fire protection subsystem** for the AegisOutfitFabricator edition family. The subsystem integrates **Ultra-High Temperature Ceramic (UHTC) outer layer**, **aerogel micro-encapsulated batting**, and **NIR reflective pigments** to achieve NFPA 1971 flash fire protection (interior ≤60°C @ 300s, 1100°C external) and ASTM F1939 radiant protection (TPP ≥45 cal/cm²) at Renaissance morphological scale.

**Prime Step:** 4 | **Batch:** 3 | **Document:** DOC-22 | **Status:** AUTHORED

### 1.2 Key Specifications Summary

| Parameter | Value | Source |
|-----------|-------|--------|
| **UHTC Coating** | YInMn Blue + CsPbBr₃ QD (230μm total) | CSMFAB078-B §3.1, MAT-03 |
| **UHTC Composition** | YInMn Blue (150μm) + CsPbBr₃ QD layer (80μm, 0.8wt%) | CSMFAB078-B §5.2 |
| **Aerogel Core** | TEOS+PMDA-ODA polyimide, ambient-pressure dry, TMCS hydrophobic | MAT-03 §3.1 |
| **Aerogel Thickness** | 25mm (AIMES), 10-15mm (Renaissance quilting) | MAT-03 §3.2 |
| **Micro-capsule Size** | D₅₀ = 50-100μm, D₉₀ < 200μm | MAT-03 §3.2 |
| **NIR Reflectance** | 85-92% (YInMn Blue), QD absorption 94% @ 1064nm | CSMFAB078-B §5.2 |
| **Flash Fire Target** | Interior ≤60°C @ 300s, 1100°C external | NFPA 1971 / CSMFAB-THERM-002 |
| **Radiant TPP Target** | ≥45 cal/cm² | ASTM F1939 / CSMFAB-THERM-003 |
| **ΔT Enhancement** | -14°C vs. black coating (QD enhancement) | CSMFAB078-B §5.2 |

### 1.3 Architectural Positioning

The thermal protection subsystem occupies **Layers 1, 5, and 9** of the 12-layer stack (SYNTH-02 §3):

```
LAYER 1: YInMn Blue + CsPbBr₃ QD (NIR/thermal reflective)  [THIS DOC]
LAYER 2: ZrB₂-SiC ceramic tile (ballistic primary)         [DOC-21]
LAYER 3: MXene on metallic thread (EMI)                    [MAT-03 §2]
LAYER 4: Fractal FSS embroidery (RF bandstop)              [DOC-23]
LAYER 5: Aerogel micro-encapsulated batting (thermal core) [THIS DOC]
LAYER 6: MXene on metallic thread (EMI)                    [MAT-03 §2]
LAYER 7: ZrB₂-SiC ceramic tile (ballistic backup)          [DOC-21]
LAYER 8: MR fluid bladder network (force trauma)           [DOC-25]
LAYER 9: STF + PCM interlayer (thermal buffer)             [THIS DOC - PCM]
LAYER 10: BFRP chassis (structural/dielectric)             [DOC-05, MAT-02]
LAYER 11: PVDF-TrFE bio-acoustic (physiological)           [DOC-29]
LAYER 12: Cobalt spinel IR signature management            [DOC-24]
```

---
