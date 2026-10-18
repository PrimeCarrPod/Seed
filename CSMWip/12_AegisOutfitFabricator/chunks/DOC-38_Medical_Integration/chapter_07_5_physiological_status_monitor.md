## 5. Physiological Status Monitoring (PSM)

### 5.1 Health Index — Composite Score

Per **NATO STANAG 2084** and **DOC-30 AI**, PSM computes **Real-Time Health Index (RTHI)**:

$$
RTHI(t) = \sum_{i=1}^N w_i \cdot f_i(x_i(t))
$$

Where $x_i$ = normalized vital sign, $f_i$ = piecewise linear mapping to [0,1], $w_i$ = weights:

| Parameter | Weight $w_i$ | $f_i$ Shape |
|-----------|--------------|-------------|
| HR | 0.20 | Gaussian around 70 bpm |
| HRV (SDNN) | 0.15 | Linear: 20→0 ms maps 1→0 |
| SpO₂ | 0.20 | Linear: 95→85% maps 1→0 |
| Tc | 0.15 | Linear: 37→39°C maps 1→0 |
| Lactate | 0.10 | Linear: 1→6 mmol/L maps 1→0 |
| Hydration | 0.10 | Linear: 65→50% maps 1→0 |
| Cognitive (TLX) | 0.10 | Linear: 30→70 maps 1→0 |

**RTHI Thresholds**:

$$
\text{Status} = \begin{cases}
\text{GREEN} & RTHI \geq 0.85 \\
\text{YELLOW} & 0.65 \leq RTHI < 0.85 \\
\text{RED} & 0.40 \leq RTHI < 0.65 \\
\text{BLACK} & RTHI < 0.40
\end{cases}
$$

### 5.2 Evacuation Triggers

**Automated MEDEVAC Request** (DOC-29 comms) when:

$$
\text{MEDEVAC} = \mathbb{I}(RTHI < 0.40) \lor \mathbb{I}(\text{T1 Triage}) \lor \mathbb{I}(\text{BLACK status} > 15 \text{ min})
$$

**MEDEVAC Priority** (per NATO STANAG 2084):
- **Priority 1 (Urgent)**: T1, RTHI < 0.40, within 1 hr
- **Priority 2 (Priority)**: T2, RTHI 0.40–0.65, within 4 hr
- **Priority 3 (Routine)**: T3, RTHI > 0.65, within 24 hr

### 5.3 Medical Log — Immutable Record

Per **HIPAA** and **DOC-30 blockchain ledger**:

$$
\text{Log Entry} = \{ t, \mathbf{v}(t), \text{RTHI}(t), \text{Interventions}, \text{AI Triage}, \text{Location}, \text{Hash}_{prev} \}
$$

**Hash Chain**: $H_n = \text{SHA256}(H_{n-1} \| \text{Entry}_n)$ — tamper-evident.

---
