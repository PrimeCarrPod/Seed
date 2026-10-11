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

