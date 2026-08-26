# Prime_Protein_Folding — Piece 05/12
## Article A5: A5-02 — Prime Protein Folding
**Piece:** 05 of 12  
**Generated:** 2026-08-26 22:08:00 UTC

---

# Prime 23 and Chaperone-Assisted Folding

## 5.1 Prime 23 Chaperone Cycles

Chaperones (GroEL/ES, Hsp70, Hsp90) operate on prime 23 cycles:
```
GroEL cycle: 23 steps (7 ATP binding + 7 hydrolysis + 7 release + 2 conformational)
Hsp70 cycle: 23 steps (ATP binding → substrate binding → ATP hydrolysis → ADP release)
Hsp90 cycle: 23 steps (dimer opening → ATP binding → client loading → closure → hydrolysis)
```

## 5.2 Prime 23 Folding Yield

The folding yield with chaperone assistance:
```
Y = 1 - exp(-23 × [chaperone]/K_d)
```
For GroEL: K_d ≈ 1 μM, [GroEL] ≈ 23 μM in E. coli → Y ≈ 0.999

## 5.3 Prime 23 Aggregation Prevention

Aggregation is suppressed by prime 23 kinetic partitioning:
```
P_fold = k_fold / (k_fold + k_agg)
k_agg = k₀ exp(-23 ΔG_agg / k_B T)
```
The prime 23 barrier makes aggregation exponentially unlikely when chaperones are present.

---

*Author: Jason Isaac Brodsky (California, 1976)*