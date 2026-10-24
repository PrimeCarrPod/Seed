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

- **Project Root**: `./CSMReach/AEGIS-Covenant-Output`
- **Chunks**: `./CSMReach/AEGIS-Covenant-Output/README_chunks/`
- **Manifest**: `./CSMReach/AEGIS-Covenant-Output/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMReach/AEGIS-Covenant-Output/memory/`
- **Runner Files**: `./CSMReach/AEGIS-Covenant-Output/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMReach (`CSMReach`)
- **Category Peers**: Other projects in CSMReach
- **File Count**: 16 files

---

*README generated for AEGIS-Covenant-Output — Part of Another Project*
*Category: CSMReach | Files: 16 | Parent: CSMReach*
*Generated using write_large_file.py IncrementalDocumentWriter*
