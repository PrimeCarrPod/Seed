## 5. Component Replacement Schedule

### 5.1 Life-Limited Parts (LLP)

| Component | Life Limit | Replacement Level | Indicator |
|-----------|------------|-------------------|-----------|
| ZrB₂-SiC Tiles (Layer 2) | 5 years / 500 cycles | O-Level (individual) | Flexural <500MPa, visual |
| MXene Films (Layers 3,6) | 3 years / 300 cycles | I-Level (panel) | SE <100 dB @ 1GHz |
| Aerogel Core (Layer 5) | 4 years / 400 cycles | I-Level (panel) | Springback <85% |
| MR Fluid (Layer 8) | 2 years / 200 cycles | I-Level (system) | Yield stress drift >15% |
| PVDF-TrFE Mesh (Layer 11) | 5 years / 500 cycles | D-Level (full) | Node failure >5% |
| Li-S Battery Pack | 3 years / 500 cycles | I-Level (module) | Capacity <80% |
| Protonic HFET (12×) | 5 years / 500 cycles | I-Level (unit) | Parametric drift >10% |
| Neuromorphic ASIC | 7 years / 1000 cycles | D-Level (module) | Inference drift >2% |
| Seals (8 interfaces) | 2 years / 200 cycles | O-Level (individual) | He leak >5×10⁻⁷ cm³/s |
| Baleen Stays | 4 years / 400 cycles | I-Level (set) | Permanent set >2mm |
| Steel Boning | 7 years / 1000 cycles | I-Level (piece) | Kink/corrosion |
| Dyneema SK99 Lacing | 3 years / 300 cycles | O-Level (zone) | Fray >2 strands |
| Ti₃AlC₂ Cleats | 5 years / 500 cycles | O-Level (piece) | Skip/fail >1/100 cycles |

### 5.2 Spare Parts Provisioning (ISO 13374 / SAE AS6294)

```
SPARES MODEL:
  - Operational Availability target: Ao ≥0.95
  - Pipeline time: O-Level (0), I-Level (72h), D-Level (30d)
  - Demand forecast: Poisson (λ = fleet × cycles/year × failure rate)
  - Safety stock: 95% service level (z=1.645)
  - Obsolescence: Rolling 5-year DMSMS scan
  
INITIAL SPARES KIT (Per 10-suit fleet):
  Bay 7 (O-Level):  56 tiles (all editions), 10 MXene tape rolls,
                    120 cleats, 4 Dyneema spools, 4 RF nodes
  Bay 6 (I-Level):  4 MR fluid drums, 4 battery modules,
                    8 aerogel panel sets, 4 FSS panels,
                    4 HFET controllers, 2 chassis segments
  Depot Pool:       200 tiles, 20 MR drums, 20 battery packs,
                    20 aerogel sets, 10 compute modules,
                    50 HFETs, 10 chassis sets
```

---
