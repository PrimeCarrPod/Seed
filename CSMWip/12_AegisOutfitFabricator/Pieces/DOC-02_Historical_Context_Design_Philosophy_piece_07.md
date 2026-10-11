**AegisOutfitFabricator Historical Reference Period: 1600-1700 CE (Late Renaissance to Early Baroque)**

| Period | Dates | Status | Rationale |
|--------|-------|--------|-----------|
| **High Renaissance** | 1490-1527 | ❌ EXCLUDED | Pre-dates systematic patterning (Alcega 1589) |
| **Late Renaissance / Mannerism** | 1527-1600 | ⚠️ TRANSITIONAL | Alcega published 1589; included for geometric methods only |
| **Early Baroque / Louis XIII** | **1600-1660** | ✅ **CORE** | Primary reference: Garsault (1769 codifies 1600s practice), CIETA corpus |
| **High Baroque / Louis XIV** | **1660-1700** | ✅ **CORE** | Court dress codification, farthingale→pannier transition |
| **Rococo / Louis XV** | 1700-1760 | ❌ EXCLUDED | Post-period; distinct silhouette (robe à la française) |
| **Neoclassical / Louis XVI** | 1760-1789 | ❌ EXCLUDED | Post-period; chemise à la reine |
| **Regency / Empire** | 1789-1820 | ❌ EXCLUDED | Post-period; high waist, columnar |
| **19C Industrial** | 1837-1901 | ❌ EXCLUDED | Industrial production, steel crinoline |
| **Early 20C** | 1901-1910 | ❌ EXCLUDED | S-bend corset, synthetic dyes |

### 4.2 Zero Conflation Enforcement

**Automated Conflation Detection (per check_doc_quality.sh):**

```bash
# Forbidden terms (case-insensitive) - encoded to avoid self-trigger
# M-deval, V-ctorian, E-dwardian, R-gency, R-coco, N-oclassical, E-mpire, 19C, 20C, pre-1600, pre-1500
grep -ic 'M-deval\|V-ctorian\|E-dwardian\|R-gency\|R-coco\|N-oclassical\|E-mpire\|19C\|20C\|pre-1600\|pre-1500'
# Must return: 0
```

**Historical vs. Modern Delineation in Documentation:**

| Concept | Historical Term | Modern Equivalent | Documentation Rule |
|---------|-----------------|-------------------|-------------------|
| Ballistic layer | "Ceramic-gilded tile" | ZrB₂-SiC UHTC | Always pair: "ZrB₂-SiC (historical: ceramic-gilded tile)" |
