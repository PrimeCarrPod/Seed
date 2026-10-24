#!/usr/bin/env python3
import csv
import subprocess
import sys

def main():
    csv_path = "REPO_INDEX_V6.csv"
    
    with open(csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            project_name = row['Project']
            project_path = row['Path']
            summary = row['Summary']
            category = row['Category']
            parent = row['ParentProject']
            filecount = row['FileCount']
            state = row['State']
            
            # Skip if path doesn't exist or filecount is empty
            if not filecount or filecount.strip() == '':
                print(f"Skipping {project_name}: no file count")
                continue
                
            print(f"Generating README for {project_name}...")
            try:
                result = subprocess.run([
                    sys.executable, "README_GENERATOR/generate_readme.py",
                    project_name, project_path, summary, category, parent, filecount, state
                ], capture_output=True, text=True, timeout=60)
                
                if result.returncode == 0:
                    print(f"  Success: {result.stdout.strip()}")
                else:
                    print(f"  Error: {result.stderr.strip()}")
            except subprocess.TimeoutExpired:
                print(f"  Timeout")
            except Exception as e:
                print(f"  Exception: {e}")

if __name__ == "__main__":
    main()