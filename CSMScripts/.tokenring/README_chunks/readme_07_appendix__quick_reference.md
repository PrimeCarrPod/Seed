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

- **Project Root**: `CSMScripts/.tokenring`
- **Chunks**: `CSMScripts/.tokenring/README_chunks/`
- **Manifest**: `CSMScripts/.tokenring/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMScripts/.tokenring/memory/`
- **Runner Files**: `CSMScripts/.tokenring/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 4
- **File Types**: : 4, .md: 1
- **Languages**: Markdown: 1
- **Key Directories**: 0

### Related Projects

- **Parent**: CSMScripts (`CSMScripts`)
- **Category Peers**: Other projects in CSMScripts
- **File Count**: 4 files

---

*README generated for .tokenring — Part of Another Project*
*Category: CSMScripts | Files: 4 | Parent: CSMScripts*
*Generated using write_large_file.py IncrementalDocumentWriter*
