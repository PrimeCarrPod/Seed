#!/usr/bin/env python3
"""
Large File Handling Utilities
Replaces the 13-piece fragmentation approach
"""

import os
import sys
import hashlib
import json
import gzip
import shutil
from pathlib import Path


def write_large_file(input_path, output_path, chunk_size=1024*1024):
    """Write large file in chunks to avoid memory issues"""
    input_path = Path(input_path)
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(input_path, 'rb') as src, open(output_path, 'wb') as dst:
        while True:
            chunk = src.read(chunk_size)
            if not chunk:
                break
            dst.write(chunk)
    print(f"Wrote {output_path} ({output_path.stat().st_size} bytes)")


def compress_file(input_path, output_path=None, keep_original=False):
    """Compress file with gzip"""
    input_path = Path(input_path)
    if output_path is None:
        output_path = input_path.with_suffix(input_path.suffix + '.gz')
    else:
        output_path = Path(output_path)

    with open(input_path, 'rb') as f_in:
        with gzip.open(output_path, 'wb') as f_out:
            shutil.copyfileobj(f_in, f_out)

    if not keep_original:
        input_path.unlink()
    print(f"Compressed {input_path} -> {output_path} ({output_path.stat().st_size} bytes)")
    return output_path


def decompress_file(input_path, output_path=None):
    """Decompress gzip file"""
    input_path = Path(input_path)
    if output_path is None:
        output_path = input_path.with_suffix('')
    else:
        output_path = Path(output_path)

    with gzip.open(input_path, 'rb') as f_in:
        with open(output_path, 'wb') as f_out:
            shutil.copyfileobj(f_in, f_out)
    print(f"Decompressed {input_path} -> {output_path}")
    return output_path


def split_logical_chunks(input_path, output_dir, chunk_prefix="chapter", ext=".md"):
    """Split markdown by logical headers (## or #)"""
    input_path = Path(input_path)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    content = input_path.read_text(encoding='utf-8')
    lines = content.split('\n')

    chunks = []
    current_chunk = []
    current_title = "intro"
    chunk_num = 0

    for line in lines:
        if line.startswith('## ') or (line.startswith('# ') and chunk_num > 0):
            if current_chunk:
                chunk_num += 1
                safe_title = current_title.lower().replace(' ', '_').replace('/', '_').replace(':', '').replace('(', '').replace(')', '').replace('.', '').replace(',', '').replace('&', '').replace('–', '').replace('—', '').replace('⁻', '').replace('ₑ', 'e').replace('ₑ', 'e')[:30]
                filename = f"{chunk_prefix}_{chunk_num:02d}_{safe_title}{ext}"
                (output_dir / filename).write_text('\n'.join(current_chunk), encoding='utf-8')
                chunks.append(filename)
            current_title = line.lstrip('# ').strip()
            current_chunk = [line]
        else:
            current_chunk.append(line)

    if current_chunk:
        chunk_num += 1
        safe_title = current_title.lower().replace(' ', '_').replace('/', '_').replace(':', '').replace('(', '').replace(')', '').replace('.', '').replace(',', '').replace('&', '').replace('–', '').replace('—', '').replace('⁻', '').replace('ₑ', 'e').replace('ₑ', 'e')[:30]
        filename = f"{chunk_prefix}_{chunk_num:02d}_{safe_title}{ext}"
        (output_dir / filename).write_text('\n'.join(current_chunk), encoding='utf-8')
        chunks.append(filename)

    print(f"Split into {len(chunks)} chunks in {output_dir}")
    return chunks


def concat_chunks(chunk_dir, output_path, pattern="chapter_*.md"):
    """Concatenate chunk files in order"""
    chunk_dir = Path(chunk_dir)
    output_path = Path(output_path)
    chunks = sorted(chunk_dir.glob(pattern))

    with open(output_path, 'w', encoding='utf-8') as out:
        for chunk in chunks:
            out.write(chunk.read_text(encoding='utf-8'))
            out.write('\n\n')
    print(f"Concatenated {len(chunks)} chunks -> {output_path}")


def generate_manifest(chunk_dir, manifest_path="MANIFEST.json", pattern="*"):
    """Generate manifest with checksums"""
    chunk_dir = Path(chunk_dir)
    manifest = {}

    for f in chunk_dir.glob(pattern):
        if f.is_file():
            sha256 = hashlib.sha256(f.read_bytes()).hexdigest()
            manifest[f.name] = {
                "size": f.stat().st_size,
                "sha256": sha256
            }

    manifest_path = Path(manifest_path)
    manifest_path.write_text(json.dumps(manifest, indent=2))
    print(f"Manifest written to {manifest_path} ({len(manifest)} files)")
    return manifest


def verify_manifest(chunk_dir, manifest_path="MANIFEST.json"):
    """Verify files against manifest"""
    chunk_dir = Path(chunk_dir)
    manifest = json.loads(Path(manifest_path).read_text())

    for name, info in manifest.items():
        f = chunk_dir / name
        if not f.exists():
            print(f"MISSING: {name}")
            return False
        sha256 = hashlib.sha256(f.read_bytes()).hexdigest()
        if sha256 != info["sha256"]:
            print(f"CORRUPTED: {name} (checksum mismatch)")
            return False
    print(f"Verified {len(manifest)} files OK")
    return True


def main():
    if len(sys.argv) < 2:
        print("Usage:")
        print("  write_large_file.py write <input> <output> [chunk_size]")
        print("  write_large_file.py compress <input> [output]")
        print("  write_large_file.py decompress <input> [output]")
        print("  write_large_file.py split <input> <output_dir> [prefix] [ext]")
        print("  write_large_file.py concat <chunk_dir> <output> [pattern]")
        print("  write_large_file.py manifest <chunk_dir> [manifest_path] [pattern]")
        print("  write_large_file.py verify <chunk_dir> [manifest_path]")
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "write":
        write_large_file(sys.argv[2], sys.argv[3], int(sys.argv[4]) if len(sys.argv) > 4 else 1024*1024)
    elif cmd == "compress":
        compress_file(sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else None)
    elif cmd == "decompress":
        decompress_file(sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else None)
    elif cmd == "split":
        split_logical_chunks(sys.argv[2], sys.argv[3], sys.argv[4] if len(sys.argv) > 4 else "chapter", sys.argv[5] if len(sys.argv) > 5 else ".md")
    elif cmd == "concat":
        concat_chunks(sys.argv[2], sys.argv[3], sys.argv[4] if len(sys.argv) > 4 else "chapter_*.md")
    elif cmd == "manifest":
        generate_manifest(sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else "MANIFEST.json", sys.argv[4] if len(sys.argv) > 4 else "*")
    elif cmd == "verify":
        verify_manifest(sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else "MANIFEST.json")
    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)


if __name__ == "__main__":
    main()