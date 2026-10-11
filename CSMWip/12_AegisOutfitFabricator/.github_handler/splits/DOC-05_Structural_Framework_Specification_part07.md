**Equation of Motion:**

$$m_{\text{eff}} \ddot{x} + c \dot{x} + k x = F_{\text{spring}}(t) - F_{\text{friction}}$$

Target: $t_{\text{deploy}} < 5\text{ s}$, overshoot $< 10\%$.

**Damping Ratio:** $\zeta = 0.7$ (critical damping for smooth deployment).

### 4.3 Locking Mechanisms

**Friction Catch (Historical: Hook-and-Eye):**

$$F_{\text{hold}} = \mu_s N \geq 1.5 \cdot F_{\text{deploy}}$$

$\mu_s = 0.4$ (steel-on-steel), $N = 200\text{ N}$ (preload).

**Magnetic Latch (Modern: Ti₃AlC₂ Cleats):**

$$F_{\text{mag}} = \frac{B^2 A}{2\mu_0} \quad B = 0.8\text{ T}, \quad A = 25\text{ mm}^2 \Rightarrow F_{\text{mag}} = 64\text{ N}$$

---

## 5. Ceramic Tile Chassis Integration (from MAT-03 §3.1, CSMFAB078 Main §4.2)

### 5.1 Magnetic Edge Alignment

**Halbach Array Configuration (Per Tile):**

$$\mathbf{B}(x,y,z) = B_0 \exp(-z/\lambda) [\cos(2\pi x/\Lambda), \sin(2\pi x/\Lambda), 0]$$

