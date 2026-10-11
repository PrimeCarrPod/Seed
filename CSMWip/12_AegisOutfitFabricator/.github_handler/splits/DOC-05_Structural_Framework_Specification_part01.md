- $\nu_{TR} = 0.40$, $\nu_{RT} = 0.27$
- $\nu_{LR} = 0.38$, $\nu_{RL} = 0.10$
- $G_{LT} = 0.65\text{ GPa}$, $G_{LR} = 0.45\text{ GPa}$, $G_{TR} = 0.35\text{ GPa}$
- Density: $\rho = 1.35\text{ g/cm}^3$
- Moisture content: 12-15% (equilibrium at 65% RH, 20°C)

### 1.2 Euler Buckling Analysis for Baleen Stays

**Critical Buckling Load (Pinned-Pinned):**

$$P_{\text{cr}} = \frac{\pi^2 E_L I_{\text{min}}}{L^2} \quad \text{where } I_{\text{min}} = \frac{\pi}{64}(D_o^4 - D_i^4)$$

**Baleen Stay Geometry (per edition):**
- Outer diameter: $D_o = 8\text{ mm}$ (tapered to 5 mm at tips)
- Inner diameter: $D_i = 4\text{ mm}$ (central canal)
- Length: $L = 350\text{ mm}$ (RM), $L = 320\text{ mm}$ (RW)
- $I_{\text{min}} = 1.55 \times 10^{-10}\text{ m}^4$

**Critical Load:**
$$P_{\text{cr}} = \frac{\pi^2 \cdot 4.5\times10^9 \cdot 1.55\times10^{-10}}{(0.35)^2} = 5.8\text{ kN}$$

**Safety Factor (vs. LES Z4 tension 60-80N × 12 stays):**
$$\text{SF} = \frac{P_{\text{cr}}}{12 \cdot T_{\text{max}}} = \frac{5800}{12 \cdot 80} = 6.0 \quad \text{✓ Adequate}$$

### 1.3 Viscoelastic Relaxation (Prony Series)

**Time-Dependent Modulus:**

$$E(t) = E_\infty + \sum_{i=1}^{3} E_i \exp(-t/\tau_i)$$

