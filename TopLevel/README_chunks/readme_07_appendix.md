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

- **Project Root**: `TopLevel`
- **Chunks**: `TopLevel/README_chunks/`
- **Manifest**: `TopLevel/README_chunks/MANIFEST.json`
- **Memory Logs**: `TopLevel/memory/`
- **Runner Files**: `TopLevel/NEXT_runner_*.md`

### Related Projects


- **Category Peers**: Other projects in  gradle-8.4
- **File Count**: .sdk files

---

*README generated for  gradle-cache) — Whole Project*
*Category:  gradle-8.4 | Files: .sdk | Parent: N/A*
*Generated using write_large_file.py IncrementalDocumentWriter*
