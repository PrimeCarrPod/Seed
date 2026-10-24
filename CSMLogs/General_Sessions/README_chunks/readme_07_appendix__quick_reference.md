## Appendix — Quick Reference
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

- **Project Root**: `./CSMLogs/General_Sessions`
- **Chunks**: `./CSMLogs/General_Sessions/README_chunks/`
- **Manifest**: `./CSMLogs/General_Sessions/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMLogs/General_Sessions/memory/`
- **Runner Files**: `./CSMLogs/General_Sessions/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMLogs (`CSMLogs`)
- **Category Peers**: Other projects in CSMLogs
- **File Count**: 1572 files

---

*README generated for General_Sessions — Part of Another Project*
*Category: CSMLogs | Files: 1572 | Parent: CSMLogs*
*Generated using write_large_file.py IncrementalDocumentWriter*
