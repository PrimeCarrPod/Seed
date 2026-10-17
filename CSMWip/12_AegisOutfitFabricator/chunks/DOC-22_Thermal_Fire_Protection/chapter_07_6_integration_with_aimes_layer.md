## 6. Integration with AIMES Layer Stack

### 6.1 Layer Positioning
Thermal protection occupies Layers 1, 4, and PCM buffer in the 12-layer AIMES stack:

```
L1: YInMn Blue + CsPbBr₃ QD Coating (NIR/UV management) ← DOC-22 Focus
L2: ZrB₂-SiC UHTC Layer (Primary Thermal) ← DOC-22 Focus
L3: MXene Ti₃C₂Tₓ Film (EMI/GIC Shield)
L4: Aerogel Core (Thermal Insulation) ← DOC-22 Focus
L5: MXene Ti₃C₂Tₓ Film (Redundant EMI)
L6: ZrB₂-SiC Inner Lamina (Structural Backup)
L7: MR Fluid Bladder Network (Impact-activated stiffening)
L8: STF-Impregnated UHMWPE Base Layer (Trauma Mitigation)
L9: Phase-Change Material Buffer (Thermal Buffer) ← DOC-22 Focus
L10: BFRP/Elium® Structural Chassis (Load-bearing Frame)
L11: PVDF-TrFE Sensor Mesh (Bio-acoustic Monitoring)
L12: CoAl₂O₄ Spinel Interior Coating (Comfort/Schumann)
```

### 6.2 Interface Compatibility
Interfaces designed for thermal expansion matching and chemical stability:

**L1/L2 Interface:**
- Thermal expansion: α_YInMn = 6.2×10⁻⁶/K ≈ α_ZrB₂-SiC = 5.8×10⁻⁶/K
- Adhesion layer: SiO₂ sol-gel (50nm) for chemical bonding
- Optical index matching: n_SiO₂ = 1.46 minimizes reflection losses

**L4/L5 Interface:**
- Aerogel/MXene adhesion: Silane coupling agent (3-aminopropyltriethoxysilane)
- Electrical continuity: MXene ensures grounding despite aerogel insulation
- Hydrophobic treatment: Aerogel surface modified with methyl groups

**L9/L10 Interface:**
- PCM/chassis bonding: Thermally conductive adhesive (k=5 W/m·K)
- Electrical isolation: PCM encapsulation prevents chassis shorting
- Mechanical compliance: Soft PCM layer accommodates chassis flexure
