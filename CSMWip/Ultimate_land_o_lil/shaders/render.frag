// render.frag - GPU Particle Render Fragment Shader
// Renders point sprites with radial gradient and color by type

#version 300 es
precision highp float;

in vec3 vColor;
in float vSize;
in vec3 vPosition;

out vec4 fragColor;

uniform float uTime;
uniform float uBloomStrength;

void main() {
    // Radial gradient for point sprite
    vec2 center = gl_PointCoord - vec2(0.5);
    float dist = length(center);
    
    // Smooth circular falloff
    float alpha = 1.0 - smoothstep(0.0, 0.5, dist);
    
    // Add subtle pulse based on time and position
    float pulse = 0.8 + 0.2 * sin(uTime * 2.0 + vPosition.x * 0.05 + vPosition.y * 0.03);
    alpha *= pulse;
    
    // Add slight color variation based on position
    vec3 finalColor = vColor * (0.9 + 0.1 * sin(uTime + vPosition.z * 0.1));
    
    // Bloom enhancement for bright particles
    float brightness = dot(finalColor, vec3(0.299, 0.587, 0.114));
    if (brightness > 0.7) {
        finalColor *= uBloomStrength;
    }
    
    fragColor = vec4(finalColor, alpha);
}