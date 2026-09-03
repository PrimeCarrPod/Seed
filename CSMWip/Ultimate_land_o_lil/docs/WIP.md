# Ultimate land 'o' lil - Work In Progress

## Current State: GPU Compute Shader Migration

### Active Task: Create Shared GPU Module
**File**: `CSMWip/Ultimate_land_o_lil/src/GPUParticles.js`
**Status**: Not started - need to extract from Ultimatev2_index_v3JJ1.html

### Micro-Tasks (Do One At A Time)

#### 1. Create GPUParticles.js Module
- [ ] Extract GPGPUParticleSystem class from Ultimatev2_index_v3JJ1.html
- [ ] Externalize shaders as template strings or separate files
- [ ] Export class for import in HTML files
- [ ] Add TypeScript-style JSDoc comments

#### 2. Create Shader Files
- [ ] `shaders/simulation.frag` - Full particle physics fragment shader
- [ ] `shaders/render.vert` - Position texture reader vertex shader  
- [ ] `shaders/render.frag` - Point rendering fragment shader

#### 3. Update HTML Files to Use Module
- [ ] Ultimatev2_index_v3JJ1.html - Import GPUParticles, remove inline class
- [ ] Ultimatev2_index_v3JJ4.html - Create with GPU + fixed flight button
- [ ] Ultimatev2_prime_fold_index_v3b.html - Create with GPU + fixed display
- [ ] Ultimatev2_PrimeFoldHarmonics_Index_v1.html - Create with GPU

#### 4. Fix Flight Button (v3 Design)
```
Header buttons:
[☰ Hide] [✈ Flight] [🔒☐ Lock] [Glueball] [Prime Gaps] [Meta] [Reinman] [● LIVE] [GPU]
```
- Flight button: just "✈ Flight" 
- Separate lock control: "🔒" + checkbox (not inside button)
- CSS: `.flight-lock { display: inline-flex; align-items: center; gap: 4px; }`

#### 5. Fix prime_fold_index_v3b Display
- Add `controls.update()` and `composer.render()` to animate loop
- Ensure three.js scene renders (was missing render call)

### Particle Physics Shader Logic (for simulation.frag)

```glsl
// Per-particle deterministic params from hash(index)
float hash(vec2 p) { return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453); }
vec3 hash3(vec2 p) { return vec3(hash(p), hash(p+1.7), hash(p+3.3)); }

// Type ID encoded in position.w or separate texture
// Physics per typeId:
// 0-2: Leptons (electron, muon, tau) - oscillatory with Berry phase
// 3-5: Neutrinos - oscillation + linear propagation
// 6-11: Quarks - confinement (sin/cos 3x frequency)
// 12: Photon - linear propagation
// 13: Gluon - 8 color states, high freq
// 14-15: W/Z bosons - massive, short range
// 16: Graviton - ultra-low freq
// 17: Higgs - central potential
// 18-19: Proton/neutron - slow orbital
// 20-24: Mesons - medium freq
// 25: Axion - ultra-low, coherence
// 26: Neutralino - slow drift
// 27: Gravitino - very slow
// 28: Demon - plasma freq 0.387
// 29: Glueball - binding oscillation
// 30: Tardigrade - very slow
// 31: Dark matter - ultra-slow
// 32: Prime particle - prime-indexed freq
// 33: Holographic - spherical shell
// 34: Swarm - cohesion velocity alignment

// Uniform influences:
// uPrimeMode: add sin(t * gap * 0.1) * 0.1
// uReinmanMode: scale *= 1 + sin(t * 0.001) * 0.2
// uMetaDepth: xy *= 1 + depth * 0.1
// Boundary: if |pos| > 60, pos *= 0.8
```

### Commands for Next Session
```bash
cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_6cb82307-decf-477a-b8de-c98aaae5d6d4
ls CSMWip/Ultimate_land_o_lil/
# Continue with GPUParticles.js creation
```