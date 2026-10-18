## 6. Renaissance Integration

### 6.1 Compute Module Concealment

#### 6.1.1 Physical Integration
Based on CSMFAB078-A §3.1 (Leaf Edition Mechanical) and SYNTH-01 §2 (Silk Mechanics):

```
Compute Module Form Factor:
  - Dimensions: 120 × 80 × 20 mm (fits in torso back panel)
  - Mass: 1.2 kg (including heatsink, shielding)
  - Mounting: Magnetic (NdFeB N52, 4× 10×5 mm) + silk lacing
  - Thermal: Vapor chamber → heat pipe → Layer 11 (thermal mgmt)
  - EMI: Mu-metal shield (0.5 mm) + MXene coating (Layer 4)
  
Connector Interface (hermetic, MIL-DTL-38999 equivalent):
  - Power: 4× 28 VDC (primary + redundant)
  - Data: 4× LVDS (FBG interrogator), 2× CAN-FD, 2× AFDX
  - RF: 4× SMPM (RF mesh antennas)
  - Fiber: 12× LC/APC (FBG/OFDR/BOTDA fibers)
```

#### 6.1.2 Edition-Specific Configurations
| Edition | Neuromorphic Cores | Partitions Active | Cooling |
|---------|-------------------|-------------------|---------|
| LE-TS | 128 | P0-P4, P7 | Vapor chamber |
| LE-TG | 128 | P0-P7 | Vapor chamber + heat pipe |
| LE-SS | 96 | P0-P3, P5, P7 | Heat pipe only |
| LE-SG | 128 | P0-P7 | Full thermal loop |

---
