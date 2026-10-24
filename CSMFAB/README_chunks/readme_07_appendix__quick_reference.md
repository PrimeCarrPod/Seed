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

- **Project Root**: `./CSMFAB`
- **Chunks**: `./CSMFAB/README_chunks/`
- **Manifest**: `./CSMFAB/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMFAB/memory/`
- **Runner Files**: `./CSMFAB/NEXT_runner_*.md`

### Related Projects

- **Category Peers**: Other projects in TopLevel
- **File Count**: 8013 files

---

*README generated for CSMFAB — Whole Project*
*Category: TopLevel | Files: 8013 | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
