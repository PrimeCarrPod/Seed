## Appendix — Quick Reference

### Key Commands

```bash
# Session startup
source ../../__Python_Tools/write_large_file.py  # Load utilities

# Document operations
python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>
python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py compress <file>

# Git workflow
git add -A && git commit -m '<type>: <description>' && git push
```

### File Locations

- **Project Root**: `./CSMFAB/FLUID-DAMP`
- **Chunks**: `./CSMFAB/FLUID-DAMP/README_chunks/`
- **Manifest**: `./CSMFAB/FLUID-DAMP/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMFAB/FLUID-DAMP/memory/`
- **Runner Files**: `./CSMFAB/FLUID-DAMP/NEXT_runner_*.md`

### Related Projects


- **Category Peers**: Other projects in CSMFAB
- **File Count**: 1 files

---

*README generated for FLUID-DAMP — Whole Project (standalone)*
*Category: CSMFAB | Files: 1 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
