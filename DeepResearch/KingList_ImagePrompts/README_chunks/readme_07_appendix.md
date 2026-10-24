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

- **Project Root**: `./DeepResearch/KingList_ImagePrompts`
- **Chunks**: `./DeepResearch/KingList_ImagePrompts/README_chunks/`
- **Manifest**: `./DeepResearch/KingList_ImagePrompts/README_chunks/MANIFEST.json`
- **Memory Logs**: `./DeepResearch/KingList_ImagePrompts/memory/`
- **Runner Files**: `./DeepResearch/KingList_ImagePrompts/NEXT_runner_*.md`

### Related Projects

- **Parent**: DeepResearch (`DeepResearch`)
- **Category Peers**: Other projects in DeepResearch
- **File Count**: 16 files

---

*README generated for KingList_ImagePrompts — Part of Another Project*
*Category: DeepResearch | Files: 16 | Parent: DeepResearch*
*Generated using write_large_file.py IncrementalDocumentWriter*
