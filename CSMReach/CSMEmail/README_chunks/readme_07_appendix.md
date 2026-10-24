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

- **Project Root**: `./CSMReach/CSMEmail`
- **Chunks**: `./CSMReach/CSMEmail/README_chunks/`
- **Manifest**: `./CSMReach/CSMEmail/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMReach/CSMEmail/memory/`
- **Runner Files**: `./CSMReach/CSMEmail/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMReach (`CSMReach`)
- **Category Peers**: Other projects in CSMReach
- **File Count**: 2 files

---

*README generated for CSMEmail — Part of Another Project*
*Category: CSMReach | Files: 2 | Parent: CSMReach*
*Generated using write_large_file.py IncrementalDocumentWriter*
