## 5. Emergency Procedures

### 5.1 Thermal Overload

```
Trigger: PVDF-TrFE core temp >39°C or skin temp >60°C
Immediate Actions:
1. Cease activity, seek shade/cooling
2. Activate MR fluid bladder cooling (if equipped)
3. Loosen LES zones 2, 3, 4 (chest, waist, hips) by 50%
4. Hydrate: 500 mL cool water over 15 min
5. If no improvement in 10 min: Emergency doff
6. Medical evaluation: Heat exhaustion/stroke protocol
```

**Key Formulas:**
- Core temp trigger: $T_{core} > 39^\circ\text{C}$
- Skin temp trigger: $T_{skin} > 60^\circ\text{C}$
- LES tension reduction: $\Delta T = 50\% \quad (\text{zones 2, 3, 4})$
- Hydration volume: $V_{hydrate} = 500 \text{ mL over } 15 \text{ min}$
- Reassessment time: $t_{reassess} = 10 \text{ min}$

### 5.2 Ballistic Impact

```
Trigger: Impact sensor (PVDF-TrFE >5g, 2ms) or audible impact
Immediate Actions:
1. Assume prone position, assess injury
2. MR fluid auto-activated (3 ms response)
3. Check BFS via PVDF-TrFE pressure sensors
4. If penetration: Emergency doff, direct pressure
5. If no penetration: Continue mission, log impact
6. Post-mission: Full tile µCT, replace impacted tiles
```

**Key Formulas:**
- Impact sensor threshold: $a > 5g, \; \Delta t = 2 \text{ ms}$
- MR fluid response time: $t_{MR} = 3 \text{ ms}$
- BFS measurement: Via PVDF-TrFE pressure sensors
- Post-mission: $\mu\text{CT scan of impacted tiles}$

### 5.3 EMI/GIC Event

```
Trigger: PVDF-TrFE GIC sensor >1 mV or EMI alert
Immediate Actions:
1. Verify BFRP dielectric isolation (multimeter >10¹² Ω)
2. Check MXene thread continuity (warp/weft <1Ω)
3. Activate CoAl₂O₄ Schumann monitoring
4. If GIC coupling detected: Ground via floating citadel electrode
5. Communications: Switch to optical fiber only
6. Power: Battery only (disconnect external)
```

**Key Formulas:**
- GIC sensor trigger: $V_{GIC} > 1 \text{ mV}$
- BFRP isolation: $R_{iso} > 10^{12} \Omega$
- MXene continuity: $R_{warp/weft} < 1 \Omega$
- Ground electrode: Floating citadel electrode
- Communications: Optical fiber only
- Power: Battery only

### 5.4 Chemical/Biological Exposure

```
Trigger: Detector alarm or symptom onset
Immediate Actions:
1. Emergency doff (<3 min)
2. Seal garment in hazmat bag
3. Personnel decontamination: 0.5% hypochlorite, 10 min
4. Medical evaluation: Per agent protocol
5. Garment: Full decon or disposal per CBRNE protocol
```

**Key Formulas:**
- Emergency doff time: $t_{doff} < 3 \text{ min}$
- Decontamination concentration: $C_{hypochlorite} = 0.5\%$
- Decontamination time: $t_{decon} = 10 \text{ min}$
- Hazmat bag sealing: Immediate
