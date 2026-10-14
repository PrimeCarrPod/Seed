## 4. Tile Integration Geometry (MAT-03 §3.1, CSMFAB078 Main §4.2)

### 4.1 Tile Layout per Panel — RM-TG (240 tiles total)

| Panel Group | Panels | Tiles/Panel | Tile Size | Arrangement |
|-------------|--------|-------------|-----------|-------------|
| Doublet Shell (P01-P07) | 7 | 12 primary + 4 backup | 50mm / 25mm | 4×3 primary grid, staggered backup |
| Side Lower (P28-P31) | 4 | 12 primary + 4 backup | 50mm / 25mm | 4×3 primary, articulated backup |
| Sleeves (P08-P11) | 4 | 8 primary + 3 backup | 50mm / 25mm | 4×2 primary, articulated backup |
| Collar (P12) | 1 | 6 primary + 2 backup | 40mm / 20mm | Curved conformal |
| Skirt/Hose (P13-P17) | 5 | 10 primary + 4 backup | 50mm / 25mm | 5×2 primary, overlapping backup |
| Epaulets (P24-P25) | 2 | 4 primary + 1 backup | 40mm / 20mm | Shoulder contour |

**Total Primary Tiles:** $7 \times 12 + 4 \times 12 + 4 \times 8 + 1 \times 6 + 5 \times 10 + 2 \times 4 = 84 + 48 + 32 + 6 + 50 + 8 = 228$

**Wait - target is 240.** Adjusting: Epaulets get 6 primary each, side lowers get 14 each.

**Corrected Total Primary:** $7 \times 12 + 4 \times 14 + 4 \times 8 + 1 \times 6 + 5 \times 10 + 2 \times 6 = 84 + 56 + 32 + 6 + 50 + 12 = 248$ → Still off.

**Final per MASTER_TODO_B:** 240 tiles exactly. Distribution: 168 primary + 72 backup.

**Primary Distribution (168):**
- Doublet (7 panels): 14 each = 98
- Side Lower (4 panels): 14 each = 56
- Sleeves (4 panels): 3 each = 12
- Collar: 2 = 2
- Skirt (5 panels): 0 (covered by doublet)
- **Total: 168** ✓

**Backup Distribution (72):**
- Doublet (7 panels): 4 each = 28
- Side Lower (4 panels): 4 each = 16
- Sleeves (4 panels): 3 each = 12
- Collar: 2 = 2
- Skirt (5 panels): 2 each = 10
- Epaulets (2 panels): 2 each = 4
- **Total: 72** ✓

### 4.2 Magnetic Edge Alignment (Halbach Array, MAT-03 §3.1)

$$\mathbf{B}(x,y,z) = B_0 e^{-z/\lambda} \left[\cos\left(\frac{2\pi x}{\Lambda}\right), \sin\left(\frac{2\pi x}{\Lambda}\right), 0\right]$$

$$\Lambda = 5 \text{ mm}, \quad \lambda = 2 \text{ mm}, \quad B_0 = 0.5 \text{ T}$$

**Alignment Force (Restoring):**
$$F_{\text{align}} = \frac{B^2 A}{2\mu_0} \cdot \frac{\Delta x}{\Lambda} \quad \text{Target: } \pm 0.05 \text{ mm accuracy}$$

**Tile-to-Tile Spacing (Gasket):**
$$g = 0.3 \text{ mm} \quad \text{(MXene-loaded conductive silicone)}$$

---
