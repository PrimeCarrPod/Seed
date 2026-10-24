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

- **Project Root**: `./__Python_Tools/__pycache__`
- **Chunks**: `./__Python_Tools/__pycache__/README_chunks/`
- **Manifest**: `./__Python_Tools/__pycache__/README_chunks/MANIFEST.json`
- **Memory Logs**: `./__Python_Tools/__pycache__/memory/`
- **Runner Files**: `./__Python_Tools/__pycache__/NEXT_runner_*.md`

### Related Projects

- **Parent**: __Python_Tools (`__Python_Tools`)
- **Category Peers**: Other projects in __Python_Tools
- **File Count**: 1 files

---

*README generated for __pycache__ — Part of Another Project*
*Category: __Python_Tools | Files: 1 | Parent: __Python_Tools*
*Generated using write_large_file.py IncrementalDocumentWriter*
