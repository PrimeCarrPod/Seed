| RM-SG | 0.92 | 15 pieces |
| RW-TS | 0.93 | 14 pieces |
| RW-TG | 0.89 | 20 pieces |
| RW-SS | 0.94 | 11 pieces |
| RW-SG | 0.90 | 17 pieces |

### 5.4 Offcut Utilization (Phoenix Protocol Integration)

$$\text{Recovery Rate} = \frac{\sum A_{\text{offcuts used}}}{\sum A_{\text{offcuts generated}}} \geq 0.85$$

---

## 6. 8-Edition Pattern Generation Pipeline (from DRAFT-01..05, SYNTH-01 §3.5, CSMFAB078 Main §5.5, CSMFAB078-A §3.4)

### 6.1 Pipeline Stages

```
Anthropometry Input (8 measurements)
         │
         ▼
Garsault Proportional Scaling (DRAFT-02) → 8 Base Body Meshes
         │
         ▼
Alcega Developable Surface Engine (DRAFT-01) → 8 × 24 Pattern Pieces
         │
         ▼
Pleating Kernel Application (DRAFT-03) → Watteau + Cartridge pleats
         │
         ▼
Hoop Architecture Integration (DRAFT-04) → Farthingale/Pannier patterns
