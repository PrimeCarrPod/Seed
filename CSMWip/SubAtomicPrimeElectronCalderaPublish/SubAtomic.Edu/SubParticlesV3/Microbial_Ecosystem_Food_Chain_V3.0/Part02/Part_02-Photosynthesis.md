# V3.0 Deep Dive Series: Microbial Ecosystem Food Chains
## Part 2 of 14 — Primary Production and Photosynthetic Food Webs

---

### Abstract

This installment develops the mathematical framework for primary production in microbial ecosystems, establishing the energy transfer mechanisms from phototrophs to heterotrophs.

---

## 1. Photosynthesis Quantum Mechanics

### 1.1 Photon Absorption Process

The quantum efficiency of photosystem II:

$$\Phi_{\text{PSII}} = \frac{\text{Number of photochemical events}}{\text{Number of photons absorbed}} = 0.95$$

The energy conversion:

$$E_{\text{photon}} = hc/\lambda = \frac{1240 \, \text{eV·nm}}{\lambda \, [\text{nm}]}$$

### 1.2 Photosynthetic Quantum Yield

$$\chi_Q = \frac{\text{Number of ATP + NADPH}}{\text{Number of photons}} = \frac{15}{2} = 7.5$$

---

## 2. Primary Producer Population Dynamics

### 2.1 Growth Kinetics (Monod Equation)

$$\mu = \mu_{\max} \frac{S}{K_s + S}$$

where $\mu$ is the specific growth rate, $S$ substrate concentration, $K_s$ half-saturation constant.

### 2.2 Lotka-Volterra Predator-Prey

$$\frac{dN}{dt} = rN \left(1 - \frac{N}{K}\right) - \alpha NP$$
$$\frac{dP}{dt} = \beta \alpha NP - \delta P$$

---

*End of Part 2 — Next: Secondary Consumers and Nutrient Cycling*
ENDOFFILE