# V3.0 Deep Dive Series: Microbial Ecosystem Food Chains
## Part 6 of 14 — Pathogenic Interactions and Parasitism

---

### Abstract

This installment develops the mathematical biology of pathogenic microbial interactions, including host-pathogen dynamics and immune response modeling.

---

## 1. Host-Pathogen Dynamics

### 1.1 SIR Model for Microbial Pathogens

$$\frac{dS}{dt} = -\beta SI$$
$$\frac{dI}{dt} = \beta SI - \gamma I$$
$$\frac{dR}{dt} = \gamma I$$

Basic reproduction number: $R_0 = \frac{\beta S_0}{\gamma}$

---

## 2. Quorum Sensing

### 2.1 Autoinducer Concentration

$$\frac{dA}{dt} = n_r - k_d A + \alpha N$$

where $A$ autoinducer, $n_r$ noise rate, $k_d$ degradation, $\alpha$ production rate.

---

*End of Part 6 — Next: Metabolic Diversity and Energy Sources*
