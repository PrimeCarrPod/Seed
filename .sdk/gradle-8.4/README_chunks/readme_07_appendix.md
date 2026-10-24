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

- **Project Root**: `./.sdk/gradle-8.4`
- **Chunks**: `./.sdk/gradle-8.4/README_chunks/`
- **Manifest**: `./.sdk/gradle-8.4/README_chunks/MANIFEST.json`
- **Memory Logs**: `./.sdk/gradle-8.4/memory/`
- **Runner Files**: `./.sdk/gradle-8.4/NEXT_runner_*.md`

### Related Projects

- **Parent**: .sdk (`.sdk`)
- **Category Peers**: Other projects in .sdk
- **File Count**: 2 files

---

*README generated for gradle-8.4 — Part of Another Project*
*Category: .sdk | Files: 2 | Parent: .sdk*
*Generated using write_large_file.py IncrementalDocumentWriter*
