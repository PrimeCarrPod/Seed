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

- **Project Root**: `./CSMPro/CSMVessel`
- **Chunks**: `./CSMPro/CSMVessel/README_chunks/`
- **Manifest**: `./CSMPro/CSMVessel/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMPro/CSMVessel/memory/`
- **Runner Files**: `./CSMPro/CSMVessel/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMPro (`CSMPro`)
- **Category Peers**: Other projects in CSMPro
- **File Count**: 1030 files

---

*README generated for CSMVessel — Part of Another Project*
*Category: CSMPro | Files: 1030 | Parent: CSMPro*
*Generated using write_large_file.py IncrementalDocumentWriter*
