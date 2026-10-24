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

- **Project Root**: `./CSMSOPP/GUIDE`
- **Chunks**: `./CSMSOPP/GUIDE/README_chunks/`
- **Manifest**: `./CSMSOPP/GUIDE/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMSOPP/GUIDE/memory/`
- **Runner Files**: `./CSMSOPP/GUIDE/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMSOPP (`CSMSOPP`)
- **Category Peers**: Other projects in CSMSOPP
- **File Count**: 1 files

---

*README generated for GUIDE — Part of Another Project*
*Category: CSMSOPP | Files: 1 | Parent: CSMSOPP*
*Generated using write_large_file.py IncrementalDocumentWriter*
