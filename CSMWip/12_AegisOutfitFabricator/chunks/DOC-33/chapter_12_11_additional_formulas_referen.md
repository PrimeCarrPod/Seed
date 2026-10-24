## 11. Additional Formulas Reference

**Assembly Time Budget:**
```
$t_{\text{assembly}} = \sum_{i=1}^{N} t_i \le 30 \text{ min}$
```

**Morphology Transition:**
```
$t_{\text{trans}} = \sum_{z=1}^{12} \frac{L_z}{v_{\text{actuator}}} < 90 \text{ s}$
```

**LES Zone Tensions:**
```
$T_z \in [T_{\min,z}, T_{\max,z}]$  per edition table
```

**Assembly Torque:**
```
$T = K \cdot D \cdot F_{\text{preload}}$  with $K=0.2$, $D=8$mm
```

**Firmware Integrity:**
```
$H = \text{SHA-256}(\text{firmware} || \text{config})$
```

**BIT False Alarm Rate:**
```
$\lambda_{\text{false}} \le 10^{-6} \text{ hr}^{-1}$  (critical)
```

**Profile Switch Time:**
```
$t_{\text{switch}} = \max_z |T_{z,\text{new}} - T_{z,\text{old}}| / \dot{T} < 30 \text{ s}$
```

**Shock Response:**
```
$SRS(f) = \max \left| \frac{1}{2\pi f} \int a(t) e^{-2\pi f t} dt \right|$
```

**Vibration Fatigue:**
```
$D = \sum n_i/N_i \le 1.0$
```

**Isolator Natural Frequency:**
```
$\omega_n = \sqrt{k/m}$  target 8-12 Hz
```

**Container Heat Transfer:**
```
$Q = U \cdot A \cdot \Delta T$
```

**Dehumidification Capacity:**
```
$\dot{m}_{\text{water}} = \frac{\dot{V} \cdot \rho_{\text{air}} \cdot (\omega_{\text{in}} - \omega_{\text{out}})}{3600}$
```

**Transmissibility:**
```
$T(\omega) = \frac{1}{\sqrt{(1-(\omega/\omega_n)^2)^2 + (2\zeta\omega/\omega_n)^2}}$
```

**Natural Frequency:**
```
$\omega_n = \sqrt{\frac{k}{m}}$  target 8-12 Hz
```

**Static Deflection:**
```
$\delta_{\text{static}} = \frac{mg}{k} = 25 \text{ mm}$
```

**Tile Retention Force:**
```
$F_{\text{mag}} = \frac{B^2 A}{2\mu_0}$  (NdFeB N52)
```

**Thermal Expansion Gap:**
```
$\Delta L = L \cdot \alpha \cdot \Delta T = 5 \text{ mm}$
```

**Activation Probability:**
```
$P_{\text{success}} = \prod_{i=1}^{N} (1 - p_{\text{fail},i})$
```

**Boot Time (Weibull):**
```
$T_{\text{boot}} \sim \text{Weibull}(k, \lambda)$  with $k=2$, $\lambda=45$s
```

**Firmware Integrity:**
```
$H = \text{SHA-256}(\text{firmware} || \text{config})$
```

**Sequential Activation Time:**
```
$t_{\text{total}} = \sum_{i=1}^{12} t_i + \sum_{i=1}^{11} t_{\text{delay},i}$
```

**Power-Up Inrush Current:**
```
$I_{\text{inrush}} = \frac{C \cdot dV/dt}{N_{\text{stagger}}}$  (staggered start)
```

**BIT Coverage:**
```
$C_{\text{BIT}} = \frac{N_{\text{tested}}}{N_{\text{total}}} \times 100\% \ge 95\%$
```

**Fault Detection Probability:**
```
$P_{\text{detect}} = 1 - \exp(-\lambda t) \ge 0.999$  (critical faults)
```

**False Alarm Rate:**
```
$\lambda_{\text{false}} = \frac{N_{\text{false}}}{T_{\text{operational}}} \le 10^{-6} \text{ hr}^{-1}$
```

**MTBFA:**
```
$MTBFA = 1/\lambda_{\text{false}} \ge 10^6 \text{ hours}$
```

**Profile Switch Time:**
```
$t_{\text{switch}} = \max_z |T_{z,\text{new}} - T_{z,\text{old}}| / \dot{T}_{\text{actuator}}$
```

**Encryption Overhead:**
```
$\eta_{\text{enc}} = \frac{t_{\text{AES}}}{t_{\text{data}}} < 1\%$  (hardware accelerated)
```

**Periodic Comm Check:**
```
$t_{\text{comm}} = 15 \text{ min} \pm 10\%$  (jitter tolerance)
```
