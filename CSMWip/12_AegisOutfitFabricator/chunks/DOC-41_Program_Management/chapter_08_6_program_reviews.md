## 6. Program Reviews

### 6.1 Review Schedule & Entrance/Exit Criteria

| Review | Date | Authority | Key Entrance Criteria | Key Exit Criteria |
|--------|------|-----------|----------------------|-------------------|
| **SRR** | Mar 2027 | MDA | Requirements baseline, SRD v1.0 | Requirements stability > 95%, SRD approved |
| **SFR** | Sep 2027 | PEO | Architecture frozen, ICDs v1.0 | Functional baseline, SFR minutes signed |
| **PDR** | Mar 2028 | PEO | 90% drawings, MBSE models validated | Allocated baseline, PDR artifacts in CM |
| **CDR** | Sep 2028 | MDA | 100% drawings, 2 prototypes built | Product baseline, CDR closure < 30 RFA |
| **FRR** | Mar 2029 | PEO | DT complete, TRR passed | Test readiness, FRR certificate |
| **PRR** | Sep 2029 | MDA | Production line demo, FRP decision | Production readiness, PRR report |
| **ORR** | Mar 2030 | Combatant Cmd | OT complete, logistics demo | IOC declaration, ORR minutes |
| **IOC** | Oct 2030 | Service Chief | 12 suits delivered, trained crews | Operational capability declared |

### 6.2 Technical Review Metrics

**Requirements Stability Index (RSI)**:

$$
RSI = 1 - \frac{N_{changed} + N_{added} + N_{deleted}}{N_{baseline}}
$$

Target: RSI ≥ 0.95 at CDR.

**Requirements Verification Traceability Matrix (RVTM)** completeness:

$$
RVTM\% = \frac{N_{verified}}{N_{total}} \times 100\%
$$

Target: 100% at CDR, 100% at FRR.

**Drawing Release Status**:

$$
Drawing\% = \frac{N_{released}}{N_{planned}} \times 100\%
$$

Target: 90% at PDR, 100% at CDR.

---
