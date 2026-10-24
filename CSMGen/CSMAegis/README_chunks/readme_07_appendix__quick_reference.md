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

- **Project Root**: `./CSMGen/CSMAegis`
- **Chunks**: `./CSMGen/CSMAegis/README_chunks/`
- **Manifest**: `./CSMGen/CSMAegis/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMGen/CSMAegis/memory/`
- **Runner Files**: `./CSMGen/CSMAegis/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMGen (`CSMGen`)
- **Category Peers**: Other projects in CSMGen
- **File Count**: 5 files

---

*README generated for CSMAegis — Part of Another Project*
*Category: CSMGen | Files: 5 | Parent: CSMGen*
*Generated using write_large_file.py IncrementalDocumentWriter*
