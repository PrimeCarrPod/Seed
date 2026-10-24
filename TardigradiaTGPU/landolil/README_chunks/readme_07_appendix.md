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

- **Project Root**: `./TardigradiaTGPU/landolil`
- **Chunks**: `./TardigradiaTGPU/landolil/README_chunks/`
- **Manifest**: `./TardigradiaTGPU/landolil/README_chunks/MANIFEST.json`
- **Memory Logs**: `./TardigradiaTGPU/landolil/memory/`
- **Runner Files**: `./TardigradiaTGPU/landolil/NEXT_runner_*.md`

### Related Projects

- **Parent**: TardigradiaTGPU (`TardigradiaTGPU`)
- **Category Peers**: Other projects in TardigradiaTGPU
- **File Count**: 90 files

---

*README generated for landolil — Part of Another Project*
*Category: TardigradiaTGPU | Files: 90 | Parent: TardigradiaTGPU*
*Generated using write_large_file.py IncrementalDocumentWriter*
