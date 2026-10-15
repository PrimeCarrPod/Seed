## 9. Traceability Matrix (Edition X — Piece 16)

### 9.1 Requirements Traceability

| Req ID | Source | Requirement | Implementation | Verification | Chapter |
|--------|--------|-------------|----------------|--------------|---------|
| REQ-EX-01 | CSMFAB078-A §3.1 | 8 editions compared | Table 128 complete | Matrix audit | 128 |
| REQ-EX-02 | CSMFAB078-A §3.5 | Forward transitions <65s | Table 129, 3/5 pass | Time trial | 129 |
| REQ-EX-03 | CSMFAB078-A §3.5 | Reverse transitions <70s | Table 130, all pass | Time trial | 130 |
| REQ-EX-04 | CSMFAB078-A §3.3 | LES calibration all editions | Table 131 complete | Tension test | 131 |
| REQ-EX-05 | CSMFAB078-A §3.4 | Trade-off analysis | Chapter 132 complete | Pareto audit | 132 |
| REQ-EX-06 | DOC-01 §5 | Utility function documented | Chapter 132 §5.2 | Review | 132 |
| REQ-EX-07 | CSMFAB078 Main §2 | Mission profile mapping | Chapter 132 §5.2 | Matrix audit | 132 |

### 9.2 Cross-Document Traceability

| Edition X Chapter | Source | Content |
|-------------------|--------|---------|
| 128 (Comparison) | CSMFAB078-A §3.1, CSMFAB078 Main §5 | Parameter matrix |
| 129 (Forward Trans) | CSMFAB078-A §3.5, DOC-10 §4 | Transition procedures |
| 130 (Reverse Trans) | CSMFAB078-A §3.5 | Reverse procedures |
| 131 (LES Calibration) | CSMFAB078-A §3.3 | Universal formula |
| 132 (Trade-offs) | CSMFAB078-A §3.4, DOC-01 §5 | Pareto, utility, TRL |
| 133 (X-refs) | All above | Reference index |
| 134 (Formulas) | CSMFAB078-A, DOC-01 | Math models |
| 135 (Standards) | All applicable | Compliance |
| 136 (Trace P16) | This doc | Piece traceability |
| 137 (Conformance) | Framework/check_doc_quality | Quality gates |

### 9.3 Standards Traceability

| Standard | Edition X Application | Chapter |
|----------|----------------------|---------|
| CSMFAB078-A §3.1-3.5 | All edition params | 128-132 |
| CSMFAB078 Main §2,5 | Mission profiles, perf | 128, 132 |
| CSMFAB078-B §3 | Threat validation | 128 |
| DOC-01 §5,9 | Trade studies, mass | 132, 128 |
| DOC-10 §4 | Don/doff/transition | 129, 130 |
| ISO 15858 | Mobility comparison | 128, 132 |
| MIL-STD-973 | CM for transitions | 129, 130 |

---