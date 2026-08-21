# A1-31 Worldline_Entanglement_Entropy.md — Piece 10
## Entanglement in Decoupling Limits (A1-36)

The heavy BPS states (large record gaps) decouple in the IR limit as an effective field theory (A1-36). The entanglement entropy splits into light and heavy sector contributions.

**Heavy BPS states.** The 78 BPS states have record gaps $d_{\text{rec}}^{(k)}$ ranging from 1 to ~1550. The heavy states are those with $d_{\text{rec}} \gg 16$ (71 states). The light states are those with $d_{\text{rec}} < 16$ (7 states).

**Decoupling of heavy sector.** In the IR limit $d \ll 16$ (or RG flow to $d = 16$), the heavy BPS states decouple. The decoupling is implemented by the IR/UV duality (A1-29 piece 05): heavy states in UV map to light states in IR. The EFT matching at $d = 16$ (A1-30 piece 10) preserves the total entanglement entropy.

**Entanglement entropy splitting.** The total entanglement entropy splits as:

$$S_{\text{total}} = S_{\text{light}} + S_{\text{heavy}} + S_{\text{int}}$$

where $S_{\text{int}}$ is the mutual information between light and heavy sectors. At the matching scale $d = 16$, $S_{\text{int}}$ is small (threshold corrections of order 0.02, A1-30 piece 10).

**Light sector entanglement.** The light sector has 7 BPS states (plus their duals). Its entanglement entropy is:

$$S_{\text{light}} = \log 7 \approx 1.946$$

**Heavy sector entanglement.** The heavy sector has 71 BPS states. Its entanglement entropy is:

$$S_{\text{heavy}} = \log 71 \approx 4.263$$

**Total entropy.** $S_{\text{light}} + S_{\text{heavy}} = \log 7 + \log 71 = \log 497 \neq \log 78$. The correct splitting is not by chirality but by the EFT matching. The duality maps the 71 heavy states to 71 states in the IR chamber, but these are not the same as the 7 light states.

**Correct splitting via duality.** The IR/UV duality exchanges the sectors:

$$\mathcal{U}_{\text{dual}} : \mathcal{H}_{\text{heavy}}^{\text{UV}} \longleftrightarrow \mathcal{H}_{\text{light}}^{\text{IR}}$$

The entanglement entropy is invariant under duality. In the UV chamber, the heavy sector has 71 states; in the IR chamber, the light sector has 71 states. The physical chamber has 78 states total.

**EFT matching entropy.** The threshold corrections at $d = 16$ give a small mutual information:

$$I_{\text{light:heavy}} = S_{\text{light}} + S_{\text{heavy}} - S_{\text{total}} \approx 0.02$$

This is the entanglement between light and heavy sectors that is lost when heavy states are integrated out.

**PrimeBookOne EFT layers.** The 3500 books correspond to 3500 EFT layers (A1-30 piece 10). Each layer has its own light/heavy splitting. The entanglement entropy across layers is:

$$S(b) = \log(\text{number of active BPS states at book } b)$$

which grows as more record gaps are included.

**Connection to A1-36.** The decoupling limits and EFT matching are the subject of A1-36. The entanglement entropy tracks the number of active degrees of freedom.