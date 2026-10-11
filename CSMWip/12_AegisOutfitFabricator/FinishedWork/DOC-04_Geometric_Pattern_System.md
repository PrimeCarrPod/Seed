# DOC-04: Geometric Pattern System
**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Document ID:** DOC-04  
**Version:** 1.0  
**Classification:** Core Document Batch 1  
**Dependencies:** DRAFT-01, DRAFT-02, DRAFT-03, DRAFT-04, DRAFT-05, SYNTH-01, CSMFAB078-A, MAT-02, Research Doc 1, CSMFAB078 Main  
**Status:** AUTHORED — Pipeline Pending  

---

## 1. Developable Surface Engine (from DRAFT-01, SYNTH-01 §3.1, Research Doc 1 §4.1, CSMFAB078 Main §5.1)

### 1.1 Convolute Surface Generation

**Directrix Curve Definition (Body Silhouette Cross-Sections):**

$$\mathbf{c}(u) = \begin{bmatrix} x(u) \\ y(u) \\ z(u) \end{bmatrix} = \begin{bmatrix} R(u) \cos\theta(u) \\ R(u) \sin\theta(u) \\ z(u) \end{bmatrix}$$

Where $u \in [0,1]$ parameterizes body height, $R(u)$ = radius at height $u$, $\theta(u)$ = angular offset for asymmetry.

**Generatrix Ruling (Straight Grain Lines):**

$$\mathbf{g}(u) = \frac{\mathbf{c}'(u) \times \mathbf{k}}{\|\mathbf{c}'(u) \times \mathbf{k}\|} \quad \text{(parallel to selvage)}$$

Where $\mathbf{k} = [0,0,1]^T$ (vertical axis).

**Developable Surface Parametrization:**

$$\mathbf{r}(u,v) = \mathbf{c}(u) + v \cdot \mathbf{g}(u), \quad v \in [0, W_{\text{pattern}}]$$

**Gaussian Curvature Constraint (Developability):**

$$K = \kappa_1 \kappa_2 = 0 \quad \Rightarrow \quad \det(\mathbf{r}_{uu} \cdot \mathbf{r}_v, \mathbf{r}_u \cdot \mathbf{r}_{uv}, \mathbf{r}_v \cdot \mathbf{r}_{vv}) = 0$$

### 1.2 Alcega Unfolding Algorithm

**Step 1: Principal Curvature Line Tracing**

$$\frac{du}{dv} = \pm \sqrt{\frac{E}{G}} \quad \text{(lines of curvature on developable surface)}$$

**Step 2: Geodesic Parallel Transport**

$$\frac{D\mathbf{g}}{ds} = 0 \quad \text{along directrix} \quad \Rightarrow \quad \mathbf{g}(u) = \mathcal{P}_{0 \rightarrow u}(\mathbf{g}_0)$$

**Step 3: Planar Development (Unfolding)**

$$\mathbf{r}_{\text{flat}}(u,v) = \int_0^u \|\mathbf{c}'(s)\| ds \cdot \mathbf{e}_x + v \cdot \mathbf{e}_y$$

**Step 4: Loom Width Constraint (Alcega 560mm Standard)**

$$\text{If } W_{\text{pattern}} > 560\text{ mm}: \text{ Split along ruling lines, add seam allowance}$$

### 1.3 DXF/SVG Output Specification

**DXF Entity Structure:**
- POLYLINE for pattern outline (closed)
- SPLINE for curved seams (Watteau back, cartridge pleats)
- HATCH for grain direction indicator
- TEXT for piece ID, edition, grain line, notch marks

**SVG ViewBox:** `0 0 560 L_max` where $L_max$ = max pattern length

---

## 2. Proportional Scaling System (from DRAFT-02, Research Doc 1 §4.3, CSMFAB078-A §3.1, SYNTH-01 §3.2, CSMFAB078 Main §5.2)

### 2.1 Anthropometric Measurement System

**Primary Measurements (Garsault Base + LES Calibration):**

| Measurement | Symbol | RM Base | RW Base | LES Zone |
|-------------|--------|---------|---------|----------|
| Stature | $H$ | 1800 mm | 1680 mm | — |
| Chest/Bust | $C$ | 980 mm | 920 mm | Z7, Z8 |
| Waist | $W$ | 820 mm | 700 mm | Z4, Z5 |
| Hip | $H_p$ | 960 mm | 1000 mm | Z5, Z6 |
| Nape-to-waist | $NW$ | 420 mm | 395 mm | Z2, Z3 |
| Across-back | $AB$ | 370 mm | 350 mm | Z2 |
| Sleeve length | $SL$ | 640 mm | 580 mm | Z1, Z12 |
| Shoulder slope | $\theta_s$ | 22° | 24° | Z1 |

### 2.2 Edition-Specific Affine Transformation

$$\mathbf{P}_e = \mathbf{S}_e \cdot \mathbf{P}_{\text{base}} + \mathbf{T}_e$$

**Scale Matrix $\mathbf{S}_e = \text{diag}(s_x, s_y, s_z)$:**

| Edition | $s_x$ (circ.) | $s_y$ (len.) | $s_z$ (depth) |
|---------|---------------|--------------|---------------|
| RM-TS | 0.92 | 1.08 | 0.90 |
| RM-TG | 1.15 | 1.08 | 1.12 |
| RM-SS | 0.92 | 0.92 | 0.90 |
| RM-SG | 1.15 | 0.92 | 1.12 |
| RW-TS | 0.90 | 1.07 | 0.88 |
| RW-TG | 1.18 | 1.07 | 1.15 |
| RW-SS | 0.90 | 0.93 | 0.88 |
| RW-SG | 1.18 | 0.93 | 1.15 |

**Translation Vector $\mathbf{T}_e$ (mm):**

| Edition | $\Delta x$ | $\Delta y$ | $\Delta z$ |
|---------|------------|------------|------------|
| RM-TS | +15 | +40 | -10 |
| RM-TG | -20 | +40 | +25 |
| RM-SS | +15 | -35 | -10 |
| RM-SG | -20 | -35 | +25 |

### 2.3 Grade Rules for Intermediate Sizes

**Linear Interpolation Between Editions:**

$$\mathbf{P}(\alpha) = (1-\alpha) \mathbf{P}_{e_1} + \alpha \mathbf{P}_{e_2}, \quad \alpha \in [0,1]$$

**Non-Linear Correction (Per DRAFT-02 §3.3):**

$$\mathbf{P}_{\text{corrected}} = \mathbf{P}(\alpha) + \mathbf{C}(\alpha) \odot \mathbf{P}_{\text{base}}$$

Where $\mathbf{C}(\alpha)$ = correction tensor from historical grading tables.

---

## 3. Pleating Kernel (from DRAFT-03, Research Doc 1 §4.4, SYNTH-01 §3.3, MAT-04 §5.2, CSMFAB078 Main §5.3)

### 3.1 Watteau Back Pleating (Double Box Pleat)

**Geometry: 3:1 Compression Ratio**

$$L_{\text{unpleated}} = 3 \cdot L_{\text{pleated}}$$

**Pleat Depth Calculation:**

$$d_p = \frac{L_{\text{unpleated}} - L_{\text{pleated}}}{2 \cdot N_{\text{pleats}}} = \frac{L_{\text{pleated}}}{N_{\text{pleats}}}$$

**Load Distribution (Column Action):**

$$\sigma_{\text{pleat}} = \frac{F_{\text{vertical}}}{A_{\text{pleat}}} = \frac{F_{\text{vertical}}}{2 \cdot d_p \cdot t_{\text{fabric}} \cdot N_{\text{pleats}}}$$

**Beeswax Thread Integration (Historical Lubrication):**

$$\mu_{\text{beeswax}} = 0.15 \quad \text{vs.} \quad \mu_{\text{dry}} = 0.35 \quad \text{(silk-on-silk)}$$

### 3.2 Cartridge Pleating (S-Curve Fold Geometry)

**Parametric S-Curve:**

$$\mathbf{c}(s) = \begin{bmatrix} R \sin(2\pi s / \lambda) \\ s \\ R (1 - \cos(2\pi s / \lambda)) \end{bmatrix}, \quad s \in [0, L]$$

Where $R$ = fold radius, $\lambda$ = wavelength (pleat repeat).

**Volumetric Compression Ratio:**

$$\eta_{\text{cart}} = \frac{V_{\text{unpleated}}}{V_{\text{pleated}}} = \frac{L \cdot W \cdot t}{L \cdot W_{\text{eff}} \cdot t_{\text{eff}}} \approx 2.5\text{--}3.5$$

**Perpendicular Force Distribution:**

$$F_{\perp}(s) = \frac{EI}{R^2} \kappa(s) \quad \text{where } \kappa(s) = \frac{2\pi}{\lambda} \text{ (constant curvature)}$$

### 3.3 Pleat Stitch Specification (ISO 4915 ↔ Historical Mapping)

| Historical Stitch | ISO 4915 Class | SPI | Thread | Application |
|-------------------|----------------|-----|--------|-------------|
| Backstitch | 301 (Lockstitch) | 18-22 | Silk/Beeswax | Watteau pleat anchor |
| Running stitch | 101 (Chainstitch) | 16-20 | Linen | Cartridge pleat gather |
| Whip stitch | 503 (Overedge) | 20-24 | Silk | Pleat edge finish |
| Stab stitch | 304 (Zigzag) | 12-16 | Metallic | Decorative pleat topstitch |

---

## 4. Hoop Architecture (from DRAFT-04, Research Doc 1 §4.5, MAT-02 §4.3, CSMFAB078-A §3.3, CSMFAB078 Main §5.4)

### 4.1 Elliptical Hoop Geometry

**Farthingale (Cone) → Pannier (Elliptical Dome) Transition:**

$$\frac{x^2}{a(z)^2} + \frac{y^2}{b(z)^2} = 1$$

$$a(z) = a_0 + (a_1 - a_0) \frac{z}{H}, \quad b(z) = b_0 + (b_1 - b_0) \frac{z}{H}$$

Where $z$ = height from waist, $H$ = total skirt length.

### 4.2 Catenary Tape Suspension

**Tape Tension Distribution:**

$$T(z) = T_0 \cosh\left(\frac{w z}{T_0}\right) \quad \text{(catenary under self-weight)}$$

Where $w$ = weight per unit length of hoop + fabric.

**Hoop Moment of Inertia (Bending Resistance):**

$$I(z) = \frac{\pi}{64} (D_o^4 - D_i^4) \quad \text{for circular cross-section hoop wire}$$

### 4.3 Deployment Kinematics

**Spring Energy Storage (LES Z5, Z6):**

$$U_{\text{spring}} = \frac{1}{2} k (\Delta x)^2 \geq m_{\text{hoop}} g H_{\text{deploy}}$$

**Deployment Time Target:** $t_{\text{deploy}} < 5\text{ s}$ (from CSMFAB078 Main §4.7)

**Friction Catch / Magnetic Latch:**

$$F_{\text{hold}} \geq 1.5 \cdot m_{\text{hoop}} g \quad \text{(safety factor 1.5)}$$

---

## 5. Zero-Waste Nesting Optimizer (from DRAFT-05, Research Doc 1 §4.6, SYNTH-01 §3.4, CSMFAB078 Main §6.4, CSMFAB078-E §2)

### 5.1 Bottom-Left + NFP + Simulated Annealing (per DRAFT-05 §3.1, Research Doc 1 §4.6, CSMFAB078 Main §6.4, SYNTH-01 §3.4)

**No-Fit Polygon (NFP) for Irregular Shapes:**

$$\text{NFP}(A, B) = \{ \mathbf{t} \in \mathbb{R}^2 \mid \text{int}(A) \cap \text{int}(B + \mathbf{t}) = \emptyset \}$$

**Objective Function:**

$$\min \quad L_{\text{used}} = \max_i (y_i + h_i)$$

Subject to:
- $x_i \geq 0, \quad x_i + w_i \leq 560$ (loom width)
- $\text{NFP}(P_i, P_j) \cap \{\mathbf{0}\} = \emptyset \quad \forall i \neq j$ (no overlap)
- Grain direction constraint: $\angle(\mathbf{g}_i, \mathbf{e}_y) \leq 5^\circ$

### 5.2 Simulated Annealing Parameters

| Parameter | Value | Schedule |
|-----------|-------|----------|
| Initial temp | 1000 | — |
| Cooling rate | 0.95 | Geometric |
| Min temp | 0.1 | — |
| Iterations/temp | 500 | — |
| Move types | Translate, Rotate 90°, Swap | Uniform |

### 5.3 Edition-Specific Efficiency Targets

| Edition | $\eta_{\text{nest}}$ Target | Offcut Catalog Size |
|---------|---------------------------|---------------------|
| RM-TS | 0.94 | 12 pieces |
| RM-TG | 0.91 | 18 pieces |
| RM-SS | 0.95 | 10 pieces |
| RM-SG | 0.92 | 15 pieces |
| RW-TS | 0.93 | 14 pieces |
| RW-TG | 0.89 | 20 pieces |
| RW-SS | 0.94 | 11 pieces |
| RW-SG | 0.90 | 17 pieces |

### 5.4 Offcut Utilization (Phoenix Protocol Integration)

$$\text{Recovery Rate} = \frac{\sum A_{\text{offcuts used}}}{\sum A_{\text{offcuts generated}}} \geq 0.85$$

---

## 6. 8-Edition Pattern Generation Pipeline (from DRAFT-01..05, SYNTH-01 §3.5, CSMFAB078 Main §5.5, CSMFAB078-A §3.4)

### 6.1 Pipeline Stages

```
Anthropometry Input (8 measurements)
         │
         ▼
Garsault Proportional Scaling (DRAFT-02) → 8 Base Body Meshes
         │
         ▼
Alcega Developable Surface Engine (DRAFT-01) → 8 × 24 Pattern Pieces
         │
         ▼
Pleating Kernel Application (DRAFT-03) → Watteau + Cartridge pleats
         │
         ▼
Hoop Architecture Integration (DRAFT-04) → Farthingale/Pannier patterns
         │
         ▼
Zero-Waste Nesting (DRAFT-05) → Cutting layouts (560mm width)
         │
         ▼
Output: DXF + SVG + Cutting instructions + Material kits
```

### 6.2 Pattern Piece Count per Edition

| Component | RM Pieces | RW Pieces |
|-----------|-----------|-----------|
| Bodice (front/back/side) | 6 | 6 |
| Sleeve (upper/lower/gusset) | 6 | 6 |
| Skirt panels (gored) | 8-12 | 10-14 |
| Watteau back | 2 | 2 |
| Cartridge pleat skirt | 4-6 | 6-8 |
| Farthingale/Pannier hoops | 4 | 4 |
| Stays/Corset panels | — | 8-12 |
| **Total** | **30-36** | **42-52** |

---

## 7. Traceability Matrix

| Section | Source Document | Section/Location | Key Values/Equations |
|---------|----------------|------------------|---------------------|
| 1.1 Convolute | DRAFT-01 | §3.1 | $\mathbf{r}(u,v) = \mathbf{c}(u) + v\mathbf{g}(u)$ |
| 1.2 Unfolding | DRAFT-01 | §3.2 | Geodesic parallel transport |
| 1.3 DXF/SVG | DRAFT-01 | §3.4 | Entity structure spec |
| 2.1 Anthro | DRAFT-02 | §3.1 | 8 measurements, LES zones |
| 2.2 Affine | DRAFT-02 | §3.2 | $\mathbf{S}_e$, $\mathbf{T}_e$ tables |
| 2.3 Grade rules | DRAFT-02 | §3.3 | Non-linear correction tensor |
| 3.1 Watteau | DRAFT-03 | §3.1 | 3:1 ratio, column action |
| 3.2 Cartridge | DRAFT-03 | §3.2 | S-curve, $\eta_{\text{cart}}$ |
| 3.3 Stitch map | DRAFT-03 | §3.4 | ISO 4915 ↔ historical table |
| 4.1 Hoop geom | DRAFT-04 | §3.1 | Elliptical $a(z), b(z)$ |
| 4.2 Catenary | DRAFT-04 | §3.2 | $T(z) = T_0 \cosh(wz/T_0)$ |
| 4.3 Deploy | DRAFT-04 | §3.3 | $U_{\text{spring}}$, $t<5s$ |
| 5.1 Nesting | DRAFT-05 | §3.1 | BL+NFP+SA algorithm |
| 5.2 SA params | DRAFT-05 | §3.2 | Cooling schedule table |
| 5.3 Efficiency | DRAFT-05 | §3.3 | Edition targets table |
| 5.4 Offcuts | DRAFT-05 | §4.3 | Recovery ≥0.85 |
| 6.1 Pipeline | SYNTH-01 | §3.5 | Stage diagram |
| 6.2 Piece count | DRAFT-01..05 | §4 | RM 30-36, RW 42-52 |

---

## 8. Standards Compliance Summary

| Standard | Application | Reference |
|----------|-------------|-----------|
| **CIETA** | Textile typology → grain direction constraints | Research Doc 1 §3 |
| **ISO 4915** | Stitch class mapping for pleats | DRAFT-03 §3.4 |
| **ASTM D1683** | Seam efficiency for pattern pieces | SYNTH-01 §4.1 |
| **ISO 13934** | Tensile for grain alignment validation | MAT-01 §3.2 |
| **ISO 13937** | Tear strength at notch points | DRAFT-01 §3.3 |

---

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