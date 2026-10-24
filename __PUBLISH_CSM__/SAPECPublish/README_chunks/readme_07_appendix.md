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

- **Project Root**: `./__PUBLISH_CSM__/SAPECPublish`
- **Chunks**: `./__PUBLISH_CSM__/SAPECPublish/README_chunks/`
- **Manifest**: `./__PUBLISH_CSM__/SAPECPublish/README_chunks/MANIFEST.json`
- **Memory Logs**: `./__PUBLISH_CSM__/SAPECPublish/memory/`
- **Runner Files**: `./__PUBLISH_CSM__/SAPECPublish/NEXT_runner_*.md`

### Related Projects

- **Parent**: __PUBLISH_CSM__ (`__PUBLISH_CSM__`)
- **Category Peers**: Other projects in __PUBLISH_CSM__
- **File Count**: 9 files

---

*README generated for SAPECPublish — Part of Another Project*
*Category: __PUBLISH_CSM__ | Files: 9 | Parent: __PUBLISH_CSM__*
*Generated using write_large_file.py IncrementalDocumentWriter*
