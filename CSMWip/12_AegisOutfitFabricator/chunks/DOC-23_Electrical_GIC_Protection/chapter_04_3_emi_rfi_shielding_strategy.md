## 3. EMI/RFI Shielding Strategy

### 3.1 Frequency-Specific Protection
Different threat frequencies require tailored shielding approaches:

**ELF/VLF (0.001-30 kHz):**
- Primary defense: Dielectric chassis blocking
- Secondary: MXene absorption (magnetic component)
- Target SE: ≥120 dB (GIC mitigation)

**LF/HF (30 kHz-30 MHz):**
- MXene reflection dominant (high conductivity)
- Target SE: ≥100 dB
- Chassis provides dielectric isolation to prevent ground loops

**VHF/UHF (30 MHz-1 GHz):**
- Combined reflection/absorption
- Target SE: ≥100 dB
- Aperture effectiveness: <λ/10 for seams and holes

**Microwave (1-10 GHz):**
- Reflection dominant
- Target SE: ≥80 dB
- Seam conductivity: Continuous MXene layers prevent slot resonance

### 3.2 Seam and Aperture Control
Historical construction techniques provide natural EMI sealing:

**Seam Treatment:**
- Overlapping MXene layers at joints (50mm overlap)
- Conductive adhesive (silver-filled epoxy) at critical seams
- Historical stitching with metallic thread (Ag-coated nylon) for flexibility
- Seam conductivity: >10⁴ S/m (measured)

**Aperture Management:**
- Ventilation holes: Honeycomb pattern with diameter <λ/50
- Viewing lenses: Conductive coating (ITO) on sapphire
- Fasteners: Non-conductive (PEEK) with conductive washers
- Cable penetrations: Waveguide beyond cutoff (WBCO) designs
