# A1-38 Worldline_Holography.md — Piece 06
## Bulk Reconstruction and HKLL Map from Gaps

The HKLL (Hamilton-Kabat-Lifschytz-Lowe) bulk reconstruction map is realized through the gap ratio statistics and the Petz recovery map.

**HKLL map from gaps.** A bulk field $\phi(z,t)$ at radial position $z = d/16$ is reconstructed from boundary operators as:
$$\phi_{\text{bulk}}(z,t) = \int dt' \, K_d(t-t') \mathcal{O}_d(t')$$
where $\mathcal{O}_d$ is the boundary operator of dimension $\Delta = d/16$, and the smearing kernel is:
$$K_d(t) = \frac{1}{2\pi} \int d\omega \, e^{-i\omega t} \frac{\Gamma(\frac{d}{32} + i\frac{\omega}{2\pi})}{\Gamma(\frac{d}{32} - i\frac{\omega}{2\pi})}$$
This is the AdS$_2$ HKLL kernel adapted to the gap spectrum.

**Gap ratio as reconstruction data.** The smearing kernel depends on the gap ratio distribution. For adjacent gaps $d, d'$, the reconstruction fidelity is:
$$\mathcal{F}(d,d') = \exp\left(-S(\rho_d || \rho_{d'})\right)$$
where $S(\rho_d || \rho_{d'})$ is the relative entropy between gap sectors (A1-34). High fidelity when gap ratios are close to 1.

**Entanglement wedge reconstruction.** The bulk operator at $z$ is reconstructible from boundary subregion $A$ iff $z \in \mathcal{E}_A$ (A1-37). The reconstruction map is the Petz recovery map:
$$\mathcal{R}_A(\cdot) = \rho_A^{1/2} \mathcal{E}^\dagger(\mathcal{E}(\rho_A)^{-1/2} \cdot \mathcal{E}(\rho_A)^{-1/2}) \rho_A^{1/2}$$
where $\mathcal{E}$ is the encoding map from bulk to boundary.

**Reconstruction fidelity.** The fidelity of reconstructing $\phi(z)$ from $A$ is:
$$\mathcal{F}(z, A) = \exp\left(-S(\rho_A(z) || \sigma_A(z))\right)$$
where $S(\rho_A(z) || \sigma_A(z))$ is the boundary relative entropy for the bulk operator at $z$. For $z \in \mathcal{E}_A$, $S=0$ and $\mathcal{F}=1$.

**BPS bulk operators.** The BPS bulk operators (record gaps $> 16$) have $\mathcal{F}=1$ for any $A$ containing the heavy sector. They are perfectly reconstructible topological operators.

**Twin prime bulk operators.** The twin prime bulk operators ($d=2$, $z=1/8$) require the full boundary for exact reconstruction. Their fidelity from a subregion $A$ is:
$$\mathcal{F}(z=1/8, A) \sim \exp\left(-\frac{|A^c|}{|A|}\right)$$
where $|A|$ is the number of books in $A$.

**PrimeBookOne HKLL data.** The 3500 books give the smearing kernels $K_d^{(b)}$ at each scale. The reconstruction fidelity matrix is the 3500×3500 syndrome matrix (A1-35).

(End of file - 33 lines)