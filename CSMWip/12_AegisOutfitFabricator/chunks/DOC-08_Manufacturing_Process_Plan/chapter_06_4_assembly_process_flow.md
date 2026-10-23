## 4. Assembly Process Flow

### 4.1 Panel Assembly & Joint Sealing (CSMFAB078 §6 Step 8)

```
Double-Gasket Joint System:
  Inner gasket: ePTFE (expanded PTFE), 1mm thick
  Outer gasket: ZrO₂-silicone composite, 2mm thick
  Bridge: MXene tape (EMI continuity across joint)

Joint SE Penalty: ≤12 dB (target <10 dB)
Verification: MIL-STD-285 (modified for fabric joints)

Assembly Sequence:
1. Ceramic tile mounting: Magnetic alignment (NdFeB N52)
2. Brocade layer placement: MXene-coated threads
3. Fractal FSS embroidery: CNC TFP (Tailored Fiber Placement)
4. Aerogel batting quilting: Diamond/trapunto, 18-22 SPI
5. STF layer integration: Quilting between fabric layers
6. Framework insertion: Baleen/steel channels
7. Liner attachment: PVDF-TrFE + CoAl₂O₄ coated fabric
8. Lacing system: Dyneema SK99 through Ti₃AlC₂ cleats
```

**Key Formulas:**
- Inner gasket thickness: $t_{inner} = 1 \text{ mm (ePTFE)}$
- Outer gasket thickness: $t_{outer} = 2 \text{ mm (ZrO}_2\text{-silicone)}$
- Joint SE penalty: $\Delta SE_{joint} \leq 12 \text{ dB} \quad (\text{target } < 10 \text{ dB})$
- Magnetic alignment: NdFeB N52 grade
- Stitch density (quilting): $\text{SPI} = 18\text{--}22 \text{ stitches/inch}$
- Dyneema SK99 lacing tension: $T_{Dyneema} = \text{calibrated per LES 12 zones}$

### 4.2 Edition Configuration (CSMFAB078 §6 Step 10)

```
Per Edition (RM-TS, RM-TG, RM-SS, RM-SG, RW-TS, RW-TG, RW-SS, RW-SG):
1. Panel count selection (ceramic tiles: 36-56)
2. Dyneema lacing tension calibration (LES 12 zones)
3. MR fluid fill: 80 kPa yield stress @ 250 kA/m
4. PVDF-TrFE mesh integration: 240 sensing nodes
5. Protonic HFET firmware flash (CSMFAB-PROTONIC-HFET)
6. QA validation: Full test protocol (DOC-09)
```

**Key Formulas:**
- Ceramic tile count range: $N_{tiles} = 36\text{--}56 \quad \text{(edition-dependent)}$
- LES zones: $N_{zones} = 12$
- MR fluid yield stress: $\tau_y = 80 \text{ kPa} \quad \text{at } H = 250 \text{ kA/m}$
- PVDF-TrFE sensing nodes: $N_{nodes} = 240$
- Firmware: CSMFAB-PROTONIC-HFET
