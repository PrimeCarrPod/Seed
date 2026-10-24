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

- **Project Root**: `./CSMSOPP/WILLIAMS-V3`
- **Chunks**: `./CSMSOPP/WILLIAMS-V3/README_chunks/`
- **Manifest**: `./CSMSOPP/WILLIAMS-V3/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMSOPP/WILLIAMS-V3/memory/`
- **Runner Files**: `./CSMSOPP/WILLIAMS-V3/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMSOPP (`CSMSOPP`)
- **Category Peers**: Other projects in CSMSOPP
- **File Count**: 4 files

---

*README generated for WILLIAMS-V3 — Part of Another Project*
*Category: CSMSOPP | Files: 4 | Parent: CSMSOPP*
*Generated using write_large_file.py IncrementalDocumentWriter*
