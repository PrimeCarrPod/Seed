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

- **Project Root**: `./CSMLogs/Heartbeat_Logs`
- **Chunks**: `./CSMLogs/Heartbeat_Logs/README_chunks/`
- **Manifest**: `./CSMLogs/Heartbeat_Logs/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMLogs/Heartbeat_Logs/memory/`
- **Runner Files**: `./CSMLogs/Heartbeat_Logs/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMLogs (`CSMLogs`)
- **Category Peers**: Other projects in CSMLogs
- **File Count**: 2 files

---

*README generated for Heartbeat_Logs — Part of Another Project*
*Category: CSMLogs | Files: 2 | Parent: CSMLogs*
*Generated using write_large_file.py IncrementalDocumentWriter*
