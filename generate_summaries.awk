#!/usr/bin/awk -f
BEGIN {
    FS = ","
    OFS = ","
}

# Function to escape CSV field
function csv_escape(str) {
    if (str ~ /[",\n]/) {
        gsub(/"/, "\"\"", str)
        return "\"" str "\""
    }
    return str
}

# Function to generate summary based on project info
function generate_summary(state, parent, project, path, filecount, existing_summary, has_readme, category) {
    # Keep existing meaningful summary
    if (existing_summary != "" && existing_summary !~ /^#/ && existing_summary != "N/A") {
        return existing_summary
    }

    # Determine effective parent: use Category if ParentProject is N/A but Category indicates a parent
    effective_parent = parent
    if (parent == "N/A" && category != "TopLevel" && category != "") {
        effective_parent = category
    }

    # Top-level projects: ParentProject=N/A AND Category=TopLevel, or known top-level names
    is_toplevel = 0
    if (parent == "N/A" && category == "TopLevel") is_toplevel = 1
    if (project == "CSMApps" || project == "CSMArchive" || project == "CSM-Brandoutreach" || project == "CSMCinema" || project == "CSMDropBox" || project == "CSMFAB" || project == "CSMGen" || project == "CSMGrantCampaigns" || project == "CSMHuman" || project == "CSMIncoming" || project == "CSMLogs" || project == "CSMMetal" || project == "CSMMinesMagnets" || project == "CSMPrePublish" || project == "CSMPro" || project == "CSMProtonics" || project == "CSMPublished" || project == "CSMQuantum" || project == "CSMRadio" || project == "CSMReach" || project == "CSMScripts" || project == "CSMSOPP" || project == "CSMSOPPv2" || project == "CSMSubatomic082026" || project == "CSMWip" || project == "CSMWipScripts" || project == "CSM_WORK_IN_PROGRESS" || project == "DeepResearch" || project == "landing-page" || project == "LEGAL-ENACTMENT" || project == "PrimeBookOne" || project == "__PUBLISH_CSM__" || project == "__Python_Tools" || project == "RESTART_PACKAGE" || project == "scripts" || project == ".sdk" || project == "TardigradiaTGPU" || project == "csmlogs" || project == "memory") is_toplevel = 1

    if (is_toplevel) {
        if (project == "CSMApps") return "# Seed \u2014 Core application ecosystem containing Bounce (TAF/DMV vehicle mesh network), CarForge, landolil, Marmalade, Vertebrae, and release management"
        if (project == "CSMArchive") return "Archival storage for legacy projects; contains V3-Compendiums (next-gen integrated documentation)"
        if (project == "CSM-Brandoutreach") return "Brand outreach and marketing materials"
        if (project == "CSMCinema") return "Cinematic production pipeline using Godot 3D; includes master scripts, storyboards, scene details, and resume/portfolio assets"
        if (project == "CSMDropBox") return "File dropbox / temporary storage utility"
        if (project == "CSMFAB") return "# Seed \u2014 Massive fabrication research portfolio (8000+ files) covering Project AEGIS (Carrington event resilience), drone designs, smart materials, home hardening, and 100+ individual research projects"
        if (project == "CSMGen") return "Agent generation pipeline and communications architecture (CSMAegis subproject)"
        if (project == "CSMGrantCampaigns") return "Grant proposal campaigns and funding applications (GrantProposals subproject)"
        if (project == "CSMHuman") return "# Seed \u2014 Human frequency interaction research: 40+ deep research projects on vibration/EMF-body interactions, resonance frequencies, ultrasonic vibrometry, and neurological impacts"
        if (project == "CSMIncoming") return "CSMIncoming \u2014 Intelligence, Submissions, and the Inbox of the Unknown"
        if (project == "CSMLogs") return "Centralized logging and session tracking; 2000+ files across subatomic research, legal enactment, TGApp ecosystem, Land of Lil, publishing outreach, and heartbeat monitoring"
        if (project == "CSMMetal") return "CSMMetal \u2014 Dielectric materials and electromagnetic protection research; vibration-dampening safety, microwave-proof materials, EMF protection"
        if (project == "CSMMinesMagnets") return "Mining and magnetics research (chunks subproject)"
        if (project == "CSMPrePublish") return "Pre-publication staging area; corrupted files recovery and placeholder articles"
        if (project == "CSMPro") return "CSMPro \u2014 Infrastructure resilience proposals; encompasses CSMBoard (business), CSMInvestor, CSMMag (rare-earth-free magnets), CSMMech (EM battlerobotics), CSMPark (theme park dielectric refab), bridge resilience reports, evacuation/fuel/rail/transport/water proposals, CSMTest, CSMVessel (maritime EM resilience)"
        if (project == "CSMProtonics") return "CSMProtonics \u2014 Protonic communication and future systems design"
        if (project == "CSMPublished") return "Published output repository: flagship papers, subatomic canonical, Caldera prime pi electron, synthesis compendiums, LaTeX publications, read-aloud versions"
        if (project == "CSMQuantum") return "# Seed \u2014 Quantum research delegation directory; 12 focused projects on MXene shielding, ZrB2-SiC composites, YInMn blue crystal field, perovskite quantum dots, aerogel networks, MAX phases, dielectric interfaces, flash sintering, CoAl2O4 spinel, PVDF piezoelectric, protonic ceramics, MR fluid dynamics"
        if (project == "CSMRadio") return "CSMRadio \u2014 Audio production and broadcasting; Agents of Aegis Radio, commercials, radio generator scripts, radio preparation, Aegis GitHub README radio"
        if (project == "CSMReach") return "CSMReach \u2014 Diplomatic and commercial outreach; 2750 files across AEGIS Covenant, dossiers, email correspondence, evaluations, insurance, corporate ACS profiles (SpaceX, Tesla, Rivian, Lucid, Helion, etc.), media correspondence, grants"
        if (project == "CSMScripts") return "CSMScripts \u2014 Automation, utilities, and operational tools; CarrPod no-Gradle Android APK toolkit, log processing, earthbeat data, freenemo modules, git recovery, heartbeat, Kilo workspace, tokenring versions"
        if (project == "CSMSOPP") return "CSMSOPP \u2014 Standard Operating Procedures and Protocols; Baker Street, Citadel, El Segundo, Guide, Keymaker, Module/Module-V2 (Williams Heuristic), Research, Robbins Heuristic, Solara, Spruce-Drake, Starlight, Zirconia, Williams-V3"
        if (project == "CSMSOPPv2") return "CSMSOPPv2 \u2014 Updated SOPs with Heuristics module"
        if (project == "CSMSubatomic082026") return "Archived subatomic research (Sept 2026): current releases, WIP, landolil engine, organized library, prime electron foundation, SubAtomic.Edu, TardigradiaTGPU"
        if (project == "CSMWip") return "CSMWip \u2014 Primary active work-in-progress (10,730 files); SubAtomic prime electron canonical, Caldera prime pi electron, legal enactment, BOUNCE (TAF/DMV mesh), Land of Lil, subatomic extensions, deep research, project tracking, prime electron synthesis, TGApp, Aegis outfit fabricator, CSMMinesMagnets"
        if (project == "CSMWipScripts") return "CSMWipScripts \u2014 WIP automation scripts; AegisIronMan, RESTART_PACKAGE"
        if (project == "CSM_WORK_IN_PROGRESS") return "Work in progress container; SubAtom_WIP"
        if (project == "DeepResearch") return "# Seed \u2014 Deep research repository (898 files); 1920s radio design, ancient quartz illumination, artificial hemoglobin, asteroid Psyche, Atlas jaw health, canine neurobiology, CarrPod logo, content files, crustal displacement, CSMGen study, fermentations, GitHub repo manager, disaster timelines, King List, Masonic history, Mayan 2040, mega analysis, microbial ecosystems, mythology, Oak Island, photonic vs electronic GPU, plasma spirits, pressure vessels, remaining projects, Tardigradia, The Mammal, tracing humanity, US presidential powers, war on demographics"
        if (project == "landing-page") return "# Carrington Storm Motors \u2014 Project AEGIS Landing Page"
        if (project == "LEGAL-ENACTMENT") return "# Seed \u2014 Legislative enactment portfolio; 60+ Acts covering critical infrastructure, domestic minerals, nuclear energy, clean manufacturing, bridge modernization, wildfire prevention, carbon removal, supply chain, water infrastructure, coastal ports, workforce, energy storage, critical minerals, cybersecurity, hydrogen, aviation fuels, water recycling, broadband, carbon capture, EV charging, climate resilience, sustainable buildings, grid modernization, advanced manufacturing, environmental remediation, offshore wind, public transit, solar, nuclear waste, precision agriculture, ocean resources, quantum computing, biomedical research, space exploration, AI safety, advanced materials, mental health, wildland fire, digital identity, supply chain resilience, semiconductor packaging, paid leave, clean energy tax credits, school infrastructure, SMR nuclear, affordable housing, geothermal, public health, offshore minerals, rural broadband, hydrogen hubs, cybersecurity workforce, carbon border adjustment, disaster insurance, advanced geothermal, hydrogen industrial, forest carbon, ocean carbon capture, advanced solar, long-duration storage"
        if (project == "PrimeBookOne") return "Prime Book One \u2014 Primary publication draft"
        if (project == "__PUBLISH_CSM__") return "Publishing pipeline for CSM; SAPECPublish subproject"
        if (project == "__Python_Tools") return "Shared Python automation utilities and tooling"
        if (project == "RESTART_PACKAGE") return "Session restart package with TODO"
        if (project == "scripts") return "Miscellaneous scripts"
        if (project == ".sdk") return "Android SDK and Gradle toolchain (android-sdk, gradle-8.4, gradle-cache)"
        if (project == "TardigradiaTGPU") return "Tardigradia TGPU research with landolil subproject"
        if (project == "csmlogs") return "Legacy logs (aug26, august26, caldera)"
        if (project == "memory") return "Memory/storage directory"
        return project " \u2014 " state " (" filecount " files)"
    }

    # Sub-projects by parent
    if (effective_parent == "CSMApps") {
        if (project == "Bounce") return "# Bounce \u2014 TAF/DMV Vehicle Mesh Network (4866 files, active)"
        if (project == "CarForge") return "CarForge \u2014 Vehicle design and fabrication subproject (minimal files)"
        if (project == "landolil") return "landolil \u2014 Subproject with 241 files (active Oct 2026)"
        if (project == "Marmalade") return "Marmalade \u2014 Lightweight subproject (15 files)"
        if (project == "Vertebrae") return "Vertebrae \u2014 Core framework subproject (5 files)"
        if (project == "Vertebrae-Extension") return "Vertebrae-Extension \u2014 Extension to Vertebrae framework (4 files)"
        if (project == "_Current_Releases") return "Current releases archive (2 files)"
        if (project == "_Past_Releases") return "Past releases archive (8 files)"
    }

    if (effective_parent == "CSMArchive") {
        if (project == "V3-Compendiums") return "V3-Compendiums \u2014 The Next Generation of Integrated Documentation (61 files, has README)"
    }

    if (effective_parent == "CSMCinema") {
        if (project == "GODOT_3D") return "Godot 3D engine integration for cinematic pipeline (11 files)"
        if (project == "MASTER_SCRIPT") return "Master script v1 for cinematic production (12 files)"
        if (project == "MASTER_SCRIPT_V2") return "Master script v2 for cinematic production (12 files)"
        if (project == "Resume") return "Resume and portfolio assets (9 files)"
        if (project == "SCENE_DETAILS") return "Scene detail documentation (21 files)"
        if (project == "Scripts") return "Production scripts (5 files)"
        if (project == "STORYBOARD") return "Storyboard assets (11 files)"
        if (project == "V2_ADDENDUM") return "Version 2 addendum documentation (12 files)"
        if (project == "WIP") return "Work in progress \u2014 active cinematic development (99 files, updated Oct 2026)"
    }

    # CSMFAB subprojects (100+)
    if (effective_parent == "CSMFAB") {
        if (project ~ /AEGIS|Aegis/) return project " \u2014 Project AEGIS Carrington event resilience research (" filecount " files)"
        if (project ~ /DRONE|Drone/) return project " \u2014 Drone redesign and propulsion research (" filecount " files)"
        if (project ~ /POCKET|Pocket/) return project " \u2014 Pocket-Watch-X wearable device research (" filecount " files)"
        if (project ~ /FEATHER|LoRa/) return project " \u2014 FEATHER LoRa mesh network node (" filecount " files)"
        if (project ~ /BIRD|UAS/) return project " \u2014 Archemedian spiraling bird UAS sub-250g wind research (" filecount " files)"
        if (project ~ /SMART_ROPE|Smart.Rope|Smart_Muscle/) return project " \u2014 Smart rope actuator / muscle design (" filecount " files)"
        if (project ~ /GRID-SEED|DEW-CATCHER|COLD-ROOT|AEGIS-HAVEN|CARR-LIBRARY|N-NODE|CORE-1|SHARE-POD|EARTH-PULSE|GRID-HEART|CARR-SONGS|CARR-FORGE/) return project " \u2014 Infrastructure resilience node/project (" filecount " files)"
        if (project ~ /LONSDALEITE|BIO-PATH|BIO-COMPATIBLE|MANA-FIRE|AEGIS-IRON|DEEP/) return project " \u2014 Advanced materials / bio-compatibility research (" filecount " files)"
        if (project ~ /CUSTACEAN|INCURSION|TESTA-FLEET|MASTER.COST|MATERIALS.STUDY/) return project " \u2014 Fleet/vessel class or master analysis (" filecount " files)"
        if (project ~ /^CSMFAB-P00[0-9]/) return project " \u2014 Infrastructure hardening proposal (" filecount " files)"
        if (project ~ /BOM-REGISTRY|CLOUD-NEST|FLUID-DAMP|PROTONIC-HFET|STELLAR-TINT|ULNAR-REST/) return project " \u2014 Component registry or research module (" filecount " files)"
        if (project ~ /^CSMFAB[0-9]{4}/) {
            num = substr(project, 8, 4)
            return project " \u2014 AEGIS research project #" num " (" filecount " files)"
        }
        if (project ~ /^CSMFAB[0-9]{3}[A-Z]/) return project " \u2014 AEGIS research project (" filecount " files)"
    }

    if (effective_parent == "CSMGen") {
        if (project == "CSMAegis") return "CSMAegis \u2014 Agent generation subproject (5 files)"
    }

    if (effective_parent == "CSMGrantCampaigns") {
        if (project == "GrantProposals") return "GrantProposals \u2014 Funding applications and proposals (24 files)"
    }

    # CSMHuman subprojects (40+)
    if (effective_parent == "CSMHuman") {
        if (project ~ /Mirror/) return project " \u2014 Mirror fascination / gazing neurological research (" filecount " files)"
        if (project ~ /Frequency|frequency/) return project " \u2014 Human body frequency interaction research (" filecount " files)"
        if (project ~ /Vibration|vibration/) return project " \u2014 Vibration impact on human body research (" filecount " files)"
        if (project ~ /EM|Electrical/) return project " \u2014 EM frequency / electrical current body interaction (" filecount " files)"
        if (project ~ /Ultrasonic|RBC|Vibrometry/) return project " \u2014 Ultrasonic vibrometry / blood research (" filecount " files)"
        if (project ~ /Sound|Healing/) return project " \u2014 Sound frequencies for healing research (" filecount " files)"
        if (project ~ /Aegis.Embark|Carrington/) return project " \u2014 AEGIS Carrington storm protection for humans (" filecount " files)"
        if (project ~ /Deep|Research|Dive|Synthesis/) return project " \u2014 Deep research synthesis on frequency-body interactions (" filecount " files)"
    }

    if (effective_parent == "CSMLogs") {
        if (project == "01_SubAtomic_Prime_Electron_Canonical") return "SubAtomic prime electron canonical research (197 files)"
        if (project == "02_Caldera_Prime_Pi_Electron") return "Caldera prime pi electron research (9 files)"
        if (project == "03_Legal_Enactment") return "CSMGen \u2014 Agent generation, pipeline, and communications architecture (78 files, has README)"
        if (project == "04_TGApp_Ecosystem") return "TGApp ecosystem development (48 files)"
        if (project == "05_Land_of_Lil") return "Land of Lil subproject (4 files)"
        if (project == "06_SubAtomic_Extensions") return "SubAtomic extensions (4 files)"
        if (project == "07_DeepResearch_SubParticles") return "Deep research on subparticles (23 files)"
        if (project == "08_Project_Tracking") return "Project tracking and management (20 files)"
        if (project == "09_Prime_Electron_Caldera_Synthesis") return "Prime electron Caldera synthesis (12 files)"
        if (project == "10_AegisOutfitFabricator") return "Aegis outfit fabricator (47 files)"
        if (project == "11_Publishing_Outreach") return "Publishing and outreach (21 files)"
        if (project == "12_CSM_Cinema_Godot") return "CSM Cinema Godot integration (5 files)"
        if (project == "13_CSM_CLS_Cascade") return "CSM CLS Cascade (18 files)"
        if (project == "15_CSMRadio_Aegis") return "CSM Radio Aegis integration (1 file)"
        if (project == "General_Sessions") return "# Seed \u2014 General session logs (1572 files, has README)"
        if (project == "heartbeat") return "Heartbeat monitoring (3 files)"
        if (project == "Heartbeat_Logs") return "Heartbeat logs (2 files)"
    }

    if (effective_parent == "csmlogs") {
        return project " \u2014 Legacy log archive (" filecount " files)"
    }

    if (effective_parent == "CSMMetal") {
        if (project ~ /Vibration|Dampening|Mitigation/) return project " \u2014 Vibration dampening safety products (" filecount " files)"
        if (project ~ /Bio-Sync|Bio/) return project " \u2014 Bio-sync seat cushion research (" filecount " files)"
        if (project ~ /Microwave|microwave/) return project " \u2014 Microwave-proof material design (" filecount " files)"
        if (project ~ /EMF|Color/) return project " \u2014 EMF protection color scheme derivation (" filecount " files)"
        if (project ~ /Induction/) return project " \u2014 Reimagining products for induction events (" filecount " files)"
        if (project ~ /Bridge|Carrington/) return project " \u2014 Bridge failure analysis for Carrington event (" filecount " files)"
    }

    if (effective_parent == "CSMMinesMagnets") {
        if (project == "chunks") return "chunks \u2014 Mining data chunks (8 files)"
    }

    if (effective_parent == "CSMPrePublish") {
        if (project == "Corrupted_Files") return "Corrupted_Files \u2014 File recovery (49 files)"
        if (project == "Placeholder_Articles") return "Placeholder_Articles \u2014 Article placeholders (3 files)"
    }

    if (effective_parent == "CSMPro") {
        if (project ~ /^CSMBoard/) return "CSMBiz \u2014 Business planning and commercial strategy (6 files, has README)"
        if (project ~ /^CSMInvestor/) return "Investor relations and pitch materials (206 files)"
        if (project ~ /^CSMMag/) return "CSMMag \u2014 Rare-earth-free magnet research and industry analysis (11 files, has README)"
        if (project ~ /^CSMMech/) return "CSMMech \u2014 Robotics for the electromagnetic battlespace (27 files, has README)"
        if (project ~ /^csm_nasa/) return "NASA collaboration materials (18 files)"
        if (project ~ /^CSMPark/) return "CSMPark \u2014 Theme park dielectric refabrication (8 files, has README)"
        if (project ~ /^CSMPRO02/) return "Bridge resilience against Carrington storms (6 files)"
        if (project ~ /CSMPRO03/) return "Bridge resilience report tailoring (5 files)"
        if (project ~ /^CSMPRO04/) return "Pittsburgh bridge retrofit proposal (5 files)"
        if (project ~ /^CSMPRO05/) return "Seattle bridge resilience report tailoring (5 files)"
        if (project ~ /^CSMProEvac2026/) return "Aegis evacuation protocols for Carrington event (5 files)"
        if (project ~ /^CSMProFuelTransport/) return "Aegis fuel infrastructure Carrington resilience (5 files)"
        if (project ~ /^CSMProRail2026/) return "Aegis rail protection proposal (5 files)"
        if (project ~ /^CSMProTransport2026/) return "Aegis transport resilience proposal (5 files)"
        if (project ~ /^CSMProWaterTransport/) return "Aegis water system Carrington resilience (5 files)"
        if (project ~ /^CSMTest/) return "CSMTest \u2014 Product testing, validation, and performance verification (6 files, has README)"
        if (project ~ /^CSMVessel/) return "CSMVessel \u2014 Maritime electromagnetic resilience and fleet architecture (1030 files, has README)"
    }

    if (effective_parent == "CSMProtonics") {
        return "CSMProtonics01 \u2014 Protonic communication and future systems design (5 files)"
    }

    if (effective_parent == "CSMPublished") {
        if (project == "01_Flagship_Papers") return "Flagship research papers (16 files)"
        if (project == "02_SubAtomic_Canonical") return "SubAtomic canonical publications (102 files)"
        if (project == "03_Caldera_Prime_Pi_Electron") return "Caldera prime pi electron publications (15 files)"
        if (project == "04_Synthesis_Compendiums") return "Synthesis compendiums (20 files)"
        if (project == "05_LaTeX_Publications") return "LaTeX formatted publications (27 files)"
        if (project == "06_ReadAloud_Versions") return "Read-aloud audio versions (5 files)"
    }

    if (effective_parent == "CSMQuantum") {
        if (project == "00-MASTER-INDEX") return "# 00-MASTER-INDEX \u2014 Quantum Research Delegation Directory (3 files, has README)"
        if (project == "01-MXene-Shielding-Optimization") return "# 01-MXene-Shielding-Optimization (3 files, has README)"
        if (project == "02-ZrB2-SiC-Composite-Design") return "# 02-ZrB2-SiC-Composite-Design (3 files, has README)"
        if (project == "03-YInMn-Blue-Crystal-Field") return "# 03-YInMn-Blue-Crystal-Field (3 files, has README)"
        if (project == "04-Perovskite-Quantum-Dot-Stability") return "# 04-Perovskite-Quantum-Dot-Stability (3 files, has README)"
        if (project == "05-Aerogel-Network-Optimization") return "# 05-Aerogel-Network-Optimization (3 files, has README)"
        if (project == "06-MAX-Phase-Discovery-Space") return "# 06-MAX-Phase-Discovery-Space (3 files, has README)"
        if (project == "07-Dielectric-Interface-Design") return "# 07-Dielectric-Interface-Design (3 files, has README)"
        if (project == "08-Flash-Sintering-Physics") return "# 08-Flash-Sintering-Physics (3 files, has README)"
        if (project == "09-CoAl2O4-Spinel-Engineering") return "# 09-CoAl2O4-Spinel-Engineering (3 files, has README)"
        if (project == "10-PVDF-Piezoelectric-Domains") return "# 10-PVDF-Piezoelectric-Domains (3 files, has README)"
        if (project == "11-Protonic-Communication-Ceramics") return "# 11-Protonic-Communication-Ceramics (3 files, has README)"
        if (project == "12-MR-Fluid-Particle-Dynamics") return "# 12-MR-Fluid-Particle-Dynamics (3 files, has README)"
    }

    if (effective_parent == "CSMRadio") {
        if (project == "02-WILLIAMS-KUTCHER-THE-STATE_IS-MINE-FUNNY") return "Williams-Kutcher comedy segment (6 files)"
        if (project == "AegisGithubReadMeRadio") return "Aegis GitHub README radio production (292 files, has README)"
        if (project == "__AGENTS_OF_AEGIS_RADIO__") return "Agents of Aegis Radio \u2014 active production (46 files, updated Oct 2026)"
        if (project == "CSMCommercials") return "Commercial production assets (20 files)"
        if (project == "radio-generator SCRIPTS") return "Radio generator automation scripts (3 files)"
        if (project == "RADIO_PREPARATION") return "Radio show preparation materials (14 files)"
    }

    if (effective_parent == "CSMReach") {
        if (project ~ /^ACS-/) {
            corp = project
            gsub(/^ACS-/, "", corp)
            gsub(/-/, " ", corp)
            return "ACS-" corp " \u2014 Corporate partnership profile for " corp " (16 files)"
        }
        if (project == "AEGIS-Covenant") return "AEGIS-Covenant \u2014 Core covenant framework (606 files)"
        if (project == "AEGIS-Covenant-Output") return "AEGIS-Covenant-Output \u2014 Generated outputs (16 files)"
        if (project == "CSMDossier") return "CSMDossier \u2014 Intelligence dossiers (586 files)"
        if (project == "CSMEmail") return "CSMEmail \u2014 Email correspondence (2 files)"
        if (project == "CSMEmailOutgoing") return "CSMEmailOutgoing \u2014 Diplomatic and commercial correspondence (519 files, has README)"
        if (project == "CSMEval") return "CSMEval \u2014 Evaluation, testing, and quality assurance (358 files, has README)"
        if (project == "CSMGeneralOutreach") return "CSMGeneralOutreach \u2014 General outreach (11 files)"
        if (project == "CSMGeneralOutreach-Global") return "# CSM General Outreach \u2014 Global (401 files, has README)"
        if (project == "CSMinsurance") return "CSMinsurance \u2014 Insurance documentation (67 files)"
        if (project == "CSMReach00001") return "CSMReach00001 \u2014 Initial reach project (7 files)"
        if (project == "grants") return "grants \u2014 Grant applications (4 files)"
        if (project == "MEDIA-CORRESPONDENCE") return "MEDIA-CORRESPONDENCE \u2014 Media relations (12 files)"
    }

    if (effective_parent == "CSMScripts") {
        if (project == "android-toolkit") return "# CarrPod No-Gradle Android APK Toolkit (4 files, has README)"
        if (project == "CSMLogs") return "CSMLogs \u2014 Log processing utilities (681 files)"
        if (project == "earthbeatv3-data") return "Earthbeat v3 data (9 files)"
        if (project == "freenemo_concat") return "FreeNemo concatenation utility (1 file)"
        if (project == "freenemo_modules") return "FreeNemo modules (31 files)"
        if (project == "__Git_Seed_Recover") return "Git seed recovery tools (15 files)"
        if (project == "heartbeat-shared") return "Shared heartbeat utilities (2 files)"
        if (project == "KiloWorkSpace") return "Kilo workspace configuration (1 file)"
        if (project == "__pycache__") return "Python cache (1 file)"
        if (project == "StartScriptCommands") return "Start script commands (2 files)"
        if (project == ".tokenring") return "Tokenring v1 (4 files)"
        if (project == ".tokenringv2") return "Tokenring v2 (4 files)"
        if (project == ".tokenringv3") return "Tokenring v3 (8 files)"
    }

    if (effective_parent == "CSMSOPP") {
        if (project == "BAKER-STREET") return "Baker Street protocol (85 files)"
        if (project == "CITADEL_to") return "Citadel protocol (5 files)"
        if (project == "EL-SEGUNDO") return "El Segundo protocol (87 files)"
        if (project == "GUIDE") return "Guide documentation (1 file)"
        if (project == "KEYMAKER") return "Keymaker protocol (2 files)"
        if (project == "KEYMAKER1") return "Keymaker v1 (23 files)"
        if (project == "MODULE") return "# THE WILLIAMS HEURISTIC \u2014 MODULE DIRECTORY (6 files, has README)"
        if (project == "MODULE-V2") return "Module V2 \u2014 Updated heuristics (15 files, has README)"
        if (project == "NASH_to") return "Nash protocol (5 files)"
        if (project == "NEO-YOGI-TORVALDS-FEYNMAN-FULLER") return "Neo-Yogi-Torvalds-Feynman-Fuller heuristic (1 file)"
        if (project == "NYX_to") return "Nyx protocol (5 files)"
        if (project == "RESEARCH") return "Research protocols (70 files)"
        if (project == "ROBBINS-HEURISTIC-TRIPLE-ZERO_to") return "Robbins heuristic triple zero (6 files)"
        if (project == "SOLARA_to") return "Solara protocol (5 files)"
        if (project == "SPRUCE-DRAKE") return "Spruce-Drake protocol (20 files)"
        if (project == "STARLIGHT") return "Starlight protocol (88 files)"
        if (project == "WILLIAMS-V3") return "Williams V3 heuristic (4 files)"
        if (project == "ZIRCONIA") return "Zirconia protocol (3 files)"
    }

    if (effective_parent == "CSMSOPPv2") {
        if (project == "HEURISTICS") return "HEURISTICS \u2014 Heuristic protocols v2 (205 files)"
    }

    if (effective_parent == "CSMSubatomic082026") {
        if (project == "__CURRENT_RELEASES__") return "Current releases archive (5 files)"
        if (project == "__CURRENT_WORK_IN_PROGRESS__") return "Current work in progress (3 files)"
        if (project == "landolil.engine") return "Landolil engine (57 files)"
        if (project == "OrganizedLibrary") return "Organized research library (334 files)"
        if (project == "Prime_Electron_Foundation") return "Prime electron foundation (1 file)"
        if (project == "SubAtomic.Edu") return "SubAtomic education platform (1203 files)"
        if (project == "TardigradiaTGPU") return "Tardigradia TGPU research (412 files)"
        if (project == "__WIP__") return "Work in progress (1 file)"
    }

    if (effective_parent == "CSMWip") {
        if (project == "01_SubAtomic_Prime_Electron_Canonical") return "SubAtomic prime electron canonical (680 files)"
        if (project == "02_Caldera_Prime_Pi_Electron") return "Caldera prime pi electron (273 files)"
        if (project == "03_Legal_Enactment") return "Legal enactment research (569 files, active)"
        if (project == "05_BOUNCE") return "# TODO.md \u2014 CSMWip/05_BOUNCE \u2014 Bounce TAF/DMV mesh network (5193 files, has TODO, has NEXT)"
        if (project == "06_Land_of_Lil") return "Land of Lil (10 files)"
        if (project == "07_SubAtomic_Extensions") return "SubAtomic extensions (135 files)"
        if (project == "08_DeepResearch_SubParticles") return "Deep research subparticles (389 files)"
        if (project == "09_Project_Tracking") return "# CSM WORK IN PROGRESS \u2014 SubParticlesV4 Complete Archive (10 files, has README)"
        if (project == "10_Prime_Electron_Caldera_Synthesis") return "Prime electron Caldera synthesis (1556 files)"
        if (project == "11_TGApp") return "TGApp ecosystem (228 files)"
        if (project == "12_AegisOutfitFabricator") return "# TODO.md \u2014 CSMWip/12_AegisOutfitFabricator (501 files, has TODO, has NEXT)"
        if (project == "CSMMinesMagnets") return "# TODO.md \u2014 CSMWip/CSMMinesMagnets (122 files, has TODO)"
        if (project == "CSMWip") return "Self-reference (1 file)"
        if (project == "Kilo_Session_20261007_Consolidation") return "Kilo session consolidation (1063 files)"
    }

    if (effective_parent == "CSMWipScripts") {
        if (project == "AegisIronMan") return "AegisIronMan \u2014 Iron Man suit fabrication scripts (15 files)"
        if (project == "RESTART_PACKAGE") return "RESTART_PACKAGE \u2014 Session restart utilities (7 files, has README)"
    }

    if (effective_parent == "CSM_WORK_IN_PROGRESS") {
        if (project == "SubAtom_WIP") return "SubAtom_WIP \u2014 SubAtomic work in progress (6 files)"
    }

    if (effective_parent == "DeepResearch") {
        if (project == "1920s-Radio-Design-Research") return "1920s radio design historical research (1 file)"
        if (project == "AncientQuartzIllumination") return "Ancient quartz illumination research (66 files)"
        if (project == "Artificial Hemoglobin Survival Research") return "Artificial hemoglobin survival research (143 files)"
        if (project == "AsteroidPsycheGoldHeist") return "Asteroid Psyche gold heist scenario (2 files)"
        if (project == "AtlasJawHealth") return "Atlas jaw health research (1 file)"
        if (project == "AtlasJawSpeechHealth") return "Atlas jaw speech health (29 files)"
        if (project == "Canine-Human_Neurobiology_and_Archaeogenetics") return "Canine-human neurobiology and archaeogenetics (18 files)"
        if (project == "CarrPodLogoGraphic") return "CarrPod logo graphics (1 file)"
        if (project == "ContentFiles") return "Content files (17 files)"
        if (project == "CONTENT.PDF") return "Content PDF (115 files)"
        if (project == "CreditsAndAttributions") return "Credits and attributions (1 file)"
        if (project == "CrustalDisplacementAnalysis") return "Crustal displacement analysis (17 files)"
        if (project == "CrustalDisplacementGoldDeposition") return "Crustal displacement gold deposition (19 files)"
        if (project == "CSMGenStudy") return "DeepResearch/CSMGenStudy \u2014 CSMGen research study (23 files, has README)"
        if (project == "Fermentations") return "Fermentation research (1 file)"
        if (project == "GitHubRepoMan") return "GitHub repository manager (3 files)"
        if (project == "HumanDisasterTimelimes") return "Human disaster timelines (37 files)"
        if (project == "KingList_ImagePrompts") return "King list image prompts (16 files)"
        if (project == "MasonicHistory") return "Masonic history research (1 file)"
        if (project == "Mayan2040") return "Mayan 2040 prophecy research (2 files)"
        if (project == "MegaAnalysis160") return "Mega analysis 160 (18 files)"
        if (project == "Microbial Ecosystem Food Chains") return "Microbial ecosystem food chains (8 files)"
        if (project == "Mythology") return "DeepResearch/Mythology \u2014 Mythology research (3 files, has README)"
        if (project == "OakIslandSonicRangeFinding") return "Oak Island sonic range finding (1 file)"
        if (project == "Photonic vs Electronic GPU Analysis") return "Photonic vs electronic GPU analysis (144 files)"
        if (project == "PlasmaSpirits") return "Plasma spirits research (3 files)"
        if (project == "Pressure Vessels and Human Physiology") return "Pressure vessels and human physiology (155 files)"
        if (project == "Remaining Projects Overview") return "CSMDeepResearch Remaining Projects Overview (1 file, has README)"
        if (project == "Tardigradia") return "Tardigradia research (1 file)"
        if (project == "TheMammal") return "The Mammal research (5 files)"
        if (project == "TracingHumanityKnowledge") return "Tracing humanity knowledge (17 files)"
        if (project == "USPresidentialPowers") return "DeepResearch/USPresidentialPowers \u2014 US presidential powers (3 files, has README)"
        if (project == "WaronDemographics") return "DeepResearch/WaronDemographics \u2014 War on demographics (7 files, has README)"
    }

    if (effective_parent == "LEGAL-ENACTMENT") {
        # Extract act number from project name like "01-Critical-Infrastructure-Protection-Act"
        if (match(project, /^([0-9]+)-/)) {
            num = substr(project, RSTART, RLENGTH-1)
            name = substr(project, RSTART+RLENGTH)
            gsub(/-/, " ", name)
            return "Act " num ": " name " Act (" filecount " files)"
        }
        return project " \u2014 Legislative act (" filecount " files)"
    }

    if (effective_parent == "__PUBLISH_CSM__") {
        if (project == "SAPECPublish") return "SAPECPublish \u2014 Publishing pipeline (9 files)"
    }

    if (effective_parent == "__Python_Tools") {
        if (project == "__pycache__") return "Python cache (1 file)"
    }

    if (effective_parent == ".sdk") {
        if (project == "android-sdk") return "Android SDK (2 files)"
        if (project == "gradle-8.4") return "Gradle 8.4 (2 files)"
        if (project == "gradle-cache") return "Gradle cache (18 files)"
    }

    if (effective_parent == "TardigradiaTGPU") {
        if (project == "landolil") return "landolil \u2014 Tardigradia subproject (90 files)"
    }

    # Default fallback
    return project " \u2014 " state " under " effective_parent " (" filecount " files)"
}

# Parse CSV line respecting quotes
function parse_csv_line(line,    fields, n, i, in_quote, field, c) {
    n = 0
    in_quote = 0
    field = ""
    for (i = 1; i <= length(line); i++) {
        c = substr(line, i, 1)
        if (c == "\"") {
            if (in_quote && i < length(line) && substr(line, i+1, 1) == "\"") {
                field = field "\""
                i++
            } else {
                in_quote = !in_quote
            }
        } else if (c == "," && !in_quote) {
            fields[++n] = field
            field = ""
        } else {
            field = field c
        }
    }
    fields[++n] = field
    return n
}

function join_csv(fields, n,    result, i, field) {
    result = ""
    for (i = 1; i <= n; i++) {
        field = fields[i]
        # Quote fields containing commas, quotes, or newlines
        if (field ~ /[",\n]/) {
            gsub(/"/, "\"\"", field)
            field = "\"" field "\""
        }
        if (i > 1) result = result ","
        result = result field
    }
    return result
}

NR == 1 {
    print $0
    next
}

{
    # Parse the line properly
    n = parse_csv_line($0, fields)
    if (n >= 16) {
        state = fields[1]
        parent = fields[2]
        summary = fields[3]
        category = fields[4]
        project = fields[5]
        path = fields[6]
        filecount = fields[7]
        has_todo = fields[8]
        has_readme = fields[9]
        has_next = fields[10]
        creation = fields[11]
        last_worked = fields[12]
        days = fields[13]
        ai = fields[14]
        status = fields[15]
        notes = fields[16]

        new_summary = generate_summary(state, parent, project, path, filecount, summary, has_readme, category)
        fields[3] = new_summary
        print join_csv(fields, 16)
    } else {
        print $0
    }
}