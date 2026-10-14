#!/usr/bin/env python3
"""
Migrate AegisOutfitFabricator Pieces/ → chunks/
Uses write_large_file.py for logical chapter splitting
"""

import os
import sys
import subprocess
import json
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent.parent / "CSMWip/12_AegisOutfitFabricator"
PIECES_DIR = PROJECT_ROOT / "Pieces"
CHUNKS_DIR = PROJECT_ROOT / "chunks"
FINISHED_DIR = PROJECT_ROOT / "FinishedWork"
WRITE_TOOL = PROJECT_ROOT.parent.parent / "__Python_Tools/write_large_file.py"

# Document mappings: piece prefix -> finishedwork filename
DOC_MAP = {
    "DOC-01_Executive_System_Architecture": "DOC-01_Executive_System_Architecture.md",
    "DOC-02_Historical_Context_Design_Philosophy": "DOC-02_Historical_Context_Design_Philosophy.md",
    "DOC-03_Material_Systems_Integration": "DOC-03_Material_Systems_Integration.md",
    "DOC-04_Geometric_Pattern_System": "DOC-04_Geometric_Pattern_System.md",
    "DOC-05_Structural_Framework_Specification": "DOC-05_Structural_Framework_Specification.md",
    "DOC-06_Protective_Layer_Architecture": "DOC-06_Protective_Layer_Architecture.md",
    "DOC-07_Textile_Engineering_Specification": "DOC-07_Textile_Engineering_Specification.md",
    "DOC-08_Manufacturing_Process_Plan": "DOC-08_Manufacturing_Process_Plan.md",
    "DOC-09_Quality_Assurance_Testing_Protocol": "DOC-09_Quality_Assurance_Testing_Protocol.md",
    "DOC-10_Deployment_Operational_Procedures": "DOC-10_Deployment_Operational_Procedures.md",
    "DOC-11_RenaissanceMan_TS_Specification": "DOC-11_RenaissanceMan_TS_Specification.md",
    "DOC-12_RenaissanceMan_TG_Specification": "DOC-12_RenaissanceMan_TG_Specification.md",
    "DOC-13_RenaissanceMan_SS_Specification": "DOC-13_RenaissanceMan_SS_Specification.md",
    "DOC-14_RenaissanceMan_SG_Specification": "DOC-14_RenaissanceMan_SG_Specification.md",
    "DOC-15_RenaissanceWoMan_TS_Specification": "DOC-15_RenaissanceWoMan_TS_Specification.md",
    "DOC-16_RenaissanceWoMan_TG_Specification": "DOC-16_RenaissanceWoMan_TG_Specification.md",
    "DOC-17_RenaissanceWoMan_SS_Specification": "DOC-17_RenaissanceWoMan_SS_Specification.md",
    "DOC-18_RenaissanceWoMan_SG_Specification": "DOC-18_RenaissanceWoMan_SG_Specification.md",
    "DOC-19_Cross_Edition_Compatibility_Matrix": "DOC-19_Cross_Edition_Compatibility_Matrix.md",
    "DOC-20_Edition_Delta_Tables": "DOC-20_Edition_Delta_Tables.md",
    "MAT-01_Silk_Fibroin_Engineering_Spec": "MAT-01_Silk_Fibroin_Engineering_Spec.md",
    "MAT-02_Structural_Foundation_Materials": "MAT-02_Structural_Foundation_Materials.md",
    "MAT-03_Protective_Layer_Integration": "MAT-03_Protective_Layer_Integration.md",
    "MAT-04_Cross_Property_Validation_Matrix": "MAT-04_Cross_Property_Validation_Matrix.md",
    "SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory": "SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory.md",
    "SYNTH-02_Protective_Layer_Adaptation_AIMES_to_Renaissance": "SYNTH-02_Protective_Layer_Adaptation_AIMES_to_Renaissance.md",
    "SYNTH-03_Geometric_Drafting_Kernel_Specification": "SYNTH-03_Geometric_Drafting_Kernel_Specification.md",
    "DRAFT-01_Alcega_Developable_Surface_Engine": "DRAFT-01_Alcega_Developable_Surface_Engine.md",
    "DRAFT-02_Garsault_Proportional_Scaling_System": "DRAFT-02_Garsault_Proportional_Scaling_System.md",
    "DRAFT-03_Pleating_Kernel": "DRAFT-03_Pleating_Kernel.md",
    "DRAFT-04_Farthingale_Pannier_Hoop_Architecture": "DRAFT-04_Farthingale_Pannier_Hoop_Architecture.md",
    "DRAFT-05_Zero_Waste_Nesting_Optimizer": "DRAFT-05_Zero_Waste_Nesting_Optimizer.md",
}


def run_cmd(cmd, cwd=None):
    print(f"$ {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd or PROJECT_ROOT, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout)
    if result.stderr:
        print(result.stderr, file=sys.stderr)
    return result


def migrate_document(doc_prefix, finished_name):
    """Migrate one document from Pieces to chunks"""
    finished_path = FINISHED_DIR / finished_name
    if not finished_path.exists():
        print(f"SKIP: {finished_name} not found in FinishedWork/")
        return False

    chunk_dir = CHUNKS_DIR / doc_prefix
    chunk_dir.mkdir(parents=True, exist_ok=True)

    print(f"\n=== Migrating {doc_prefix} ===")

    # Split into logical chapters
    result = run_cmd([
        sys.executable, str(WRITE_TOOL), "split",
        str(finished_path),
        str(chunk_dir),
        "chapter", ".md"
    ])

    if result.returncode != 0:
        print(f"FAILED: Split failed for {doc_prefix}")
        return False

    # Generate manifest
    result = run_cmd([
        sys.executable, str(WRITE_TOOL), "manifest",
        str(chunk_dir)
    ])

    if result.returncode != 0:
        print(f"FAILED: Manifest failed for {doc_prefix}")
        return False

    # Verify
    result = run_cmd([
        sys.executable, str(WRITE_TOOL), "verify",
        str(chunk_dir)
    ])

    if result.returncode != 0:
        print(f"FAILED: Verify failed for {doc_prefix}")
        return False

    print(f"✓ Migrated {doc_prefix}")
    return True


def compress_finishedwork():
    """Compress all FinishedWork markdown files"""
    print("\n=== Compressing FinishedWork/ ===")
    for md_file in FINISHED_DIR.glob("*.md"):
        if not md_file.name.endswith(".gz"):
            result = run_cmd([
                sys.executable, str(WRITE_TOOL), "compress",
                str(md_file)
            ])
            if result.returncode == 0:
                print(f"✓ Compressed {md_file.name}")
            else:
                print(f"FAILED: Compress {md_file.name}")


def create_master_index():
    """Create master index of all chunks"""
    print("\n=== Creating Master Index ===")
    index = {
        "project": "AegisOutfitFabricator",
        "migration_date": "2026-10-14",
        "documents": {}
    }

    for doc_prefix, finished_name in DOC_MAP.items():
        chunk_dir = CHUNKS_DIR / doc_prefix
        manifest_path = chunk_dir / "MANIFEST.json"
        if manifest_path.exists():
            with open(manifest_path) as f:
                manifest = json.load(f)
            index["documents"][doc_prefix] = {
                "finished_file": finished_name,
                "chunk_count": len(manifest),
                "chunks": manifest
            }

    index_path = CHUNKS_DIR / "MASTER_INDEX.json"
    with open(index_path, 'w') as f:
        json.dump(index, f, indent=2)
    print(f"✓ Master index created: {index_path}")


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Migrate Pieces to chunks")
    parser.add_argument("--source", default="Pieces", help="Source directory")
    parser.add_argument("--target", default="chunks", help="Target directory")
    parser.add_argument("--doc", help="Migrate single document prefix")
    parser.add_argument("--compress", action="store_true", help="Compress FinishedWork after migration")
    parser.add_argument("--index", action="store_true", help="Create master index")
    args = parser.parse_args()

    CHUNKS_DIR.mkdir(parents=True, exist_ok=True)

    if args.doc:
        if args.doc in DOC_MAP:
            migrate_document(args.doc, DOC_MAP[args.doc])
        else:
            print(f"Unknown document: {args.doc}")
            sys.exit(1)
    else:
        # Migrate all
        success = 0
        failed = 0
        for doc_prefix, finished_name in DOC_MAP.items():
            if migrate_document(doc_prefix, finished_name):
                success += 1
            else:
                failed += 1
        print(f"\n=== Migration Complete: {success} success, {failed} failed ===")

    if args.compress or not args.doc:
        compress_finishedwork()

    if args.index or not args.doc:
        create_master_index()


if __name__ == "__main__":
    main()