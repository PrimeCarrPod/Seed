// simulation.frag - GPU Particle Simulation Shader
// Updates particle positions using physics on GPU

#version 300 es
precision highp float;

in vec2 vUv;
out vec4 fragColor;

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

#define WIDTH 512.0
#define HEIGHT 512.0
#define MAX_PARTICLES 150000

// Hash function for pseudo-random
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

// Get particle index from UV
int getIndex(vec2 uv) {
    return int(uv.y * WIDTH + uv.x);
}

void main() {
    vec2 uv = vUv;
    int idx = getIndex(uv);
    
    if (idx >= int(MAX_PARTICLES)) {
        fragColor = vec4(0.0);
        return;
    }
    
    // Read current position and velocity
    vec4 posData = texture(uPositionTexture, uv);
    vec4 velData = texture(uVelocityTexture, uv);
    
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
    
    // Leptons (0-5): electron, muon, tau, e_nu, mu_nu, tau_nu
    if (typeId < 6.0) {
        accel.x = sin(pos.y * 0.5 + t + primeInfluence + reinmanInfluence) + cos(pos.x * 0.5 - t * 0.7);
        accel.y = sin(pos.x * 0.5 - t * 0.8) + cos(pos.y * 0.5 - t);
        accel.z = sin(t * 0.5 + typeId) * 0.8;
    }
    // Quarks (6-11): up, down, charm, strange, top, bottom
    else if (typeId < 12.0) {
        float conf = uPrimeMode ? 1.5 : 1.0;
        accel.x = sin(t * 3.0 + typeId) * 1.2 * conf;
        accel.y = cos(t * 3.0 + typeId * 0.5) * 1.2 * conf;
        accel.z = sin(t * 2.0 + typeId) * 0.6 * conf;
    }
    // Gauge bosons (12-16): photon, gluon, w, z, graviton
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
    // Higgs (17)
    else if (typeId == 17.0) {
        accel = vec3(-pos.x * 0.002 + sin(t * 0.3) * 0.6, -pos.y * 0.002 + cos(t * 0.3) * 0.6, sin(t * 0.2) * 0.4) * 1.2;
    }
    // Hadrons (18-21): proton, neutron, pion, kaon
    else if (typeId < 22.0) {
        accel = vec3(sin(t + typeId) * 0.7, cos(t + typeId) * 0.7, sin(t * 0.4 + typeId) * 0.5) * dt;
    }
    // BSM/Exotic (22-25): demon, glueball, tardigrade, dark_matter
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
    
    // Write new position (keep typeId in alpha)
    fragColor = vec4(pos, typeId);
}