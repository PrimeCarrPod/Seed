## Operations — El Segundo Protocol

### Session Lifecycle

1. **Startup** — Read `AGENTS.md` → `TODO.md` → `memory/latest.md` → `NEXT_runner_XXX.md`
2. **Execution** — Process subtasks sequentially with 30s timeout guard
3. **Heartbeat** — Progress output every 2 minutes (120s interval)
4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask
5. **Handoff** — Create `NEXT_runner_XXX+1.md` and update `RESUME_SESSION.md`

### Build & Validation

```bash
# Verify document integrity
python3 ../../__Python_Tools/write_large_file.py verify chunks/<DOC-ID>/

# Reassemble for review
python3 ../../__Python_Tools/write_large_file.py concat chunks/<DOC-ID>/ FinishedWork/<DOC>.md

# Compress for storage
python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<DOC>.md
```

### Quality Gates

- All reassembled documents must pass manifest verification
- Cross-reference validation across related documents
- Mathematical consistency checks for synthesis documents
- Material property consistency for engineering specs
