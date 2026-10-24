## 7. Supply Chain & Obsolescence Management

### 7.1 Supply Chain Strategy (Per CSMFAB078 §8 Circular Economy)

```
IN-HOUSE PRODUCTION (Vertical Integration):
  - Basalt fiber: Columbia River → 500 ton/yr @ $2.10/kg
  - Elium® resin: MMA + peroxide → $4.80/kg (vs $12/kg commercial)
  - ZrB₂-SiC: Flash sinter in-house → 96.9% density @ $68/kg
  - MXene: Ti₃AlC₂ MAX Phase → LiF/HCl etch → $65/kg (vs $2000/kg)
  - Aerogel: Ambient pressure dry → $68/m² (vs $230/m²)
  - YInMn Blue: Ionic liquid extraction → In recovery 99.4%

EXTERNAL DEPENDENCIES (Single Source Mitigation):
  - NdFeB N52 magnets: 3 qualified suppliers (China/Japan/USA)
  - Dyneema SK99: DSM (sole) → Qualified alternate: Honeywell Spectra
  - Viton GF-600S: Chemours → Alternate: Daikin, Solvay
  - Li-S cells: OXIS Energy (primary) → Sion Power (alternate)
  - Neuromorphic ASIC: CSM fab (TSMC 28nm) → SkyWater (alt)
  
QUALIFICATION: All alternates require full CSMFAB078 §7 acceptance test
```

### 7.2 Shelf-Life Management

| Item | Shelf Life | Storage Condition | Monitoring | Disposition |
|------|------------|-------------------|------------|-------------|
| MR Fluid | 24 months | 15-25°C, sealed, N₂ blanket | Viscosity quarterly | Reprocess or scrap |
| Li-S Battery | 12 months @ 50% SOC | 10-20°C, 30-50% RH | Impedance monthly | Refresh charge or replace |
| MXene Dispersion | 6 months | 4°C, anaerobic | Conductivity monthly | Re-synthesize |
| Viton O-rings | 10 years | <25°C, dark, no ozone | Visual + hardness annually | Replace |
| YInMn Coating | 5 years | 15-25°C, sealed | Fluorescence annually | Re-coat |
| Baleen (raw) | Indefinite | Dry, pest-free | Visual | N/A |

### 7.3 Obsolescence Mitigation (DMSMS)

```
DMSMS PROCESS (SAE AS6294):
  1. Monitor: SD-6, GIDEP, manufacturer PCNs (monthly scan)
  2. Assess: Impact analysis (form/fit/function, qualification cost)
  3. Resolve: 
     - Life-of-type buy (LOTB)
     - Alternate source qualification
     - Redesign (form/fit/function equivalent)
     - Emulation (FPGA for obsolete ASIC)
  4. Implement: ECN/ECR process, regression test
  5. Verify: Full acceptance test per CSMFAB078 §7

CRITICAL WATCH LIST (2026):
  - NdFeB N52: China export controls → US/Japan qualification
  - Li-S chemistry: OXIS bankruptcy risk → Sion Power transition
  - Protonic HFET: TSMC 28nm → SkyWater 130nm port (rad-hard)
  - R-1234yf: GWP regulation → R-513A transition plan
```

---
