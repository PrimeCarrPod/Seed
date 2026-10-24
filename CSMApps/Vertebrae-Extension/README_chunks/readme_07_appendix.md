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

- **Project Root**: `./CSMApps/Vertebrae-Extension`
- **Chunks**: `./CSMApps/Vertebrae-Extension/README_chunks/`
- **Manifest**: `./CSMApps/Vertebrae-Extension/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMApps/Vertebrae-Extension/memory/`
- **Runner Files**: `./CSMApps/Vertebrae-Extension/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMApps (`CSMApps`)
- **Category Peers**: Other projects in CSMApps
- **File Count**: 4 files

---

*README generated for Vertebrae-Extension — Part of Another Project*
*Category: CSMApps | Files: 4 | Parent: CSMApps*
*Generated using write_large_file.py IncrementalDocumentWriter*
