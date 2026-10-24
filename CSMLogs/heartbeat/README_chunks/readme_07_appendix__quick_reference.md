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

- **Project Root**: `CSMLogs/heartbeat`
- **Chunks**: `CSMLogs/heartbeat/README_chunks/`
- **Manifest**: `CSMLogs/heartbeat/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMLogs/heartbeat/memory/`
- **Runner Files**: `CSMLogs/heartbeat/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 3
- **File Types**: .log: 3, .md: 1
- **Languages**: Markdown: 1
- **Key Directories**: 3

### Related Projects

- **Parent**: CSMLogs (`CSMLogs`)
- **Category Peers**: Other projects in CSMLogs
- **File Count**: 3 files

---

*README generated for heartbeat — Part of Another Project*
*Category: CSMLogs | Files: 3 | Parent: CSMLogs*
*Generated using write_large_file.py IncrementalDocumentWriter*
