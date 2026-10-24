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

- **Project Root**: `./CSMPro/csm_nasa`
- **Chunks**: `./CSMPro/csm_nasa/README_chunks/`
- **Manifest**: `./CSMPro/csm_nasa/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMPro/csm_nasa/memory/`
- **Runner Files**: `./CSMPro/csm_nasa/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMPro (`CSMPro`)
- **Category Peers**: Other projects in CSMPro
- **File Count**: 18 files

---

*README generated for csm_nasa — Part of Another Project*
*Category: CSMPro | Files: 18 | Parent: CSMPro*
*Generated using write_large_file.py IncrementalDocumentWriter*
