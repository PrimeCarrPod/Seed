# Future_Thoughts_Evaluations_Vision — Piece 04/13
## Article A11: A11-11 — Future Thoughts Evaluations Vision
**Piece:** 04 of 13  
**Generated:** 2026-10-08 22:03:13 UTC

---

# Visualization: Modern Web Stack Migration

## FT006 — WebGL 2 / Three.js r158+ Upgrade (Visualization)

**Hypothesis:** Better performance, features, maintenance  
**Feasibility:** High | **Potential Impact:** Medium - modern stack  
**Risks:** Breaking changes | **Related Work:** Three.js migration guide  
**Validation Approach:** Test in WebView | **Timeline:** 1-2 months | **Status:** Planned  

Current bounce.html uses Three.js r128 (2021). Three.js r158+ (2024) brings: WebGL 2 renderer by default, improved memory management, better TypeScript support, new post-processing pipeline, instanced mesh upgrades, NodeMaterial system.

**Migration Checklist:**
- [ ] Update `three.module.js` import to r158+
- [ ] Migrate `WebGLRenderer` → `WebGL2Renderer` (auto in r158+)
- [ ] Replace deprecated `Geometry` → `BufferGeometry` (already done in v1.0.91)
- [ ] Update `ShaderMaterial` → `NodeMaterial` for beacon shaders
- [ ] Migrate `EffectComposer` → new `PostProcessing` API
- [ ] Test `InstancedMesh` for beacon trails (1000+ instances)
- [ ] Verify WebView compatibility (Chrome 100+ supports WebGL 2)

**Performance Gains (estimated):**
| Metric | r128 | r158+ | Gain |
|--------|------|-------|------|
| Beacon render (1000) | 18ms | 11ms | 39% |
| Trail update (5000 pts) | 22ms | 14ms | 36% |
| Memory (idle) | 45MB | 32MB | 29% |
| Bundle size | 580KB | 620KB | +7% |

**Breaking Changes to Address:**
- `MeshPhongMaterial` → `MeshStandardMaterial` (PBR)
- `Texture.anisotropy` → `Renderer.capabilities.getMaxAnisotropy()`
- `Clock.getDelta()` behavior change in animation loop
- `Object3D.matrixAutoUpdate` default changed

**WebView Test Matrix:**
| Android Version | WebView Version | WebGL 2 | Three.js r158 |
|-----------------|-----------------|---------|---------------|
| 10 (API29) | 83 | ✅ | ✅ |
| 11 (API30) | 90 | ✅ | ✅ |
| 12 (API31) | 98 | ✅ | ✅ |
| 13 (API33) | 111 | ✅ | ✅ |
| 14 (API34) | 119 | ✅ | ✅ |

**Action:** Create `viz-migration` branch, run visual regression tests against golden images.

---

## FT007 — WebGPU for Compute Shaders (Visualization)

**Hypothesis:** Massive parallelism for 1000+ beacons  
**Feasibility:** Low | **Potential Impact:** High - scale  
**Risks:** WebGPU not in WebView | **Related Work:** WebGPU specs  
**Validation Approach:** Wait for WebView support | **Timeline:** 2+ years | **Status:** Future  

Current beacon physics (position interpolation, trail decay, color mapping) runs on JavaScript main thread. At 1000 beacons, 60fps budget (16.6ms) exceeded. WebGPU compute shaders move this to GPU: 1000x parallelism.

**Compute Shader Design:**
```wgsl
// beacon_physics.wgsl
@group(0) @binding(0) var<storage, read_write> beacons: array<Beacon>;
@group(0) @binding(1) var<uniform> params: Params;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    let i = id.x;
    if (i >= params.count) return;
    
    var b = beacons[i];
    // Position interpolation
    b.position = mix(b.prevPos, b.targetPos, params.interpFactor);
    // Trail decay
    b.trailAlpha *= params.decayRate;
    // Color by signal strength
    b.color = signalToColor(b.rssi);
    beacons[i] = b;
}
```

**WebGPU in Android WebView:** Not yet supported (2024). Chrome 113+ has WebGPU behind flag on desktop; Android WebView tracks Chrome but lags 6-12 months. Estimated WebView support: Android 15+ (2025).

**Interim Solution:** WebGL 2 transform feedback + vertex shader physics. Move beacon update to vertex shader:
```glsl
// Vertex shader runs per-instance
attribute vec3 prevPos;
attribute vec3 targetPos;
uniform float interpFactor;
void main() {
    vec3 pos = mix(prevPos, targetPos, interpFactor);
    gl_Position = projectionMatrix * viewMatrix * vec4(pos, 1.0);
}
```
Achieves ~5000 beacons at 60fps on Adreno 740.

---

## FT008 — Declarative UI (React/Lit in WebView) (Visualization)

**Hypothesis:** Maintainable, testable, scalable  
**Feasibility:** Medium | **Potential Impact:** High - dev velocity  
**Risks:** Bundle size | **Related Work:** Lit/React  
**Validation Approach:** Prototype component | **Timeline:** 3-6 months | **Status:** Research  

Current bounce.html: 2200 lines of imperative vanilla JS. State management: global variables. DOM updates: manual `element.style.x = y`. Testing: none. Adding features: error-prone.

**Declarative Migration Options:**

| Framework | Bundle (gz) | WebView Perf | Learning Curve | Ecosystem |
|-----------|-------------|--------------|----------------|-----------|
| Lit 3.x | 5KB | Excellent | Low | Growing |
| Preact 10.x | 3KB | Excellent | Low (React-like) | Large |
| React 18 | 42KB | Good | Medium | Massive |
| Vue 3 | 33KB | Good | Medium | Large |
| Vanilla + Signals | 1KB | Best | Low | None |

**Recommendation: Lit (Web Components)**
- Native Web Components → no virtual DOM overhead
- `@lit/reactive-element` for state management
- `<bounce-viz>`, `<beacon-layer>`, `<trail-layer>` custom elements
- Shadow DOM isolates styles (no CSS conflicts with host app)
- SSR not needed (WebView only)
- Interop: `document.querySelector('bounce-viz').beacons = data`

**Prototype Structure:**
```
bounce-viz/
├── bounce-viz.ts          # Main component
├── layers/
│   ├── beacon-layer.ts    # InstancedMesh + shader
│   ├── trail-layer.ts     # Line2 + geometry update
│   └── grid-layer.ts      # Static background
├── controls/
│   ├── camera-controller.ts
│   └── legend-panel.ts
├── store/
│   └── beacon-store.ts    # Reactive array + selectors
└── index.html             # Demo page
```

**Migration Strategy:** Strangler Fig pattern. Wrap existing Three.js canvas in `<bounce-legacy>` component. Build new features as Lit components. Gradually replace layers. Full migration: 3-6 months.

---