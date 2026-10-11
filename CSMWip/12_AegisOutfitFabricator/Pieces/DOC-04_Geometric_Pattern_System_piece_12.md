## 9. Computational Performance Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Unfolding time (per piece) | < 50 ms | C++ implementation |
| Affine scaling (8 editions) | < 10 ms | Vectorized NumPy |
| Pleating application | < 20 ms | GPU kernel |
| Nesting optimization | < 30 s | 500 iterations SA |
| Full pipeline (8 editions) | < 60 s | End-to-end |

---

## 10. Risk Register — Geometric Pattern System

| Risk ID | Description | Likelihood | Impact | Mitigation |
|---------|-------------|------------|--------|------------|
| GP-01 | Developable surface fails for high-curvature regions (armhole) | Medium | High | Fallback: dart insertion + seam allowance |
| GP-02 | Edition scaling creates non-physical intersections | Low | High | Collision detection in pipeline |
| GP-03 | Nesting efficiency < 0.85 for RW-SG (complex pieces) | Medium | Medium | Manual override + offcut catalog |
| GP-04 | Pleat depth exceeds fabric width for large editions | Low | High | Automatic pleat count reduction |
| GP-05 | Hoop deployment collision with ceramic tiles | Medium | High | Kinematic simulation in digital twin |

---

*End of DOC-04 — Geometric Pattern System*  
*Next: DOC-05 Structural Framework Specification*