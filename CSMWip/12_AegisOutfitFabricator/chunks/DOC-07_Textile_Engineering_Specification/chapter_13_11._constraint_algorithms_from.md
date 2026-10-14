## 11. Constraint Algorithms from Historical Regulation (SYNTH-01 §13)

### 11.1 Sumptuary Law Quantification (Research Doc 1 §9.2)

```
Max gold thread width ≤ sumptuary_limit(era, rank)
Dye palette ⊆ approved_chemistry(era)
  - Kermes crimson (insect-derived): nobility only
  - True indigo: regulated by guild
  - Woad (blue): commoner alternative
Yardage ≤ quota(garment_type, era)
  - Robe à la française: 12-15 meters silk
  - Court gown: regulated by rank
Construction_method ∈ {guild_authorized(era, gender)}
  - Maîtres Tailleurs (men): Structured garments (baleen stays)
  - Maîtresses Couturières (women): Unstructured (shifts, linen)
```

### 11.2 Guild Segregation as Workflow Constraints

```
Workflow_constraints:
  Structured_garment_production → Maîtres_Tailleurs_only
  Unstructured_garment_production → Maîtresses_Couturières_only
  Cross-gender_employment → PROHIBITED (1675 Paris regulation)
  Apprenticeship_duration → 7-10 years (guild mandated)
```
