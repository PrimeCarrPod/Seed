
---

## 7. Standards Compliance Summary

| Standard | Application | Reference |
|----------|-------------|-----------|
| **CIETA** | Textile typology classification & mechanical baselines | Research Doc 1 §3 |
| **ISO 4915** | Stitch class mapping (historical ↔ modern) | Research Doc 2 §3.1 |
| **ASTM D1683** | Seam efficiency η methodology | Research Doc 2 §3.2 |
| **ISO 13934** | Tensile properties of fabrics | SYNTH-01 §4.1 |
| **ISO 13937** | Tear strength (historical seam validation) | MAT-01 §3.3 |

---

## 8. Design Decision Log — Key Philosophical Choices

| Decision ID | Choice | Rationale | Alternative Rejected |
|-------------|--------|-----------|---------------------|
| DD-01 | Period 1600-1700 only | Alcega/Garsault continuity; CIETA corpus density | Extending to 1789 (includes Rococo, breaks silhouette) |
| DD-02 | HAS as weighted feature match | Quantifiable, traceable to extant garments | Expert panel scoring (subjective, non-reproducible) |
| DD-03 | PES as min(1, achieved/required) | Hard threshold per threat; no over-engineering credit | Linear weighting (allows trade-offs below threshold) |
| DD-04 | NSGA-II for Pareto | Handles non-convex frontier, categorical variables | Gradient-based (requires differentiable objectives) |
| DD-05 | Zero conflation enforced by grep | Automatable, zero tolerance | Manual review (inconsistent, doesn't scale) |
| DD-06 | Historical term + modern equivalent always paired | Traceability, prevents conflation in specs | Separate historical/modern sections (creates drift) |

---

*End of DOC-02 — Historical Context & Design Philosophy*  
*Next: DOC-03 Material Systems Integration*