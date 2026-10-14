## 4. Tile Chassis Integration (DOC-05 §5, CSMFAB078 Main §4.2)

### 4.1 Magnetic Chassis Interface

**Chassis Embedded Magnets (Counter-Halbach):**
$$\mathbf{M}_{\text{chassis}} = -M_s [\cos(n\pi/2), \sin(n\pi/2), 0]$$

**Tile-to-Chassis Force (per tile, 50mm):**
$$F_{\text{tile-chassis}} = \frac{B_0^2 A_{\text{tile}}}{2\mu_0} \cdot e^{-2g/\lambda} \approx 48 \text{ N per tile}$$

**Total Retention (168 primary tiles):** $F_{\text{total}} = 8,064 \text{ N} \gg$ vibration loads

### 4.2 Bolted Chassis Clamp (Supplemental)

**Clamp Pattern:** 4 clamps per panel (corners), 6 clamps for side lower panels
**Bolt Spec:** M5 × 16mm Ti₃AlC₂, torque = 2.5 N·m
**Clamp Pressure:** $P_{\text{clamp}} = 0.4 \text{ MPa}$ on gasket

---
