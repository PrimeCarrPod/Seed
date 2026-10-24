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

- **Project Root**: `./DeepResearch/Mayan2040`
- **Chunks**: `./DeepResearch/Mayan2040/README_chunks/`
- **Manifest**: `./DeepResearch/Mayan2040/README_chunks/MANIFEST.json`
- **Memory Logs**: `./DeepResearch/Mayan2040/memory/`
- **Runner Files**: `./DeepResearch/Mayan2040/NEXT_runner_*.md`

### Related Projects

- **Parent**: DeepResearch (`DeepResearch`)
- **Category Peers**: Other projects in DeepResearch
- **File Count**: 2 files

---

*README generated for Mayan2040 — Part of Another Project*
*Category: DeepResearch | Files: 2 | Parent: DeepResearch*
*Generated using write_large_file.py IncrementalDocumentWriter*
