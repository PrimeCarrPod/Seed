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

- **Project Root**: `./DeepResearch/CONTENT.PDF`
- **Chunks**: `./DeepResearch/CONTENT.PDF/README_chunks/`
- **Manifest**: `./DeepResearch/CONTENT.PDF/README_chunks/MANIFEST.json`
- **Memory Logs**: `./DeepResearch/CONTENT.PDF/memory/`
- **Runner Files**: `./DeepResearch/CONTENT.PDF/NEXT_runner_*.md`

### Related Projects

- **Parent**: DeepResearch (`DeepResearch`)
- **Category Peers**: Other projects in DeepResearch
- **File Count**: 115 files

---

*README generated for CONTENT.PDF — Part of Another Project*
*Category: DeepResearch | Files: 115 | Parent: DeepResearch*
*Generated using write_large_file.py IncrementalDocumentWriter*
