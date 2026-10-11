ΔE/ΔS_bust = 0.5 cm per size
ΔE/ΔS_waist = 0.3 cm per size
```

### 3.4 Edition-Specific Scaling: TS, TG, SS, SG for RM & RW
**RenaissanceMan (RM) Editions:**
| Edition | Bust Range (cm) | Scale Factor | Notes |
|---------|-----------------|--------------|-------|
| RM-TS | 80-90 | 0.90-0.95 | Petite |
| RM-TG | 95-105 | 1.00-1.05 | Standard |
| RM-SS | 75-85 | 0.85-0.90 | Small structure |
| RM-SG | 100-110 | 1.05-1.10 | Large structure |

**RenaissanceWoMan (RW) Editions:**
| Edition | Bust Range (cm) | Scale Factor | Notes |
|---------|-----------------|--------------|-------|
| RW-TS | 80-90 | 0.90-0.95 | Petite |
| RW-TG | 95-105 | 1.00-1.05 | Standard |
| RW-SS | 75-85 | 0.85-0.90 | Small structure |
| RW-SG | 100-110 | 1.05-1.10 | Large structure |

**Combined Scaling Function:**
```
Scale(Edition, Morphology, Target_Measurements) = 
  Base_Scale(Morphology) × Edition_Factor(Edition) × Individual_Factor(Measurements)
```

**Morphology Factors (RM vs RW):**
```
RM: Broader shoulders, narrower hips, longer torso
