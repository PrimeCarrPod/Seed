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

- **Project Root**: `./CSMScripts/.tokenringv3`
- **Chunks**: `./CSMScripts/.tokenringv3/README_chunks/`
- **Manifest**: `./CSMScripts/.tokenringv3/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMScripts/.tokenringv3/memory/`
- **Runner Files**: `./CSMScripts/.tokenringv3/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMScripts (`CSMScripts`)
- **Category Peers**: Other projects in CSMScripts
- **File Count**: 8 files

---

*README generated for .tokenringv3 — Part of Another Project*
*Category: CSMScripts | Files: 8 | Parent: CSMScripts*
*Generated using write_large_file.py IncrementalDocumentWriter*
