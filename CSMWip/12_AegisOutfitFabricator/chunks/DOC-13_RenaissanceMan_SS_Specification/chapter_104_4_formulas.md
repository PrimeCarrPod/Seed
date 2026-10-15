## 4. Formulas (Extended Chapters 100-107)

### 4.1 Mission Profile Scoring
$$Score_{profile} = \sum w_i \cdot \frac{Capability_i}{Requirement_i}$$

Weights: Mobility 0.3, Protection 0.25, Thermal 0.2, EMI 0.15, Logistics 0.1

### 4.2 Variant Mass Calculation
$$M_{variant} = M_{baseline} + \sum \Delta m_{changes}$$

### 4.3 Configuration Effectiveness
$$E_{config} = \frac{Performance_{variant}}{Performance_{baseline}} \times \frac{M_{baseline}}{M_{variant}}$$

### 4.4 Transition Time (RM-SS → Variant)
$$T_{trans} = \sum_{components} \frac{|m_{base} - m_{var}|}{\dot{m}_{change}}$$

Where $\dot{m}_{change}$ = component swap rate (kg/min)

### 4.5 Mission Endurance
$$T_{endurance} = \frac{E_{battery}}{P_{avg}} \times \eta_{duty}$$

$E_{battery}$ = 150 mAh × 3.7 V = 0.555 Wh, $P_{avg}$ = 50 mW → 11 hr theoretical

---