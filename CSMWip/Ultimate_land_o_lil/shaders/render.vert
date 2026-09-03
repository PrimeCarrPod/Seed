// render.vert - GPU Particle Render Vertex Shader
// Reads position from texture and transforms to clip space

#version 300 es
precision highp float;

in uint vertexID;
out vec3 vColor;
out float vSize;
out vec3 vPosition;

uniform sampler2D uPositionTexture;
uniform float uTime;
uniform float uPointSize;

#define WIDTH 512.0
#define HEIGHT 512.0
#define MAX_PARTICLES 150000

// Color palette for 26 particle types
vec3 colors[26];

void initColors() {
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
}

float sizes[26];

void initSizes() {
    sizes[0] = 0.35; sizes[1] = 0.6; sizes[2] = 0.7; sizes[3] = 0.25; sizes[4] = 0.25; sizes[5] = 0.25;
    sizes[6] = 0.5; sizes[7] = 0.5; sizes[8] = 0.55; sizes[9] = 0.55; sizes[10] = 0.6; sizes[11] = 0.6;
    sizes[12] = 0.45; sizes[13] = 0.4; sizes[14] = 1.0; sizes[15] = 1.0; sizes[16] = 0.3;
    sizes[17] = 1.2; sizes[18] = 0.8; sizes[19] = 0.75; sizes[20] = 0.55; sizes[21] = 0.6;
    sizes[22] = 0.35; sizes[23] = 1.4; sizes[24] = 1.5; sizes[25] = 1.0;
}

void main() {
    initColors();
    initSizes();
    
    uint idx = vertexID;
    
    if (idx >= uint(MAX_PARTICLES)) {
        gl_Position = vec4(0.0);
        gl_PointSize = 0.0;
        return;
    }
    
    // Calculate UV from vertex ID
    float u = float(idx % uint(WIDTH)) / WIDTH + 0.5 / WIDTH;
    float v = float(idx / uint(WIDTH)) / HEIGHT + 0.5 / HEIGHT;
    vec2 uv = vec2(u, v);
    
    // Read position from texture
    vec4 posData = texture(uPositionTexture, uv);
    vec3 pos = posData.xyz;
    float typeId = posData.w;
    
    vPosition = pos;
    
    // Get color by type
    int typeIdx = int(typeId + 0.5);
    if (typeIdx >= 0 && typeIdx < 26) {
        vColor = colors[typeIdx];
        vSize = sizes[typeIdx] * uPointSize;
    } else {
        vColor = vec3(0.5);
        vSize = 0.5 * uPointSize;
    }
    
    // Transform to clip space
    vec4 mvPosition = modelViewMatrix * vec4(pos, 1.0);
    gl_PointSize = vSize * (300.0 / -mvPosition.z);
    gl_Position = projectionMatrix * mvPosition;
}