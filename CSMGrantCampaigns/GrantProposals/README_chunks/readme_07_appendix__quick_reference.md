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

- **Project Root**: `./CSMGrantCampaigns/GrantProposals`
- **Chunks**: `./CSMGrantCampaigns/GrantProposals/README_chunks/`
- **Manifest**: `./CSMGrantCampaigns/GrantProposals/README_chunks/MANIFEST.json`
- **Memory Logs**: `./CSMGrantCampaigns/GrantProposals/memory/`
- **Runner Files**: `./CSMGrantCampaigns/GrantProposals/NEXT_runner_*.md`

### Related Projects

- **Parent**: CSMGrantCampaigns (`CSMGrantCampaigns`)
- **Category Peers**: Other projects in CSMGrantCampaigns
- **File Count**: 24 files

---

*README generated for GrantProposals — Part of Another Project*
*Category: CSMGrantCampaigns | Files: 24 | Parent: CSMGrantCampaigns*
*Generated using write_large_file.py IncrementalDocumentWriter*
