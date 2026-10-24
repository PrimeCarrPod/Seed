## 9. Standards Compliance (Quality Gates)

| Standard | Clause | Gate Category | Application |
|----------|--------|---------------|-------------|
| **CSMFAB078-B** | §3 | Protection Performance | Threat thresholds |
| **CSMFAB078-B** | §4 | All | QA gate definitions |
| **NIJ STD-0101.06** | §5-7 | PG-01, PG-07, PG-08 | Ballistic test method |
| **MIL-STD-461G** | RS103, RS105 | PG-03, PG-05 | EMI/HPM/EMP test |
| **IEEE 299** | — | PG-03 | Shielding effectiveness |
| **ASTM F2700** | — | PG-02 | Convective/radiative heat |
| **NFPA 1971** | §8.2 | PG-02 | Structural fire fighting |
| **ASTM F2371** | — | PG-06 | Force trauma (STF) |
| **IEC 61000-4-3** | — | PG-04 | Radiated immunity (FSS) |
| **ISO 15858** | §5, §6, Annex B | FG-01 to FG-05 | Ergonomics test methods |
| **ISO 7933** | — | FG-04 | Heat stress (PHS) |
| **ISO 9920** | — | FG-04 | Clothing insulation |
| **ISO 7933** | — | FG-04 | PHS model |
| **CIETA Typology** | All | HG-02, HG-03 | Historical weave verification |
| **DOC-02** | §4.5 | HG-01 | Conflation check |
| **DOC-09** | All | All | Test procedures |
| **Framework/check_doc_quality.sh** | All | MG-01 to MG-06 | Doc quality gates |
| **DRAFT-05** | §6 | MG-01 | Nesting optimizer |
| **DOC-10** | §4 | OG-01 to OG-04 | Operational procedures |
| **CSMFAB078-A** | §3.4, §3.5 | FG-05, OG-03 | Mobility, transitions |
| **ASTM E119** | — | PG-05 (mod) | Fire resistance (DE) |
| **MIL-STD-810H** | 514 | PG-05 | Thermal shock (DE) |
| **ISO 13934-1** | — | HG-03, FG-01 | Tensile properties |
| **ASTM D1683** | — | HG-04, MG-06 | Seam strength |

### 9.1 Gate-to-Standard Mapping

| Gate | Primary Standard | Secondary Standards |
|------|------------------|---------------------|
| FG-01 | ISO 15858 §5.2 | ISO 13934-1 |
| FG-02 | ISO 15858 §6.3 | Custom task battery |
| FG-03 | ISO 15858 Annex B | Tekscan 9800 protocol |
| FG-04 | ISO 7933 (PHS) | ISO 9920 |
| FG-05 | CSMFAB078-A §3.4 | Chapter 76 task sim |
| PG-01 | NIJ STD-0101.06 §5-7 | ASTM F2371 |
| PG-02 | ASTM F2700 / NFPA 1971 §8.2 | ASTM C177 |
| PG-03 | MIL-STD-461G RS103 | IEEE 299 |
| PG-04 | IEC 61000-4-3 | VNA S₂₁ |
| PG-05 | MIL-STD-810H 514 | ASTM E119, RS105 |
| PG-06 | ASTM F2371 mod | Rheometer |
| PG-07 | NIJ STD-0101.06 §6.3 | High-speed camera |
| PG-08 | NIJ STD-0101.06 §7 | — |
| HG-01 | DOC-02 §4.5 | grep automated |
| HG-02 | DOC-02 Eq. 2.4 | CIETA |
| HG-03 | Material certs | CIETA, ISO 13934-1 |
| HG-04 | DOC-02, Research Doc 1 | Visual audit |
| MG-01 | DRAFT-05 §6 | Physical yield |
| MG-02 | DRAFT-01 engine | Pattern audit |
| MG-03 | write_large_file.py | diff |
| MG-04 | MANIFEST.json | SHA256 |
| MG-05 | gzip -9 | stat |
| MG-06 | Framework/check_doc_quality.sh | Script execution |
| OG-01 | DOC-10 §4.2 | Stopwatch |
| OG-02 | DOC-10 §4.3 | Stopwatch |
| OG-03 | CSMFAB078-A §3.5 | Stopwatch + LES |
| OG-04 | Chapter 108 | Stopwatch |

---
