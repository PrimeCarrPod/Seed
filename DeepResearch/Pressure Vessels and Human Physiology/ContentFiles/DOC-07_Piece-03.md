# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5601-5700 | Piece 3 of 9 | ~100 Lines

---

#### 7.3 Joint Mechanics: Bellows, Convolutes, Planar, Rotary

**7.3.1 The Fundamental Joint Problem**

An EMU joint must:
1. **Seal** against 30 kPa internal pressure
2. **Rotate/Bend** through 90–180° range of motion (ROM)
3. **Minimize torque** (astronaut effort $\propto$ joint torque)
3. **Maintain restraint integrity** (no bladder herniation)
4. **Survive 25+ EVA cycles** (fatigue, wear)

**Pressure Force on Joint:**
$$F_P = P \cdot A_{projected}$$
For elbow ($r = 0.08$ m, $L = 0.3$ m):
$$F_P = 30,000 \times \pi \times 0.08^2 = 603 \text{ N} \quad (61 \text{ kgf})$$

**This force tries to straighten the joint** — astronaut must overcome it.

**7.3.2 Joint Type 1: Bellows (Convolute) — Elbow, Knee, Waist**

**Geometry:** Accordion-fold urethane/nylon bladder + fabric restraint bellows.

**Shuttle EMU Elbow Bellows:**
- **Convolutions:** 8–10
- **Conv. height:** 12 mm
- **Conv. pitch:** 15 mm
- **Bladder material:** Urethane/nylon (0.25 mm)
- **Restraint:** Dacron® bellows (integral with bladder)

**Torque Model (Bellows):**
$$T(\theta) = T_{bending} + T_{pressure} + T_{friction}$$

**Bending Torque (Elastic):**
$$T_{bending} = \frac{E I_{eff}}{R} \theta$$
Where $I_{eff}$ = effective second moment of bellows cross-section.

**Pressure Torque (Moment Arm Change):**
$$T_{pressure} = P \cdot \frac{dV}{d\theta}$$
Where $V(\theta)$ = bladder volume as function of angle.

**For Convolute Bellows:**
$$\frac{dV}{d\theta} \approx -A_{end} \cdot L \cdot \sin\theta \quad \text{(simplified)}$$

**Measured EMU Elbow Torque (Shuttle):**
| Angle | Torque [N·m] | Component |
|-------|--------------|-----------|
| 0° (extended) | 0 | — |
| 45° | 3.5 | Bending + pressure |
| 90° | 7.2 | Peak pressure moment |
| 135° | 5.8 | Decreasing moment arm |
| **Max** | **~7.5 N·m** | At ~100° |

**7.3.3 Joint Type 2: Planar (Constant Volume) — Wrist, Ankle**

**Principle:** Joint axis offset from bladder centroid → **constant volume** during rotation.
**No pressure torque!** Only bending + friction.

**Wrist Joint (Shuttle EMU):**
- **Type:** Planar bearing (two races, balls)
- **Bladder:** Straight tube through joint (no convolutions)
- **Restraint:** Cable/tendon system (maintains tension)

**Torque:**
$$T_{wrist} = T_{bearing} + T_{cable} \approx 0.5\text{–}1.0 \text{ N·m}$$
**Much lower than elbow!**

**7.3.4 Joint Type 3: Rotary (Constant Volume) — Shoulder, Hip**

**Principle:** Rotating bearing with bladder passing through center.
**Zero pressure torque** (if perfectly centered).

**Shoulder (Shuttle EMU — Upper Torso Mounted):**
- **Type:** Rotary bearing (ball/roller) in Hard Upper Torso (HUT)
- **Bladder:** Sealed to bearing inner race
- **Restraint:** Cable tendons from HUT to arm restraint

**Torque:**
$$T_{shoulder} = T_{bearing} + T_{cable\_tension}$$
**Measured:** 2–4 N·m (depends on cable routing)

**7.3.5 Joint Type 4: Advanced — Rolling Convolute / Rolling Lobe (xEMU)**

**xEMU Innovation:** **Rolling Lobe Joint** (patented by NASA/ILC)
- **Bladder:** Single lobe that rolls (like tire sidewall)
- **Restraint:** Integrated fabric that rolls with bladder
- **Advantages:** Lower torque, longer life, no pinch points

**Rolling Lobe Kinematics:**
$$\frac{dV}{d\theta} = 0 \quad \text{(constant volume by geometry!)}$$
**Eliminates pressure torque entirely!**

**Rolling Lobe Torque:**
$$T_{roll} = T_{membrane\_bending} + T_{friction} \approx 1.5\text{–}2.5 \text{ N·m} \quad \text{(vs. 7.5 for bellows)}$$

**Life Improvement:** 100,000 cycles (vs. 25,000 for bellows) — no crease fatigue.

**7.3.6 Glove Joints — The Ultimate Challenge**

**Fingers:** 14 joints per hand (MCP, PIP, DIP × 4 + thumb CMC, MCP, IP)

**Glove Bladder:** Dip-molded urethane, 0.15 mm thick, seamless.
**Restraint:** Knit Dacron®/Vectran® with **tendon cables** on dorsal side.

**Finger Torque (Per Joint):**
| Joint | ROM | Torque (Shuttle) | Torque (xEMU Rolling) |
|-------|-----|------------------|----------------------|
| MCP (knuckle) | 90° | 0.4 N·m | 0.15 N·m |
| PIP | 90° | 0.3 N·m | 0.12 N·m |
| DIP | 70° | 0.2 N·m | 0.08 N·m |

**Total Hand Closure Force:** ~50 N (Shuttle) → **fatigue in 20 min**
**xEMU Target:** < 20 N (rolling lobe + optimized tendons)

**7.3.7 Joint Torque vs. Pressure — The Scaling Law**

**For Bellows/Convolute Joints:**
$$T_{max} \propto P \cdot r^2 \cdot L \quad \text{(pressure moment)}$$

**For Rolling Lobe/Planar/Rotary:**
$$T_{max} \propto P^0 \quad \text{(pressure-independent!)}$$

**This is why NASA invests in rolling lobe — breaks the pressure-torque coupling.**

---

*End of Piece 3 — DOC-07 Lines 5601-5700*
*Next: Piece 4 — Section 7.4 Pressure Bladder Stress Analysis & Burst Criteria*