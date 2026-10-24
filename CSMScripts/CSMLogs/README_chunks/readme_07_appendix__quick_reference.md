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

- **Project Root**: `CSMScripts/CSMLogs`
- **Chunks**: `CSMScripts/CSMLogs/README_chunks/`
- **Manifest**: `CSMScripts/CSMLogs/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMScripts/CSMLogs/memory/`
- **Runner Files**: `CSMScripts/CSMLogs/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 681
- **File Types**: .md: 638, .txt: 34, .json: 10
- **Languages**: Markdown: 638, JSON: 10
- **Key Directories**: 6

### Related Projects

- **Parent**: CSMScripts (`CSMScripts`)
- **Category Peers**: Other projects in CSMScripts
- **File Count**: 681 files

---

*README generated for CSMLogs — Part of Another Project*
*Category: CSMScripts | Files: 681 | Parent: CSMScripts*
*Generated using write_large_file.py IncrementalDocumentWriter*
