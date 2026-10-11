
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

