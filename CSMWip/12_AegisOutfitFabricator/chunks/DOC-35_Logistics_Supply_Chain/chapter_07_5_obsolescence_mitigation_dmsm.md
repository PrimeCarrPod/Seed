## 5. Obsolescence Mitigation (DMSMS)

### 5.1 DMSMS Framework — SAE AS6294 Compliance

Per **SAE AS6294** §5 and DoDI 4151.22 Enclosure 5, the AIMES program implements a proactive **Diminishing Manufacturing Sources and Material Shortages (DMSMS)** management program.

### 5.2 Obsolescence Risk Assessment

Each LRU and critical component assessed quarterly:

$$
\text{ORI}_j = P_{obs,j} \cdot I_{impact,j} \cdot U_{urgency,j}
$$

Where:
- $P_{obs,j}$ = Probability of obsolescence (0–1) from market intelligence
- $I_{impact,j}$ = Impact score (1–5): 5 = No alternate, grounding risk
- $U_{urgency,j}$ = Urgency (1–5): 5 = <12 months to exhaustion

**Risk Matrix**:
| ORI Range | Category | Action |
|-----------|----------|--------|
| ≥ 60 | **Critical** | Immediate mitigation (LOTB, redesign) |
| 30–59 | **High** | Accelerated mitigation (qualify alternate) |
| 10–29 | **Medium** | Monitor, develop mitigation plan |
| < 10 | **Low** | Routine monitoring |

### 5.3 Mitigation Strategies

| Strategy | Trigger | Timeline | Cost Multiplier |
|----------|---------|----------|-----------------|
| **LOTB** (Life-of-Type Buy) | $P_{obs} > 0.7$, $I=5$ | 6–18 months | 1.5–3× unit cost |
| **Alternate Qualification** | Form-fit-function equivalent exists | 12–36 months | 2–5× (NRE + test) |
| **Redesign/Re-engineer** | No alternate, critical function | 24–60 months | 10–50× (NRE) |
| **Emulation/FPGA** | Obsolete microcontroller/FPGA | 12–24 months | 3–10× |
| **Additive Manufacturing** | Metallic/polymer parts, low volume | 6–18 months | 5–20× (setup) |

### 5.4 DMSMS Watchlist — Critical AIMES Items

| Item | Source | Obsolescence Risk | Mitigation Status |
|------|--------|-------------------|-------------------|
| Neuromorphic Processor (DOC-30) | Single-source foundry | Critical (ORI=72) | LOTB FY26–27, Redesign FY28 |
| MXene Precursor (Ti3C2Tx) | Limited suppliers | High (ORI=48) | Alternate qualification FY27 |
| Auxetic Metamaterial Foam (DOC-26) | Proprietary process | High (ORI=45) | AM process development FY26 |
| MR Fluid (DOC-28) | Specialty chemical | Medium (ORI=22) | Monitor, dual-source FY27 |
| Fiber Bragg Grating Arrays (DOC-29) | 2 suppliers | Medium (ORI=18) | Qualified 2nd source FY26 |

---
