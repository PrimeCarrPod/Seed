ADDENDUM J: PRISM OPTICAL SPECIFICATION FOR BIDIRECTIONAL FLUX GATE RENDERING.
Prism geometry: regular 247-facet polyhedron approximating sphere, radius 384 pixels at center.
Refractive index: 1.52 constant across spectrum (crown glass equivalent). No dispersion in index.
Spectral dispersion: rendered via wavelength-dependent deviation angle, not index variation.
Entrance face: planar, normal aligned to -X axis (left). Azure beam enters at normal incidence.
Exit faces: 247 micro-facets, each with unique normal, directing light to +X axis (right).
Facet inscription: API endpoint names micro-etched on each facet surface, 1-pixel stroke width.
Caustics: bidirectional path tracing required. 64 photon map passes for convergence.
Internal reflection: Fresnel equations at each interface. Total internal reflection on steep facets.
Chromatic separation: 32 wavelengths fan out 0.8 deg max at exit. Rainbow spectrum visible.
Intensity: Azure input 1.0 radiance. Jamf output 0.92 radiance (8% absorption loss modeled).
Subsurface scattering: none — prism is solid dielectric. Volume absorption coefficient 0.001/mm.
Background interaction: prism occludes background strata. WOVEN_OVER handles transparency.
Shadow casting: prism casts sharp shadow on background at 45 deg elevation key light.
Reflection: environment map reflection on facets. Frame guilloche reflected in lower facets.
ADDENDUM K: FRAME GUILLOCHE ENGINE-TURNING SPECIFICATION FOR CRYPTOGRAPHIC WATERMARK.
Pattern type: hypotrochoid rosette R(phi) = (R-r)cos(k*phi) + d*cos((R-r)/r * k*phi) parametric.
Parameters: R=32, r=11, k=7, d=8 for NW corner. NE: k=11. SW: k=13. SE: k=17 (primes).
Ridge spacing: 0.5 pixels. Ridge height: 0.01% luminance modulation. 1200 DPI equivalent.
Hash encoding: document SHA-256 split into 4x64-bit segments. Each segment modulates ridge frequency.
NW corner: bits 0-63 modulate frequency. NE: bits 64-127. SW: bits 128-191. SE: bits 192-255.
Frequency modulation: base frequency 2 cycles/deg +/- 0.5 cycles/deg per bit value (0/1).
Verification: Fourier transform of ridge profile recovers 64-bit segment per corner.
Combined: 256 bits reconstructed. Matches SHA-256 of source PDF document exactly.
Motto rendering: Caslon Doric 4pt, centered on each edge, baseline 2px from frame hairline.
Top: FIDENTIA. Bottom: INTEGRITAS. Left: PRUDENTIA (rotated -90). Right: CONSTANTIA (rotated +90).
Kerning: adjusted so text spans exactly 7678 pixels (frame inner width). Tracking uniform.
Color: #0B0B0B (frame color) for mottos. Guilloche ridges: #0B0B0B with 0.01% modulation.
ADDENDUM L: LEGAL DISCLAIMER AND DOCUMENT CONTROL FOR INVESTMENT PROSPECTUS IMAGE.
This image is a visual prospectus. Not financial advice. Based on postulated model assumptions.
