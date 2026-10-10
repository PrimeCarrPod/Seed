**Sumptuary Law Quantification:**
- Gold thread width limits
- Dye chemistry restrictions (kermes, indigo, woad)
- Yardage maximums per garment
- Guild segregation: Maîtres Tailleurs (structured) vs Maîtresses Couturières (unstructured)

**Algorithmic Constraints for Fabrication System:**
```
Max gold width ≤ sumptuary_limit(era, rank)
Dye palette ⊆ approved_chemistry(era)
Yardage ≤ quota(garment_type, era)
Construction_method ∈ {guild_authorized(era, gender)}
```

## 14. Traceability Matrix — SYNTH-01

| Section | Source Document | Section/Line | Key Values Extracted |
|---------|----------------|--------------|---------------------|
| 2.1 Silk Properties | Research Doc 1 | §2.1, Lines 10–15 | E=8–12 GPa, σ_uts=500–700 MPa, ε_break=15–25% |
| 2.1 Degumming | Research Doc 1 | §2.1, Lines 13–15 | 95–100°C, 60–90 min, 96% removal |
| 2.2 Gilded Threads | Research Doc 1 | §2.2, Lines 19–21 | Au-Hg/Ag, AuHg intermetallic |
| 3. Orthotropic Tensor | Research Doc 1 | §3.1, Lines 34–41 | ν = -ε_trans/ε_long, Hooke's law |
| 4. CIETA Typologies | Research Doc 1 | §3, Lines 26–32 | 5 structures with mechanical properties |
| 5. Metallic Thread Mech | Research Doc 1 | §2.2, Lines 19–21 | Rule of mixtures, geometry |
| 6. Core-Spun Correlation | Research Doc 2 | §3.3, §4 | PET 65%, cotton 38mm, β=0.958 |
| 7.1 Stitch Classification | Research Doc 2 | §1, Lines 3–10 | ISO 4915 → historical mapping |
| 7.2 Seam Integrity | Research Doc 2 | §2, Lines 22–30 | η = F_seamed/F_unseamed × 100% |
| 7.3 Cartridge Pleating | Research Doc 1 | §6.2, Lines 95–99 | 3:1 ratio, S-curve folds |
| 8. Hyperelastic Model | Research Doc 2 | §5, Lines 94–102 | W=W(I₁,I₂,I₄,I₆), Yeoh model |
| 9. Thread Materials | Research Doc 2 | §3, Lines 38–62 | 6 materials with properties |
| 10. Needle Thermodynamics | Research Doc 2 | §4, Lines 74–118 | q=βμF_nv, ΔT∝1/(ρck) |
