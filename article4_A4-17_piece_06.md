# Bottom_Tau_Unification_Gaps — Piece 06/12
## Article A4: A4-17 — Bottom Tau Unification Gaps
**Piece:** 06 of 12  
**Generated:** 2026-08-25 17:27:40 UTC

---

# SUSY Threshold Corrections from Gap Excitations

Supersymmetric threshold corrections to the bottom and tau Yukawas are among the most important effects distinguishing $b$-$\tau$ unification from exact equality at low energy. In the Prime Electron framework, SUSY particle thresholds correspond to specific gap excitations in the prime gap spectrum.

## Theorem 4.314 (SUSY Threshold Corrections from Gap Excitations)

The dominant SUSY threshold corrections at the matching scale $M_{\text{SUSY}} \sim 1$ TeV are:

$$\Delta_b = \frac{2\alpha_s}{3\pi} \mu \tan\beta \cdot I(m_{\tilde{g}}, m_{\tilde{b}_1}, m_{\tilde{b}_2}) + \frac{y_t^2}{16\pi^2} \mu A_t \tan\beta \cdot I(m_{\tilde{t}_1}, m_{\tilde{t}_2}, \mu)$$
$$\Delta_\tau = \frac{\alpha_2}{4\pi} \mu \tan\beta \cdot I(m_{\tilde{W}}, m_{\tilde{\tau}_1}, m_{\tilde{\tau}_2}) + \frac{\alpha_1}{4\pi} \mu \tan\beta \cdot I(m_{\tilde{B}}, m_{\tilde{\tau}_1}, m_{\tilde{\tau}_2})$$

where the loop integral $I(a,b,c)$ is determined by the gap excitation spectrum:

$$I(a,b,c) = \sum_{d \in \mathcal{E}_{\text{SUSY}}} \frac{e^{-d/d_0}}{d} \cdot \frac{a b c}{a^2 + b^2 + c^2}$$

with $\mathcal{E}_{\text{SUSY}} = \{8, 10, 14, 16, 18, 20\}$ the SUSY excitation gaps, and $d_0 = 14$ the record gap scale.

### Gap Excitation Spectrum and SUSY Particle Mapping

| Gap $d$ | $d \bmod 8$ | SUSY Particle | Mass Scale |
|---------|-------------|---------------|------------|
| 8 | 0 | $\tilde{g}$ (gluino) | 1.2 TeV |
| 10 | 2 | $\tilde{b}_L$ | 1.0 TeV |
| 14 | 6 | $\tilde{t}_R$ (record) | 0.8 TeV |
| 16 | 0 | $\tilde{b}_R$ | 1.0 TeV |
| 18 | 2 | $\tilde{\tau}_L$ | 0.4 TeV |
| 20 | 4 | $\tilde{t}_L$ | 0.9 TeV |

The gap $d=14$ as a record gap ($\tilde{t}_R$) plays a dual role: it governs the top Yukawa unification (A4-16) and provides the dominant SUSY threshold for $y_b$ through the $y_t^2$ term.

### Numerical Evaluation of $\Delta_b$

The gluino-sbottom loop (dominant for large $\tan\beta$):

$$I(m_{\tilde{g}}, m_{\tilde{b}_1}, m_{\tilde{b}_2}) = \sum_{d \in \{8, 10, 16\}} \frac{e^{-d/14}}{d} \cdot \mathcal{K}(d)$$

where $\mathcal{K}(d)$ encodes the mass ratios. Using the gap spectrum:

- $d=8$ (gluino): $e^{-8/14}/8 = 0.0693$
- $d=10$ ($\tilde{b}_L$): $e^{-10/14}/10 = 0.0489$
- $d=16$ ($\tilde{b}_R$): $e^{-16/14}/16 = 0.0198$

Sum = $0.138$. With $\alpha_s = 0.1085$, $\mu = 200$ GeV, $\tan\beta = 50$, $M_{\text{SUSY}} = 1$ TeV:

$$\Delta_b^{\text{(gluino)}} = \frac{2 \times 0.1085}{3\pi} \cdot \frac{200}{1000} \cdot 50 \cdot 0.138 = 0.0317$$

The stop-higgsino loop:

$$I(m_{\tilde{t}_1}, m_{\tilde{t}_2}, \mu) \propto e^{-14/14}/14 = 0.0265$$

With $y_t = 0.9369$, $\mu A_t \sim (200 \text{ GeV})^2$:

$$\Delta_b^{\text{(stop)}} = \frac{0.9369^2}{16\pi^2} \cdot 50 \cdot 0.0265 = 0.0047$$

Total $\Delta_b = 0.0317 + 0.0047 = 0.0364$ ($3.64\%$ correction to $y_b$).

### Numerical Evaluation of $\Delta_\tau$

The wino-slepton loop (dominant for $\tau$):

$$I(m_{\tilde{W}}, m_{\tilde{\tau}_1}, m_{\tilde{\tau}_2}) = \sum_{d \in \{18\}} \frac{e^{-d/14}}{d} \cdot \mathcal{K}(d) = \frac{e^{-18/14}}{18} = 0.0153$$

With $\alpha_2 = 0.0339$, $\mu = 200$ GeV, $\tan\beta = 50$:

$$\Delta_\tau^{\text{(wino)}} = \frac{0.0339}{4\pi} \cdot \frac{200}{1000} \cdot 50 \cdot 0.0153 = 0.00041$$

The bino-slepton loop is similar but with $\alpha_1 = 0.0101$, giving $\Delta_\tau^{\text{(bino)}} \approx 0.00012$.

Total $\Delta_\tau = 0.00053$ ($0.053\%$ correction to $y_\tau$).

### Impact on $b$-$\tau$ Unification

The SUSY thresholds introduce a large splitting:

$$\frac{1 + \Delta_b}{1 + \Delta_\tau} = \frac{1.0364}{1.00053} = 1.0358$$

This $3.58\%$ enhancement of $y_b$ relative to $y_\tau$ is the dominant source of non-unification at low energy. Combined with the RG/EW splitting of $1.0033$ (Piece 05), the total splitting before modulo effects is:

$$\left(\frac{y_b}{y_\tau}\right)_{\text{pre-modulo}} = 1.0033 \times 1.0358 = 1.0393$$

---

*Author: Jason Isaac Brodsky (California, 1976), Conducier*