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

- **Project Root**: `CSMWipScripts/RESTART_PACKAGE`
- **Chunks**: `CSMWipScripts/RESTART_PACKAGE/README_chunks/`
- **Manifest**: `CSMWipScripts/RESTART_PACKAGE/README_chunks/MANIFEST.json`
- **Memory Logs**: `CSMWipScripts/RESTART_PACKAGE/memory/`
- **Runner Files**: `CSMWipScripts/RESTART_PACKAGE/NEXT_runner_*.md`

### Project Statistics

- **Total Files**: 7
- **File Types**: .md: 7, .sh: 1
- **Languages**: Markdown: 7, Shell: 1
- **Key Directories**: 0

### Related Projects

- **Parent**: CSMWipScripts (`CSMWipScripts`)
- **Category Peers**: Other projects in CSMWipScripts
- **File Count**: 7 files

---

*README generated for RESTART_PACKAGE — Part of Another Project*
*Category: CSMWipScripts | Files: 7 | Parent: CSMWipScripts*
*Generated using write_large_file.py IncrementalDocumentWriter*
