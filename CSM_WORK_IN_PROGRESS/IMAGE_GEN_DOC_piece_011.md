ADDENDUM A: DETAILED COLOR PALETTE SPECIFICATION FOR LLOYDS COMPLIANCE RENDERING.
Primary Indigo 0D1B2A: RGB (13, 27, 42) — used for deepest shadows, frame hairline, text anchors.
Primary Copper B87333: RGB (184, 115, 51) — used for midtone structural elements, prism edges, data lines.
Primary Gold FFD700: RGB (255, 215, 0) — used for highlights, aureole, key financial figures, trigger points.
Lloyds Navy 1B4F72: RGB (27, 79, 114) — used for conservative percentile bands, regulatory annotations.
Lloyds Adverse C8102E: RGB (200, 16, 46) — used for adverse scenario tornadoes, risk warnings, tail bands.
White FFFFFF: RGB (255, 255, 255) — used ONLY for Cup of Water pixel (0.0001 opacity) and QR modules.
Black 000000: RGB (0, 0, 0) — used ONLY for frame hairline #0B0B0B (near-black) and guilloche ridges.
Azure 0078D4: RGB (0, 120, 212) — used for Azure AD token stream entering prism from left side exactly.
Jamf Red E63946: RGB (230, 57, 70) — used for Jamf Pro MDM commands exiting prism right side exactly.
Spectral dispersion: 32 wavelengths linearly spaced 380-750nm. Each wavelength rendered separately.
Path tracing: 4096 samples per pixel per wavelength. Russian roulette termination after 8 bounces.
Bidirectional path tracing for caustics through prism. Photon mapping for aureole glow subsurface.
Microfacet GGX distribution for copper/indigo surfaces. Disney BRDF for gold emissive surfaces.
Volume scattering for atmospheric perspective in deep background strata. Heterogeneous media support.
ADDENDUM B: MICROTEXT FONT SPECIFICATIONS FOR ALL INSCRIPTIONS AT EVERY SCALE.
Frame mottos: Caslon Doric 4pt, optical size 4pt, tracking +50, all caps, baseline aligned to frame.
Financial tables: Bank of England engraved script, 6pt nominal, stroke width 0.3px, anti-aliased.
API microtext on prism facets: JetBrains Mono 2pt, 1-pixel x-height, subpixel positioning enabled.
Code microtext on app surfaces: Fira Code 2pt, ligatures disabled, 1-pixel x-height exactly.
Heuristic names on SOPP layer: IBM Plex Sans 5pt, semibold, all caps, letter-spacing 0.5px.
Particle mass labels: Latin Modern Math 3pt, italic for variables, upright for units, Unicode math.
Tornado axis labels: Noto Sans 4pt, rotated to follow spiral, perspective-corrected for 3D view.
Lloyds stamp text: Bank of England script 3pt, engraved stroke simulation, ridge modulation encoded.
QR code modules: 1-pixel perfect squares, quiet zone 4 modules, error correction level H (30%).
Test name tags: Handwriting font reconstructed from Williams Juilliard notebooks, 2px x-height.
Guilloche ridge text: Micro-engraving at 0.5-pixel ridge spacing, frequency-modulated for hash.
All fonts: hinted for 7680x7680 target resolution, no bitmap fallback, vector outlines only.
ADDENDUM C: RENDER FARM DISTRIBUTION SPECIFICATION FOR 8K SPECTRAL PATH TRACING.
Total pixels: 58,982,400 (7680 x 7680). Tiles: 64x64 pixels = 14,400 tiles total for distribution.
