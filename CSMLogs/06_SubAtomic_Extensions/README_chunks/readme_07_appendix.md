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

- **Project Root**: `./CSMLogs/06_SubAtomic_Extensions`
- **Chunks**: `./CSMLogs/06_SubAtomic_Extensions/README_chunks/`
- **Manifest**: `./CSMLogs/06_SubAtomic_Extensions/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMLogs/06_SubAtomic_Extensions/memory/`
- **Runner Files**: `./CSMLogs/06_SubAtomic_Extensions/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMLogs (`CSMLogs`)
- **Category Peers**: Other projects in CSMLogs
- **File Count**: 4 files

---

*README generated for 06_SubAtomic_Extensions — Part of Another Project*
*Category: CSMLogs | Files: 4 | Parent: CSMLogs*
*Generated using write_large_file.py IncrementalDocumentWriter*
