# A1-39 Worldline_Information_Preservation.md — Piece 06
## Hayden-Preskill Decoding from Gap Ratios

The Hayden-Preskill protocol (information thrown into a black hole is recoverable from radiation after Page time) is realized by the worldline QEC structure.

**Hayden-Preskill setup.** Information is encoded in a reference system $R$ and thrown into the "black hole" (heavy sector, $d > 16$). After Page time $t_P$, the information is recoverable from the "radiation" (light sector, $d < 16$).

**QEC as Hayden-Preskill.** The holographic QEC code (A1-35, A1-38) implements the Hayden-Preskill decoder. The encoding map is:
$$\mathcal{E} : \mathcal{H}_R \otimes \mathcal{H}_{\text{BH}} \to \mathcal{H}_{\text{light}} \otimes \mathcal{H}_{\text{heavy}}$$
The Petz recovery map $\mathcal{R}_{\text{Petz}}$ (A1-35, A1-37) decodes the information from $\mathcal{H}_{\text{light}}$.

**Gap ratio as decoding key.** The decoding fidelity depends on the gap ratio distribution. For a gap $d$ in the heavy sector, the information is recoverable from light gaps $d' < 16$ with fidelity:
$$\mathcal{F}(d) = \exp\left(-S(\rho_{\text{light}} || \sigma_{\text{light}})\right)$$
where $S(\rho_{\text{light}} || \sigma_{\text{light}})$ is the relative entropy between the light sector states (A1-34). Small gap ratios $\to$ high fidelity.

**Page time = decoding threshold.** Before Page time ($t < t_P$), $\mathcal{F} \approx 0$. After Page time ($t > t_P$), $\mathcal{F} \to 1$. The threshold is the self-dual scale $d=16$.

**BPS information: always recoverable.** Information in the BPS sector (record gaps $> 16$) is recoverable at all times, even before Page time, because $S(\rho_{\text{BPS}}||\sigma_{\text{BPS}}) = 0$.

**Decoding time.** The decoding time from the light sector is:
$$t_{\text{decode}} \sim \frac{1}{2\pi} \log \dim \mathcal{H}_{\text{light}} \sim \frac{1}{2\pi} \log\left(\prod_{d<16} m_d\right)$$
This is the light sector Page time.

**Twin prime decoding.** The twin prime code (A1-35) provides an explicit decoding algorithm. The logical qubits encoded in twin prime pairs are decoded via the gap ratio pattern $r=1$.

**PrimeBookOne decoding data.** The 3500×3500 syndrome matrix gives the decoding fidelity at each book scale.

(End of file - 33 lines)