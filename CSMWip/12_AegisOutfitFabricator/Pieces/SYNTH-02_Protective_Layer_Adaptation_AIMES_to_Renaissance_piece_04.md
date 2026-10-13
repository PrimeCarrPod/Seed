## 3. Edition-Specific Layer Scaling (LES Adaptation)

From CSMFAB078 §3.3 (Lines 45-48), panel count scales with edition:

| Edition | Tile Count (AIMES) | Ceramic Mass | Renaissance Panel Count | Renaissance Ceramic Mass |
|---------|-------------------|--------------|------------------------|--------------------------|
| LE-TS (Tall-Skinny) | 42 | 18.9 kg | 42 (25mm) | 8-10 kg |
| LE-TG (Tall-Gordo) | 56 | 25.2 kg | 56 (25mm) | 10-13 kg |
| LE-SS (Short-Skinny) | 36 | 16.2 kg | 36 (25mm) | 7-9 kg |
| LE-SG (Short-Gordo) | 48 | 21.6 kg | 48 (25mm) | 9-11 kg |

**Metallic Thread Density Scaling:**
```
Thread count per edition ∝ surface area ∝ (height × chest)^0.5
RM-TS: baseline density
RM-TG: 1.3× baseline (larger surface)
RM-SS: 0.85× baseline
RM-SG: 1.15× baseline
```

**Baleen/Steel Framework Scaling:**
```
Baleen stays per edition: 20-30 (historical standard)
Steel boning channels: edition-specific curvature radius
Hoop count (crinoline/farthingale): 4-6 hoops, r_max scaled to hip measurement
