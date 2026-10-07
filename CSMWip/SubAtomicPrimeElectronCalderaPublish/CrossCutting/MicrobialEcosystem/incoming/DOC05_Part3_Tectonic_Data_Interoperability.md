# DOCUMENT 5: Global Spatial Distribution Methodology
## Part 3 of 5: Tectonic Overprint Assessment, Data Management Schema, and Interoperability

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 130-140)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC05_Global_Spatial_Distribution_Methodology.md

---

## 5.8 Tectonic Overprint Assessment: Post-Depositional Alteration Screening

### 5.8.1 Types of Tectonic Overprint on Clay Deposits

| Overprint Type | Mechanism | Clay Mineralogical Effect | Diagnostic Criteria |
|----------------|-----------|--------------------------|---------------------|
| **Burial diagenesis** | T, P increase with depth | Smectite → Illite (S-I mixed layers) | Kübler index, %Illite layers, K₂O content |
| **Hydrothermal alteration** | Hot fluid circulation | Kaolinite → Dickite; Smectite → Chlorite | δ¹⁸O, δD, fluid inclusions, T > 150°C |
| **Metamorphism** | Regional T/P | Clay → Mica (phyllite, schist) | Crystallinity, polytypes, index minerals |
| **Fault-related** | Shear, fluid flow | Localized alteration halos | Fabric, veining, geochemical gradients |
| **Folding** | Pressure solution | Clay alignment, cleavage | S-C fabrics, pressure shadows |

### 5.8.2 Smectite-to-Illite Transition: The Burial Diagenesis Thermometer

**Reaction progress:**
$$\text{Smectite} \xrightarrow{\text{K}^+, T, t} \text{R1 I-S} \xrightarrow{} \text{R3 I-S} \xrightarrow{} \text{Illite}$$

**Kinetic model (Kisch, 1987; Środoń, 1984):**
$$\frac{dX}{dt} = A \exp\left(-\frac{E_a}{RT}\right) (1-X)^n$$

where $X$ = fraction illite layers

**Parameters:**
- $A \approx 10^{13}\ \text{s}^{-1}$
- $E_a \approx 200\text{--}250\ \text{kJ/mol}$
- $n \approx 1\text{--}2$

**Calibration (time-temperature index):**
$$\text{TTI} = \int_0^t \exp\left[\frac{E_a}{R}\left(\frac{1}{T_{\text{ref}}} - \frac{1}{T(\tau)}\right)\right] d\tau$$

With $T_{\text{ref}} = 100^\circ\text{C}$, $E_a = 220\ \text{kJ/mol}$

**%Illite layers vs TTI:**
| % Illite | TTI | Equivalent (100°C, 10 Myr) |
|----------|-----|---------------------------|
| 10% (R1) | 1 | 10 Myr |
| 30% (R1) | 5 | 50 Myr |
| 50% (R3) | 20 | 200 Myr |
| 70% (R3) | 100 | 1 Gyr |
| 90% (Illite) | 500 | 5 Gyr |

### 5.8.3 Screening Protocol for Primary vs Overprinted Clay

**Step 1: Crystallinity indices**
- **Kübler index (KI):** FWHM of 10Å peak
  - KI > 0.42°Δ2θ → Diagenetic (primary)
  - KI < 0.25°Δ2θ → Anchizone (overprinted)
- **Árkai index (AI):** FWHM of chlorite 002/004
  - Similar thresholds for chlorite crystallinity

**Step 2: Polytypism analysis**
- **1Md/1M ratio** (kaolinite): Increases with T
- **2M₁/1M ratio** (illite): Increases with T
- **Ordered vs disordered** I-S: Ordering = time × temperature

**Step 3: Geochemical tracers**
- **K₂O content:** Increases during S→I (K fixation)
- **δ¹⁸O:** Increases with T (equilibrium with water)
- **δD:** Decreases with T (equilibrium with water)
- **B, Li isotopes:** Sensitive to fluid-rock interaction

**Step 4: Textural criteria (SEM/TEM)**
- **Primary:** Booklets, vermiform, honeycomb (kaolinite); Flakes, honeycomb (smectite)
- **Overprinted:** Euhedral crystals, sutured contacts, pressure shadows

**Decision tree:**
```
IF KI > 0.42 AND %Illite < 10% AND K₂O < 2% AND texture = primary
    THEN "Primary detrital/pedogenic"
ELSE IF KI < 0.25 OR %Illite > 30% OR K₂O > 4% OR texture = overprinted
    THEN "Diagenetically overprinted"
ELSE
    THEN "Moderately overprinted — use with caution"
```

---

## 5.9 Data Management: Relational Schema for Global Clay Database

### 5.9.1 Database Design Principles

**Requirements:**
- Store heterogeneous data (point, polygon, raster, spectral, geochemical)
- Support versioning and provenance
- Enable spatial and attribute queries
- Interoperable with standards (OGC, ISO 19115, GeoSciML)

### 5.9.2 Core Entity-Relationship Schema

```sql
-- Main tables
CREATE TABLE site (
    site_id UUID PRIMARY KEY,
    name VARCHAR(255),
    country VARCHAR(100),
    geom GEOGRAPHY(POINT, 4326),
    elevation_m DECIMAL(8,2),
    access_notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE profile (
    profile_id UUID PRIMARY KEY,
    site_id UUID REFERENCES site(site_id),
    profile_name VARCHAR(100),
    classification_usda VARCHAR(100),
    classification_wrb VARCHAR(100),
    classification_fao VARCHAR(100),
    parent_material VARCHAR(200),
    land_use VARCHAR(100),
    vegetation VARCHAR(200),
    drainage_class VARCHAR(50),
    geom GEOGRAPHY(POINT, 4326),
    date_described DATE,
    described_by VARCHAR(200)
);

CREATE TABLE horizon (
    horizon_id UUID PRIMARY KEY,
    profile_id UUID REFERENCES profile(profile_id),
    horizon_designation VARCHAR(20),  -- e.g., 'Ap', 'Bt1', 'C'
    top_depth_cm DECIMAL(6,2),
    bottom_depth_cm DECIMAL(6,2),
    thickness_cm GENERATED ALWAYS AS (bottom_depth_cm - top_depth_cm) STORED,
    moist_color VARCHAR(20),  -- Munsell
    dry_color VARCHAR(20),
    structure_grade VARCHAR(20),
    structure_type VARCHAR(20),
    consistency_wet VARCHAR(20),
    consistency_dry VARCHAR(20),
    clay_percent_field DECIMAL(5,2),
    clay_percent_lab DECIMAL(5,2),
    silt_percent_lab DECIMAL(5,2),
    sand_percent_lab DECIMAL(5,2),
    bulk_density_gcm3 DECIMAL(4,2),
    particle_density_gcm3 DECIMAL(4,2),
    porosity_vol_frac DECIMAL(4,3),
    ph_h2o DECIMAL(3,1),
    ph_kcl DECIMAL(3,1),
    ec_dS_m DECIMAL(6,2),
    cec_cmol_kg DECIMAL(6,2),
    base_sat_pct DECIMAL(5,2),
    organic_carbon_pct DECIMAL(5,2),
    total_nitrogen_pct DECIMAL(5,3),
    carbonate_pct DECIMAL(5,2),
    gypsum_pct DECIMAL(5,2)
);

CREATE TABLE clay_mineralogy (
    mineralogy_id UUID PRIMARY KEY,
    horizon_id UUID REFERENCES horizon(horizon_id),
    method VARCHAR(50),  -- 'XRD-RIR', 'XRD-Rietveld', 'SEM-EDS'
    kaolinite_pct DECIMAL(5,2),
    smectite_pct DECIMAL(5,2),
    illite_pct DECIMAL(5,2),
    chlorite_pct DECIMAL(5,2),
    vermiculite_pct DECIMAL(5,2),
    halloysite_pct DECIMAL(5,2),
    dickite_pct DECIMAL(5,2),
    interstratified_pct DECIMAL(5,2),
    quartz_pct DECIMAL(5,2),
    feldspar_pct DECIMAL(5,2),
    goethite_pct DECIMAL(5,2),
    hematite_pct DECIMAL(5,2),
    gibbsite_pct DECIMAL(5,2),
    anatase_pct DECIMAL(5,2),
    other_minerals TEXT,
    i_s_percent_illite DECIMAL(5,2),
    i_s_ordering VARCHAR(20),  -- 'R0', 'R1', 'R3'
    kubler_index_deg DECIMAL(4,2),
    arakai_index_deg DECIMAL(4,2),
    analyzed_by VARCHAR(100),
    date_analyzed DATE
);

CREATE TABLE geochemistry (
    geochem_id UUID PRIMARY KEY,
    horizon_id UUID REFERENCES horizon(horizon_id),
    sample_type VARCHAR(50),  -- 'bulk', '<2um', 'oxide'
    sio2_pct DECIMAL(6,3),
    al2o3_pct DECIMAL(6,3),
    fe2o3_pct DECIMAL(6,3),
    feo_pct DECIMAL(6,3),
    mgo_pct DECIMAL(6,3),
    cao_pct DECIMAL(6,3),
    na2o_pct DECIMAL(6,3),
    k2o_pct DECIMAL(6,3),
    tio2_pct DECIMAL(6,3),
    p2o5_pct DECIMAL(6,3),
    mno_pct DECIMAL(6,3),
    loI_pct DECIMAL(6,3),
    -- Trace elements
    la_ppm DECIMAL(10,2),
    ce_ppm DECIMAL(10,2),
    nd_ppm DECIMAL(10,2),
    -- ... other REE
    zr_ppm DECIMAL(10,2),
    hf_ppm DECIMAL(10,2),
    nb_ppm DECIMAL(10,2),
    ta_ppm DECIMAL(10,2),
    th_ppm DECIMAL(10,2),
    u_ppm DECIMAL(10,2),
    -- Isotopes
    d13c_org_permil DECIMAL(6,2),
    d18o_clay_permil DECIMAL(6,2),
    dD_clay_permil DECIMAL(6,2),
    sr87_86_ratio DECIMAL(10,6),
    nd143_144_ratio DECIMAL(10,6),
    analysis_method VARCHAR(100),
    lab_name VARCHAR(100)
);

CREATE TABLE geophysics (
    geophysics_id UUID PRIMARY KEY,
    site_id UUID REFERENCES site(site_id),
    method VARCHAR(50),  -- 'VES', 'MT', 'Seismic', 'MASW', 'Borehole'
    line_name VARCHAR(100),
    station_id VARCHAR(50),
    geom GEOGRAPHY(POINT, 4326),
    depth_m DECIMAL(8,2),
    resistivity_ohmm DECIMAL(10,2),
    vp_ms DECIMAL(8,2),
    vs_ms DECIMAL(8,2),
    gr_api DECIMAL(8,2),
    sph_gcc DECIMAL(6,3),
    nphi_vol_frac DECIMAL(4,3),
    data_file_path VARCHAR(500),
    processed_by VARCHAR(100),
    date_acquired DATE
);

CREATE TABLE remote_sensing (
    rs_id UUID PRIMARY KEY,
    site_id UUID REFERENCES site(site_id),
    sensor VARCHAR(50),  -- 'ASTER', 'PRISMA', 'EnMAP', 'EMIT', 'AVIRIS-NG'
    scene_id VARCHAR(100),
    acquisition_date DATE,
    kaolinite_index DECIMAL(6,4),
    smectite_index DECIMAL(6,4),
    illite_index DECIMAL(6,4),
    clay_fraction_map_path VARCHAR(500),
    mineral_map_path VARCHAR(500),
    processing_level VARCHAR(20),  -- 'L1B', 'L2A', 'L3'
    atmospheric_correction VARCHAR(50),
    validation_rmse DECIMAL(6,3)
);

CREATE TABLE bibliography (
    bib_id UUID PRIMARY KEY,
    citation_text TEXT,
    doi VARCHAR(100),
    url VARCHAR(500),
    year INT,
    authors TEXT[],
    title TEXT,
    journal VARCHAR(200)
);

CREATE TABLE site_bibliography (
    site_id UUID REFERENCES site(site_id),
    bib_id UUID REFERENCES bibliography(bib_id),
    relevance VARCHAR(50),  -- 'primary', 'supporting', 'regional'
    PRIMARY KEY (site_id, bib_id)
);
```

### 5.9.3 Metadata Standards

**Minimum metadata per dataset (ISO 19115 / GeoSciML):**
- **Identification:** Title, abstract, purpose, status, point of contact
- **Spatial:** Extent (bbox), reference system (EPSG:4326), resolution
- **Temporal:** Extent (start/end date), resolution
- **Quality:** Lineage, positional accuracy, attribute accuracy, completeness
- **Distribution:** Format, access constraints, license (CC-BY-4.0 recommended)
- **Reference system:** Horizontal (WGS84), vertical (EGM2008)

**Controlled vocabularies (SKOS):**
- Clay mineral names (from IMA-CNMNC)
- Soil horizon designations (USDA, WRB)
- Analytical methods (XRD, XRF, ICP-MS, etc.)
- Sensor names (ASTER, PRISMA, etc.)

---

## 5.10 Interoperability: OneGeology, Macrostrat, EarthChem Integration

### 5.10.1 Target Integration Platforms

| Platform | Scope | Data Model | API | Clay Relevance |
|----------|-------|------------|-----|----------------|
| **OneGeology** | Global geological maps | GeoSciML 4.1 | WMS, WFS, WCS | Bedrock geology, surficial maps |
| **Macrostrat** | Stratigraphic columns | Custom (PostgreSQL/PostGIS) | REST, GraphQL | Stratigraphy, lithology, age |
| **EarthChem** | Geochemical data | EarthChem XML | REST, OAI-PMH | Whole-rock, mineral chemistry |
| **IUGS/CGI** | Global standards | GeoSciML, CGI vocabularies | — | Interoperability frameworks |
| **GBIF** | Biodiversity | Darwin Core | REST | Soil biodiversity links |

### 5.10.2 Mapping to GeoSciML 4.1

**Key GeoSciML classes for clay data:**

```xml
<!-- MappedGeologyFeature: Clay deposit -->
<MappedFeature gml:id="clay_deposit_001">
  <specification xlink:href="#clay_geologic_unit"/>
  <shape>...Polygon geometry...</shape>
</MappedFeature>

<GeologicUnit gml:id="clay_geologic_unit">
  <name>Costa Rica Oxisol Kaolinite Deposit</name>
  <geologicUnitType xlink:href="http://vocab.nerc.ac.uk/collection/P06/current/CLAY_DEPOSIT/"/>
  <rank xlink:href="http://www.opengis.net/def/nil/OGC/0/unknown"/>
  
  <composition>
    <UnitPart proportion="65">
      <role xlink:href="http://vocab.nerc.ac.uk/collection/P06/current/DOMINANT_MINERAL/"/>
      <material xlink:href="http://www.mindat.org/min-2125.html"/>  <!-- Kaolinite -->
    </UnitPart>
    <UnitPart proportion="20">
      <role xlink:href="http://vocab.nerc.ac.uk/collection/P06/current/SUBORDINATE_MINERAL/"/>
      <material xlink:href="http://www.mindat.org/min-3523.html"/>  <!-- Smectite -->
    </UnitPart>
    <UnitPart proportion="10">
      <role xlink:href="http://vocab.nerc.ac.uk/collection/P06/current/ACCESSORY_MINERAL/"/>
      <material xlink:href="http://www.mindat.org/min-1942.html"/>  <!-- Gibbsite -->
    </UnitPart>
  </composition>
  
  <age>
    <GeochronologicEra>Holocene</GeochronologicEra>
  </age>
  
  <description>Deeply weathered tropical kaolinite-gibbsite deposit</description>
</GeologicUnit>
```

### 5.10.3 Macrostrat Integration

**Macrostrat units → Clay provinces:**

```sql
-- Link clay profiles to Macrostrat units
CREATE TABLE clay_macrostrat_link (
    profile_id UUID REFERENCES profile(profile_id),
    macrostrat_unit_id BIGINT,  -- Macrostrat unit ID
    macrostrat_column_id BIGINT,
    confidence DECIMAL(3,2),  -- 0.0-1.0
    link_method VARCHAR(50),  -- 'spatial', 'lithology', 'age', 'manual'
    notes TEXT
);
```

**Query example:** Get all clay profiles in Cretaceous units
```sql
SELECT c.*, m.unit_name, m.age_top_ma, m.age_bottom_ma, m.lithology
FROM clay_macrostrat_link cml
JOIN profile p ON cml.profile_id = p.profile_id
JOIN macrostrat.units m ON cml.macrostrat_unit_id = m.id
WHERE m.age_top_ma >= 66 AND m.age_bottom_ma <= 145
  AND m.lithology ILIKE '%clay%' OR m.lithology ILIKE '%mudstone%' OR m.lithology ILIKE '%shale%';
```

### 5.10.4 EarthChem Integration

**EarthChem sample registration:**
```xml
<sample>
  <igsn>IECLY001ABC</igsn>
  <name>Costa Rica Oxisol Bt horizon</name>
  <description>Kaolinite-gibbsite horizon at 120 cm depth</description>
  <latitude>9.7489</latitude>
  <longitude>-83.7534</latitude>
  <elevation>370</elevation>
  <material>Clay</material>
  <purpose>Research</purpose>
  <collection_method>Hand auger</collection_method>
  <collector>J. Researcher</collector>
  <collection_date>2024-03-15</collection_date>
</sample>
```

**Chemical analysis submission:**
- Link to IGSN
- Method metadata (XRF, ICP-MS, XRD)
- Reference materials used
- Uncertainty estimates

### 5.10.5 FAIR Compliance Checklist

| Principle | Requirement | Implementation |
|-----------|-------------|----------------|
| **Findable** | Persistent identifiers (DOI, IGSN) | All sites, profiles, samples get DOIs/IGSNs |
| | Rich metadata | ISO 19115 + GeoSciML |
| | Registered in index | GeoNetwork, DataCite |
| **Accessible** | Standard protocols | OGC WMS/WFS/WCS, REST APIs |
| | Authentication/authorization | OAuth2, OpenID Connect |
| | Metadata always available | Even if data restricted |
| **Interoperable** | Standard vocabularies | IMA-CNMNC, CGI, NERC |
| | Standard formats | GeoJSON, GeoPackage, NetCDF, CSV |
| | Qualified references | Links to related data (ORCID, ROR) |
| **Reusable** | Clear license | CC-BY-4.0 or CC0 |
| | Provenance | Full lineage (field → lab → database) |
| | Community standards | OneGeology, EarthChem, Macrostrat |

---

*End of Part 3 — Continue to Part 4: Advanced Statistical Methods, Machine Learning, and Validation Frameworks*