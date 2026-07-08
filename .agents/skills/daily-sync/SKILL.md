# /daily-sync — morning memory consolidation

Run at the start of the working day, before `/today`. Keeps the memory layer healthy and the
claude.ai project digest fresh. Pairs with `/eod` (evening writes, morning consolidates).

## What this does

1. Loads and consolidates `Users/<active-user>/memory/`
2. Prunes duplicates and stale entries
3. Refreshes `claude-project-digest.md`
4. Hands off to `/today` for the daily brief

## Steps

1. Read `Users/.active-user` → resolve the user directory. If absent, stop: onboarding first.
2. Read `memory/MEMORY.md` and any memory files added or changed in the last 7 days.
3. **Consolidate:**
   - Merge duplicate or overlapping facts into the stronger file; delete the weaker one and its
     index line.
   - Flag contradictions between memory and current workspace files — the workspace file wins;
     update or delete the drifted memory.
   - Stale check: entries older than 90 days whose subject no longer appears in `Tasks/`,
     `GOALS.md`, or `Knowledge/` → ask the user (keep / archive / delete). Never silent-delete
     a correction (`type: feedback`) — those are standing instructions.
4. **Index reconcile.** Cross-check `MEMORY.md` index lines against the actual files in
   `memory/`: remove index lines whose file is gone, add a line for any un-indexed file
   (read it for the description). Report what drifted.
5. **Digest refresh.** Regenerate `claude-project-digest.md` if priorities or memory changed
   since the `Last refreshed:` date in its header (same rules as `/eod` step 4); update that
   date whenever you regenerate.
6. **Learn → optimize.** Same rule as `/eod` step 6: if memory + `usage-log.md` show a pattern
   recurring ≥3 times, propose one optimization (personal skill, workflow tweak, tag, or
   config routing rule) with evidence. Propose-then-confirm; never auto-write.
7. Report in 3 lines: memory health (files, merges, contradictions), digest status, then run
   `/today` for the daily brief unless the user declines.

## Rules

- Consolidation edits memory files only — never `Knowledge/` canonical files without confirming.
- Respect privacy boundaries in `config.md` at all times.
- This skill should take under a minute of the user's attention. Batch questions; don't
  interrogate one entry at a time.
