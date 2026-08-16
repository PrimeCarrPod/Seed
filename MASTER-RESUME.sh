#!/usr/bin/env bash
# ============================================================
# MASTER-RESUME.sh — SubParticles V4/V5 Research Initiative
# Complete project index for multi-agent parallel work
# ============================================================

set -euo pipefail

# ─── CONFIGURATION ────────────────────────────────────────
REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_1474395b-daea-4849-ad09-b4ee4163c318"
SUBPARTICLES_DIR="$REPO_ROOT/DeepResearch/SubParticlesV4"
LOGS_DIR="$REPO_ROOT/CSMLogs/Final"
SCRIPTS_DIR="$REPO_ROOT/CSMScripts"
RESTART_DIR="$REPO_ROOT/RESTART_PACKAGE"

# ─── COLORS ───────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

log() { echo -e "${CYAN}[MASTER]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${BLUE}${BOLD}═══ $* ═══${NC}\n"; }

# ─── HEARTBEAT MANAGEMENT ─────────────────────────────────
start_heartbeats() {
    banner "STARTING HEARTBEATS"
    log "Chamber mode (4 specialized chambers)..."
    bash "$SCRIPTS_DIR/earthbeatv3.sh chamber" &
    CHAMBER_PID=$!
    
    log "Parallel mode (4 instances)..."
    bash "$SCRIPTS_DIR/earthbeatv3.sh parallel 4" &
    PARALLEL_PID=$!
    
    log "Tokenring mode (8 instances)..."
    bash "$SCRIPTS_DIR/earthbeatv3.sh tokenring 8" &
    TOKENRING_PID=$!
    
    sleep 2
    success "Heartbeats running: Chamber=$CHAMBER_PID Parallel=$PARALLEL_PID Tokenring=$TOKENRING_PID"
    echo "  Stop all: kill $CHAMBER_PID $PARALLEL_PID $TOKENRING_PID"
}

check_heartbeats() {
    banner "HEARTBEAT STATUS"
    if pgrep -f "earthbeatv3.sh chamber" >/dev/null; then
        success "Chamber mode: RUNNING"
    else
        warn "Chamber mode: STOPPED"
    fi
    if pgrep -f "earthbeatv3.sh parallel" >/dev/null; then
        success "Parallel mode: RUNNING"
    else
        warn "Parallel mode: STOPPED"
    fi
    if pgrep -f "earthbeatv3.sh tokenring" >/dev/null; then
        success "Tokenring mode: RUNNING"
    else
        warn "Tokenring mode: STOPPED"
    fi
    ls -la "$SCRIPTS_DIR/earthbeatv3-data/" 2>/dev/null | head -20
}

# ─── PROJECT INDEX ────────────────────────────────────────
show_project_index() {
    banner "SUBPARTICLES PROJECT INDEX"
    
    echo "┌─────────────────────────────────────────────────────────────────────────────┐"
    echo "│  V4.0 SERIES — 18 PARTICLES × 14 PARTS = 252 DOCUMENTS COMPLETE            │"
    echo "├─────────────────────────────────────────────────────────────────────────────┤"
    
    local particles=(
        "Pion_Kaon_V4.0:Pion/Kaon"
        "Photon_V4.0:Photon"
        "Gluon_V4.0:Gluon"
        "Graviton_V4.0:Graviton"
        "Higgs_V4.0:Higgs"
        "Neutron_V4.0:Neutron"
        "Muon_V4.0:Muon"
        "Tau_V4.0:Tau"
        "WZ_Boson_V4.0:W/Z Boson"
        "Electron_Neutrino_V4.0:Electron Neutrino"
        "Muon_Neutrino_V4.0:Muon Neutrino"
        "Tau_Neutrino_V4.0:Tau Neutrino"
        "Baryon_V4.0:Baryon"
        "Proton_Neutron_Baryon_V4.0:Proton/Neutron"
        "OneQuark_V4.0:OneQuark"
        "Pines_Demon_V4.0:Pines Demon"
        "Glueball_Single_Electron_V4.0:Glueball/Single Electron"
        "Electron_Unique_Properties_V4.0:Electron Unique Properties"
    )
    
    for p in "${particles[@]}"; do
        IFS=':' read -r dir name <<< "$p"
        count=$(ls -1 "$SUBPARTICLES_DIR/$dir/" 2>/dev/null | wc -l)
        printf "  %-35s %2d/14 parts\n" "$name" "$count"
    done
    
    echo "├─────────────────────────────────────────────────────────────────────────────┤"
    echo "│  V5.0 SERIES — IN PROGRESS                                                 │"
    echo "├─────────────────────────────────────────────────────────────────────────────┤"
    
    for d in "$SUBPARTICLES_DIR"/*_V5.0; do
        [ -d "$d" ] || continue
        name=$(basename "$d" _V5.0)
        count=$(ls -1 "$d/" 2>/dev/null | wc -l)
        printf "  %-35s %2d/14 parts\n" "$name" "$count"
    done
    
    echo "└─────────────────────────────────────────────────────────────────────────────┘"
}

# ─── AGENT WORK ASSIGNMENT ────────────────────────────────
show_agent_work() {
    banner "AGENT WORK ASSIGNMENTS — CURRENT PRIORITIES"
    
    echo "┌─────────────────────────────────────────────────────────────────────────────┐"
    echo "│  PHOTON V5.0 — COMPLETE PARTS 10-14 (5 parts remaining)                    │"
    echo "├─────────────────────────────────────────────────────────────────────────────┤"
    echo "  Part 10: Photon in Strong Fields (Schwinger, Nonlinear QED, Magnetars)     │"
    echo "  Part 11: Photon Nuclear Physics (GDR, Nuclear GPDs, EIC Nuclear)           │"
    echo "  Part 12: Precision Spectroscopy (Atomic, Lamb Shift, Muonic Atoms)         │"
    echo "  Part 13: Quantum Optics & Photonics (Cavity QED, Squeezed Light)           │"
    echo "  Part 14: Final Synthesis (Unified Photon Ontology, All Predictions)        │"
    echo "├─────────────────────────────────────────────────────────────────────────────┤"
    echo "│  NEXT V5.0 SERIES TO START (choose one)                                     │"
    echo "├─────────────────────────────────────────────────────────────────────────────┤"
    echo "  Gluon V5.0        — Lattice gluon PDFs, gluon saturation, EIC gluon tomography"
    echo "  Graviton V5.0     — Gravitational waves, quantum gravity, cosmology"
    echo "  Higgs V5.0        — Higgs couplings, HH production, BSM Higgs sectors"
    echo "  Neutrino V5.0     — Oscillation precision, 0νββ, cosmic neutrinos"
    echo "  W/Z V5.0          — EW precision, diboson, HL-LHC projections"
    echo "  Electron V5.0     — g-2, EDM, atomic physics, BSM searches"
    echo "└─────────────────────────────────────────────────────────────────────────────┘"
}

# ─── KEY FILES REFERENCE ──────────────────────────────────
show_key_files() {
    banner "KEY FILES FOR AGENTS"
    
    echo "  📁 Project Root:     $SUBPARTICLES_DIR"
    echo "  📁 Photon V5.0:      $SUBPARTICLES_DIR/Photon_V5.0/"
    echo "  📁 Logs:             $LOGS_DIR/"
    echo "  📁 Scripts:          $SCRIPTS_DIR/"
    echo "  📁 Restart Package:  $RESTART_DIR/"
    echo ""
    echo "  📄 Latest Session Logs:"
    ls -lt "$LOGS_DIR"/session-log-*.md 2>/dev/null | head -5 | awk '{print "    " $9}'
    echo ""
    echo "  📄 Photon V5.0 Parts:"
    for i in {1..9}; do
        printf "    Part %02d: %s\n" "$i" "$SUBPARTICLES_DIR/Photon_V5.0/Part$(printf %02d $i)/"
    done
    echo "    Part 10: $SUBPARTICLES_DIR/Photon_V5.0/Part10/Part_10-Photon_Strong_Fields.md"
    echo "    Part 11: $SUBPARTICLES_DIR/Photon_V5.0/Part11/Part_11-Photon_Nuclear_Physics.md"
    echo "    Parts 12-14: TO BE CREATED"
    echo ""
    echo "  📄 Reference Foundation:"
    echo "    Pion/Kaon V4.0: $SUBPARTICLES_DIR/Pion_Kaon_V4.0/ (14 parts)"
    echo "    Photon V4.0:    $SUBPARTICLES_DIR/Photon_V4.0/ (14 parts)"
}

# ─── GIT STATUS ───────────────────────────────────────────
show_git_status() {
    banner "GIT STATUS"
    cd "$REPO_ROOT"
    git status --short
    echo ""
    log "Current branch: $(git branch --show-current)"
    log "Latest commit:  $(git log --oneline -1)"
    log "Remote status:  $(git status -uno | grep -c 'up to date' && echo 'UP TO DATE' || echo 'HAS CHANGES')"
}

# ─── MAIN MENU ────────────────────────────────────────────
main_menu() {
    clear
    echo -e "${BLUE}${BOLD}"
    cat <<'EOF'
╔══════════════════════════════════════════════════════════════════════════════╗
║     SUBPARTICLES V4/V5 RESEARCH INITIATIVE — MASTER RESUME SCRIPT           ║
║     Carrington Storm Motors / Safe Pod Engineering Company                  ║
╚══════════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    show_project_index
    show_agent_work
    show_key_files
    show_git_status
    check_heartbeats
    
    echo ""
    echo "┌─────────────────────────────────────────────────────────────────────────────┐"
    echo "│  COMMANDS                                                                    │"
    echo "├─────────────────────────────────────────────────────────────────────────────┤"
    echo "  ./MASTER-RESUME.sh start       — Start all three heartbeat modes           │"
    echo "  ./MASTER-RESUME.sh status      — Check heartbeat status                    │"
    echo "  ./MASTER-RESUME.sh index       — Show project index only                   │"
    echo "  ./MASTER-RESUME.sh work        — Show agent work assignments               │"
    echo "  ./MASTER-RESUME.sh files       — Show key file locations                   │"
    echo "  ./MASTER-RESUME.sh git         — Show git status                           │"
    echo "  ./MASTER-RESUME.sh photon10    — View Part 10 (Strong Fields)              │"
    echo "  ./MASTER-RESUME.sh photon11    — View Part 11 (Nuclear Physics)            │"
    echo "  ./MASTER-RESUME.sh photon12    — Create Part 12 template (Spectroscopy)    │"
    echo "  ./MASTER-RESUME.sh photon13    — Create Part 13 template (Quantum Optics)  │"
    echo "  ./MASTER-RESUME.sh photon14    — Create Part 14 template (Synthesis)       │"
    echo "  ./MASTER-RESUME.sh new-v5 <name> — Start new V5.0 series (e.g., Gluon)     │"
    echo "└─────────────────────────────────────────────────────────────────────────────┘"
}

# ─── COMMAND HANDLERS ────────────────────────────────────
view_part() {
    local part=$1
    local file="$SUBPARTICLES_DIR/Photon_V5.0/Part${part}/Part_${part}-*.md"
    if [ -f $file ]; then
        less $file
    else
        error "Part $part not found"
    fi
}

create_part_template() {
    local part_num=$1
    local part_name=$2
    local part_dir="$SUBPARTICLES_DIR/Photon_V5.0/Part${part_num}"
    
    if [ -d "$part_dir" ] && [ -f "$part_dir/Part_${part_num}-*.md" ]; then
        warn "Part $part_num already exists"
        return
    fi
    
    mkdir -p "$part_dir"
    
    cat > "$part_dir/Part_${part_num}-${part_name}.md" <<EOF
# Photon Physics — V5.0 Deep Dive Series
## Part ${part_num} of 14 — ${part_name}

---

### Abstract

This V5.0 installment covers ${part_name,,}, building on Photon V5.0 Parts 1-$((${part_num}-1)) and the Pion/Kaon V4.0 foundation. We develop the photon's role in ${part_name,,} within the one-electron universe framework.

---

### 1. Introduction

[To be developed]

---

### 2. Theoretical Framework

[To be developed]

---

### 3. Key Phenomena

[To be developed]

---

### 4. Experimental Status (2024+)

[To be developed]

---

### 5. One-Electron Universe Perspective

[To be developed - connect to worldline kink ontology from Part 9]

---

### 6. Future Directions

[To be developed]

---

### 7. Summary Table

| Phenomenon | Parameter | Worldline Picture | Test |
|------------|-----------|-------------------|------|
| [TBD]      | [TBD]     | [TBD]             | [TBD] |

---

### 8. References

1. **Photon V5.0 Parts 1-$((${part_num}-1))** — Foundation
2. **Pion/Kaon V4.0 Parts 04, 05, 09, 13, 14** — Radiative decays, finite T/μ, one-electron, future facilities, synthesis
3. [Add specific references]

---

*End of Part ${part_num} — Next: [Next Part Title]*
EOF
    
    success "Created template for Part ${part_num}: ${part_name}"
    log "Edit: $part_dir/Part_${part_num}-${part_name}.md"
}

start_new_v5() {
    local particle=$1
    if [ -z "$particle" ]; then
        error "Usage: $0 new-v5 <ParticleName>"
        return
    fi
    
    local dir_name="${particle}_V5.0"
    local target_dir="$SUBPARTICLES_DIR/$dir_name"
    
    if [ -d "$target_dir" ]; then
        warn "Directory $dir_name already exists"
        return
    fi
    
    mkdir -p "$target_dir"
    log "Created $target_dir"
    
    # Create Part 01 template
    local part_dir="$target_dir/Part01"
    mkdir -p "$part_dir"
    
    cat > "$part_dir/Part_01-${particle}_V5_Overview.md" <<EOF
# ${particle} Physics — V5.0 Deep Dive Series
## Part 1 of 14 — ${particle} V5.0 Overview and Precision Frontier

---

### Abstract

This V5.0 installment launches the ${particle} deep dive series, building on the ${particle} V4.0 foundation (14 parts) and incorporating 2024-2025 experimental/theoretical advances. We develop the ${particle} at the precision frontier and its role in the one-electron universe.

---

### 1. ${particle} in the Standard Model

[To be developed]

---

### 2. Precision Measurements (2024+)

[To be developed]

---

### 3. Theoretical Advances (2024+)

[To be developed]

---

### 4. One-Electron Universe Perspective

[To be developed]

---

### 5. V5.0 Series Roadmap

| Part | Title | Focus |
|------|-------|-------|
| 01 | This document | Overview and precision frontier |
| 02 | [TBD] | [TBD] |
| ... | ... | ... |
| 14 | Final Synthesis | Unified ontology, all predictions |

---

### 6. References

1. **${particle} V4.0** — 14 parts complete
2. **Pion/Kaon V4.0 Parts 09, 14** — One-electron framework
3. [Add 2024-2025 references]

---

*End of Part 1 — Next: [Part 2 Title]*
EOF
    
    success "Created new V5.0 series: ${particle}_V5.0 with Part 01 template"
    log "Directory: $target_dir"
    log "Next: Create Parts 2-14 following the 14-part structure"
}

# ─── DISPATCH ────────────────────────────────────────────
case "${1:-menu}" in
    start)
        start_heartbeats
        ;;
    status)
        check_heartbeats
        ;;
    index)
        show_project_index
        ;;
    work)
        show_agent_work
        ;;
    files)
        show_key_files
        ;;
    git)
        show_git_status
        ;;
    photon10)
        view_part 10
        ;;
    photon11)
        view_part 11
        ;;
    photon12)
        create_part_template 12 "Precision_Spectroscopy"
        ;;
    photon13)
        create_part_template 13 "Quantum_Optics_Photonics"
        ;;
    photon14)
        create_part_template 14 "Final_Synthesis"
        ;;
    new-v5)
        start_new_v5 "${2:-}"
        ;;
    menu|*)
        main_menu
        ;;
esac