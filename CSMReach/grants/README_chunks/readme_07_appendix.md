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

- **Project Root**: `./CSMReach/grants`
- **Chunks**: `./CSMReach/grants/README_chunks/`
- **Manifest**: `./CSMReach/grants/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMReach/grants/memory/`
- **Runner Files**: `./CSMReach/grants/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMReach (`CSMReach`)
- **Category Peers**: Other projects in CSMReach
- **File Count**: 4 files

---

*README generated for grants — Part of Another Project*
*Category: CSMReach | Files: 4 | Parent: CSMReach*
*Generated using write_large_file.py IncrementalDocumentWriter*
