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

- **Project Root**: `./CSMScripts`
- **Chunks**: `./CSMScripts/README_chunks/`
- **Manifest**: `./CSMScripts/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMScripts/memory/`
- **Runner Files**: `./CSMScripts/NEXT_runner_*.md`

### Related Projects

- **Category Peers**: Other projects in TopLevel
- **File Count**: 847 files

---

*README generated for CSMScripts — Whole Project*
*Category: TopLevel | Files: 847 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
