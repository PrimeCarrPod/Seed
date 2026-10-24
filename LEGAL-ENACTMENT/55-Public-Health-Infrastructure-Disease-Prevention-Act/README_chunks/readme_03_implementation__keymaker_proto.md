## Implementation — Keymaker Protocol
## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Python/Markdown/Shell | Latest | Primary implementation |
| Build | Custom (no-Gradle for Android) | — | Reproducible builds |
| Version Control | Git | — | Distributed workflow |
| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
./LEGAL-ENACTMENT/55-Public-Health-Infrastructure-Disease-Prevention-Act/
├── README.md              # This file
├── AGENTS.md              # Project conventions
├── TODO.md              # Task hierarchy
├── memory/              # Daily session logs
├── chunks/              # Logical document chunks
├── FinishedWork/        # Completed documents
├── scripts/             # Automation utilities
└── Research/            # Reference materials
```

### Configuration

Key environment variables and configuration files:

- `AGENTS.md` — Project-specific conventions and commands
- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)
- `memory/YYYY-MM-DD.md` — Raw daily logs
- `NEXT_runner_XXX.md` — Next session instructions

