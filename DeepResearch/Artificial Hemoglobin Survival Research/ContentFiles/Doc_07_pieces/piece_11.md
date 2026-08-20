# Document 7: Intravenous Carbon Dioxide Mitigation — THAM, IPRAC, Peritoneal Dialysis, and Emerging Technologies
## Piece 10/18: Extracorporeal CO₂ Removal (ECCO₂R) — Hemolung RAS, Clinical Integration, and Advanced Circuit Management

Extracorporeal CO₂ Removal (ECCO₂R) using the Hemolung Respiratory Assist System (RAS) represents the most clinically mature extracorporeal CO₂ removal technology. Unlike IPRAC (percutaneous, impeller-enhanced), ECCO₂R employs a centrifugal pump to actively circulate blood through a high-efficiency gas exchange membrane. This piece provides a detailed clinical integration guide for ECCO₂R in entrapment scenarios, covering circuit management, anticoagulation, troubleshooting, and integration with the broader CO₂ mitigation framework.

**Hemolung RAS — System Architecture and Specifications**:

*Console*:
- **Dimensions**: 35 × 40 × 45 cm, 15 kg (cart-mounted).
- **Display**: 12" touchscreen, real-time waveforms (flow, pressures, gas exchange).
- **Pump**: Magnetically levitated centrifugal pump (0-600 mL/min, ±10 mL/min accuracy).
- **Gas Exchanger**: Integrated membrane oxygenator (polymethylpentane, 0.9 m²).
- **Heat Exchanger**: Counter-current, maintains 37°C ± 0.5°C.
- **Sensors**: 
  - Blood flow (ultrasonic, ±5%).
  - Pressures (pre-pump, post-oxygenator, return).
  - Gas flow (0-10 L/min, thermal mass flow).
  - Exhaust CO₂/O₂ (NDIR/paramagnetic).
  - Temperature (inlet/outlet).
- **Power**: AC 110-240V + 4-hour Li-ion battery (hot-swappable).
- **Data**: USB, Ethernet, HL7 output for EMR integration.

*Catheter — 15.5 Fr Dual-Lumen*:
- **Drainage Lumen** (21 Fr equivalent): Multiple side holes, radiopaque tip marker.
- **Return Lumen** (17 Fr equivalent): End-hole, directional tip.
- **Lengths**: 55 cm (femoral), 50 cm (jugular).
- **Materials**: Polyurethane, heparin-bonded surface.
- **Guidewire Compatibility**: 0.035" (Seldinger).

*Gas Exchange Cartridge (Disposable, 14-day rated)*:
- **Membrane**: Polymethylpentane (PMP), 0.9 m² effective area.
- **Fiber Geometry**: 250 μm ID, 30 μm wall, 45% packing density.
- **Priming Volume**: 95 mL (blood path).
- **Heat Exchanger**: Counter-current, 37°C ± 0.5°C.
- **Priming**: Saline → CO₂ flush → heparinized saline.

**ECCO₂R Circuit Management — Advanced Protocols**:

*Priming and Initiation*:
1. **Prime**: 1L NS → 500 mL heparinized saline (5 U/mL) → CO₂ flush (purge air).
2. **De-air**: Critical — air in membrane causes vapor lock, gas embolism risk.
   - Invert oxygenator, tap gently, purge vents.
   - Vacuum assist (if available) for complete de-airing.
3. **Heparinization**: 
   - Bolus: 50-100 U/kg (target ACT 180-220 sec).
   - Infusion: 10-15 U/kg/hr (adjust to ACT 180-220 / anti-Xa 0.3-0.5).
4. **Initiation Sequence**:
   - Pump 100 mL/min → confirm flow, no air.
   - Ramp to 350 mL/min over 2 min.
   - Sweep gas 5 L/min 100% O₂.
   - Monitor: Exhaust CO₂ >50 mL/min, PaCO₂ drop in 15 min.

*Anticoagulation Management — The Critical Balance*:
| Parameter | Target | Monitoring | Adjustment |
|-----------|--------|------------|------------|
| **ACT** | 180-220 sec | q1h × 4h, then q4h | Heparin ±2-5 U/kg/hr |
| **Anti-Xa** | 0.3-0.5 IU/mL | q6h | Heparin ±2 U/kg/hr |
| **Platelet Count** | >80,000 | q12h | ↓ Heparin if <80k; HIT workup if <50k |
| **Fibrinogen** | >150 mg/dL | q12h | Cryo if <150 |
| **PT/INR** | <1.5 | q12h | FFP if INR >1.5 |
| **D-dimer** | Monitor trend | q24h | ↑ if rising → circuit clot |
| **Free Hb** | <20 mg/dL | q6h | ↓ Flow if >50 mg/dL |

*Heparin Dosing Protocol*:
- **Bolus**: 50 U/kg (max 5,000 U) at initiation.
- **Infusion**: Start 10 U/kg/hr → titrate to ACT 180-220.
- **Monitoring**: ACT q1h × 4h, then q4h (i-STAT ACT cartridge).
- **Adjustment**: 
  - ACT <160: Bolus 30 U/kg + ↑ infusion 2 U/kg/hr.
  - ACT >240: Hold 15 min → ↓ infusion 2 U/kg/hr.
- **HIT Protocol**: If platelets ↓ >50% or new thrombosis → stop heparin, start argatroban 2 mcg/kg/min, send HIT panel.

*Circuit Monitoring and Troubleshooting*:

| Parameter | Normal Range | Abnormal | Action |
|-----------|--------------|----------|--------|
| **Blood Flow** | 350-500 mL/min | <300 or >550 | Check for kinks, suction, preload |
| **Pre-Pump Pressure** | -50 to -150 mmHg | < -200 | Suction → ↓ flow, check line/kink |
| **Post-Oxygenator Pressure** | 100-250 mmHg | >300 | ↑ ΔP → clot in oxygenator → consider exchange |
| **Return Pressure** | 0-50 mmHg | >100 | Check return line, RA pressure |
| **ΔP (Post - Pre)** | 100-350 mmHg | >400 | Oxygenator clotting → prepare exchange |
| **Sweep Gas Flow** | 5-10 L/min | <2 or >12 | Adjust to target PaCO₂ |
| **Exhaust CO₂** | 50-100 mL/min | <30 | ↑ Sweep gas, check membrane |
| **Exhaust O₂** | 85-95% | <80% | Check O₂ supply, membrane integrity |
| **Circuit Temp** | 36.5-37.5°C | <36 or >38 | Check heat exchanger, ambient |
| **Circuit ΔT** | <1°C | >2°C | Heat exchanger failure |

*Circuit Exchange Protocol* (Membrane Failure/Clotting):
1. **Preparation**: New cartridge primed, heparinized, de-aired.
2. **Bridge**: Double-lumen connector or second circuit ready.
3. **Transition**: 
   - Clamp old circuit (drain + return).
   - Connect new circuit to catheter lumens.
   - Prime new circuit → de-air → restart flow.
4. **Transition Time**: <2 min (minimize blood loss).
6. **Post-Exchange**: Re-check ACT, recalibrate sensors.

**ECCO₂R Integration with Ventilation and CO₂ Mitigation**:

*Ventilator Strategy with ECCO₂R*:
- **Ultra-Protective Ventilation**: V_T 3-4 mL/kg, PEEP 10-15, Rate 10-15, FiO₂ titrated.
- **Permissive Hypercapnia**: Target PaCO₂ 55-65 mmHg (ECCO₂R removes excess).
- **Driving Pressure**: <15 cm H₂O (lung protection).
- **PEEP Titration**: Best compliance (stress index 0.9-1.1).

*CO₂ Mitigation Ladder with ECCO₂R*:
```
PaCO₂ >55 mmHg on optimized vent
    ↓
ECCO₂R Initiation (350 mL/min, sweep 5 L/min)
    ↓
PaCO₂ >60 after 1h ECCO₂R
    ↓
↑ Sweep gas to 10 L/min, ↑ Blood flow to 500 mL/min
    ↓
PaCO₂ >65 after 2h
    ↓
Add THAM 250 mL bolus → 125 mL/hr
    ↓
PaCO₂ >65 after 4h
    ↓
Add IPRAC (if available) OR Peritoneal Dialysis
    ↓
PaCO₂ >70 despite all
    ↓
Metabolic Suppression (Propofol + Hypothermia)
    ↓
PaCO₂ >75 despite all
    ↓
VV-ECMO (Full Support)
```

*ECCO₂R + THAM Synergy*:
- ECCO₂R removes CO₂ mechanically; THAM buffers residual H⁺.
- **Dose Reduction**: ECCO₂R reduces THAM requirement by 40-60%.
- **Titration**: THAM rate guided by pH; ECCO₂R sweep gas guided by PaCO₂.

**ECCO₂R + Liquid Ventilation Synergy**:
- **TLV/PLV + ECCO₂R**: Dual CO₂ removal pathways (pulmonary + extracorporeal).
- **Synergy**: 
  - TLV removes CO₂ from pulmonary blood.
  - ECCO₂R removes CO₂ from systemic venous return.
  - **Combined**: Can achieve near-total CO₂ removal independence from native lungs.
- **Protocol**: 
  - TLV: Sweep gas 10 L/min, V_T 10 mL/kg, rate 5/min.
  - ECCO₂R: 400 mL/min, sweep 5 L/min.
  - **Combined CO₂ Removal**: 250-350 mL/min (exceeds metabolic production).

**ECCO₂R Complication Management**:

| Complication | Incidence | Recognition | Management |
|--------------|-----------|-------------|------------|
| **Bleeding** | 15-20% | Overt bleed, Hb drop, ACT >250 | ↓ Heparin, transfuse, consider reversal |
| **Circuit Thrombosis** | 10-15% | ↑ ΔP, ↓ flow, visible clot | ↑ Heparin, consider exchange |
| **Hemolysis** | 5-10% | Free Hb >50 mg/dL, pink urine | ↓ Flow, check for kink, consider exchange |
| **Air Embolism** | <1% | Sudden hypotension, mill wheel | Left lateral, aspirate CVC, 100% O₂, CPR |
| **Catheter Malposition** | 5-10% | Poor flow, recirculation | Reposition (fluoro), re-wire |
| **HIT** | 1-3% | Platelets ↓ >50%, thrombosis | Stop heparin, argatroban, HIT panel |
| **Infection (CRBSI)** | 2-5% | Fever, positive blood culture | Culture, antibiotics, line exchange |
| **Hypothermia** | 5-10% | Circuit temp <36°C | Check heat exchanger, warm fluids |

**ECCO₂R in Entrapment — Special Protocols**:

*Rapid Deployment Kit (Pre-packed)*:
- Hemolung console + cartridge (pre-primed? no, sterile).
- 15.5 Fr catheter + 13 Fr sheath.
- Heparin + ACT cartridges (20).
- Sweep gas O₂ (cylinder + regulator).
- ACT/i-STAT cartridges (20).
- Heparin infusion pump.

*Deployment Timeline*:
| Time | Action |
|------|--------|
| 0 min | Decision: PaCO₂ >60 despite THAM → ECCO₂R indicated. |
| 5 min | Femoral/IJ access (US-guided), sheath placement. |
| 15 min | Catheter placement, position confirmed. |
| 25 min | Circuit primed, heparinized, connected. |
| 30 min | Flow 350 mL/min, sweep 5 L/min → CO₂ removal active. |
| 45 min | PaCO₂ recheck — expect ↓ 15-20 mmHg. |

*Transport Considerations*:
- **Console**: 15 kg, cart-mounted — ambulance/helicopter transportable.
- **Power**: 4h battery + ambulance inverter.
- **O₂ Supply**: E-cylinder (680 L) → 2h at 5 L/min; liquid O₂ preferred.
- **Monitoring**: Portable monitor (SpO₂, EtCO₂, NIBP, ECG) + console display.

**ECCO₂R vs IPRAC — Decision Algorithm for Entrapment**:

```
Mechanical CO₂ Removal Indicated (PaCO₂ >60 despite THAM)
    ↓
IPRAC Available AND Cath Lab Skills Available?
    ↓ YES → IPRAC (faster, no heparin, portable, higher CO₂ removal)
    ↓ NO
ECCO₂R Available AND ECMO Specialist Available?
    ↓ YES → ECCO₂R (mature tech, hemodynamic support)
    ↓ NO
Peritoneal Dialysis Available?
    ↓ YES → PD + THAM + IPRAC (if available)
    ↓ NO
Metabolic Suppression + THAM Max Dose
    ↓
VV-ECMO (If Available)
```

**ECCO₂R Training and Credentialing**:

*Required Competencies*:
- ECMO specialist certification (ELSO) OR dedicated ECCO₂R course (16h).
- Vascular access (IJ/femoral) proficiency.
- Anticoagulation management (heparin, argatroban, bivalirudin).
- Circuit troubleshooting (simulation-based).
- Emergency procedures (air embolism, circuit rupture, power failure).

*Credentialing*:
- **Initial**: 16h didactic + 4 supervised runs + written exam.
- **Maintenance**: 4 runs/year + annual competency verification.
- **Medical Director**: Board-certified intensivist/pulmonologist with ECMO privileges.

**Conclusion**: ECCO₂R (Hemolung RAS) provides a clinically validated, FDA-cleared extracorporeal CO₂ removal option with established safety data and manageable anticoagulation requirements. While IPRAC offers superior CO₂ removal and portability, ECCO₂R's clinical maturity, hemodynamic support capability, and broader operator base make it a critical alternative when IPRAC is unavailable or vascular access favors the smaller dual-lumen catheter. Integration with THAM, liquid ventilation, and the broader CO₂ mitigation ladder ensures a layered, resilient defense against the hypercapnic crisis of entrapment.