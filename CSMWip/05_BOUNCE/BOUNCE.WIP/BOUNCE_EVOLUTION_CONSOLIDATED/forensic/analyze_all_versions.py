#!/usr/bin/env python3
"""
Forensic Analysis Script for Bounce App Versions
Unzips all versions, extracts key files, diffs consecutive versions,
documents APK size anomalies and changes.
"""

import os
import zipfile
import subprocess
import json
import csv
from pathlib import Path
from datetime import datetime

# Configuration
BOUNCE_DIR = Path("/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/worktrees/worktree_12e4cc5c-88f9-4c4e-a46d-b5896e6b345e/CSMApps/Bounce")
EVOLUTION_DIR = Path("/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/worktrees/worktree_12e4cc5c-88f9-4c4e-a46d-b5896e6b345e/CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION")
FORENSIC_DIR = EVOLUTION_DIR / "forensic"
SOURCE_DIR = FORENSIC_DIR / "source"
APKS_DIR = FORENSIC_DIR / "apks"
DIFFS_DIR = FORENSIC_DIR / "diffs"
ANALYSIS_DIR = FORENSIC_DIR / "analysis"

# Key files to extract from each version
KEY_FILES = [
    "src/main/java/com/carrpod/bounce/MainActivity.java",
    "src/main/assets/bounce.html",
    "build.sh",
    "src/main/AndroidManifest.xml",
    "src/main/assets/js/three.min.js",
]

# Output files
VERSION_LOG = ANALYSIS_DIR / "version_analysis_log.json"
SIZE_LOG = ANALYSIS_DIR / "apk_size_analysis.csv"
CHANGE_LOG = ANALYSIS_DIR / "version_changes.csv"
ERROR_LOG = ANALYSIS_DIR / "errors_and_solutions.csv"
BEST_PRACTICES = ANALYSIS_DIR / "best_practices.csv"
ANTI_PATTERNS = ANALYSIS_DIR / "anti_patterns.csv"

def get_version_from_filename(filename):
    """Extract version number from filename"""
    # Handle various formats
    name = filename.replace("CarrPod_Bounce_", "").replace(".zip", "")
    if name == "v1":
        return "1.0.0"
    if "work-in-progress" in name:
        return "wip"
    if "87-new" in name:
        return "1.0.87-new"
    if " 2" in name:
        return name.replace(" 2", "-dup")
    # Remove 'v' prefix if present
    if name.startswith('v'):
        name = name[1:]
    return name

def unzip_version(zip_path, extract_dir):
    """Unzip a version to extract directory"""
    try:
        with zipfile.ZipFile(zip_path, 'r') as zf:
            zf.extractall(extract_dir)
        return True, None
    except Exception as e:
        return False, str(e)

def extract_key_files(version_dir, version, target_dir):
    """Extract key files from version to forensic source directory"""
    extracted = {}
    for key_file in KEY_FILES:
        src = version_dir / key_file
        if src.exists():
            dst = target_dir / f"{version}_{src.name}"
            dst.parent.mkdir(parents=True, exist_ok=True)
            subprocess.run(["cp", str(src), str(dst)], check=False)
            extracted[key_file] = {"size": src.stat().st_size, "lines": count_lines(src)}
        else:
            extracted[key_file] = {"size": 0, "lines": 0, "missing": True}
    return extracted

def count_lines(filepath):
    """Count lines in a file"""
    try:
        with open(filepath, 'r', errors='ignore') as f:
            return sum(1 for _ in f)
    except:
        return 0

def get_apk_size(version_dir):
    """Find and measure APK size if present"""
    apk_files = list(version_dir.rglob("*.apk"))
    if apk_files:
        return apk_files[0].stat().st_size
    return 0

def diff_versions(prev_version, curr_version, prev_dir, curr_dir):
    """Generate diff between two versions for key files"""
    diffs = {}
    for key_file in KEY_FILES:
        prev_file = prev_dir / f"{prev_version}_{Path(key_file).name}"
        curr_file = curr_dir / f"{curr_version}_{Path(key_file).name}"
        if prev_file.exists() and curr_file.exists():
            diff_file = DIFFS_DIR / f"{prev_version}_to_{curr_version}_{Path(key_file).name}.diff"
            result = subprocess.run(
                ["diff", "-u", str(prev_file), str(curr_file)],
                capture_output=True, text=True
            )
            diffs[key_file] = {
                "lines_added": result.stdout.count('\n+') if result.stdout else 0,
                "lines_removed": result.stdout.count('\n-') if result.stdout else 0,
                "diff_file": str(diff_file) if result.stdout else None
            }
            if result.stdout:
                with open(diff_file, 'w') as f:
                    f.write(result.stdout)
        else:
            diffs[key_file] = {"error": "One or both files missing"}
    return diffs

def analyze_version(zip_path, version, prev_version, prev_extracted):
    """Analyze a single version"""
    version_dir = SOURCE_DIR / version
    version_dir.mkdir(parents=True, exist_ok=True)
    
    # Unzip
    success, error = unzip_version(zip_path, version_dir)
    if not success:
        return {"version": version, "error": error, "success": False}
    
    # Find the actual source directory (might be nested)
    src_dirs = list(version_dir.rglob("src/main"))
    if src_dirs:
        actual_src = src_dirs[0].parent.parent
    else:
        actual_src = version_dir
    
    # Extract key files
    extracted = extract_key_files(actual_src, version, SOURCE_DIR)
    
    # Get APK size
    apk_size = get_apk_size(actual_src)
    
    # Get zip size
    zip_size = zip_path.stat().st_size
    
    # Diff with previous version
    diffs = {}
    if prev_version and prev_extracted:
        diffs = diff_versions(prev_version, version, SOURCE_DIR, SOURCE_DIR)
    
    # Analyze MainActivity for specific patterns
    main_activity_analysis = analyze_main_activity(SOURCE_DIR / f"{version}_MainActivity.java")
    
    # Analyze bounce.html for specific patterns
    html_analysis = analyze_bounce_html(SOURCE_DIR / f"{version}_bounce.html")
    
    return {
        "version": version,
        "zip_size": zip_size,
        "apk_size": apk_size,
        "extracted_files": extracted,
        "diffs": diffs,
        "main_activity": main_activity_analysis,
        "bounce_html": html_analysis,
        "success": True
    }

def analyze_main_activity(filepath):
    """Analyze MainActivity.java for key patterns"""
    patterns = {
        "wifi_scanning": "WifiManager",
        "bluetooth_le": "BluetoothLeScanner",
        "wifi_direct": "WifiP2pManager",
        "gps": "LocationManager",
        "sensors": "SensorManager",
        "webview": "WebView",
        "javascript_interface": "@JavascriptInterface",
        "wake_lock": "PowerManager",
        "permissions": "checkSelfPermission",
        "kalman": "KalmanFilter",
        "trilateration": "Trilateration",
        "ekf": "PositionEKF",
        "particle_filter": "ParticleFilter",
        "hmm": "ZoneHMM",
        "rtt": "WifiRttRanging",
        "bt_3d": "btTrajectories",
        "theory_mode": "THEORY",
        "trail": "trailPoints",
        "broadcast": "refreshBroadcastSSID",
        "update_check": "onUpdateAvailable",
    }
    
    results = {k: False for k in patterns}
    line_count = 0
    
    if filepath.exists():
        try:
            with open(filepath, 'r', errors='ignore') as f:
                content = f.read()
                line_count = content.count('\n')
                for pattern, keyword in patterns.items():
                    if keyword in content:
                        results[pattern] = True
        except:
            pass
    
    results["line_count"] = line_count
    return results

def analyze_bounce_html(filepath):
    """Analyze bounce.html for key patterns"""
    patterns = {
        "threejs": "three.min.js",
        "orbit_controls": "OrbitControls",
        "effect_composer": "EffectComposer",
        "unreal_bloom": "UnrealBloomPass",
        "shader_pass": "ShaderPass",
        "tardigrade": "tardigrade",
        "beacon_physics": "beacon.*physics",
        "grid_floor": "grid.*floor",
        "trail_curve": "CatmullRomCurve3",
        "camera_modes": "cameraMode",
        "hud_panels": "panel-",
        "beacon_panel": "BEACONS",
        "scan_panel": "SCAN",
        "bt_panel": "BT",
        "forge_panel": "FORGE",
        "legend": "legend",
        "wifi_scanner_ui": "Wi-Fi Scanner",
        "control_buttons": "btn-",
        "broadcast_status": "broadcastStatus",
        "update_notification": "updateNotification",
        "chart_js": "Chart.js",
        "glsl_shaders": "glsl",
        "canvas_texture": "CanvasTexture",
        "additive_blending": "AdditiveBlending",
    }
    
    results = {k: False for k in patterns}
    line_count = 0
    
    if filepath.exists():
        try:
            with open(filepath, 'r', errors='ignore') as f:
                content = f.read()
                line_count = content.count('\n')
                for pattern, keyword in patterns.items():
                    if keyword in content:
                        results[pattern] = True
        except:
            pass
    
    results["line_count"] = line_count
    return results

def main():
    print("=== BOUNCE FORENSIC ANALYSIS STARTED ===")
    print(f"Time: {datetime.now().isoformat()}")
    
    # Create directories
    for d in [SOURCE_DIR, APKS_DIR, DIFFS_DIR, ANALYSIS_DIR]:
        d.mkdir(parents=True, exist_ok=True)
    
    # Get all zip files sorted by version
    zip_files = sorted(BOUNCE_DIR.glob("CarrPod_Bounce_*.zip"))
    
    # Filter out special files for main analysis
    main_versions = []
    for zf in zip_files:
        version = get_version_from_filename(zf.name)
        if version not in ["wip", "1.0.87-new", "1.0.91-dup"]:
            main_versions.append((version, zf))
    
    # Sort by version number
    def version_key(v):
        ver = v[0]
        # Handle special cases
        if ver == "1.0.0":
            return (1, 0, 0)
        if ver in ["wip", "1.0.87-new", "1.0.91-dup"]:
            return (999, 999, 999)
        parts = ver.split('.')
        try:
            return tuple(int(p) for p in parts)
        except:
            return (0, 0, 0)
    
    main_versions.sort(key=version_key)
    
    print(f"Found {len(main_versions)} main versions to analyze")
    
    # Analysis results
    all_results = []
    prev_version = None
    prev_extracted = None
    
    # CSV writers
    with open(SIZE_LOG, 'w', newline='') as size_f, \
         open(CHANGE_LOG, 'w', newline='') as change_f, \
         open(ERROR_LOG, 'w', newline='') as error_f:
        
        size_writer = csv.writer(size_f)
        size_writer.writerow(["Version", "Zip_Size_Bytes", "APK_Size_Bytes", "MainActivity_Lines", "HTML_Lines", "Build_sh_Lines", "Anomaly_Flag"])
        
        change_writer = csv.writer(change_f)
        change_writer.writerow(["From_Version", "To_Version", "File", "Lines_Added", "Lines_Removed", "Major_Change"])
        
        error_writer = csv.writer(error_f)
        error_writer.writerow(["Version", "Error_Type", "Description", "Solution_Found", "Solution_Version"])
    
    # Process each version
    for version, zip_path in main_versions:
        print(f"\nAnalyzing {version}...")
        result = analyze_version(zip_path, version, prev_version, prev_extracted)
        all_results.append(result)
        
        # Write size analysis
        with open(SIZE_LOG, 'a', newline='') as f:
            writer = csv.writer(f)
            ma_lines = result.get("extracted_files", {}).get("src/main/java/com/carrpod/bounce/MainActivity.java", {}).get("lines", 0)
            html_lines = result.get("extracted_files", {}).get("src/main/assets/bounce.html", {}).get("lines", 0)
            build_lines = result.get("extracted_files", {}).get("build.sh", {}).get("lines", 0)
            anomaly = "YES" if result.get("apk_size", 0) < 150000 or result.get("apk_size", 0) > 300000 else "NO"
            writer.writerow([version, result["zip_size"], result["apk_size"], ma_lines, html_lines, build_lines, anomaly])
        
        # Write changes
        with open(CHANGE_LOG, 'a', newline='') as f:
            writer = csv.writer(f)
            for file_key, diff in result.get("diffs", {}).items():
                if isinstance(diff, dict) and "lines_added" in diff:
                    major = "YES" if diff["lines_added"] > 50 or diff["lines_removed"] > 50 else "NO"
                    writer.writerow([prev_version, version, file_key, diff["lines_added"], diff["lines_removed"], major])
        
        prev_version = version
        prev_extracted = result.get("extracted_files", {})
    
    # Save full results
    with open(VERSION_LOG, 'w') as f:
        json.dump(all_results, f, indent=2, default=str)
    
    print(f"\n=== ANALYSIS COMPLETE ===")
    print(f"Results saved to {ANALYSIS_DIR}")
    print(f"Versions analyzed: {len(all_results)}")

if __name__ == "__main__":
    main()