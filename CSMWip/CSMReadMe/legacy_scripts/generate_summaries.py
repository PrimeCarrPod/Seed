import csv
import re
from datetime import datetime

# Read the CSV
rows = []
with open('/workspace/app/REPO_INDEX_V6.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        rows.append(row)

# Summary generation logic
def generate_summary(row):
    project = row['Project']
    path = row['Path']
    parent = row['ParentProject']
    state = row['State']
    filecount = row['FileCount']
    existing_summary = row['Summary']
    has_readme = row['HasREADME']
    has_todo = row['HasTODO']
    category = row['Category']
    
    # If already has a meaningful summary, keep it
    if existing_summary and existing_summary.strip() and not existing_summary.startswith('#'):
        return existing_summary
    
    # Top-level projects
    if parent == 'N/A' or state in ['Whole Project', 'Whole Project (standalone)', 'Near-Whole Project']:
        summaries = {
            'CSMApps': '# Seed — Core application ecosystem containing Bounce (TAF/DMV vehicle mesh network), CarForge, landolil, Marmalade, Vertebrae, and release management',
            'CSMArchive': 'Archival storage for legacy projects; contains V3-Compendiums (next-gen integrated documentation)',
            'CSM-Brandoutreach': 'Brand outreach and marketing materials',
            'CSMCinema': 'Cinematic production pipeline using Godot 3D; includes master scripts, storyboards, scene details, and resume/portfolio assets',
            'CSMDropBox': 'File dropbox / temporary storage utility',
            'CSMFAB': '# Seed — Massive fabrication research portfolio (8000+ files) covering Project AEGIS (Carrington event resilience), drone designs, smart materials, home hardening, and 100+ individual research projects from CSMFAB01 to CSMFAB078',
            'CSMGen': 'Agent generation pipeline and communications architecture (CSMAegis subproject)',
            'CSMGrantCampaigns': 'Grant proposal campaigns and funding applications (GrantProposals subproject)',
            'CSMHuman': '# Seed — Human frequency interaction research: 40+ deep research projects on vibration/EMF-body interactions, resonance frequencies, ultrasonic vibrometry, and neurological impacts',
            'CSMIncoming': 'CSMIncoming — Intelligence, Submissions, and the Inbox of the Unknown',
            'CSMLogs': 'Centralized logging and session tracking; 2000+ files across subatomic research, legal enactment, TGApp ecosystem, Land of Lil, publishing outreach, and heartbeat monitoring',
            'CSMMetal': 'CSMMetal — Dielectric materials and electromagnetic protection research; vibration-dampening safety, microwave-proof materials, EMF protection',
            'CSMMinesMagnets': 'Mining and magnetics research (chunks subproject)',
            'CSMPrePublish': 'Pre-publication staging area; corrupted files recovery and placeholder articles',
            'CSMPro': 'CSMPro — Infrastructure resilience proposals; encompasses CSMBoard (business), CSMInvestor, CSMMag (rare-earth-free magnets), CSMMech (EM battlerobotics), CSMPark (theme park dielectric refab), bridge resilience reports, evacuation/fuel/rail/transport/water proposals, CSMTest, CSMVessel (maritime EM resilience)',
            'CSMProtonics': 'CSMProtonics — Protonic communication and future systems design',
            'CSMPublished': 'Published output repository: flagship papers, subatomic canonical, Caldera prime pi electron, synthesis compendiums, LaTeX publications, read-aloud versions',
            'CSMQuantum': '# Seed — Quantum research delegation directory; 12 focused projects on MXene shielding, ZrB2-SiC composites, YInMn blue crystal field, perovskite quantum dots, aerogel networks, MAX phases, dielectric interfaces, flash sintering, CoAl2O4 spinel, PVDF piezoelectric, protonic ceramics, MR fluid dynamics',
            'CSMRadio': 'CSMRadio — Audio production and broadcasting; Agents of Aegis Radio, commercials, radio generator scripts, radio preparation, Aegis GitHub README radio',
            'CSMReach': 'CSMReach — Diplomatic and commercial outreach; 2750 files across AEGIS Covenant, dossiers, email correspondence, evaluations, insurance, corporate ACS profiles (SpaceX, Tesla, Rivian, Lucid, Helion, etc.), media correspondence, grants',
            'CSMScripts': 'CSMScripts — Automation, utilities, and operational tools; CarrPod no-Gradle Android APK toolkit, log processing, earthbeat data, freenemo modules, git recovery, heartbeat, Kilo workspace, tokenring versions',
            'CSMSOPP': 'CSMSOPP — Standard Operating Procedures and Protocols; Baker Street, Citadel, El Segundo, Guide, Keymaker, Module/Module-V2 (Williams Heuristic), Research, Robbins Heuristic, Solara, Spruce-Drake, Starlight, Zirconia, Williams-V3',
            'CSMSOPPv2': 'CSMSOPPv2 — Updated SOPs with Heuristics module',
            'CSMSubatomic082026': 'Archived subatomic research (Sept 2026): current releases, WIP, landolil engine, organized library, prime electron foundation, SubAtomic.Edu, TardigradiaTGPU',
            'CSMWip': 'CSMWip — Primary active work-in-progress (10,730 files); SubAtomic prime electron canonical, Caldera prime pi electron, legal enactment, BOUNCE (TAF/DMV mesh), Land of Lil, subatomic extensions, deep research, project tracking, prime electron synthesis, TGApp, Aegis outfit fabricator, CSMMinesMagnets',
            'CSMWipScripts': 'CSMWipScripts — WIP automation scripts; AegisIronMan, RESTART_PACKAGE',
            'CSM_WORK_IN_PROGRESS': 'Work in progress container; SubAtom_WIP',
            'DeepResearch': '# Seed — Deep research repository (898 files); 1920s radio design, ancient quartz illumination, artificial hemoglobin, asteroid Psyche, Atlas jaw health, canine neurobiology, CarrPod logo, content files, crustal displacement, CSMGen study, fermentations, GitHub repo manager, disaster timelines, King List, Masonic history, Mayan 2040, mega analysis, microbial ecosystems, mythology, Oak Island, photonic vs electronic GPU, plasma spirits, pressure vessels, remaining projects, Tardigradia, The Mammal, tracing humanity, US presidential powers, war on demographics',
            'landing-page': '# Carrington Storm Motors — Project AEGIS Landing Page',
            'LEGAL-ENACTMENT': '# Seed — Legislative enactment portfolio; 60+ Acts covering critical infrastructure, domestic minerals, nuclear energy, clean manufacturing, bridge modernization, wildfire prevention, carbon removal, supply chain, water infrastructure, coastal ports, workforce, energy storage, critical minerals, cybersecurity, hydrogen, aviation fuels, water recycling, broadband, carbon capture, EV charging, climate resilience, sustainable buildings, grid modernization, advanced manufacturing, environmental remediation, offshore wind, public transit, solar, nuclear waste, precision agriculture, ocean resources, quantum computing, biomedical research, space exploration, AI safety, advanced materials, mental health, wildland fire, digital identity, supply chain resilience, semiconductor packaging, paid leave, clean energy tax credits, school infrastructure, SMR nuclear, affordable housing, geothermal, public health, offshore minerals, rural broadband, hydrogen hubs, cybersecurity workforce, carbon border adjustment, disaster insurance, advanced geothermal, hydrogen industrial, forest carbon, ocean carbon capture, advanced solar, long-duration storage',
            'PrimeBookOne': 'Prime Book One — Primary publication draft',
            '__PUBLISH_CSM__': 'Publishing pipeline for CSM; SAPECPublish subproject',
            '__Python_Tools': 'Shared Python automation utilities and tooling',
            'RESTART_PACKAGE': 'Session restart package with TODO',
            'scripts': 'Miscellaneous scripts',
            '.sdk': 'Android SDK and Gradle toolchain (android-sdk, gradle-8.4, gradle-cache)',
            'TardigradiaTGPU': 'Tardigradia TGPU research with landolil subproject',
            'csmlogs': 'Legacy logs (aug26, august26, caldera)',
            'memory': 'Memory/storage directory',
        }
        return summaries.get(project, f'{project} — {state} ({filecount} files)')
    
    # Sub-projects - generate based on name patterns
    proj_lower = project.lower()
    
    # CSMApps subprojects
    if parent == 'CSMApps':
        if 'Bounce' in project:
            return '# Bounce — TAF/DMV Vehicle Mesh Network (4866 files, active)'
        elif 'CarForge' in project:
            return 'CarForge — Vehicle design and fabrication subproject (minimal files)'
        elif 'landolil' in project:
            return 'landolil — Subproject with 241 files (active Oct 2026)'
        elif 'Marmalade' in project:
            return 'Marmalade — Lightweight subproject (15 files)'
        elif 'Vertebrae' in project:
            return 'Vertebrae — Core framework subproject (5 files)'
        elif 'Vertebrae-Extension' in project:
            return 'Vertebrae-Extension — Extension to Vertebrae framework (4 files)'
        elif '_Current_Releases' in project:
            return 'Current releases archive (2 files)'
        elif '_Past_Releases' in project:
            return 'Past releases archive (8 files)'
    
    # CSMArchive subprojects
    if parent == 'CSMArchive':
        if 'V3-Compendiums' in project:
            return 'V3-Compendiums — The Next Generation of Integrated Documentation (61 files, has README)'
    
    # CSMCinema subprojects
    if parent == 'CSMCinema':
        subs = {
            'GODOT_3D': 'Godot 3D engine integration for cinematic pipeline (11 files)',
            'MASTER_SCRIPT': 'Master script v1 for cinematic production (12 files)',
            'MASTER_SCRIPT_V2': 'Master script v2 for cinematic production (12 files)',
            'Resume': 'Resume and portfolio assets (9 files)',
            'SCENE_DETAILS': 'Scene detail documentation (21 files)',
            'Scripts': 'Production scripts (5 files)',
            'STORYBOARD': 'Storyboard assets (11 files)',
            'V2_ADDENDUM': 'Version 2 addendum documentation (12 files)',
            'WIP': 'Work in progress — active cinematic development (99 files, updated Oct 2026)',
        }
        return subs.get(project, f'{project} — CSMCinema subproject ({filecount} files)')
    
    # CSMFAB subprojects (many - use pattern matching)
    if parent == 'CSMFAB':
        if 'AEGIS' in project.upper() or 'Aegis' in project:
            return f'{project} — Project AEGIS Carrington event resilience research ({filecount} files)'
        elif 'DRONE' in project.upper() or 'Drone' in project:
            return f'{project} — Drone redesign and propulsion research ({filecount} files)'
        elif 'POCKET' in project.upper() or 'Pocket' in project:
            return f'{project} — Pocket-Watch-X wearable device research ({filecount} files)'
        elif 'FEATHER' in project.upper() or 'LoRa' in project:
            return f'{project} — FEATHER LoRa mesh network node ({filecount} files)'
        elif 'BIRD' in project.upper() or 'UAS' in project:
            return f'{project} — Archemedian spiraling bird UAS sub-250g wind research ({filecount} files)'
        elif 'SMART_ROPE' in project.upper() or 'Smart Rope' in project or 'Smart_Muscle' in project:
            return f'{project} — Smart rope actuator / muscle design ({filecount} files)'
        elif 'GRID' in project.upper() or 'DEW' in project.upper() or 'COLD' in project.upper() or 'HAVEN' in project.upper() or 'CARR' in project.upper() or 'NODE' in project.upper() or 'CORE' in project.upper() or 'SHARE' in project.upper() or 'EARTH' in project.upper() or 'HEART' in project.upper() or 'SONG' in project.upper() or 'FORGE' in project.upper():
            return f'{project} — Infrastructure resilience node/project ({filecount} files)'
        elif 'LONSDALEITE' in project.upper() or 'BIO' in project.upper() or 'MANA' in project.upper() or 'IRO' in project.upper() or 'DEEP' in project.upper():
            return f'{project} — Advanced materials / bio-compatibility research ({filecount} files)'
        elif 'CUSTACEAN' in project.upper() or 'INCURSION' in project.upper() or 'TESTA' in project.upper() or 'MASTER' in project.upper() or 'MATERIALS' in project.upper() or 'COST' in project.upper():
            return f'{project} — Fleet/vessel class or master analysis ({filecount} files)'
        elif 'P00' in project:
            return f'{project} — Infrastructure hardening proposal ({filecount} files)'
        elif 'BOM' in project.upper() or 'CLOUD' in project.upper() or 'FLUID' in project.upper() or 'PROTONIC' in project.upper() or 'STELLAR' in project.upper() or 'ULNAR' in project.upper():
            return f'{project} — Component registry or research module ({filecount} files)'
        elif re.match(r'CSMFAB\d{4}', project):
            num = project.replace('CSMFAB', '')[:4]
            return f'{project} — AEGIS research project #{num} ({filecount} files)'
    
    # CSMGen subprojects
    if parent == 'CSMGen':
        if 'CSMAegis' in project:
            return 'CSMAegis — Agent generation subproject (5 files)'
    
    # CSMGrantCampaigns subprojects
    if parent == 'CSMGrantCampaigns':
        if 'GrantProposals' in project:
            return 'GrantProposals — Funding applications and proposals (24 files)'
    
    # CSMHuman subprojects (many similar research projects)
    if parent == 'CSMHuman':
        if 'Mirror' in project:
            return f'{project} — Mirror fascination / gazing neurological research ({filecount} files)'
        elif 'Frequency' in project or 'frequency' in project:
            return f'{project} — Human body frequency interaction research ({filecount} files)'
        elif 'Vibration' in project or 'vibration' in project:
            return f'{project} — Vibration impact on human body research ({filecount} files)'
        elif 'EM' in project or 'Electrical' in project:
            return f'{project} — EM frequency / electrical current body interaction ({filecount} files)'
        elif 'Ultrasonic' in project or 'RBC' in project or 'Vibrometry' in project:
            return f'{project} — Ultrasonic vibrometry / blood research ({filecount} files)'
        elif 'Sound' in project or 'Healing' in project:
            return f'{project} — Sound frequencies for healing research ({filecount} files)'
        elif 'Aegis Embark' in project or 'Carrington' in project:
            return f'{project} — AEGIS Carrington storm protection for humans ({filecount} files)'
        elif 'Deep' in project or 'Research' in project or 'Dive' in project or 'Synthesis' in project:
            return f'{project} — Deep research synthesis on frequency-body interactions ({filecount} files)'
    
    # CSMLogs subprojects
    if parent == 'CSMLogs':
        subs = {
            '01_SubAtomic_Prime_Electron_Canonical': 'SubAtomic prime electron canonical research (197 files)',
            '02_Caldera_Prime_Pi_Electron': 'Caldera prime pi electron research (9 files)',
            '03_Legal_Enactment': 'CSMGen — Agent generation, pipeline, and communications architecture (78 files, has README)',
            '04_TGApp_Ecosystem': 'TGApp ecosystem development (48 files)',
            '05_Land_of_Lil': 'Land of Lil subproject (4 files)',
            '06_SubAtomic_Extensions': 'SubAtomic extensions (4 files)',
            '07_DeepResearch_SubParticles': 'Deep research on subparticles (23 files)',
            '08_Project_Tracking': 'Project tracking and management (20 files)',
            '09_Prime_Electron_Caldera_Synthesis': 'Prime electron Caldera synthesis (12 files)',
            '10_AegisOutfitFabricator': 'Aegis outfit fabricator (47 files)',
            '11_Publishing_Outreach': 'Publishing and outreach (21 files)',
            '12_CSM_Cinema_Godot': 'CSM Cinema Godot integration (5 files)',
            '13_CSM_CLS_Cascade': 'CSM CLS Cascade (18 files)',
            '15_CSMRadio_Aegis': 'CSM Radio Aegis integration (1 file)',
            'General_Sessions': '# Seed — General session logs (1572 files, has README)',
            'heartbeat': 'Heartbeat monitoring (3 files)',
            'Heartbeat_Logs': 'Heartbeat logs (2 files)',
        }
        return subs.get(project, f'{project} — CSMLogs subproject ({filecount} files)')
    
    # csmlogs subprojects (lowercase)
    if parent == 'csmlogs':
        return f'{project} — Legacy log archive ({filecount} files)'
    
    # CSMMetal subprojects
    if parent == 'CSMMetal':
        if 'Vibration' in project or 'Dampening' in project or 'Mitigation' in project:
            return f'{project} — Vibration dampening safety products ({filecount} files)'
        elif 'Bio-Sync' in project or 'Bio' in project:
            return f'{project} — Bio-sync seat cushion research ({filecount} files)'
        elif 'Microwave' in project or 'microwave' in project:
            return f'{project} — Microwave-proof material design ({filecount} files)'
        elif 'EMF' in project or 'Color' in project:
            return f'{project} — EMF protection color scheme derivation ({filecount} files)'
        elif 'Induction' in project:
            return f'{project} — Reimagining products for induction events ({filecount} files)'
        elif 'Bridge' in project or 'Carrington' in project:
            return f'{project} — Bridge failure analysis for Carrington event ({filecount} files)'
    
    # CSMMinesMagnets subprojects
    if parent == 'CSMMinesMagnets':
        if 'chunks' in project:
            return 'chunks — Mining data chunks (8 files)'
    
    # CSMPrePublish subprojects
    if parent == 'CSMPrePublish':
        if 'Corrupted' in project:
            return 'Corrupted_Files — File recovery (49 files)'
        elif 'Placeholder' in project:
            return 'Placeholder_Articles — Article placeholders (3 files)'
    
    # CSMPro subprojects
    if parent == 'CSMPro':
        subs = {
            'CSMBoard': 'CSMBiz — Business planning and commercial strategy (6 files, has README)',
            'CSMInvestor': 'Investor relations and pitch materials (206 files)',
            'CSMMag': 'CSMMag — Rare-earth-free magnet research and industry analysis (11 files, has README)',
            'CSMMech': 'CSMMech — Robotics for the electromagnetic battlespace (27 files, has README)',
            'csm_nasa': 'NASA collaboration materials (18 files)',
            'CSMPark': 'CSMPark — Theme park dielectric refabrication (8 files, has README)',
            'CSMPRO02': 'Bridge resilience against Carrington storms (6 files)',
            'CSMPRO03': 'Bridge resilience report tailoring (Bay Area / London) (5 files each)',
            'CSMPRO04': 'Pittsburgh bridge retrofit proposal (5 files)',
            'CSMPRO05': 'Seattle bridge resilience report tailoring (5 files)',
            'CSMProEvac2026': 'Aegis evacuation protocols for Carrington event (5 files)',
            'CSMProFuelTransport': 'Aegis fuel infrastructure Carrington resilience (5 files)',
            'CSMProRail2026': 'Aegis rail protection proposal (5 files)',
            'CSMProTransport2026': 'Aegis transport resilience proposal (5 files)',
            'CSMProWaterTransport': 'Aegis water system Carrington resilience (5 files)',
            'CSMTest': 'CSMTest — Product testing, validation, and performance verification (6 files, has README)',
            'CSMVessel': 'CSMVessel — Maritime electromagnetic resilience and fleet architecture (1030 files, has README)',
        }
        return subs.get(project, f'{project} — CSMPro infrastructure resilience subproject ({filecount} files)')
    
    # CSMProtonics subprojects
    if parent == 'CSMProtonics':
        return 'CSMProtonics01 — Protonic communication and future systems design (5 files)'
    
    # CSMPublished subprojects
    if parent == 'CSMPublished':
        subs = {
            '01_Flagship_Papers': 'Flagship research papers (16 files)',
            '02_SubAtomic_Canonical': 'SubAtomic canonical publications (102 files)',
            '03_Caldera_Prime_Pi_Electron': 'Caldera prime pi electron publications (15 files)',
            '04_Synthesis_Compendiums': 'Synthesis compendiums (20 files)',
            '05_LaTeX_Publications': 'LaTeX formatted publications (27 files)',
            '06_ReadAloud_Versions': 'Read-aloud audio versions (5 files)',
        }
        return subs.get(project, f'{project} — CSMPublished subproject ({filecount} files)')
    
    # CSMQuantum subprojects
    if parent == 'CSMQuantum':
        quantum_subs = {
            '00-MASTER-INDEX': '# 00-MASTER-INDEX — Quantum Research Delegation Directory (3 files, has README)',
            '01-MXene-Shielding-Optimization': '# 01-MXene-Shielding-Optimization (3 files, has README)',
            '02-ZrB2-SiC-Composite-Design': '# 02-ZrB2-SiC-Composite-Design (3 files, has README)',
            '03-YInMn-Blue-Crystal-Field': '# 03-YInMn-Blue-Crystal-Field (3 files, has README)',
            '04-Perovskite-Quantum-Dot-Stability': '# 04-Perovskite-Quantum-Dot-Stability (3 files, has README)',
            '05-Aerogel-Network-Optimization': '# 05-Aerogel-Network-Optimization (3 files, has README)',
            '06-MAX-Phase-Discovery-Space': '# 06-MAX-Phase-Discovery-Space (3 files, has README)',
            '07-Dielectric-Interface-Design': '# 07-Dielectric-Interface-Design (3 files, has README)',
            '08-Flash-Sintering-Physics': '# 08-Flash-Sintering-Physics (3 files, has README)',
            '09-CoAl2O4-Spinel-Engineering': '# 09-CoAl2O4-Spinel-Engineering (3 files, has README)',
            '10-PVDF-Piezoelectric-Domains': '# 10-PVDF-Piezoelectric-Domains (3 files, has README)',
            '11-Protonic-Communication-Ceramics': '# 11-Protonic-Communication-Ceramics (3 files, has README)',
            '12-MR-Fluid-Particle-Dynamics': '# 12-MR-Fluid-Particle-Dynamics (3 files, has README)',
        }
        return quantum_subs.get(project, f'{project} — CSMQuantum research project ({filecount} files)')
    
    # CSMRadio subprojects
    if parent == 'CSMRadio':
        subs = {
            '02-WILLIAMS-KUTCHER-THE-STATE_IS-MINE-FUNNY': 'Williams-Kutcher comedy segment (6 files)',
            'AegisGithubReadMeRadio': 'Aegis GitHub README radio production (292 files, has README)',
            '__AGENTS_OF_AEGIS_RADIO__': 'Agents of Aegis Radio — active production (46 files, updated Oct 2026)',
            'CSMCommercials': 'Commercial production assets (20 files)',
            'radio-generator SCRIPTS': 'Radio generator automation scripts (3 files)',
            'RADIO_PREPARATION': 'Radio show preparation materials (14 files)',
        }
        return subs.get(project, f'{project} — CSMRadio subproject ({filecount} files)')
    
    # CSMReach subprojects
    if parent == 'CSMReach':
        if 'ACS-' in project:
            corp = project.replace('ACS-', '').replace('-', ' ').title()
            return f'ACS-{corp} — Corporate partnership profile for {corp} (16 files)'
        elif 'AEGIS-Covenant' in project:
            return 'AEGIS-Covenant — Core covenant framework (606 files)'
        elif 'AEGIS-Covenant-Output' in project:
            return 'AEGIS-Covenant-Output — Generated outputs (16 files)'
        elif 'CSMDossier' in project:
            return 'CSMDossier — Intelligence dossiers (586 files)'
        elif 'CSMEmail' in project and 'Outgoing' not in project:
            return 'CSMEmail — Email correspondence (2 files)'
        elif 'CSMEmailOutgoing' in project:
            return 'CSMEmailOutgoing — Diplomatic and commercial correspondence (519 files, has README)'
        elif 'CSMEval' in project:
            return 'CSMEval — Evaluation, testing, and quality assurance (358 files, has README)'
        elif 'CSMGeneralOutreach' in project and 'Global' not in project:
            return 'CSMGeneralOutreach — General outreach (11 files)'
        elif 'CSMGeneralOutreach-Global' in project:
            return '# CSM General Outreach — Global (401 files, has README)'
        elif 'CSMinsurance' in project:
            return 'CSMinsurance — Insurance documentation (67 files)'
        elif 'CSMReach00001' in project:
            return 'CSMReach00001 — Initial reach project (7 files)'
        elif 'grants' in project:
            return 'grants — Grant applications (4 files)'
        elif 'MEDIA-CORRESPONDENCE' in project:
            return 'MEDIA-CORRESPONDENCE — Media relations (12 files)'
    
    # CSMScripts subprojects
    if parent == 'CSMScripts':
        subs = {
            'android-toolkit': '# CarrPod No-Gradle Android APK Toolkit (4 files, has README)',
            'CSMLogs': 'CSMLogs — Log processing utilities (681 files)',
            'earthbeatv3-data': 'Earthbeat v3 data (9 files)',
            'freenemo_concat': 'FreeNemo concatenation utility (1 file)',
            'freenemo_modules': 'FreeNemo modules (31 files)',
            '__Git_Seed_Recover': 'Git seed recovery tools (15 files)',
            'heartbeat-shared': 'Shared heartbeat utilities (2 files)',
            'KiloWorkSpace': 'Kilo workspace configuration (1 file)',
            '__pycache__': 'Python cache (1 file)',
            'StartScriptCommands': 'Start script commands (2 files)',
            '.tokenring': 'Tokenring v1 (4 files)',
            '.tokenringv2': 'Tokenring v2 (4 files)',
            '.tokenringv3': 'Tokenring v3 (8 files)',
        }
        return subs.get(project, f'{project} — CSMScripts utility ({filecount} files)')
    
    # CSMSOPP subprojects
    if parent == 'CSMSOPP':
        subs = {
            'BAKER-STREET': 'Baker Street protocol (85 files)',
            'CITADEL_to': 'Citadel protocol (5 files)',
            'EL-SEGUNDO': 'El Segundo protocol (87 files)',
            'GUIDE': 'Guide documentation (1 file)',
            'KEYMAKER': 'Keymaker protocol (2 files)',
            'KEYMAKER1': 'Keymaker v1 (23 files)',
            'MODULE': '# THE WILLIAMS HEURISTIC — MODULE DIRECTORY (6 files, has README)',
            'MODULE-V2': 'Module V2 — Updated heuristics (15 files, has README)',
            'NASH_to': 'Nash protocol (5 files)',
            'NEO-YOGI-TORVALDS-FEYNMAN-FULLER': 'Neo-Yogi-Torvalds-Feynman-Fuller heuristic (1 file)',
            'NYX_to': 'Nyx protocol (5 files)',
            'RESEARCH': 'Research protocols (70 files)',
            'ROBBINS-HEURISTIC-TRIPLE-ZERO_to': 'Robbins heuristic triple zero (6 files)',
            'SOLARA_to': 'Solara protocol (5 files)',
            'SPRUCE-DRAKE': 'Spruce-Drake protocol (20 files)',
            'STARLIGHT': 'Starlight protocol (88 files)',
            'WILLIAMS-V3': 'Williams V3 heuristic (4 files)',
            'ZIRCONIA': 'Zirconia protocol (3 files)',
        }
        return subs.get(project, f'{project} — CSMSOPP protocol ({filecount} files)')
    
    # CSMSOPPv2 subprojects
    if parent == 'CSMSOPPv2':
        if 'HEURISTICS' in project:
            return 'HEURISTICS — Heuristic protocols v2 (205 files)'
    
    # CSMSubatomic082026 subprojects (archived)
    if parent == 'CSMSubatomic082026':
        subs = {
            '__CURRENT_RELEASES__': 'Current releases archive (5 files)',
            '__CURRENT_WORK_IN_PROGRESS__': 'Current work in progress (3 files)',
            'landolil.engine': 'Landolil engine (57 files)',
            'OrganizedLibrary': 'Organized research library (334 files)',
            'Prime_Electron_Foundation': 'Prime electron foundation (1 file)',
            'SubAtomic.Edu': 'SubAtomic education platform (1203 files)',
            'TardigradiaTGPU': 'Tardigradia TGPU research (412 files)',
            '__WIP__': 'Work in progress (1 file)',
        }
        return subs.get(project, f'{project} — Archived subatomic research ({filecount} files)')
    
    # CSMWip subprojects
    if parent == 'CSMWip':
        subs = {
            '01_SubAtomic_Prime_Electron_Canonical': 'SubAtomic prime electron canonical (680 files)',
            '02_Caldera_Prime_Pi_Electron': 'Caldera prime pi electron (273 files)',
            '03_Legal_Enactment': 'Legal enactment research (569 files, active)',
            '05_BOUNCE': '# TODO.md — CSMWip/05_BOUNCE — Bounce TAF/DMV mesh network (5193 files, has TODO, has NEXT)',
            '06_Land_of_Lil': 'Land of Lil (10 files)',
            '07_SubAtomic_Extensions': 'SubAtomic extensions (135 files)',
            '08_DeepResearch_SubParticles': 'Deep research subparticles (389 files)',
            '09_Project_Tracking': '# CSM WORK IN PROGRESS — SubParticlesV4 Complete Archive (10 files, has README)',
            '10_Prime_Electron_Caldera_Synthesis': 'Prime electron Caldera synthesis (1556 files)',
            '11_TGApp': 'TGApp ecosystem (228 files)',
            '12_AegisOutfitFabricator': '# TODO.md — CSMWip/12_AegisOutfitFabricator (501 files, has TODO, has NEXT)',
            'CSMMinesMagnets': '# TODO.md — CSMWip/CSMMinesMagnets (122 files, has TODO)',
            'CSMWip': 'Self-reference (1 file)',
            'Kilo_Session_20261007_Consolidation': 'Kilo session consolidation (1063 files)',
        }
        return subs.get(project, f'{project} — CSMWip active project ({filecount} files)')
    
    # CSMWipScripts subprojects
    if parent == 'CSMWipScripts':
        if 'AegisIronMan' in project:
            return 'AegisIronMan — Iron Man suit fabrication scripts (15 files)'
        elif 'RESTART_PACKAGE' in project:
            return 'RESTART_PACKAGE — Session restart utilities (7 files, has README)'
    
    # CSM_WORK_IN_PROGRESS subprojects
    if parent == 'CSM_WORK_IN_PROGRESS':
        if 'SubAtom_WIP' in project:
            return 'SubAtom_WIP — SubAtomic work in progress (6 files)'
    
    # DeepResearch subprojects
    if parent == 'DeepResearch':
        subs = {
            '1920s-Radio-Design-Research': '1920s radio design historical research (1 file)',
            'AncientQuartzIllumination': 'Ancient quartz illumination research (66 files)',
            'Artificial Hemoglobin Survival Research': 'Artificial hemoglobin survival research (143 files)',
            'AsteroidPsycheGoldHeist': 'Asteroid Psyche gold heist scenario (2 files)',
            'AtlasJawHealth': 'Atlas jaw health research (1 file)',
            'AtlasJawSpeechHealth': 'Atlas jaw speech health (29 files)',
            'Canine-Human_Neurobiology_and_Archaeogenetics': 'Canine-human neurobiology and archaeogenetics (18 files)',
            'CarrPodLogoGraphic': 'CarrPod logo graphics (1 file)',
            'ContentFiles': 'Content files (17 files)',
            'CONTENT.PDF': 'Content PDF (115 files)',
            'CreditsAndAttributions': 'Credits and attributions (1 file)',
            'CrustalDisplacementAnalysis': 'Crustal displacement analysis (17 files)',
            'CrustalDisplacementGoldDeposition': 'Crustal displacement gold deposition (19 files)',
            'CSMGenStudy': 'DeepResearch/CSMGenStudy — CSMGen research study (23 files, has README)',
            'Fermentations': 'Fermentation research (1 file)',
            'GitHubRepoMan': 'GitHub repository manager (3 files)',
            'HumanDisasterTimelimes': 'Human disaster timelines (37 files)',
            'KingList_ImagePrompts': 'King list image prompts (16 files)',
            'MasonicHistory': 'Masonic history research (1 file)',
            'Mayan2040': 'Mayan 2040 prophecy research (2 files)',
            'MegaAnalysis160': 'Mega analysis 160 (18 files)',
            'Microbial Ecosystem Food Chains': 'Microbial ecosystem food chains (8 files)',
            'Mythology': 'DeepResearch/Mythology — Mythology research (3 files, has README)',
            'OakIslandSonicRangeFinding': 'Oak Island sonic range finding (1 file)',
            'Photonic vs Electronic GPU Analysis': 'Photonic vs electronic GPU analysis (144 files)',
            'PlasmaSpirits': 'Plasma spirits research (3 files)',
            'Pressure Vessels and Human Physiology': 'Pressure vessels and human physiology (155 files)',
            'Remaining Projects Overview': 'CSMDeepResearch Remaining Projects Overview (1 file, has README)',
            'Tardigradia': 'Tardigradia research (1 file)',
            'TheMammal': 'The Mammal research (5 files)',
            'TracingHumanityKnowledge': 'Tracing humanity knowledge (17 files)',
            'USPresidentialPowers': 'DeepResearch/USPresidentialPowers — US presidential powers (3 files, has README)',
            'WaronDemographics': 'DeepResearch/WaronDemographics — War on demographics (7 files, has README)',
        }
        return subs.get(project, f'{project} — DeepResearch project ({filecount} files)')
    
    # LEGAL-ENACTMENT subprojects
    if parent == 'LEGAL-ENACTMENT':
        # Extract act number/name
        act_match = re.match(r'(\d+)-(.+)', project)
        if act_match:
            num = act_match.group(1)
            name = act_match.group(2).replace('-', ' ').title()
            return f'Act {num}: {name} Act ({filecount} files)'
        return f'{project} — Legislative act ({filecount} files)'
    
    # __PUBLISH_CSM__ subprojects
    if parent == '__PUBLISH_CSM__':
        if 'SAPECPublish' in project:
            return 'SAPECPublish — Publishing pipeline (9 files)'
    
    # __Python_Tools subprojects
    if parent == '__Python_Tools':
        if '__pycache__' in project:
            return 'Python cache (1 file)'
    
    # .sdk subprojects
    if parent == '.sdk':
        subs = {
            'android-sdk': 'Android SDK (2 files)',
            'gradle-8.4': 'Gradle 8.4 (2 files)',
            'gradle-cache': 'Gradle cache (18 files)',
        }
        return subs.get(project, f'{project} — SDK component ({filecount} files)')
    
    # TardigradiaTGPU subprojects
    if parent == 'TardigradiaTGPU':
        if 'landolil' in project:
            return 'landolil — Tardigradia subproject (90 files)'
    
    # Default fallback
    return f'{project} — {state} under {parent} ({filecount} files)'

# Generate summaries for all rows
for row in rows:
    row['Summary'] = generate_summary(row)

# Write back
with open('/workspace/app/REPO_INDEX_V6.csv', 'w', newline='') as f:
    fieldnames = ['State', 'ParentProject', 'Summary', 'Category', 'Project', 'Path', 'FileCount', 'HasTODO', 'HasREADME', 'HasNEXT', 'CreationDate', 'LastWorkedDate', 'DaysSinceUpdated', 'AI', 'Status', 'Notes']
    writer = csv.DictWriter(f, fieldnames=fieldnames, quoting=csv.QUOTE_ALL)
    writer.writeheader()
    writer.writerows(rows)

print(f"Updated {len(rows)} rows with summaries")
