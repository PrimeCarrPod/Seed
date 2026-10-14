## 3. Cross-Cutting Systems

### 3.1 Leaf Edition System (LES) — 12-Zone Tension Calibration

The LES maps **12 anatomical tension zones** to historical lacing points, calibrated per edition:

| Zone | Anatomical Location | RM Tension (N) | RW Tension (N) | Historical Lacing Point |
|------|---------------------|----------------|----------------|------------------------|
| Z1 | Shoulder apex | 45-65 | 40-60 | Sleeve head attachment |
| Z2 | Scapular spine | 50-70 | 45-65 | Back lacing (Watteau) |
| Z3 | Thoracic spine | 55-75 | 50-70 | Center back stay |
| Z4 | Lumbar | 60-80 | 55-75 | Waist lacing (stays) |
| Z5 | Iliac crest | 55-75 | 50-70 | Farthingale tape |
| Z6 | Anterior superior iliac | 50-70 | 45-65 | Pannier suspension |
| Z7 | Sternum | 40-60 | 35-55 | Front busk/lacing |
| Z8 | Costal margin | 45-65 | 40-60 | Lower front lacing |
| Z9 | Axillary | 35-55 | 30-50 | Side gore lacing |
| Z10 | Cervical | 30-50 | 25-45 | Collar/coif attachment |
| Z11 | Occipital | 25-45 | 20-40 | Hood/coif tension |
| Z12 | Distal sleeve | 20-40 | 15-35 | Cuff lacing |

**Tension Calibration Equation per Edition:**

$$T_{z,e} = T_{z,\text{base}} \cdot \left(1 + \alpha_e \cdot \frac{M_e - M_{\text{ref}}}{M_{\text{ref}}}\right) \cdot \beta_{z,e}$$

Where $T_{z,\text{base}}$ from CSMFAB078-A Table 3.3, $\alpha_e$ edition morphology factor, $\beta_{z,e}$ zone-edition interaction coefficient.

### 3.2 Dyneema-Silk Hybrid Lacing System

Historical cord construction with modern core-spun architecture:

$$\sigma_{\text{lace}} = \frac{F}{A_{\text{core}} + A_{\text{sheath}}} = \frac{F}{\frac{\pi}{4}(d_{\text{Dyneema}}^2 + d_{\text{silk}}^2)}$$

**Target Specifications:**
- Core: Dyneema SK99 equivalent, $d_{\text{core}} = 0.8\text{ mm}$, $\sigma_{\text{uts}} = 3.6\text{ GPa}$
- Sheath: Degummed silk fibroin, $d_{\text{sheath}} = 0.4\text{ mm}$, $\sigma_{\text{uts}} = 650\text{ MPa}$
- Combined: $\sigma_{\text{lace}} \geq 2.1\text{ GPa}$, elongation at break $\varepsilon_b = 3.5\%$

### 3.3 Ti₃AlC₂ MAX Phase Cleat/Aglet Engineering

Historical aglet form factor with modern dielectric properties:

$$\varepsilon_r = 15.2 - 0.008T \quad (20-300^\circ\text{C}) \quad \text{(Dielectric constant)}$$

$$\tan\delta = 0.002 + 1.5\times10^{-5}T \quad \text{(Loss tangent)}$$

$$E = 320\text{ GPa}, \quad K_{IC} = 4.5\text{ MPa}\sqrt{\text{m}}, \quad \rho = 4.2\text{ g/cm}^3$$

**Historical Dimensional Constraints (per Alcega/Garsault):**
- Aglet length: 8-12 mm
- Aglet diameter: 2-3 mm (tapered)
- Eyelet internal diameter: 3-4 mm
- Cleat engagement depth: 4-6 mm

### 3.4 Phoenix Protocol — Circular Economy Integration

Garment lifecycle mapped to historical remaking traditions:

$$\text{Recovery Rate} = \frac{m_{\text{recovered}}}{m_{\text{original}}} \geq 0.85 \quad \text{(target)}$$

**Disassembly Sequence (Reverse Assembly):**
1. L12 CoAl₂O₄ coating → chemical stripping (citric acid, pH 3.5, 60°C)
2. L11 PVDF-TrFE liner → mechanical delamination
3. L10 Baleen/steel chassis → bolt/screw removal, baleen channel extraction
4. L9-L8 STF layers → aqueous extraction (DI water, 40°C, sonication)
5. L7-L2 Ceramic tiles → magnetic release, individual tile recovery
6. L3-L6 MXene brocade → thread-level unwinding, MXene recovery (HCl etch)
7. L1 YInMn Blue/QD → thermal decomposition (400°C inert), pigment recovery

---
