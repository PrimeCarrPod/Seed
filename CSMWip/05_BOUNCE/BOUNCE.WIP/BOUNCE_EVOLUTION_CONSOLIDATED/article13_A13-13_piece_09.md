# Master_Index_Cross_Reference_Complete — Piece 09/13
## Article A13: A13-13 — Master Index Cross Reference Complete
**Piece:** 09 of 13  
**Generated:** 2026-10-08 22:46:20 UTC

---

## MERGE METHODS (17 Ways - If Push Fails)

1. `git push origin main`
2. `git checkout main && git merge branch --no-edit && git push origin main`
3. `git push --force-with-lease origin branch:main`
4. `git rebase main branch && git push origin branch:main`
5. `gh pr create --base main --head branch --title "Merge" --body "Auto" && gh pr merge --auto`
6. `git push origin branch && gh api repos/owner/repo/merges -X POST -f base=main -f head=branch`
7. Temp branch from main, cherry-pick commits, push
8. `git format-patch main..branch --stdout | git am -3 && git push origin main`
9. `git bundle create bundle.bundle main..branch` → transfer → verify → pull
10. Subtree merge: `git read-tree --prefix=path/ -u branch`
11. `git merge-file` for individual files
12. Manual file copy + commit
13. GitHub REST API: create commit via API
14. GitHub Actions workflow to merge
15. `git replace + git filter-branch` (last resort)
16. Clone fresh, apply patches, push
17. Contact GitHub support (enterprise)

