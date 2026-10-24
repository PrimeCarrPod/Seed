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

- **Project Root**: `./CSMRadio/RADIO_PREPARATION`
- **Chunks**: `./CSMRadio/RADIO_PREPARATION/README_chunks/`
- **Manifest**: `./CSMRadio/RADIO_PREPARATION/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMRadio/RADIO_PREPARATION/memory/`
- **Runner Files**: `./CSMRadio/RADIO_PREPARATION/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMRadio (`CSMRadio`)
- **Category Peers**: Other projects in CSMRadio
- **File Count**: 14 files

---

*README generated for RADIO_PREPARATION — Part of Another Project*
*Category: CSMRadio | Files: 14 | Parent: CSMRadio*
*Generated using write_large_file.py IncrementalDocumentWriter*
