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

- **Project Root**: `./DeepResearch/Mythology`
- **Chunks**: `./DeepResearch/Mythology/README_chunks/`
- **Manifest**: `./DeepResearch/Mythology/README_chunks/MANIFEST.json`
- **Memory Logs**: `./DeepResearch/Mythology/memory/`
- **Runner Files**: `./DeepResearch/Mythology/NEXT_runner_*.md`

### Related Projects

- **Parent**: DeepResearch (`DeepResearch`)
- **Category Peers**: Other projects in DeepResearch
- **File Count**: 3 files

---

*README generated for Mythology — Part of Another Project*
*Category: DeepResearch | Files: 3 | Parent: DeepResearch*
*Generated using write_large_file.py IncrementalDocumentWriter*
