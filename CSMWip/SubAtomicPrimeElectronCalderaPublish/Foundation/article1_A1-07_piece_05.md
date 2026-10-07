## 6. Proper Time Reversal Symmetry and CPT

The Prime Electron model provides a natural geometric origin for CPT symmetry. The single worldline traversed in opposite proper time directions implements charge conjugation (C), parity (P), and time reversal (T) as geometric operations on the worldline.

### 6.1 C as Proper Time Reversal

Charge conjugation in the Prime Electron model is the operation:

$$
\mathcal{C}: \quad \tau \mapsto -\tau, \quad \sigma \mapsto -\sigma, \quad q \mapsto -q
$$

This maps the forward-traversing electron worldline ($\sigma = +1, q = -e$) to the backward-traversing positron worldline ($\sigma = -1, q = +e$). The prime gap sequence is invariant under this operation because $d_n = d_n$ (gaps are positive definite). The **C-invariance of the gap sequence** is the arithmetic origin of charge conjugation symmetry.

### 6.2 P as Spatial Reflection of Worldline Tangent

Parity acts on the spatial components of the worldline tangent:

$$
\mathcal{P}: \quad \vec{u} \mapsto -\vec{u}, \quad u^0 \mapsto u^0
$$

In the prime basis, the spatial momentum is $\vec{p}_n \propto \vec{v}_n/d_n$ where $\vec{v}_n$ is the spatial displacement vector at vertex $n$. Parity corresponds to reversing the spatial winding of the worldline. The **prime gap sequence does not determine spatial winding**—this is an additional degree of freedom corresponding to the three spatial dimensions. The Prime Electron model thus predicts that P-symmetry is **emergent from the embedding geometry**, not fundamental to the prime sequence itself.

### 6.3 T as Combined C and P

Time reversal in the Prime Electron model is the composition:

$$
\mathcal{T} = \mathcal{C} \mathcal{P}: \quad \tau \mapsto -\tau, \quad \vec{u} \mapsto -\vec{u}
$$

This maps a forward-traversing electron to a backward-traversing electron (not a positron). The full CPT operation is:

$$
\mathcal{CPT} = \mathcal{C} \mathcal{P} \mathcal{T} = \mathcal{C}^2 \mathcal{P}^2 = \text{identity}
$$

since $\mathcal{C}^2 = \mathcal{P}^2 = 1$. This provides a **geometric proof of the CPT theorem**: the single worldline with its proper time orientation and spatial embedding automatically satisfies CPT invariance.

### 6.4 CPT Violation from Prime Gap Asymmetries

If the prime gap sequence exhibited statistical asymmetries under $n \mapsto -n$ (which it cannot, being defined only for $n \geq 1$), CPT would be violated. However, the **distribution of gaps modulo classes** (e.g., $d_n \bmod 6$) shows subtle biases that could induce effective CPT violation in certain observables. The Prime Electron model predicts:

$$
\frac{\Gamma(e^- \to \nu_e \bar{\nu}_\mu \mu^-)}{\Gamma(e^+ \to \bar{\nu}_e \nu_\mu \mu^+)} - 1 \sim \mathcal{O}\left( \frac{\Delta_{\text{gap}}}{p_n} \right)
$$

where $\Delta_{\text{gap}}$ measures the asymmetry in gap distributions between forward and backward traversal sectors. Current experimental bounds on CPT violation in lepton decays constrain this asymmetry to be $< 10^{-12}$, consistent with the observed near-symmetry of prime gap statistics.