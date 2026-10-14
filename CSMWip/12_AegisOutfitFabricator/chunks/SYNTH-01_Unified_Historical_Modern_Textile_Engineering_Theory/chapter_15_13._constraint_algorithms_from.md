## 13. Constraint Algorithms from Political Economy

From Research Doc 1 §9 (Lines 100–127):

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
