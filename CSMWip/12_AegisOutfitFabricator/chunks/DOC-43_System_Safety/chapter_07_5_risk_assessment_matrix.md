## 5. Risk Assessment Matrix

### 5.1 MIL-STD-882E Risk Matrix

| Probability \ Severity | **Catastrophic (1)** | **Critical (2)** | **Marginal (3)** | **Negligible (4)** |
|------------------------|----------------------|------------------|------------------|--------------------|
| **Frequent (A)** | High | High | Serious | Medium |
| **Probable (B)** | High | High | Serious | Medium |
| **Occasional (C)** | High | Serious | Medium | Low |
| **Remote (D)** | Serious | Medium | Low | Low |
| **Improbable (E)** | Medium | Low | Low | Low |
| **Eliminated (F)** | Eliminated | Eliminated | Eliminated | Eliminated |

**Risk Level Definitions**:
- **High**: Unacceptable — Must eliminate or reduce. Requires MDA approval for acceptance.
- **Serious**: Undesirable — Must reduce to Medium or Low. Requires PM approval.
- **Medium**: Acceptable with review — Track and monitor. CAM approval.
- **Low**: Acceptable — No further reduction required. Documented.
- **Eliminated**: Hazard eliminated by design.

### 5.2 ALARP Principle — As Low As Reasonably Practicable

Per **UK HSE** and **IEC 61508**, risk reduction continues until **ALARP** is demonstrated:

$$
\text{ALARP Demonstrated} \iff \frac{\text{Cost of Additional Reduction}}{\text{Risk Reduction Achieved}} > \text{Disproportion Factor}
$$

**Disproportion Factor**: Typically 10–100× for High risks, 3–10× for Serious.

**Cost of Risk Reduction**:

$$
C_{reduction} = C_{engineering} + C_{schedule} + C_{weight} + C_{performance} + C_{lifecycle}
$$

### 5.3 Residual Risk Summary (Post-Mitigation)

| Hazard ID | Description | Residual Severity | Residual Probability | Residual Risk | ALARP Status |
|-----------|-------------|-------------------|----------------------|---------------|--------------|
| **SHA-001** | Seal failure → asphyxiation | 1 (Catastrophic) | F (Eliminated) | Eliminated | ✅ Redundant APC |
| **SHA-002** | Battery thermal runaway | 2 (Critical) | E (Improbable) | Low | ✅ BMS + containment |
| **SHA-003** | AI autonomy loss | 2 (Critical) | E (Improbable) | Low | ✅ Verified runtime |
| **SHA-004** | Cyber safety disable | 1 (Catastrophic) | E (Improbable) | Medium | 🔄 Monitoring |
| **SHA-005** | Blast TBI | 2 (Critical) | D (Remote) | Medium | ✅ Auxetic + helmet |
| **SHA-006** | Chemical permeation | 2 (Critical) | E (Improbable) | Low | ✅ MOF + STF |
| **SHA-007** | Tile spall | 3 (Marginal) | D (Remote) | Low | ✅ Auxetic backing |
| **SHA-008** | MR fluid leak | 3 (Marginal) | D (Remote) | Low | ✅ Double bladder |
| **SHA-009** | Training inadequacy | 2 (Critical) | D (Remote) | Medium | 🔄 Recert program |
| **SHA-010** | Maintenance error | 2 (Critical) | D (Remote) | Medium | 🔄 Procedural controls |

---
