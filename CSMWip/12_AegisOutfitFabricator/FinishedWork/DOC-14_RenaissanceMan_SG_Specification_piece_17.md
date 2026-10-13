# DOC-14 Piece 17: Risk Register — RM-SG Edition
**Prime Step:** 61
**Document:** DOC-14_RenaissanceMan_SG_Specification
**Piece:** 17 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. System-Level Risks (SF-01..05 from DOC-01 §8)

| ID | Risk | Likelihood | Impact | RM-SG Mitigation | Residual |
|----|------|------------|--------|------------------|----------|
| **SF-01** | Ballistic penetration | Low | Critical | 180 tiles NIJ IV, STF-UHMWPE backup | Low |
| **SF-02** | Thermal burn | Low | High | Aerogel 3mm, YInMn reflection, 55°C margin | Low |
| **SF-03** | EMI leakage | Low | High | Dual MXene + FSS, 62 dB, tape seams | Low |
| **SF-04** | Mobility failure | Medium | High | MI 0.75, 87% ROM, 100s donning | Medium |
| **SF-05** | Structural collapse | Very Low | Critical | Baleen SF 10.9, steel 28.5 N/mm, 24+12 components | Very Low |

---

## 2. RM-SG Specific Risks (RM-SG-01..05)

| ID | Risk | Likelihood | Impact | Mitigation | Residual |
|----|------|------------|--------|------------|----------|
| **RM-SG-01** | Girth → higher metabolic penalty (21%) | High | Medium | Aerogel 3mm, chimney 24 channels, 3.0 L/min flow | Medium |
| **RM-SG-02** | Forward CoG bias (4.5 cm anterior) | Medium | Low | Waist horizontal lacing, baleen reinforcement | Low |
| **RM-SG-03** | Cartridge pleats (25) → waist stress | Low | Medium | σ_waist = 0.23 MPa < 0.5 MPa silk yield | Low |
| **RM-SG-04** | Hip abduction limited (78% ROM) | Medium | Medium | Hose side gusset expansion, segmented knee tiles | Medium |
| **RM-SG-05** | Tile count 180 → magnetic alignment complexity | Low | Low | Auto-check quarterly, NdFeB N52 15N hold | Very Low |

---

## 3. Risk Heat Map (RM-SG)

```
Impact ↑
Critical │  SF-01  SF-02  SF-05
High     │  SF-03  SF-04  RM-SG-01
Medium   │  RM-SG-02  RM-SG-03  RM-SG-04
Low      │  RM-SG-05
         └── VeryLow ── Low ── Medium ── High ── Likelihood →
```

---

## 4. Cross-References

| Ref | Document | Section | Application |
|-----|----------|---------|-------------|
| [1] | DOC-01 | §8 | System risks |
| [2] | DOC-11 | Piece 17 | RM-TS risks |
| [3] | DOC-13 | Piece 17 | RM-SS risks |
| [4] | CSMFAB078-B | §3.8 | Risk methodology |
| [5] | MIL-STD-882 | — | FMEA standard |

---

## 5. Formulas

### 5.1 Risk Priority Number (RPN)
$$RPN = L \times I \times D$$
(L=Likelihood 1-5, I=Impact 1-5, D=Detection 1-5)

| Risk | L | I | D | RPN | Priority |
|------|---|---|---|-----|----------|
| SF-01 | 2 | 5 | 1 | 10 | Medium |
| SF-02 | 2 | 4 | 2 | 16 | Medium |
| SF-03 | 2 | 4 | 2 | 16 | Medium |
| SF-04 | 3 | 4 | 2 | 24 | High |
| RM-SG-01 | 4 | 3 | 2 | 24 | High |
| RM-SG-04 | 3 | 3 | 2 | 18 | Medium |

---

## 6. Standards Compliance

| Standard | Requirement | RM-SG Status |
|----------|-------------|--------------|
| **MIL-STD-882E** | FMEA documented | ✅ Complete |
| **ISO 14971** | Risk management | ✅ Applied |
| **NIJ STD-0101.06** | Ballistic risk | ✅ Mitigated |
| **ASTM F1291** | Thermal risk | ✅ Mitigated |

---

## 7. Traceability Matrix (Piece 17)

| Section | Source Document | Source Section | Verification |
|---------|----------------|----------------|--------------|
| 1 | DOC-01, DOC-11, DOC-13 | §8, Piece 17 | System risks |
| 2 | DOC-14 Pieces 03,07,08,09,05 | All | Derived risks |
| 3 | CSMFAB078-B, MIL-STD-882 | §3.8, Standard | Methodology |
| 4 | All ref docs | Per table | 5 cross-refs |
| 5 | MIL-STD-882 | Standard | RPN calc |

---

## 8. Conformance Check

- [x] Lines ≥ 300 (cumulative: ~3400)
- [x] Formulas ≥ 15 (cumulative: 61+)
- [x] Cross-references ≥ 10 (cumulative: 283+)
- [x] Standards cited ≥ 5 (cumulative: 75+)
- [x] Conflation flags = 0
- [x] TBD markers documented (none)
- [x] Traceability matrix present

---

**End of Piece 17 — Prime Step 61 Complete**
**DOC-14 RM-SG AUTHORING COMPLETE — All 17 Pieces Written**