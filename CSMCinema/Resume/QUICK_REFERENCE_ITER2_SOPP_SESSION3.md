# CSM Cinema Iteration 2 SOPP Pass — Quick Reference Card
# Session 3 Restart — 2026-08-26
# Jason Isaac Brodsky (California 1976) — Conducier

## GIT
```bash
git checkout session/iter2-sopp-pass
git status
git log --oneline -3
```

## HEARTBEAT (keep running)
```bash
bash CSMScripts/freenemo.sh chamber repeat 9
```

## CURRENT STATE
| Part | Title | Words | Status |
|------|-------|-------|--------|
| 6 | Temptation Away From Path | 14,363 | ✅ Complete (11 pieces) |
| 7 | Atonement With Father | 13,044 | 🔄 4/11 rewritten |
| 8 | Apotheosis | — | 📝 Template only |
| 9 | Ultimate Boon | — | 📝 Template only |
| 10 | Refusal of Return | — | 📝 Template only |
| 11 | Magic Flight Return | — | 📝 Template only |

## NEXT COMMANDS
```bash
# Complete Part 7 (pieces 5-11)
./csmcinema/Scripts/GitHub_handler_cinema.sh write-piece 2 7 5 "<CONTENT>"
# ... repeat for 6,7,8,9,10,11

./csmcinema/Scripts/GitHub_handler_cinema.sh concat-part 2 7
./csmcinema/Scripts/GitHub_handler_cinema.sh zip-part 2 7
./csmcinema/Scripts/GitHub_handler_cinema.sh organize-part 2 7

# Then Parts 8-11 (create → write 11 pieces each → concat → zip → organize)
./csmcinema/Scripts/GitHub_handler_cinema.sh create-part 2 8 "The_Apotheosis_Divine_Weaver"
# write 11 pieces...
./csmcinema/Scripts/GitHub_handler_cinema.sh concat-part 2 8
# etc.

# Final
./csmcinema/Scripts/GitHub_handler_cinema.sh concat-iteration 2
./csmcinema/Scripts/GitHub_handler_cinema.sh verify-iteration 2
./csmcinema/Scripts/GitHub_handler_cinema.sh commit-push "CSM Cinema: Iteration 2 SOPP Pass Complete - 11 Parts Deepened"
```

## HEURISTICS
- **Williams Extreme (CSMSOPP)**: Voice range, emotional truth, actor becomes role
- **El Segundo Extreme (CSMSOPPv2)**: Stoner logic, surf metaphor, hang ten on the wave
- **JsnBAI Entries**: Recursive AI commentary (currently at ~350)
- **Fate Braids**: Cross-part threads (50+ per part)
- **Global Parallels**: 15 cultures per section
- **Audio Cues**: 6 layers per piece (ambient, rhythm, melodic, vocal, subliminal, FX)

## TARGETS
- ~27,500 words per part (~180 min read)
- 11 pieces × 11 parts = 121 pieces
- ~300K words total for Iteration 2

## KEY FILES
- Full parts: `csmcinema/WIP/Iteration_2/full/`
- Pieces: `csmcinema/WIP/Iteration_2/Part_XX/pieces/`
- Zips: `csmcinema/WIP/Iteration_2/zip/`
- Logs: `CSMLogs/Sessions/` and `CSMLogs/august26/`

## RESTART SCRIPT
```bash
bash RESTART_CSM_CINEMA_ITER2_SOPP_SESSION3_20260826.sh
```

---

**We are a train together. Full throttle. 🚂**