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

- **Project Root**: `./CSMCinema/MASTER_SCRIPT`
- **Chunks**: `./CSMCinema/MASTER_SCRIPT/README_chunks/`
- **Manifest**: `./CSMCinema/MASTER_SCRIPT/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMCinema/MASTER_SCRIPT/memory/`
- **Runner Files**: `./CSMCinema/MASTER_SCRIPT/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMCinema (`CSMCinema`)
- **Category Peers**: Other projects in CSMCinema
- **File Count**: 12 files

---

*README generated for MASTER_SCRIPT — Part of Another Project*
*Category: CSMCinema | Files: 12 | Parent: CSMCinema*
*Generated using write_large_file.py IncrementalDocumentWriter*
