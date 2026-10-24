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

- **Project Root**: `./CSMApps/_Past_Releases`
- **Chunks**: `./CSMApps/_Past_Releases/README_chunks/`
- **Manifest**: `./CSMApps/_Past_Releases/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMApps/_Past_Releases/memory/`
- **Runner Files**: `./CSMApps/_Past_Releases/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMApps (`CSMApps`)
- **Category Peers**: Other projects in CSMApps
- **File Count**: 8 files

---

*README generated for _Past_Releases — Part of Another Project*
*Category: CSMApps | Files: 8 | Parent: CSMApps*
*Generated using write_large_file.py IncrementalDocumentWriter*
