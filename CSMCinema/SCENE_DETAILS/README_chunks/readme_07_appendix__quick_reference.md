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

- **Project Root**: `./CSMCinema/SCENE_DETAILS`
- **Chunks**: `./CSMCinema/SCENE_DETAILS/README_chunks/`
- **Manifest**: `./CSMCinema/SCENE_DETAILS/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMCinema/SCENE_DETAILS/memory/`
- **Runner Files**: `./CSMCinema/SCENE_DETAILS/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMCinema (`CSMCinema`)
- **Category Peers**: Other projects in CSMCinema
- **File Count**: 21 files

---

*README generated for SCENE_DETAILS — Part of Another Project*
*Category: CSMCinema | Files: 21 | Parent: CSMCinema*
*Generated using write_large_file.py IncrementalDocumentWriter*
