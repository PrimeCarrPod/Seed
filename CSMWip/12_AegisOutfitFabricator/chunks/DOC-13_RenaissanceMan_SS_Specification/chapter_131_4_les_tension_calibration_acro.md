## 4. LES Tension Calibration Across Editions (CSMFAB078-A §3.3)

### 4.1 Universal Calibration Formula

**Base Equation (CSMFAB078-A Eq. 3.3.4):**
$$T_{z,e} = T_{z,ref} \times \left[1 + \alpha_e \times \beta_{z}\right]$$

**Reference Edition:** RM-TS (αₑ = 0, M_ref = 16.47 kg)

**Zone Sensitivity Factors (β_z) — Validated Across All 8 Editions:**

| Zone | β_z,RM (Male) | β_z,RW (Female) | Anatomy |
|------|---------------|-----------------|---------|
| Z1 | 0.80 | 0.85 | Neck/Cervical |
| Z2 | 0.90 | 0.95 | Shoulder |
| Z3 | 1.00 | 1.00 | Upper Torso |
| Z4 | 1.00 | 0.95 | Chest/Bust |
| Z5 | 1.10 | 1.15 | Waist |
| Z6 | 1.10 | 1.20 | Hip |
| Z7 | 1.00 | 1.05 | Deltoid |
| Z8 | 0.90 | 0.95 | Forearm |
| Z9 | 0.80 | 0.85 | Thigh |
| Z10 | 0.70 | 0.75 | Knee |
| Z11 | 0.60 | 0.65 | Calf |
| Z12 | 0.50 | 0.55 | Ankle |

### 4.2 Edition Tension Tables

#### Male Editions (RM-TS Reference = 55-65 N)

| Zone | **RM-SS** (α=-0.15) | RM-TS (α=0.00) | RM-SG (α=+0.18) | RM-TG (α=+0.25) |
|------|---------------------|----------------|-----------------|-----------------|
| Z1 | **50** | 55 | 63 | 66 |
| Z2 | **55** | 60 | 70 | 74 |
| Z3 | **60** | 65 | 77 | 81 |
| Z4 | **60** | 65 | 77 | 81 |
| Z5 | **55** | 60 | 72 | 77 |
| Z6 | **50** | 55 | 66 | 70 |
| Z7 | **45** | 50 | 59 | 63 |
| Z8 | **40** | 45 | 53 | 56 |
| Z9 | **35** | 40 | 47 | 50 |
| Z10 | **30** | 35 | 41 | 44 |
| Z11 | **25** | 30 | 35 | 38 |
| Z12 | **20** | 25 | 29 | 31 |
| **Total** | **525** | **585** | **689** | **731** |

#### Female Editions (RM-TS Ref scaled by RW morphology)

| Zone | RW-SS (α=-0.12) | RW-TS (α=+0.05) | RW-SG (α=+0.20) | RW-TG (α=+0.30) |
|------|-----------------|-----------------|-----------------|-----------------|
| Z1 | 48 | 57 | 65 | 69 |
| Z2 | 53 | 63 | 73 | 78 |
| Z3 | 58 | 68 | 79 | 84 |
| Z4 | 56 | 65 | 75 | 80 |
| Z5 | 52 | 63 | 75 | 81 |
| Z6 | 48 | 58 | 70 | 76 |
| Z7 | 43 | 51 | 59 | 63 |
| Z8 | 39 | 46 | 54 | 57 |
| Z9 | 34 | 41 | 48 | 51 |
| Z10 | 33 | 39 | 45 | 48 |
| Z11 | 27 | 32 | 38 | 41 |
| Z12 | 22 | 26 | 31 | 33 |
| **Total** | **513** | **609** | **718** | **767** |

### 4.3 Morphology Factor Derivation

**αₑ Calculation (CSMFAB078-A Eq. 3.2.1):**
$$\alpha_e = \frac{1}{3}\left(\frac{H_e - H_{ref}}{H_{ref}} + \frac{C_e - C_{ref}}{C_{ref}} + \frac{W_e - W_{ref}}{W_{ref}}\right)$$

**Reference (RM-TS):** H=190, C=90, W=75

| Edition | H | C | W | αₑ Calculation | αₑ |
|---------|---|---|---|----------------|-----|
| **RM-SS** | 162.5 | 81 | 70 | ⅓(-0.145 -0.100 -0.067) | **-0.15** |
| RM-TS | 190 | 90 | 75 | 0 | 0.00 |
| RM-SG | 162.5 | 110 | 100 | ⅓(-0.145 +0.222 +0.333) | **+0.18** |
| RM-TG | 190 | 115 | 105 | ⅓(0 +0.278 +0.400) | **+0.25** |
| RW-SS | 152.5 | 87 (B) | 65 | ⅓(-0.197 -0.033 -0.133) | **-0.12** |
| RW-TS | 180 | 97 (B) | 70 | ⅓(-0.053 +0.078 -0.067) | **+0.05** |
| RW-SG | 152.5 | 110 (B) | 100 | ⅓(-0.197 +0.222 +0.333) | **+0.20** |
| RW-TG | 180 | 115 (B) | 105 | ⅓(-0.053 +0.278 +0.400) | **+0.30** |

### 4.4 Transition Tension Delta

**Transition Tension Change (RM-SS → Target):**
$$\Delta T_z = T_{z,target} - T_{z,RM-SS}$$

**Max Single-Zone Delta:** Z6 (Hip) RM-SS→RM-TG: +20 N
**Max Total Delta:** RM-SS→RM-TG: +206 N (39% increase)

**Transition Actuation Time (SMA Micro-Tensioners):**
$$t_{actuate} = \frac{\Delta T_z}{k_{SMA} \cdot \dot{T}_{max}} \approx 5-15\ \text{s per zone}$$

**Full 12-Zone Transition:** 30-60 s (parallel actuation) — **within LES verify window**

### 4.5 Cross-References

- CSMFAB078-A §3.3: LES calibration framework
- Chapter 38: RM-SS zone tensions
- Chapter 95: LES verification post-donning
- Chapter 129: Edition transitions (forward)
- Chapter 130: Reverse transitions
- Chapter 128: Edition comparison matrix
- Chapter 78: LES tension vs. mobility

---