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

- **Project Root**: `./CSMCinema/Resume`
- **Chunks**: `./CSMCinema/Resume/README_chunks/`
- **Manifest**: `./CSMCinema/Resume/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMCinema/Resume/memory/`
- **Runner Files**: `./CSMCinema/Resume/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMCinema (`CSMCinema`)
- **Category Peers**: Other projects in CSMCinema
- **File Count**: 9 files

---

*README generated for Resume — Part of Another Project*
*Category: CSMCinema | Files: 9 | Parent: CSMCinema*
*Generated using write_large_file.py IncrementalDocumentWriter*
