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

- **Project Root**: `./CSMScripts/freenemo_modules`
- **Chunks**: `./CSMScripts/freenemo_modules/README_chunks/`
- **Manifest**: `./CSMScripts/freenemo_modules/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMScripts/freenemo_modules/memory/`
- **Runner Files**: `./CSMScripts/freenemo_modules/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMScripts (`CSMScripts`)
- **Category Peers**: Other projects in CSMScripts
- **File Count**: 31 files

---

*README generated for freenemo_modules — Part of Another Project*
*Category: CSMScripts | Files: 31 | Parent: CSMScripts*
*Generated using write_large_file.py IncrementalDocumentWriter*
