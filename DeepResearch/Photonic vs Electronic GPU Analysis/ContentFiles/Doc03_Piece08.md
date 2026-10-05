# Document 3: Thermodynamics of Joule Heating and Landauer Limit
## Piece 8: Carnot Efficiency Limits for Heat-to-Work Conversion in Cooling Systems

---

### 3.8 Carnot Efficiency Limits for Heat-to-Work Conversion in Cooling Systems

Cooling systems for high-performance computing operate as heat engines in reverse, consuming work to move heat from a cold reservoir (chip) to a hot reservoir (ambient). The Carnot limit sets the fundamental minimum work required, defining the thermodynamic ceiling for cooling efficiency.

#### 3.8.1 Carnot Refrigerator and Heat Pump

**Refrigerator** (cooling):
- Removes heat Q_C from cold reservoir at T_C
- Rejects heat Q_H to hot reservoir at T_H
- Consumes work W
- Coefficient of Performance (COP): COP_R = Q_C / W

**Heat pump** (heating):
- Delivers heat Q_H to hot reservoir at T_H
- Extracts heat Q_C from cold reservoir at T_C
- Consumes work W
- COP_HP = Q_H / W = COP_R + 1

**Carnot limits** (reversible cycle):
COP_R,Carnot = T_C / (T_H - T_C)
COP_HP,Carnot = T_H / (T_H - T_C)

**Example**: T_C = 300K (chip), T_H = 350K (cooling water)
COP_R,Carnot = 300/50 = 6
COP_HP,Carnot = 350/50 = 7

Real systems: COP ≈ 0.3-0.5 × Carnot (due to irreversibilities)

#### 3.8.2 Vapor-Compression Refrigeration Cycle

**Standard cycle**:
1. Compressor: adiabatic compression (W_in)
2. Condenser: heat rejection at T_H (Q_H out)
3. Expansion valve: isenthalpic throttling
4. Evaporator: heat absorption at T_C (Q_C in)

**Irreversibilities**:
- Compressor: isentropic efficiency η_is ≈ 0.7-0.8
- Heat exchangers: finite ΔT (5-10K approach)
- Throttling: isenthalpic, not isentropic (major loss)
- Pressure drops in pipes

**COP with real compressor**:
COP = η_is × COP_Carnot × (1 - T_H/T_C × ΔT_cond/ΔT_evap) ...

#### 3.8.3 Liquid Cooling for Datacenters

**Direct-to-chip (D2C)**:
- Cold plate on chip
- Single-phase (water) or two-phase (dielectric)
- Thermal resistance: R_th ≈ 0.01-0.05 K/W

**Immersion cooling**:
- Servers submerged in dielectric fluid
- Single-phase: natural/forced convection
- Two-phase: boiling on chip surface
- Heat rejection: dry cooler or cooling tower

**Cooling distribution unit (CDU)**:
- Heat exchanger: facility water ↔ coolant
- Pumps, filters, controls
- Approach temperature: ΔT_approach = 2-5K

#### 3.8.4 Facility-Level Thermodynamics

**Cooling tower**:
- Evaporative cooling
- Wet-bulb temperature limit
- COP_tower ≈ 10-20 (free cooling)

**Chiller plant**:
- Centrifugal chillers: COP ≈ 5-7
- Magnetic bearing, variable speed
- Heat recovery: reclaim condenser heat

**Power Usage Effectiveness (PUE)**:
PUE = Total facility power / IT equipment power
= 1 + P_cooling / P_IT

Theoretical minimum PUE (Carnot):
P_cooling,min = P_IT / COP_R,Carnot
PUE_min = 1 + 1/COP_R,Carnot = 1 + (T_H - T_C)/T_C = T_H/T_C

For T_H = 350K, T_C = 300K: PUE_min = 1.17

**Best achieved**: PUE ≈ 1.05-1.10 (Google, Facebook)
Gap from Carnot: ~2-3×

#### 3.8.5 Thermoelectric Cooling (Peltier)

**Peltier effect**: Current through junction → heat pumping
Q_C = α I T_C - ½ I² R - K ΔT

where α = Seebeck coefficient, R = resistance, K = thermal conductance.

**Figure of merit**: ZT = α² T / (R K)

**COP**:
COP = (α T_C - ½ I R) / (I R + α ΔT)  (at optimal I)

**Maximum COP**:
COP_max = (√(1+ZT_m) - T_H/T_C) / (√(1+ZT_m) + 1)
where T_m = (T_H + T_C)/2

**State of the art**: ZT ≈ 2-3 (BiTe, skutterudites)
COP ≈ 0.1-0.2 × Carnot
Used for spot cooling, not bulk

#### 3.8.6 Magnetic and Caloric Cooling

**Magnetic refrigeration** (magnetocaloric effect):
- Adiabatic magnetization/demagnetization
- Materials: Gd, Gd-Si-Ge, La-Fe-Si
- COP ≈ 0.3-0.5 × Carnot near room temperature
- No moving parts, quiet

**Electrocaloric cooling**:
- Electric field on ferroelectric
- Thin films, fast response
- ZT equivalent ~ 0.5-1

**Elastocaloric cooling**:
- Stress-induced phase transformation
- NiTi shape memory alloys
- COP ≈ 0.2-0.4 × Carnot

#### 3.8.7 Two-Phase Cooling Thermodynamics

**Boiling heat transfer**:
- Nucleate boiling: q = C (ΔT)^n (n ≈ 3)
- Critical heat flux (CHF): q_max before film boiling
- CHF ≈ 1-2 MW/m² (water), 0.5 MW/m² (dielectric)

**Condensation**:
- Filmwise vs. dropwise
- Dropwise: 5-10× better heat transfer
- Surface coatings promote dropwise

**Flow boiling in microchannels**:
- High heat transfer coefficient: h ≈ 10-50 kW/m²K
- Pressure drop: ΔP = f(L/D)(ρv²/2)
- Flow instability: density wave oscillations

**Two-phase CDU**:
- Pumpless (thermosyphon) or pumped
- COP ≈ 10-20 (effectively heat pipe)
- Limited by CHF and pumping power

#### 3.8.8 Waste Heat Recovery

**Organic Rankine Cycle (ORC)**:
- Low-grade heat (80-150°C) → electricity
- Working fluid: R245fa, toluene, siloxanes
- Efficiency: η ≈ 5-15% (vs Carnot 15-30%)

**Thermoelectric generation (TEG)**:
- Seebeck effect: ΔT → voltage
- ZT ≈ 1-2 for power generation
- Efficiency: η ≈ 5-10% of Carnot

**Applications in datacenters**:
- Pre-heat facility water
- Drive absorption chillers
- District heating (Nordic datacenters)

**Cogeneration (CHP)**:
- Natural gas → electricity + heat
- Overall efficiency: 80-90%
- Datacenter as heat source for district heating

#### 3.8.9 Exergy Analysis of Cooling Systems

**Exergy** (available work):
Ex = (H - H₀) - T₀(S - S₀)

**Exergy destruction** = T₀ σ (entropy production)

**Cooling system exergy efficiency**:
η_ex = Ex_cooling / W_in
= (1 - T₀/T_C) Q_C / W_in
= COP_R / COP_R,Carnot

**Component-level exergy destruction**:
- Compressor: ~30-40%
- Condenser: ~20-30%
- Expansion valve: ~20-30%
- Evaporator: ~10-20%

**Optimization**: Minimize total exergy destruction
- Reduce ΔT in heat exchangers
- Use expanders instead of throttling valves
- Multi-stage compression with intercooling

#### 3.8.10 Future: Thermodynamic Computing

**Adiabatic quantum computing**:
- Quantum annealing (D-Wave)
- Thermal fluctuations assist tunneling
- Operates near T_C (15 mK)
- Cooling cost: ~10 kW per mW at 15 mK

**Reversible computing with thermal coupling**:
- Bennett's Brownian computer
- Thermal ratchets for logic
- Dissipation → k_B T per step (not k_B T ln 2)

**Information-fueled engines**:
- Szilard engine powered by data erasure
- Maxwell's demon as computational element
- Landauer cost paid by computation itself

**Conclusion**: Cooling efficiency fundamentally limited by Carnot
Current systems: 30-50% of Carnot
Path to improvement: reduce ΔT, eliminate throttling, waste heat reuse
Ultimate limit: PUE → 1.0 (all heat reused)

---

*End of Piece 8. Next: Piece 9 - Thermodynamic Uncertainty Relations for Precision vs. Dissipation*