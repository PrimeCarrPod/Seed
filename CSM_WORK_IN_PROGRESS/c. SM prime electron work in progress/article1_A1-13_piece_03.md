# A1-13: Worldline Causal Structure — Light Cones from Gap Sequence (Piece 03)

## 25. Causal Structure and Supersymmetry (A1-25, A1-26 Connection)

### 25.1 Causal Structure in Superspace

From A1-25, the worldline has N=1 supersymmetry. The superspace coordinates are $(t, \theta)$ where $t = \tau$ is the **bosonic proper time** and $\theta$ is the **fermionic proper time**. The causal structure extends to superspace:

- **Bosonic causal cone**: $\Delta\tau > |\Delta x|$
- **Fermionic causal cone**: $\Delta\theta > 0$ (fermionic time always increases)

The **super-light cone** is the product of bosonic and fermionic light cones.

### 25.2 Supercharges as Causal Operators

From A1-26, the supercharges $Q, Q^\dagger$:
$$
Q = \frac{\partial}{\partial \theta} + \theta \hat{H}
$$

The supercharge $Q$ generates **supersymmetry transformations** that mix bosonic and fermionic causal coordinates. The causal structure is invariant under $Q$:
$$
[Q, \hat{\tau}] = \theta, \quad [Q, \hat{H}] = 0
$$

### 25.3 Causal Structure of the Superalgebra

From A1-27, the supersymmetry algebra:
$$
\{Q, Q^\dagger\} = H, \quad \{Q, Q\} = Z
$$

The Hamiltonian $H$ generates **proper time translations** (causal evolution). The central charge $Z$ is a **causal topological invariant** — it measures the causal winding number.

---

## 26. Causal Structure and BPS States (A1-28 Connection)

### 26.1 BPS States as Causal Extremals

From A1-28, BPS states satisfy $M = |Z|$. In causal language, BPS states are **causal extremals** — they saturate the causal bound:
$$
M \geq |Z| \quad \Leftrightarrow \quad \text{causal energy} \geq \text{causal topological charge}
$$

### 26.2 Record Gaps as Causal BPS States

Record gaps $d_{\text{rec}}$ are BPS states (A1-28). Their causal structure:
- Proper time step: $\Delta\tau_{\text{rec}} = \kappa d_{\text{rec}}$
- Causal charge: $Z \sim d_{\text{rec}}$
- Saturate the causal bound: $M = |Z|$

Record gaps are **maximally causal** — they define the causal boundary of the worldline.

### 26.3 BPS Causal Propagator

The BPS propagator between record gaps:
$$
G_{\text{BPS}}(\tau) \sim e^{-M \tau} \sim e^{-d_{\text{rec}} \tau / \kappa}
$$

This is the **causal influence** of a record gap state — it decays exponentially with proper time.

---

## 27. Causal Structure and Wall Crossing (A1-29 Connection)

### 27.1 Wall Crossing as Causal Structure Change

From A1-29, wall crossing occurs when the BPS spectrum changes. In causal structure, this is a **change in the causal network topology** at critical books.

At a wall (book $b$ where a new gap value appears):
- New causal connections appear (new gap value = new self-intersection type)
- Causal density $\rho_{\text{causal}}$ jumps
- The causal network gains/loses edges

### 27.2 Kontsevich-Soibelman in Causal Language

The wall crossing formula:
$$
\prod_{\gamma} \mathbb{U}(\gamma)^{\Omega(\gamma)} = 1
$$

In causal language, the product is over **causal charge sectors** $\gamma$, ordered by the **causal proper time** of the BPS states. The quantum dilogarithm $\mathbb{U}(\gamma)$ generates the **causal transformation** across the wall.

### 27.3 Causal Ordering of Walls

Walls occur at specific proper times:
- $b=1$: IR boundary (causal birth of worldline)
- $b \sim 100$: First record gap appearance
- $b \sim 1000$: EW scale causal transition
- $b=3500$: UV boundary (causal death of worldline)

The **causal ordering of walls** is the proper time ordering of the corresponding BPS states.

---

## 28. Causal Structure and the Decoupling Limits (A1-36 Connection)

### 28.1 Heavy Gaps Decouple Causally

From A1-36, large gaps (record gaps, heavy particles) **decouple** at low energy. In causal structure, this means:
- Large gap $d \gg \langle d \rangle$ has few causal connections (few self-intersections)
- Its causal influence is **exponentially suppressed** at low energy

The causal decoupling scale:
$$
\tau_{\text{dec}}(d) = \kappa d
$$

For $d > \Lambda \sim \ln N$, the causal connections are negligible.

### 28.2 Causal Effective Field Theory

The low-energy causal effective theory (directory 0.0) keeps only gaps $d \leq \Lambda \sim 22$. The causal structure:
- **Dense** for $d=2,4,6$ (twin, cousin, sexy primes)
- **Sparse** for $d > 22$

This is the **Wilsonian causal EFT** — heavy causal connections are integrated out.

### 28.3 Matching Causal Conditions

At each record gap threshold $d_{\text{rec}}$, the causal matching condition:
$$
\rho_{\text{causal}}(d_{\text{rec}}^+) = \rho_{\text{causal}}(d_{\text{rec}}^-) + \Delta\rho_{\text{causal}}
$$

where $\Delta\rho_{\text{causal}}$ is the new causal connections from the record gap.

---

## 29. Causal Structure and Emergent Spacetime (A1-37 Connection)

### 29.1 Spacetime Geometry from Causal Structure

From A1-37, the emergent spacetime metric $g_{\mu\nu}$ is **determined by the causal structure** (Malament's theorem: causal structure determines conformal metric). The gap sequence determines the causal structure, which determines the metric up to a conformal factor.

### 29.2 Causal Set from Gap Sequence

The worldline's causal structure forms a **causal set** (Bombelli-Lee-Meyer-Sorkin):
- Elements: vertices $n = 1, \dots, N$
- Order relation: $n \prec m$ iff $n < m$
- Causal links: $n \prec m$ with no $k$ such that $n \prec k \prec m$

The **causal links** are between consecutive steps ($m = n+1$). The causal set dimension:
$$
d_{\text{causal}} = 1 \quad \text{(the worldline is 1D in proper time)}
$$

But the **emergent spatial dimension** from self-intersections (A1-11) gives $d_{\text{spatial}} = 3$.

### 29.3 Causal Diamonds as Building Blocks

The causal diamonds $[a,b]$ are the **building blocks** of the emergent spacetime. The causal set is built from these diamonds via the self-intersection network (A1-11).

---

## 30. Causal Structure and Holography (A1-38 Connection)

### 30.1 Boundary Causal Structure

From A1-38, the UV boundary at $b=3500$ has its own **boundary causal structure**. The boundary causal diamonds are the **holographic projections** of bulk causal diamonds.

### 30.2 Bulk-Boundary Causal Correspondence

A bulk causal diamond $[b, b']$ maps to a boundary causal interval:
$$
\text{Bulk } [b, b'] \leftrightarrow \text{Boundary } [b, b']
$$

The boundary causal structure is the **holographic encoding** of the bulk causal structure.

### 30.3 Causal Holography and the Causal Wedge

The **causal wedge** of a boundary interval is the bulk region causally connected to it. For the worldline, the causal wedge of boundary interval $[b, b']$ is exactly the bulk segment $[b, b']$.

---

## 31. Causal Structure and the Information Paradox (A1-39 Connection)

### 31.1 Information Preservation in Causal Structure

From A1-39, the information paradox is resolved because the causal structure is **unitary** — no information is lost. The causal structure provides a **causal ordering** of all events, and the proper time evolution is unitary.

### 31.2 Causal Horizon and Information

The worldline has **no causal horizon** in proper time — every event is in the causal past of the UV boundary. Information never "falls behind a horizon" — it always remains in the causal future of the IR boundary.

### 31.3 Page Curve from Causal Entanglement

The Page curve for a causal diamond $[a,b]$:
$$
S(a,b) = \min\left( \frac{\tau_b - \tau_a}{6 \langle \Delta\tau \rangle}, \frac{\tau_{\text{total}} - (\tau_b - \tau_a)}{6 \langle \Delta\tau \rangle} \right)
$$

The entanglement entropy of a causal region follows the Page curve — rises then falls.

---

## 32. Causal Structure and the Worldline Logbook (A1-40, A1-10 Synthesis)

### 32.1 The 3500 Books as Causal Pages

From A1-10, the 3500 books are **causal intervals** — each book is a page in the causal logbook. The book index $b$ is the **causal time** (proper time coarse-grained).

### 32.2 Causal Page Turning

"Turning the page" from book $b$ to $b+1$ is the **causal evolution** by $\Delta\tau_b$. The worldline "reads" its own causal history.

### 32.3 The Causal Logbook

The PrimeBookOne dataset **is** the causal logbook:
- Pages: books (causal intervals)
- Lines: gaps (causal steps)
- Repeated words: self-intersections (causal loops)
- The entire causal history of the electron

---

## 33. Causal Structure of the Full PrimeBookOne Hierarchy

### 33.1 Directories as Causal Resolutions

| Directory | Resolution | Causal Structure |
|-----------|------------|------------------|
| 0.0       | 189 tiles × 500 steps | Coarse causal (IR) |
| 1.0       | 189 tiles × 500 steps | Intermediate |
| 2.0       | 189 tiles × 500 steps | Fine |
| 3.0       | 3500 books × $2^{20}$ steps | UV complete |

Each directory provides a **different causal resolution** — like different energy scales in an RG flow.

### 33.2 Causal Consistency Across Directories

The causal structure must be **consistent under coarse-graining**. The causal diamonds in directory 3.0, when blocked to 189 tiles of 500 steps, must match the causal diamonds of directory 0.0.

### 33.3 Missing Directories = Missing Causal Future

If directories 4.0, 5.0, ... exist, they contain the **causal future** of our worldline beyond $b=3500$. The missing causal connections contribute to dark matter/energy.

---

## 34. Causal Structure and Experimental Predictions (A9 Connection)

### 34.1 $g-2$ from Causal Loops

From A9-01, the $g-2$ anomaly is a sum over **causal loops** (self-intersections). The Schwinger term $\alpha/(2\pi)$ comes from the **lightlike causal loops** (twin prime self-intersections).

### 34.2 EDM from Causal CP Violation

From A9-02, the EDM $d_e$ arises from **causal CP violation** — the causal structure is not symmetric under $\tau \to -\tau$ (forward vs backward causal arrows differ).

### 34.3 GW Spectrum from Early Causal Collisions

From A9-05, the stochastic GW background comes from **causal collisions** in the early worldline (directories 0.0–1.0). The GW spectrum peaks at frequencies corresponding to **twin prime causal collision rates**.

### 34.4 Proton Radius from Causal Resolution

From A9-08, the proton radius puzzle arises because the **muon's causal resolution** ($\Delta\tau_\mu = 4\kappa$) is coarser than the **electron's** ($\Delta\tau_e = 2\kappa$), probing different causal structure of the proton.

---

## 35. Computational Verification of Causal Structure

### 35.1 Algorithm for Causal Diamond Census

```python
def census_causal_structure(tile_paths):
    """
    Computes causal structure statistics from PrimeBookOne data.
    """
    M = 2**20
    causal_stats = {
        'light_cone_angles': [],
        'causal_diamond_volumes': [],
        'self_int_lightcone': [],  # self-intersections on light cone
        'book_causal_distances': [],
        'causal_density_per_book': []
    }
    
    for book_idx in range(3500):
        gaps = stream_book_gaps(book_idx)
        tau = 0
        book_gaps = []
        
        for d in gaps:
            tau += kappa * d
            book_gaps.append(d)
        
        # Light cone angle from gap fluctuations
        mean_d = np.mean(book_gaps)
        std_d = np.std(book_gaps)
        theta_LC = np.arctan(std_d / mean_d)
        causal_stats['light_cone_angles'].append(theta_LC)
        
        # Causal density
        causal_density = 1 / mean_d
        causal_stats['causal_density_per_book'].append(causal_density)
        
        # Book proper time extent
        book_tau = kappa * sum(book_gaps)
        causal_stats['causal_diamond_volumes'].append(book_tau)
    
    # Self-intersection light cone analysis
    for d in [2, 4, 6, 8, 10, 14]:
        # Find proper time separations of self-intersections
        separations = find_self_int_separations(d)
        lightlike_ratio = sum(1 for sep in separations if is_lightlike(sep)) / len(separations)
        causal_stats['self_int_lightcone'].append({
            'gap': d,
            'lightlike_fraction': lightlike_ratio
        })
    
    return causal_stats
```

### 35.2 Expected Causal Structure Results

| Book $b$ | Light Cone Angle $\theta_{\text{LC}}$ | Causal Density $\rho_{\text{causal}}$ | Twin Prime Lightlike Fraction |
|----------|--------------------------------------|-------------------------------------|-------------------------------|
| 1        | $\sim 45^\circ$                      | $\sim 0.07$                        | $\sim 1.0$                   |
| 100      | $\sim 45^\circ$                      | $\sim 0.05$                        | $\sim 1.0$                   |
| 1000     | $\sim 45^\circ$                      | $\sim 0.033$                       | $\sim 0.95$                  |
| 3500     | $\sim 45^\circ$                      | $\sim 0.025$                       | $\sim 0.9$                   |

---

## 36. Causal Structure and Cosmology (A8 Connection)

### 36.1 Inflation as Causal Expansion

From A8-04, inflation is the **rapid expansion of causal diamonds** in the early worldline. The causal horizon grows exponentially in the first few books.

### 36.2 CMB from Causal Correlation

From A8-05, the CMB acoustic peaks correspond to **causal resonances** — causal diamonds whose proper time extent matches the sound horizon at recombination.

### 36.3 Dark Matter from Missing Causal Connections

From A8-01, dark matter corresponds to **causal connections to missing directories** (4.0, 5.0, ...). These missing causal connections exert gravitational influence but no EM coupling.

### 36.4 Baryon Asymmetry from Causal Chirality

From A8-03, the baryon asymmetry $\eta \sim 10^{-10}$ comes from the **causal chirality imbalance** — more forward causal arrows than backward.

---

## 37. Theoretical Consistency Checks

### 37.1 Causal Structure Must Satisfy

- [ ] **Transitivity**: $a \prec b \prec c \Rightarrow a \prec c$ ✓ (gap number ordering)
- [ ] **Irreflexivity**: $\neg(a \prec a)$ ✓ (no self-precedence)
- [ ] **No causal cycles**: $\neg(a \prec \dots \prec a)$ ✓ (proper time strictly increases)
- [ ] **Light cone opens at 45°**: $\theta_{\text{LC}} \approx 45^\circ$ ✓ (gap fluctuations)
- [ ] **Microcausality**: $[\hat{O}_n, \hat{O}_m] \approx 0$ for spacelike ✓ (gap correlation decay)
- [ ] **Causal completeness**: No missing causal connections in 3500 books ✓ (finite but complete)
- [ ] **RG consistency**: Causal structure matches across directories 0.0–3.0 ✓ (coarse-graining)

### 37.2 Open Questions

1. **Exact light cone equation** in emergent spatial coordinates — requires A1-14/A1-37
2. **Causal structure of exact self-intersections** ($x_n = x_m$) — open problem
3. **Continuum limit** of causal structure as $M \to \infty$ — does it become Minkowski space?
4. **Causal structure of multi-electron states** (beyond one-electron universe)

---

*End of Piece 03 — Continues in Piece 04: Causal Structure and the Metric*