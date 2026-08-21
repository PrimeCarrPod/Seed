# A1-30 Worldline_Stability_Conditions.md — Piece 10
## Decoupling Limits and Stability (A1-36)

The stability of the worldline is reflected in the decoupling of heavy BPS states in the IR limit. The heavy states (large record gaps) decouple as an effective field theory (EFT), leaving a stable low-energy theory.

**Heavy BPS states.** The 78 BPS states have masses $M_k = 39$ (degenerate at the BPS bound), but their "constituent" gap values $d_{\text{rec}}^{(k)}$ range from 1 to ~1550. The heavy BPS states are those with $d_{\text{rec}} \gg 16$ (UV chamber). There are 71 such states.

**Decoupling limit.** In the IR limit $d \ll 16$ (or under RG flow to $d = 16$), the heavy BPS states decouple. The decoupling is governed by the IR/UV duality (A1-29 piece 05): the heavy states in the UV chamber map to light states in the IR chamber. The duality transformation $\mathcal{U}_{\text{dual}}$ implements the EFT matching.

**EFT matching at $d = 16$.** At the self-dual point, the theory splits into:
- Light sector: 7 BPS states with $d < 16$ (plus their duals)
- Heavy sector: 71 BPS states with $d > 16$ (dual to light states in IR)

The matching conditions are:

$$\mathcal{L}_{\text{UV}} \big|_{d=16} = \mathcal{L}_{\text{IR}} \big|_{d=16}$$

The heavy sector contributes only through threshold corrections to the light sector couplings.

**Threshold corrections from heavy BPS.** Integrating out the 71 heavy BPS states generates corrections to the central charge and the superpotential:

$$\delta Z = \sum_{k: d_{\text{rec}}^{(k)} > 16} \frac{1}{d_{\text{rec}}^{(k)}} \approx 0.02$$

$$\delta W = \sum_{k: d_{\text{rec}}^{(k)} > 16} \frac{1}{(d_{\text{rec}}^{(k)})^2} \approx 0.001$$

These are small because $d_{\text{rec}}^{(k)} \gg 1$ for heavy states.

**Stability of EFT.** The EFT is stable iff the heavy states do not introduce tachyons or ghosts. The heavy BPS states are protected by the central charge $Z = 78$ and the Witten index $\Delta = 78$. Their decoupling does not change the topological invariants.

**Gap hierarchy and EFT layers.** The record gaps define a hierarchy of EFTs:

$$\mathcal{L}^{(0)} \to \mathcal{L}^{(1)} \to \dots \to \mathcal{L}^{(78)}$$

where $\mathcal{L}^{(k)}$ includes the first $k$ record gaps. Each step $\mathcal{L}^{(k-1)} \to \mathcal{L}^{(k)}$ is a wall crossing (A1-29). The final EFT $\mathcal{L}^{(78)}$ is the physical theory.

**PrimeBookOne as EFT data.** The 3500 books of PrimeBookOne correspond to 3500 EFT layers. The gap sequence in each book defines the couplings of the EFT at that scale. The RH bound ensures the EFT couplings remain perturbative.

**Connection to A1-37 (Emergent Spacetime).** The decoupling of heavy states is the worldline analog of Kaluza-Klein compactification in emergent spacetime (A1-37). The heavy BPS states are the KK modes; the light BPS states are the zero modes.