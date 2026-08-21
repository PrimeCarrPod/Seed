## Piece 10: Koide Formula and the Renormalization Group Flow

From A2-07, the renormalization group flow of lepton masses is governed by the prime density β-function:

β(r) = \frac{d \log r}{d \log μ} = \frac{2}{(\log μ)^2}

where r(μ) = m(μ)/mₑ is the running mass ratio. The RG flow from the electron scale to the muon scale to the tau scale passes through the record gap transitions at p₂ = 7 and p₃ = 23.

The Koide formula is an RG invariant. Consider the running Koide parameter:

Q(μ) = \frac{m_e(μ) + m_μ(μ) + m_τ(μ)}{(\sqrt{m_e(μ)} + \sqrt{m_μ(μ)} + \sqrt{m_τ(μ)})^2}

At the electron mass scale μ = mₑ, we have mₑ(mₑ) = mₑ, m_μ(mₑ) = m_μ, m_τ(mₑ) = m_τ, giving Q = 2/3.

At the muon mass scale μ = m_μ, the running masses are:
- mₑ(m_μ) = mₑ · exp[∫_{mₑ}^{m_μ} β(r) d\log μ] ≈ mₑ · (m_μ/mₑ)^{β(m_μ)}
- m_μ(m_μ) = m_μ
- m_τ(m_μ) = m_τ · exp[-∫_{m_μ}^{m_τ} β(r) d\log μ]

The RG invariance of Q means Q(μ) = 2/3 for all μ. This is a consequence of the fact that the three charged lepton masses are the fixed points of the RG flow at the first three record gap transitions.

The RG equation for the mass ratios is:
\frac{d}{d\log μ} \left(\frac{m_i}{m_j}\right) = (β_i - β_j) \frac{m_i}{m_j}

At the record gap transitions, β_i = β_j for i,j = 1,2,3 because the record gaps have the same asymptotic density. Thus the mass ratios are constant at the fixed points, and Q is invariant.

The Koide formula is therefore a statement about the RG fixed point structure of the Prime Electron model: the three charged leptons are the only stable fixed points of the RG flow in the prime gap density, and their mass ratio satisfies Q = 2/3 exactly.