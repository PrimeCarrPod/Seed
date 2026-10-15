## 2. Profile-Specific Configuration (RM-SS Variants)

### 2.1 Configuration Definition Framework

Each mission profile may authorize specific configuration variants within the RM-SS edition envelope. All variants maintain:
- **Edition Identity:** RM-SS (H=155-170, C=76-86, W=65-75)
- **Mass Limit:** ≤14.5 kg (5% margin above baseline)
- **Protection Floor:** NIJ IV, 58 dB EMI, <58°C thermal

### 2.2 Authorized Variants

| Variant ID | Name | Mass | Key Changes | Authorization |
|------------|------|------|-------------|---------------|
| **RM-SS-01** | **Baseline Urban** | 13.73 kg | Standard per this spec | Default |
| **RM-SS-02** | **Light Infil** | 13.2 kg | -30 primary tiles, -60 backup, +1mm aerogel | CO Only |
| **RM-SS-03** | **Cold Weather** | 14.1 kg | +1mm aerogel, +2 baleen, heated insoles | ENV ≥ -20°C |
| **RM-SS-04** | **Maritime** | 13.9 kg | Hydrophobic MXene, corrosion-resistant hardware | OPS MARITIME |
| **RM-SS-05** | **EMCON** | 13.5 kg | PVDF only (no BLE), MXene 7 wt%, no QD | EMCON ORDER |
| **RM-SS-06** | **Training** | 12.8 kg | Ceramic simulants (Al₂O₃), no STF, no MXene | TRAINING ONLY |

### 2.3 Variant Configuration Details

#### RM-SS-02 Light Infil (Mass-Optimized)
| Change | Baseline | Variant | Mass Delta |
|--------|----------|---------|------------|
| Primary Tiles | 150 | 120 | -0.70 kg |
| Backup Tiles | 280 | 220 | -0.41 kg |
| Aerogel | 2 mm | 3 mm | +0.01 kg |
| STF Coverage | Z1-Z3,Z7 | Z1-Z2 | -0.05 kg |
| **Total** | **13.73 kg** | **13.18 kg** | **-0.55 kg** |

**Protection Impact:** V₅₀ → 915 m/s, Thermal → 62°C, EMI → 56 dB

#### RM-SS-03 Cold Weather (Thermal-Optimized)
| Change | Baseline | Variant | Mass Delta |
|--------|----------|---------|------------|
| Aerogel | 2 mm | 3 mm | +0.01 kg |
| Baleen Stays | 20 | 22 | +0.04 kg |
| Heated Insoles | — | 2× 5V/2A | +0.12 kg |
| Battery | 150 mAh | 500 mAh | +0.02 kg |
| **Total** | **13.73 kg** | **13.92 kg** | **+0.19 kg** |

**Performance:** Thermal interior <52°C @ -20°C ambient, 1100°C/300s

#### RM-SS-04 Maritime (Corrosion-Optimized)
| Change | Baseline | Variant | Mass Delta |
|--------|----------|---------|------------|
| MXene Coating | Standard | +PTFE topcoat | +0.02 kg |
| Brass Eyelets | CuZn37 | Ti Gr.5 | +0.03 kg |
| MAX Aglets | Ti₃AlC₂ | Ti₃AlC₂ + Au flash | +0.01 kg |
| Lacing Cord | Dyneema | Dyneema + hydrophobic | +0.01 kg |
| **Total** | **13.73 kg** | **13.80 kg** | **+0.07 kg** |

**Performance:** 500 hr salt fog (ASTM B117), no corrosion

#### RM-SS-05 EMCON (Emission Control)
| Change | Baseline | Variant | Mass Delta |
|--------|----------|---------|------------|
| PVDF (L11) | Full + BLE | Piezo only | -0.005 kg |
| MXene (L3/L6) | 5 wt% | 7 wt% | +0.06 kg |
| QD (L1) | CdSe/ZnS | None | -0.01 kg |
| BLE Module | nRF52840 | Removed | -0.008 kg |
| **Total** | **13.73 kg** | **13.77 kg** | **+0.04 kg** |

**Performance:** EMI emissions < -100 dBm, SE 62 dB @ 1 GHz

#### RM-SS-06 Training (Cost-Optimized)
| Change | Baseline | Variant | Mass Delta |
|--------|----------|---------|------------|
| L2/L7 Ceramic | ZrB₂-SiC | Al₂O₃ (simulant) | -1.8 kg |
| STF Layers | SiO₂/PEG | None | -0.48 kg |
| MXene Layers | Ti₃C₂Tₓ | None | -0.56 kg |
| PVDF/Spinel | Active | None | -0.11 kg |
| **Total** | **13.73 kg** | **12.78 kg** | **-0.95 kg** |

**Protection:** NIJ II simulant only, NO live threat protection

### 2.4 Configuration Management

| Control | Requirement |
|---------|-------------|
| **Variant Selection** | Mission commander + CCB approval |
| **Documentation** | Variant ID on neck label + digital ID |
| **Reversion** | Must return to RM-SS-01 within 72 hr |
| **Tracking** | All variants logged in CMDB |
| **Testing** | Each variant: full QA gate pass |

### 2.5 Cross-References

- Chapter 101: Mission profiles
- Chapter 10: Edition identification
- Chapter 17: Layer specifications (baseline)
- Chapter 128: Edition comparison
- Chapter 129: Edition transitions
- CSMFAB078-A §3.5: Edition transition rules
- Framework/Config_Mgmt_Plan.md: CM process

---