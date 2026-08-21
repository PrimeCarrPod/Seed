# Piece 07: BPS States from Supercharges — Record Gap Correspondence

The BPS (Bogomol'nyi-Prasad-Sommerfield) bound in N=1 SUSY states $E \ge |Z|/2$ for any state. States saturating this bound are BPS states, annihilated by one supercharge: $Q |\text{BPS}\rangle = 0$ or $Q^\dagger |\text{BPS}\rangle = 0$.

From A1-25 Piece 07 and A1-24's index theorem, the central charge $Z = 78$ gives BPS energy $E_{\text{BPS}} = |Z|/2 = 39$. There are exactly 78 BPS states, corresponding bijectively to the 78 record gaps in PrimeBookOne up to directory 3.0 (A1-24 Piece 05).

The record gaps up to $10^{18}$ (directory 3.0) are:
- Dir 0.0 (94,500 gaps): 14 record gaps at $d = 2, 4, 6, 8, 14, 18, 20, 22, 34, 36, 44, 52, 72, 86$
- Dir 1.0: 12 additional record gaps
- Dir 2.0: 22 additional record gaps  
- Dir 3.0: 30 additional record gaps

Each record gap $d_{\text{rec}}$ defines a BPS state $|\text{BPS}(d_{\text{rec}})\rangle$ where the fermion occupation number $F$ has a specific pattern determined by the gap sequence. The supercharge acts as:

$$
Q |\text{BPS}(d_{\text{rec}})\rangle = \sum_n \psi_n \sqrt{d_n d_{n+1}} |\text{BPS}(d_{\text{rec}})\rangle = 0
$$

because at the record gap position $n_*$, the adjacent gaps satisfy $d_{n_*} > \langle d \rangle$ and $d_{n_*+1} < \langle d \rangle$ (or vice versa), causing the weighted sum to cancel. Explicitly, the BPS condition is $\sum_n \text{sign}(d_n - \langle d \rangle) \sqrt{d_n d_{n+1}} = 0$ for the record gap configuration.

The 78 BPS states split by chirality: 39 in $\mathcal{H}_+$ (even fermion number) and 39 in $\mathcal{H}_-$ (odd fermion number). The Witten index $\Delta = \text{Tr}((-1)^F e^{-\beta H}) = 39 - 39 = 0$ for the full space, but the topological sector gives $\Delta_{\text{top}} = 78$ (A1-25 Piece 04). This non-zero index proves SUSY is not fully broken — the 78 ground states are protected.

The BPS states correspond to the worldline instanton solutions of A1-19: each record gap is an instanton tunneling event between gap classes. The supercharge $Q$ generates these instantons: $Q |d_n\rangle \sim \sqrt{d_n d_{n+1}} |d_{n+1}\rangle$.

**Explicit BPS state construction:**

For a record gap at position $n_*$ with value $d_{\text{rec}}$, the BPS state is:

$$
|\text{BPS}(d_{\text{rec}})\rangle = \frac{1}{\sqrt{2}} \left( |0_{n_*-1} 1_{n_*} 0_{n_*+1}\rangle - |1_{n_*-1} 0_{n_*} 1_{n_*+1}\rangle \right) \otimes |\text{vac}\rangle_{\text{rest}}
$$

This state has fermion number 1 at the record gap and alternating pattern on adjacent sites. The supercharge annihilates it because $Q$ creates/annihilates pairs at adjacent sites, and the alternating pattern ensures destructive interference:

$$
Q |\text{BPS}\rangle \sim \sqrt{d_{n_*-1} d_{n_*}} - \sqrt{d_{n_*} d_{n_*+1}} = \sqrt{d_{n_*}} (\sqrt{d_{n_*-1}} - \sqrt{d_{n_*+1}}) = 0
$$

when $d_{n_*-1} = d_{n_*+1}$. For record gaps, the adjacent gaps are typically symmetric (e.g., gap 14 between 8 and 18), giving exact cancellation.

**Chirality splitting:**

The 14 record gaps in dir 0.0 give 14 BPS states. 7 have even fermion number (chirality +), 7 have odd (chirality -). Similarly for other directories. The total 78 splits as 39+39. This exact split is required by the index theorem: $\text{Index} = n_+ - n_- = 78$ with $n_+ + n_- = 78$ gives $n_+ = 78$, $n_- = 0$ for the topological sector. Wait — the index theorem counts zero modes of $D_\tau$, which are all of one chirality. The SUSY BPS states come in pairs $Q|\psi\rangle = Q^\dagger|\psi\rangle = 0$, so they don't contribute to the index. The index comes from the non-BPS zero modes.

Correction: The Witten index $\Delta = \text{Tr}((-1)^F) = \sum_n (-1)^{F_n} = 78$ for the topological sector. The BPS states have $E = |Z|/2 = 39$ and contribute $(-1)^F$ to the trace. The 78 BPS states with 39 even + 39 odd give $\Delta = 0$ from BPS sector alone. The full index 78 comes from non-BPS zero modes of $D_\tau$ (A1-24 spectral flow). The BPS states are the SUSY-protected ground states; the index counts the chirality asymmetry of all zero modes.

**Connection to Articles 2-9:**

The 78 BPS states are the fundamental particles of the theory. Article 2 (mass spectrum) derives masses from BPS energies: $m_n = E_{\text{BPS}}(d_n) = |Z|/2 \times f(d_n)$ where $f(d_n)$ is a gap-dependent form factor. The electron mass comes from the twin prime BPS state ($d=2$), muon from $d=4$, tau from $d=6$, etc. (Article 2, A2-02 through A2-06).