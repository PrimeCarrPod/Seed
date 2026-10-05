// GPUParticles.js - GPGPU Particle System for Ultimatev2
// Uses ping-pong render targets for position/velocity simulation on GPU

export class GPGPUParticleSystem {
    constructor(renderer, params = {}) {
        this.renderer = renderer;
        this.width = params.width || 512;
        this.height = params.height || 512;
        this.maxParticles = this.width * this.height;
        this.particleCount = Math.min(params.particleCount || 150000, this.maxParticles);
        
        // Ping-pong render targets for position and velocity
        this.positionRT = {
            read: this._createRenderTarget(),
            write: this._createRenderTarget()
        };
        this.velocityRT = {
            read: this._createRenderTarget(),
            write: this._createRenderTarget()
        };
        
        // Simulation material (fragment shader updates positions)
        this.simulationMaterial = this._createSimulationMaterial(params);
        
        // Render material (vertex shader reads position texture)
        this.renderMaterial = this._createRenderMaterial(params);
        
        // Quad geometry for simulation pass
        this.quadGeo = new THREE.PlaneGeometry(2, 2);
        
        // Simulation scene
        this.simScene = new THREE.Scene();
        this.simMesh = new THREE.Mesh(this.quadGeo, this.simulationMaterial);
        this.simScene.add(this.simMesh);
        
        // Render scene (points)
        this.renderScene = new THREE.Scene();
        this.particleGeo = new THREE.BufferGeometry();
        this._setupParticleGeometry();
        this.particleSystem = new THREE.Points(this.particleGeo, this.renderMaterial);
        this.renderScene.add(this.particleSystem);
        
        // Camera for simulation (orthographic, covers full texture)
        this.simCamera = new THREE.OrthographicCamera(-1, 1, 1, -1, 0, 1);
        
        // Camera for rendering
        this.renderCamera = params.camera || new THREE.PerspectiveCamera(60, window.innerWidth/window.innerHeight, 0.1, 2000);
        
        // Uniforms
        this.uniforms = this.simulationMaterial.uniforms;
        this.renderUniforms = this.renderMaterial.uniforms;
        
        // Initialize textures with particle data
        this._initializeTextures(params);
        
        // State
        this.time = 0;
        this.speed = 1.0;
        this.primeMode = false;
        this.reinmanMode = false;
        this.metaDepth = 3;
        this.swarmMode = false;
    }
    
    _createRenderTarget() {
        const rt = new THREE.WebGLRenderTarget(this.width, this.height, {
            minFilter: THREE.NearestFilter,
            magFilter: THREE.NearestFilter,
            format: THREE.RGBAFormat,
            type: THREE.FloatType,
            depthBuffer: false,
            stencilBuffer: false
        });
        rt.texture.generateMipmaps = false;
        return rt;
    }
    
    _createSimulationMaterial(params) {
        const vertexShader = `
            varying vec2 vUv;
            void main() {
                vUv = uv;
                gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
            }
        `;
        
        const fragmentShader = `
            uniform float uTime;
            uniform float uDeltaTime;
            uniform float uSpeed;
            uniform bool uPrimeMode;
            uniform bool uReinmanMode;
            uniform int uMetaDepth;
            uniform bool uSwarmMode;
            uniform sampler2D uPositionTexture;
            uniform sampler2D uVelocityTexture;
            uniform float uPrimeGaps[256];
            uniform float uPrimes[256];
            uniform float uParticleTypes;
            uniform float uParticleParams;
            
            varying vec2 vUv;
            
            // Hash function for pseudo-random
            float hash(vec2 p) {
                return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
            }
            
            // Get particle index from UV
            int getIndex(vec2 uv) {
                return int(uv.y * ${this.width.toFixed(1)} + uv.x);
            }
            
            // Get UV from particle index
            vec2 getUV(int idx) {
                return vec2(float(idx % ${this.width}), float(idx / ${this.width})) + 0.5;
            }
            
            void main() {
                vec2 uv = vUv;
                int idx = getIndex(uv);
                
                if (idx >= ${this.particleCount}) {
                    gl_FragColor = vec4(0.0);
                    return;
                }
                
                // Read current position and velocity
                vec4 posData = texture2D(uPositionTexture, uv);
                vec4 velData = texture2D(uVelocityTexture, uv);
                
                vec3 pos = posData.xyz;
                vec3 vel = velData.xyz;
                float typeId = posData.w;
                float life = velData.w;
                
                float dt = uDeltaTime * uSpeed;
                float t = uTime * uSpeed;
                
                // Prime gap influence
                float primeInfluence = 0.0;
                if (uPrimeMode) {
                    int gapIdx = idx % 256;
                    primeInfluence = uPrimeGaps[gapIdx] * 0.1;
                }
                
                // Reinman one-electron influence
                float reinmanInfluence = 0.0;
                if (uReinmanMode) {
                    reinmanInfluence = sin(t * 0.001) * 0.05;
                }
                
                // Meta-depth scaling
                float metaFactor = 1.0 + float(uMetaDepth) * 0.1;
                
                // Physics per particle type
                vec3 accel = vec3(0.0);
                
                // Leptons
                if (typeId < 6.0) { // electron, muon, tau, neutrinos
                    accel.x = sin(pos.y * 0.5 + t + primeInfluence + reinmanInfluence) + cos(pos.x * 0.5 - t * 0.7);
                    accel.y = sin(pos.x * 0.5 - t * 0.8) + cos(pos.y * 0.5 - t);
                    accel.z = sin(t * 0.5 + typeId) * 0.8;
                }
                // Quarks
                else if (typeId < 12.0) {
                    float conf = uPrimeMode ? 1.5 : 1.0;
                    accel.x = sin(t * 3.0 + typeId) * 1.2 * conf;
                    accel.y = cos(t * 3.0 + typeId * 0.5) * 1.2 * conf;
                    accel.z = sin(t * 2.0 + typeId) * 0.6 * conf;
                }
                // Gauge bosons
                else if (typeId < 17.0) {
                    if (typeId == 12.0) { // photon
                        accel = vec3(cos(typeId) * 14.0, sin(typeId) * 7.0, 10.0) * dt;
                    } else if (typeId == 13.0) { // gluon
                        accel.x = sin(pos.y * 2.0 + t * 2.0 + typeId) * 1.5;
                        accel.y = cos(pos.x * 2.0 + t * 2.0 + typeId) * 1.5;
                        accel.z = sin(t * 1.5 + typeId) * 1.0;
                    } else if (typeId == 14.0) { // w_boson
                        accel = vec3(sin(t * 2.0) * 3.0, cos(t * 2.0) * 3.0, sin(t) * 2.0);
                    } else if (typeId == 15.0) { // z_boson
                        accel = vec3(sin(t * 1.8) * 2.5, cos(t * 1.8) * 2.5, sin(t * 0.9) * 2.0);
                    } else { // graviton
                        accel = vec3(sin(t * 0.1) * 0.5, cos(t * 0.1) * 0.5, sin(t * 0.05) * 0.3);
                    }
                }
                // Higgs
                else if (typeId == 17.0) {
                    accel = vec3(-pos.x * 0.002 + sin(t * 0.3) * 0.6, -pos.y * 0.002 + cos(t * 0.3) * 0.6, sin(t * 0.2) * 0.4) * 1.2;
                }
                // Hadrons
                else if (typeId < 24.0) {
                    accel = vec3(sin(t + typeId) * 0.7, cos(t + typeId) * 0.7, sin(t * 0.4 + typeId) * 0.5) * dt;
                }
                // BSM / Exotic
                else {
                    accel = vec3(sin(t * 0.1 + typeId) * 0.3, cos(t * 0.1 + typeId) * 0.3, sin(t * 0.05 + typeId) * 0.2);
                }
                
                // Apply meta-depth
                accel *= metaFactor;
                
                // Apply prime gap holographic influence
                if (uPrimeMode) {
                    accel.x += sin(t * primeInfluence * 10.0) * 0.1;
                    accel.y += cos(t * primeInfluence * 10.0) * 0.1;
                }
                
                // Apply Reinman worldline influence
                if (uReinmanMode) {
                    float rFactor = 1.0 + sin(t * 0.001) * 0.2;
                    accel *= rFactor;
                }
                
                // Swarm cohesion
                if (uSwarmMode) {
                    // Simple cohesion toward center
                    vec3 center = vec3(0.0);
                    accel += (center - pos) * 0.01;
                }
                
                // Velocity integration (semi-implicit Euler)
                vel += accel * dt;
                pos += vel * dt * 1.5;
                
                // Boundary conditions (soft bounds)
                pos = clamp(pos, vec3(-60.0), vec3(60.0));
                if (abs(pos.x) > 55.0) pos.x *= 0.95;
                if (abs(pos.y) > 55.0) pos.y *= 0.95;
                if (abs(pos.z) > 55.0) pos.z *= 0.95;
                
                // Write new position and velocity
                gl_FragColor = vec4(pos, typeId);
                
                // Velocity in second render target (we'll handle separately)
                // Actually we need two passes - let's pack velocity in alpha or use second RT
            }
        `;
        
        return new THREE.ShaderMaterial({
            vertexShader,
            fragmentShader,
            uniforms: {
                uTime: { value: 0 },
                uDeltaTime: { value: 0 },
                uSpeed: { value: 1.0 },
                uPrimeMode: { value: false },
                uReinmanMode: { value: false },
                uMetaDepth: { value: 3 },
                uSwarmMode: { value: false },
                uPositionTexture: { value: null },
                uVelocityTexture: { value: null },
                uPrimeGaps: { value: new Float32Array(256) },
                uPrimes: { value: new Float32Array(256) },
                uParticleTypes: { value: 0 },
                uParticleParams: { value: 0 }
            }
        });
    }
    
    _createRenderMaterial(params) {
        const vertexShader = `
            uniform sampler2D uPositionTexture;
            uniform float uTime;
            uniform float uPointSize;
            
            varying vec3 vColor;
            varying float vSize;
            varying vec3 vPosition;
            
            void main() {
                vec2 uv = vec2(
                    (gl_VertexID % ${this.width}) / float(${this.width}),
                    floor(float(gl_VertexID) / ${this.width}) / float(${this.height})
                ) + vec2(0.5 / ${this.width}, 0.5 / ${this.height});
                
                vec4 posData = texture2D(uPositionTexture, uv);
                vec3 pos = posData.xyz;
                float typeId = posData.w;
                
                vPosition = pos;
                
                // Color by type
                vec3 colors[26];
                colors[0] = vec3(0.22, 0.74, 0.97);   // electron
                colors[1] = vec3(0.91, 0.47, 0.97);   // muon
                colors[2] = vec3(0.75, 0.52, 0.99);   // tau
                colors[3] = vec3(0.40, 0.91, 0.97);   // e_nu
                colors[4] = vec3(0.40, 0.91, 0.97);   // mu_nu
                colors[5] = vec3(0.40, 0.91, 0.97);   // tau_nu
                colors[6] = vec3(0.98, 0.75, 0.14);   // up
                colors[7] = vec3(0.38, 0.65, 0.98);   // down
                colors[8] = vec3(0.98, 0.75, 0.14);   // charm
                colors[9] = vec3(0.38, 0.65, 0.98);   // strange
                colors[10] = vec3(0.98, 0.75, 0.14);  // top
                colors[11] = vec3(0.38, 0.65, 0.98);  // bottom
                colors[12] = vec3(0.99, 0.94, 0.54);  // photon
                colors[13] = vec3(0.98, 0.45, 0.09);  // gluon
                colors[14] = vec3(0.98, 0.44, 0.52);  // w
                colors[15] = vec3(0.65, 0.55, 0.98);  // z
                colors[16] = vec3(0.82, 0.98, 0.89);  // graviton
                colors[17] = vec3(0.93, 0.28, 0.60);  // higgs
                colors[18] = vec3(0.96, 0.25, 0.37);  // proton
                colors[19] = vec3(0.58, 0.64, 0.72);  // neutron
                colors[20] = vec3(0.53, 0.94, 0.67);  // pion
                colors[21] = vec3(0.99, 0.83, 0.30);  // kaon
                colors[22] = vec3(0.30, 0.11, 0.58);  // demon
                colors[23] = vec3(0.98, 0.45, 0.09);  // glueball
                colors[24] = vec3(0.13, 0.83, 0.93);  // tardigrade
                colors[25] = vec3(0.12, 0.11, 0.29);  // dark_matter
                
                int idx = int(typeId + 0.5);
                if (idx >= 0 && idx < 26) {
                    vColor = colors[idx];
                } else {
                    vColor = vec3(0.5);
                }
                
                // Size by type
                float sizes[26] = float[26](
                    0.35, 0.6, 0.7, 0.25, 0.25, 0.25,
                    0.5, 0.5, 0.55, 0.55, 0.6, 0.6,
                    0.45, 0.4, 1.0, 1.0, 0.3,
                    1.2, 0.8, 0.75, 0.55, 0.6,
                    0.35, 1.4, 1.5, 1.0
                );
                vSize = sizes[idx] * uPointSize;
                
                vec4 mvPosition = modelViewMatrix * vec4(pos, 1.0);
                gl_PointSize = vSize * (300.0 / -mvPosition.z);
                gl_Position = projectionMatrix * mvPosition;
            }
        `;
        
        const fragmentShader = `
            varying vec3 vColor;
            varying float vSize;
            varying vec3 vPosition;
            
            uniform float uTime;
            uniform float uBloomStrength;
            
            void main() {
                // Radial gradient for point sprite
                float dist = length(gl_PointCoord - vec2(0.5));
                float alpha = 1.0 - smoothstep(0.0, 0.5, dist);
                alpha *= smoothstep(0.5, 0.0, dist);
                
                // Add pulse
                alpha *= 0.8 + 0.2 * sin(uTime * 3.0 + vPosition.x * 0.1);
                
                gl_FragColor = vec4(vColor, alpha);
            }
        `;
        
        return new THREE.ShaderMaterial({
            vertexShader,
            fragmentShader,
            uniforms: {
                uPositionTexture: { value: null },
                uTime: { value: 0 },
                uPointSize: { value: 1.0 },
                uBloomStrength: { value: 1.4 }
            },
            transparent: true,
            vertexColors: false,
            blending: THREE.AdditiveBlending,
            depthWrite: false
        });
    }
    
    _setupParticleGeometry() {
        // Create vertex IDs for the vertex shader to index into position texture
        const indices = new Uint32Array(this.particleCount);
        for (let i = 0; i < this.particleCount; i++) {
            indices[i] = i;
        }
        this.particleGeo.setIndex(new THREE.BufferAttribute(indices, 1));
        this.particleGeo.setDrawRange(0, this.particleCount);
    }
    
    _initializeTextures(params) {
        // Initialize position texture with particle data
        const posData = new Float32Array(this.width * this.height * 4);
        const velData = new Float32Array(this.width * this.height * 4);
        
        const types = [
            'electron', 'muon', 'tau', 'electron_neutrino', 'muon_neutrino', 'tau_neutrino',
            'up_quark', 'down_quark', 'charm_quark', 'strange_quark', 'top_quark', 'bottom_quark',
            'photon', 'gluon', 'w_boson', 'z_boson', 'graviton',
            'higgs',
            'proton', 'neutron', 'pion_plus', 'kaon_plus',
            'demon', 'glueball', 'tardigrade', 'dark_matter'
        ];
        
        const ratios = [
            0.12, 0.04, 0.02, 0.06, 0.04, 0.02,
            0.03, 0.03, 0.01, 0.01, 0.005, 0.005,
            0.05, 0.04, 0.01, 0.01, 0.01,
            0.01,
            0.05, 0.04, 0.02, 0.01,
            0.02, 0.015, 0.01, 0.03
        ];
        
        let cumsum = 0;
        const cumWeights = ratios.map(w => { cumsum += w; return cumsum; });
        
        for (let i = 0; i < this.particleCount; i++) {
            const r = Math.random() * cumsum;
            let typeIdx = cumWeights.findIndex(c => r <= c);
            if (typeIdx === -1) typeIdx = 0;
            
            const x = (Math.random() - 0.5) * 25;
            const y = (Math.random() - 0.5) * 25;
            const z = (Math.random() - 0.5) * 25;
            
            const idx = i * 4;
            posData[idx] = x;
            posData[idx + 1] = y;
            posData[idx + 2] = z;
            posData[idx + 3] = typeIdx; // type ID in alpha
            
            velData[idx] = 0;
            velData[idx + 1] = 0;
            velData[idx + 2] = 0;
            velData[idx + 3] = 1.0; // life
        }
        
        // Upload to textures
        const posTex = this.positionRT.read.texture;
        const velTex = this.velocityRT.read.texture;
        
        posTex.image.data = posData;
        posTex.needsUpdate = true;
        velTex.image.data = velData;
        velTex.needsUpdate = true;
        
        // Copy to write targets too
        this.renderer.copyTextureToTexture(posTex, this.positionRT.write.texture);
        this.renderer.copyTextureToTexture(velTex, this.velocityRT.write.texture);
    }
    
    // Prime data arrays (to be passed from main)
    setPrimeData(primes, gaps) {
        const primeArray = this.uniforms.uPrimes.value;
        const gapArray = this.uniforms.uPrimeGaps.value;
        
        for (let i = 0; i < Math.min(primes.length, 256); i++) {
            primeArray[i] = primes[i];
        }
        for (let i = 0; i < Math.min(gaps.length, 256); i++) {
            gapArray[i] = gaps[i];
        }
    }
    
    // Update uniforms
    updateUniforms(deltaTime) {
        this.time += deltaTime;
        
        this.uniforms.uTime.value = this.time;
        this.uniforms.uDeltaTime.value = deltaTime;
        this.uniforms.uSpeed.value = this.speed;
        this.uniforms.uPrimeMode.value = this.primeMode;
        this.uniforms.uReinmanMode.value = this.reinmanMode;
        this.uniforms.uMetaDepth.value = this.metaDepth;
        this.uniforms.uSwarmMode.value = this.swarmMode;
        
        this.renderUniforms.uTime.value = this.time;
        this.renderUniforms.uPositionTexture.value = this.positionRT.read.texture;
    }
    
    // Simulation step (GPU)
    simulate() {
        // Bind position texture as input
        this.uniforms.uPositionTexture.value = this.positionRT.read.texture;
        this.uniforms.uVelocityTexture.value = this.velocityRT.read.texture;
        
        // Render to write target
        this.renderer.setRenderTarget(this.positionRT.write);
        this.renderer.render(this.simScene, this.simCamera);
        this.renderer.setRenderTarget(null);
        
        // Swap read/write
        const temp = this.positionRT.read;
        this.positionRT.read = this.positionRT.write;
        this.positionRT.write = temp;
    }
    
    // Render particles
    render() {
        this.renderUniforms.uPositionTexture.value = this.positionRT.read.texture;
        this.renderer.render(this.renderScene, this.renderCamera);
    }
    
    // Full step
    step(deltaTime) {
        this.updateUniforms(deltaTime);
        this.simulate();
        this.render();
    }
    
    // Setters for mode toggles
    setSpeed(v) { this.speed = v; }
    setPrimeMode(v) { this.primeMode = v; }
    setReinmanMode(v) { this.reinmanMode = v; }
    setMetaDepth(v) { this.metaDepth = v; }
    setSwarmMode(v) { this.swarmMode = v; }
    setParticleCount(v) { 
        this.particleCount = Math.min(v, this.maxParticles);
        this.particleGeo.setDrawRange(0, this.particleCount);
    }
    
    // Cleanup
    dispose() {
        this.positionRT.read.dispose();
        this.positionRT.write.dispose();
        this.velocityRT.read.dispose();
        this.velocityRT.write.dispose();
        this.simulationMaterial.dispose();
        this.renderMaterial.dispose();
        this.quadGeo.dispose();
        this.particleGeo.dispose();
    }
}