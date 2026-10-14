## 4. Tile Integration Geometry (MAT-03 §3.1, CSMFAB078 Main §4.2)

### 4.1 Tile Layout per Panel — RM-TS (180 tiles total)

| Panel Group | Panels | Tiles/Panel | Tile Size | Arrangement |
|-------------|--------|-------------|-----------|-------------|
| Doublet Shell (P01-P07) | 7 | 12 primary + 4 backup | 25mm / 15mm | 4×3 primary grid, staggered backup |
| Sleeves (P08-P11) | 4 | 8 primary + 3 backup | 25mm / 15mm | 4×2 primary, articulated backup |
| Collar (P12) | 1 | 6 primary + 2 backup | 20mm / 12mm | Curved conformal |
| Skirt/Hose (P13-P17) | 5 | 10 primary + 4 backup | 25mm / 15mm | 5×2 primary, overlapping backup |
| Epaulets (P24-P25) | 2 | 4 primary + 1 backup | 20mm / 12mm | Shoulder contour |

**Total Primary Tiles:** $7 \times 12 + 4 \times 8 + 1 \times 6 + 5 \times 10 + 2 \times 4 = 84 + 32 + 6 + 50 + 8 = 180 \quad \text{✓}$

**Total Backup Tiles:** $7 \times 4 + 4 \times 3 + 1 \times 2 + 5 \times 4 + 2 \times 1 = 28 + 12 + 2 + 20 + 2 = 64$

### 4.2 Magnetic Edge Alignment (Halbach Array, MAT-03 §3.1)

$$\mathbf{B}(x,y,z) = B_0 e^{-z/\lambda} \left[\cos\left(\frac{2\pi x}{\Lambda}\right), \sin\left(\frac{2\pi x}{\Lambda}\right), 0\right]$$

$$\Lambda = 5 \text{ mm}, \quad \lambda = 2 \text{ mm}, \quad B_0 = 0.5 \text{ T}$$

**Alignment Force (Restoring):**
$$F_{\text{align}} = \frac{B^2 A}{2\mu_0} \cdot \frac{\Delta x}{\Lambda} \quad \text{Target: } \pm 0.05 \text{ mm accuracy}$$

**Tile-to-Tile Spacing (Gasket):**
$$g = 0.3 \text{ mm} \quad \text{(MXene-loaded conductive silicone)}$$

---
