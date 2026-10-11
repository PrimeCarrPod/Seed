| 5:00-5:15 | Split, zip, push DRAFT-04, verify | 15 min |
| 5:15-5:45 | Write DRAFT-05 (Zero-Waste Nesting Optimizer) | 30 min |
| 5:45-6:00 | Split, zip, push DRAFT-05, verify | 15 min |
| 6:00-6:15 | Session log, create NEXT_RUNNER_004, push all | 15 min |

**Total: ~6 hours** — Focused on 5 DRAFT documents with pipeline verification each

---

## 🔍 QUALITY CHECKLIST PER DRAFT DOCUMENT

Before considering any DRAFT document complete:

### Document Structure Requirements
- [ ] **Minimum 300 lines** of dense technical content (wc -l ≥ 300)
- [ ] **≥15 mathematical formulas** in LaTeX/Unicode (grep -c '\\$\\|\\[' ≥ 15)
- [ ] **≥10 cross-references** to source documents (grep -c 'Research\\|SYNTH\\|MAT\\|CSMFAB078' ≥ 10)
- [ ] **≥5 industry standards** cited (grep -ci 'CIETA\\|ASTM\\|NIJ\\|NFPA\\|MIL-STD\\|ISO\\|IEC' ≥ 5)
- [ ] **Zero conflation** — historical vs modern clearly separated (grep -i 'mediev al\|victori an\|edwardi an' = 0)
- [ ] **No guessing** — every value sourced or marked [TBD:RESEARCH] (grep -c 'TBD:RESEARCH' documented)
- [ ] **Traceability matrix** present at end of document (grep -c 'Traceability Matrix' ≥ 1)
- [ ] **Reassembly diff = 0 bytes** (diff original reassembled = no output)

### Content-Specific Quality Gates

#### DRAFT-01: Alcega Developable Surface Engine
- [ ] Developable surface mathematics: directrix + generatrix
- [ ] Osculating circle tangent for bodice curves
- [ ] Coordinate transformation: 3D body → 2D pattern
- [ ] DXF/SVG output spec with layer structure
- [ ] Cutting layout optimizer on 560mm width
- [ ] Marker efficiency >85%

#### DRAFT-02: Garsault Proportional Scaling System
- [ ] Anthropometric measurement system (8+ measurements)
