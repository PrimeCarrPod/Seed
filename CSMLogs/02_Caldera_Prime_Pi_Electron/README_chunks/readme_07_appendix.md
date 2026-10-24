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

- **Project Root**: `./CSMLogs/02_Caldera_Prime_Pi_Electron`
- **Chunks**: `./CSMLogs/02_Caldera_Prime_Pi_Electron/README_chunks/`
- **Manifest**: `./CSMLogs/02_Caldera_Prime_Pi_Electron/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMLogs/02_Caldera_Prime_Pi_Electron/memory/`
- **Runner Files**: `./CSMLogs/02_Caldera_Prime_Pi_Electron/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMLogs (`CSMLogs`)
- **Category Peers**: Other projects in CSMLogs
- **File Count**: 9 files

---

*README generated for 02_Caldera_Prime_Pi_Electron — Part of Another Project*
*Category: CSMLogs | Files: 9 | Parent: CSMLogs*
*Generated using write_large_file.py IncrementalDocumentWriter*
