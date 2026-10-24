## 3. Synthetic Training Environment (STE)

### 3.1 STE Architecture — One World Terrain (OWT)

The STE implements the **One World Terrain** concept per **DoDI 4151.22**, providing a common synthetic environment across all LVC domains. Terrain material properties reference **MAT-01** silk fibroin engineering and **MAT-02** structural foundation materials for ground interaction modeling. **SYNTH-03** drafting kernel supports terrain mesh generation. **SYNTH-01** constitutive models apply to terrain physics.

**Terrain Representation**:

$$\text{OWT Tile} = \{ \text{Elevation}, \text{Imagery}, \text{Vector}, \text{3D Features}, \text{Materials} \}$$

| LOD Level | Resolution | Coverage | Use Case |
|-----------|------------|----------|----------|
| **LOD 0** | 0.5 m | 10 km × 10 km | Close combat, dismounted |
| **LOD 1** | 2.0 m | 50 km × 50 km | Mounted maneuver |
| **LOD 2** | 10.0 m | 200 km × 200 km | Operational planning |
| **LOD 3** | 30.0 m | Global | Strategic overview |

**Terrain Streaming Formula**:

$$\text{Stream Bandwidth} = \sum_{i=0}^{L} \frac{A_i \cdot R_i \cdot B_{\text{tex}}}{T_{\text{frame}}}$$

Where $A_i$ = area at LOD $i$, $R_i$ = resolution, $B_{\text{tex}}$ = bytes per texel, $T_{\text{frame}} = 11.11$ ms.

### 3.2 AI Adversary & Force Generation

**Computer-Generated Forces (CGF) — Doctrine-Driven**:

$$\text{Force Size} = \text{Mission Type} \times \text{Threat Level} \times \text{Force Ratio}$$

**AI Adversary Scaling (Adaptive Difficulty)**:

$$\text{Difficulty}(t) = \text{Base} + \alpha \cdot \text{Proficiency}(t) + \beta \cdot \text{Complexity}(\text{Mission})$$

$$\frac{d\text{Proficiency}}{dt} = \eta \cdot (\text{Performance}_{\text{target}} - \text{Performance}_{\text{actual}}) - \lambda \cdot \text{Proficiency}$$

Where $\eta = 0.1$ (learning rate), $\lambda = 0.01$ (decay), $\alpha = 0.5$, $\beta = 0.3$.

**Entity Aggregation for Large Forces**:

$$N_{\text{aggregated}} = \left\lceil \frac{N_{\text{entities}}}{E_{\text{per-aggregate}}} \right\rceil, \quad E_{\text{per-aggregate}} = 64$$

### 3.3 After Action Review (AAR) Automation

**Automated Scoring Function**:

$$\text{Score} = \sum_{i=1}^{M} w_i \left(1 - \frac{|t_a^{(i)} - t_t^{(i)}|}{t_t^{(i)}}\right) \mathbb{I}(\text{Correct}_i)$$

Where $w_i$ = task weight, $t_a$ = actual time, $t_t$ = target time, $\mathbb{I}$ = indicator.

**Performance Metrics**:

| Metric | Formula | Standard |
|--------|---------|----------|
| **Task Completion Rate** | $\frac{N_{\text{completed}}}{N_{\text{assigned}}}$ | ≥ 0.95 |
| **Time Efficiency** | $\frac{\sum t_t}{\sum t_a}$ | ≥ 0.90 |
| **Procedure Adherence** | $\frac{N_{\text{correct steps}}}{N_{\text{total steps}}}$ | ≥ 0.98 |
| **Communication Efficiency** | $\frac{N_{\text{essential comms}}}{N_{\text{total comms}}}$ | ≥ 0.85 |
| **Situational Awareness** | $\frac{N_{\text{detected threats}}}{N_{\text{actual threats}}}$ | ≥ 0.90 |

---

