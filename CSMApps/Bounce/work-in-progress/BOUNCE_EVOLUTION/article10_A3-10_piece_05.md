# Refinement_Existing_Parts_Prioritized — Piece 05/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 05 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Visual Effects & Rendering (RF015, RF016, RF029)

## 5.1 RF015 — Catmull-Rom Trail Tension Parameter (P2, Low Effort)

**Component:** `TrailRenderer.js` (Catmull-Rom spline)  
**Issue:** Fixed centripetal tension (α=0.5) — not user-configurable  
**Current State:** `const curve = new THREE.CatmullRomCurve3(points, false, 'centripetal', 0.5);`  
**Proposed Refinement:** Expose tension parameter with UI control and persistence  

### Implementation:
```javascript
// TrailRenderer.js
class TrailRenderer {
  constructor() {
    this.tension = this.loadTension(); // 0.0 (uniform) to 1.0 (chordal)
    this.curveType = 'catmullrom';
  }
  
  loadTension() {
    const saved = localStorage.getItem('trail_tension');
    return saved ? parseFloat(saved) : 0.5; // default centripetal
  }
  
  saveTension(value) {
    this.tension = Math.max(0, Math.min(1, value));
    localStorage.setItem('trail_tension', this.tension.toFixed(2));
    this.rebuildCurve();
  }
  
  rebuildCurve() {
    if (this.curve) this.curve.dispose();
    this.curve = new THREE.CatmullRomCurve3(
      this.controlPoints, 
      false, 
      'catmullrom', 
      this.tension
    );
    this.updateGeometry();
  }
  
  // UI: Settings panel slider 0.0–1.0, step 0.05
  // Presets: "Smooth" (0.0), "Centripetal" (0.5), "Chordal" (1.0)
}
```

### Tension Effects:
| Tension (α) | Curve Type | Visual Character | Use Case |
|-------------|------------|------------------|----------|
| 0.0 | Uniform | Very smooth, overshoots corners | Aesthetic trails |
| 0.5 | Centripetal (default) | Balanced, no loops | General purpose |
| 1.0 | Chordal | Sharp corners, follows points tightly | Precision tracking |

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 5.2 RF016 — UnrealBloomPass Auto-Scale by GPU Tier (P1, Medium Effort)

**Component:** `EffectComposer` + `UnrealBloomPass` (post-processing)  
**Issue:** Fixed strength=1.0, radius=0.5, threshold=0.8 — too bright on mobile GPUs, causes thermal throttling  
**Current State:** Hardcoded bloom parameters  
**Proposed Refinement:** Benchmark GPU on startup, auto-scale bloom parameters  

### GPU Tier Detection:
```javascript
// modules/rendering/gpuBenchmark.js
class GPUBenchmark {
  static async run() {
    const canvas = document.createElement('canvas');
    canvas.width = 512; canvas.height = 512;
    const gl = canvas.getContext('webgl2', { preserveDrawingBuffer: false });
    
    // Shader stress test: 1000 particles, 60 frames
    const start = performance.now();
    for (let frame = 0; frame < 60; frame++) {
      renderParticleFrame(gl, 1000);
    }
    const elapsed = performance.now() - start;
    const fps = 60000 / elapsed;
    
    // Classify tier
    let tier;
    if (fps >= 55) tier = 'high';      // Desktop GPU, modern flagship
    else if (fps >= 30) tier = 'mid';  // Mid-range mobile, older desktop
    else tier = 'low';                  // Low-end mobile, integrated
    
    // Detect vendor/renderer for known devices
    const renderer = gl.getParameter(gl.RENDERER);
    const vendor = gl.getParameter(gl.VENDOR);
    
    return { tier, fps, renderer, vendor };
  }
  
  static getBloomConfig(tier) {
    const configs = {
      high: { strength: 1.0, radius: 0.6, threshold: 0.75, exposure: 1.2 },
      mid:  { strength: 0.6, radius: 0.4, threshold: 0.85, exposure: 1.0 },
      low:  { strength: 0.3, radius: 0.2, threshold: 0.95, exposure: 0.8 }
    };
    return configs[tier] || configs.mid;
  }
}

// Initialize on app start
async function initBloom() {
  const { tier } = await GPUBenchmark.run();
  const config = GPUBenchmark.getBloomConfig(tier);
  bloomPass.strength = config.strength;
  bloomPass.radius = config.radius;
  bloomPass.threshold = config.threshold;
  composer.exposure = config.exposure;
  
  // Allow manual override in settings
  settingsPanel.addSlider('bloom_strength', 0, 1.5, config.strength, 
    v => bloomPass.strength = v);
}
```

### Performance Targets:
| Tier | Bloom Cost | Target FPS | Thermal |
|------|------------|------------|---------|
| High | 2.5ms/frame | 60 | Safe |
| Mid | 5ms/frame | 45 | Warm |
| Low | 12ms/frame | 25 | Throttling risk |

### Fallback: Disable bloom entirely on `low` tier if FPS < 20 after 10s
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 5.3 RF029 — Theme System (CSS Variables + Auto-Switch) (P2, Low Effort)

**Component:** `bounce.html` inline styles, `Chart.js` hardcoded colors  
**Issue:** Fixed color scheme — no dark mode, no accessibility options  
**Current State:** Hardcoded hex colors throughout (`#00ff88`, `#1a1a2e`, etc.)  
**Proposed Refinement:** CSS custom properties + system preference detection  

### CSS Variable Architecture:
```css
/* bounce.html <style> or modules/ui/theme.css */
:root {
  /* Light theme (default) */
  --bg-primary: #0d1117;
  --bg-secondary: #161b22;
  --bg-tertiary: #21262d;
  --fg-primary: #e6edf3;
  --fg-secondary: #8b949e;
  --accent-primary: #00d4aa;
  --accent-secondary: #58a6ff;
  --accent-warning: #d29922;
  --accent-danger: #f85149;
  --border-color: #30363d;
  --trail-color: #00d4aa;
  --zone-colors: #ff6b6b, #4ecdc4, #ffe66d, #95e1d3, #f38181;
  
  --chart-grid: rgba(255,255,255,0.1);
  --chart-text: #8b949e;
}

@media (prefers-color-scheme: light) {
  :root {
    --bg-primary: #ffffff;
    --bg-secondary: #f6f8fa;
    --bg-tertiary: #eaeef2;
    --fg-primary: #1f2328;
    --fg-secondary: #656d76;
    --accent-primary: #007b5e;
    --accent-secondary: #0969da;
    --border-color: #d0d7de;
    --chart-grid: rgba(0,0,0,0.1);
    --chart-text: #656d76;
  }
}

/* High contrast mode */
@media (prefers-contrast: more) {
  :root {
    --fg-primary: #000000;
    --fg-secondary: #333333;
    --border-color: #000000;
    --accent-primary: #006600;
    --accent-danger: #cc0000;
  }
}

/* Reduced motion */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

### JavaScript Theme Controller:
```javascript
// modules/ui/themeController.js
class ThemeController {
  constructor() {
    this.themes = ['auto', 'dark', 'light', 'high-contrast'];
    this.current = localStorage.getItem('theme') || 'auto';
    this.apply(this.current);
    
    // Listen for system changes
    window.matchMedia('(prefers-color-scheme: dark)')
      .addEventListener('change', () => this.maybeAutoSwitch());
  }
  
  apply(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
    this.current = theme;
    this.updateCharts(); // Chart.js colors
    this.updateThreeJS(); // Three.js materials
  }
  
  maybeAutoSwitch() {
    if (this.current === 'auto') {
      this.apply('auto'); // Triggers CSS media queries
    }
  }
}
```

### Chart.js Integration:
```javascript
// Use CSS variables in chart options
const chartOptions = {
  plugins: {
    legend: { labels: { color: 'var(--chart-text)' } }
  },
  scales: {
    x: { grid: { color: 'var(--chart-grid)' }, ticks: { color: 'var(--chart-text)' } },
    y: { grid: { color: 'var(--chart-grid)' }, ticks: { color: 'var(--chart-text)' } }
  }
};
```

### Target: v1.0.94 | Status: Planned | Master List Ref: P2-04

---

*End of Piece 05/13*