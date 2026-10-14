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
