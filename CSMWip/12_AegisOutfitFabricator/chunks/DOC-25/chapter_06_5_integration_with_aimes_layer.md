## 5. Integration with AIMES Layer Stack

### 5.1 Layer Positioning
Directed energy protection occupies Layers 1, 2, and 9 in the 12-layer AIMES stack:

```
L1: Ablative layer (Silica-phenolic + pigment wash) ← DOC-25 Focus
L2: Reflective layer (Dielectric mirror stack) ← DOC-25 Focus
L3: MXene Ti₃C₂Tₓ Film (EMI/GIC Shield)
L4: Aerogel Core (Thermal Insulation)
L5: MOF-Coated Textile (Chemical/Bio Adsorption)
L6: MXene Ti₃C₂Tₓ Film (Redundant EMI)
L7: ZrB₂-SiC Inner Lamina (Structural Backup)
L8: MR Fluid Bladder Network (Impact-activated stiffening)
L9: Phase-Change Material Layer (Thermal Buffer) ← DOC-25 Focus
L10: BFRP/Elium® Structural Chassis (Load-bearing Frame)
L11: PVDF-TrFE Sensor Mesh (Bio-acoustic Monitoring)
L12: CoAl₂O₄ Spinel Interior Coating (Comfort/Schumann)
```

### 5.2 Interface Compatibility
Interfaces designed for thermal expansion matching and chemical stability:

**L1/L2 Interface:**
- Thermal expansion: $\alpha_{\text{ablative}} = 5\times 10^{-6}/K \approx \alpha_{\text{dielectric}} = 4\times 10^{-6}/K$
- Adhesion layer: SiO₂ sol-gel (50nm) for chemical bonding
- Optical index matching: n_SiO₂ = 1.46 minimizes reflection losses

**L2/L3 Interface:**
- Dielectric/MXene adhesion: Zirconium carboxylate bonding
- Electrical continuity: MXene ensures grounding despite dielectric insulation
- Hydrophobic treatment: Dielectric surface modified with methyl groups

**L9/L10 Interface:**
- PCM/chassis bonding: Thermally conductive adhesive (k=5 W/m·K)
- Electrical isolation: PCM encapsulation prevents chassis shorting
- Mechanical compliance: Soft PCM layer accommodates chassis flexure under load

**Thermal Contact Resistance:**
```
$R_{tc} = \frac{1}{h_c A}$  where $h_c$ = contact conductance
```

**Thermal Expansion Mismatch Stress:**
```
$\sigma_{th} = \frac{E \alpha \Delta T}{1-\nu}$
```
