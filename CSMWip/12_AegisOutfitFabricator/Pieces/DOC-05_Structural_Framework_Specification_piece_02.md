```
√(J₂) + α·I₁ = k
α ≈ 0.1-0.2 for keratinous materials [TBD:RESEARCH]
I₁ = σ₁ + σ₂ + σ₃ (hydrostatic pressure)
J₂ = 1/6[(σ₁-σ₂)² + (σ₂-σ₃)² + (σ₃-σ₁)²] (deviatoric)
```

### 1.2 Euler Buckling Prevention in Stays

**Critical Load per Stay** (Research Doc 1 §5.1; MAT-02 §1.4):
```
P_cr = π²·E·I / L²

Stay cross-section: rectangular, width b = 7mm, thickness h = 2mm
I = b·h³/12 = 7×2³/12 = 4.67 mm⁴ = 4.67×10⁻¹² m⁴
Stay length: L = 150mm = 0.15m (typical)
E = 4×10⁹ Pa (hydrated baleen, mid-range)
End conditions: pinned-pinned (K=1) for laced stays

P_cr = π² × 4×10⁹ × 4.67×10⁻¹² / 0.15² ≈ 8.2 N per stay
```

**Stay Array Buckling Resistance** (MAT-02 §1.4):
```
Typical corset: 20-30 stays (10-15 per side)
Total buckling resistance: P_total = N_stays × P_cr
For 24 stays: P_total ≈ 24 × 8.2 N = 197 N
Safety factor vs. lacing tension (typical 150-200N): SF ≈ 1.0-1.3
→ Requires spiral steel reinforcement for SF > 2.0
```

### 1.3 Spiral Steel Boning Mechanics

**Material Properties** (Research Doc 1 §5.3; MAT-02 §3):
```
Spring steel 17-7 PH (precipitation hardening):
E = 200 GPa, σ_y = 1200-1500 MPa, ρ = 7.8 g/cm³
