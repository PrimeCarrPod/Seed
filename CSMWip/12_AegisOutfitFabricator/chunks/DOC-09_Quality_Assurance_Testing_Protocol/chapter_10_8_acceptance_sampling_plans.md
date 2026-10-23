## 8. Acceptance Sampling Plans

### 8.1 Lot Definition

```
Lot = Same material batch + same production shift + same edition
Maximum lot size: 50 garments
Lot identification: Serial number range + lot number
```

**Key Formulas:**
- Lot size: $N_{lot} \leq 50 \text{ garments}$
- Lot definition: $L = (B_{mat}, S_{shift}, E_{edition})$

### 8.2 Sampling (ISO 2859-1)

```
Critical characteristics (ballistic, EMI, thermal):
  Inspection level: S-4 (100% for critical)
  AQL: 0.0%
  Switching rules: Normal → Tightened → Reduced

Major characteristics (structural, dimensional):
  Inspection level: II (normal)
  AQL: 0.65%
  Sample size: Per ISO 2859-1 Table 1

Minor characteristics (cosmetic):
  Inspection level: I (reduced)
  AQL: 1.5%
```

**Key Formulas:**
- Critical AQL: $AQL_{critical} = 0.0\%$
- Major AQL: $AQL_{major} = 0.65\%$
- Minor AQL: $AQL_{minor} = 1.5\%$
- Sample size: $n = f(N_{lot}, \text{inspection level})$ per ISO 2859-1 Table 1
- Acceptance number: $c = 0 \quad (\text{for AQL } = 0.0\%)$
- Operating characteristic: $P_a(p) = \sum_{d=0}^{c} \binom{n}{d} p^d (1-p)^{n-d}$
- Average outgoing quality: $AOQ = p \times P_a(p) \times \frac{N-n}{N}$
