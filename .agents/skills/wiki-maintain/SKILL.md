# /wiki-maintain

Run a weekly health check on the Knowledge wiki so the OS keeps compounding
instead of becoming a pile of stale notes.

## What this does

1. Checks `Knowledge/index.md` against the actual files under `Knowledge/`.
2. Reviews `Knowledge/log.md` for recent ingest/query/maintenance activity.
3. Flags stale provenance tags using `Knowledge/Reference/provenance-tags.md`.
4. Finds orphan Knowledge files that are not listed in the index.
5. Finds index rows whose target files no longer exist.
6. Runs `/wiki-ingest` first if `Knowledge/Ingestion/` contains pending files.

## Steps

1. Read `Knowledge/index.md`, `Knowledge/log.md`, and
   `Knowledge/Reference/provenance-tags.md`. Both index and log are per-user,
   gitignored files — if absent, create them (index: section headers per
   Knowledge layer; log: `| Date | Operation | Detail | Files touched |`)
   rather than reporting an error.
2. Inventory files under:
   - `Knowledge/Segments/`
   - `Knowledge/Hypotheses/`
   - `Knowledge/Decisions/`
   - `Knowledge/People/`
   - `Knowledge/Reference/`
   - `Knowledge/Research/`
3. If `Knowledge/Ingestion/` has files beyond `README.md` and `.gitkeep`, ask
   whether to run `/wiki-ingest` before maintenance.
4. Check every indexed page exists.
5. Check every non-template Knowledge page is indexed.
6. Search active Knowledge files for provenance tags:
   - `[doc-decision]`
   - `[doc-research]`
   - `[verbal-stake]`
   - `[marketer-intuition]`
   - `[assumption]`
7. Flag stale items using the decay windows in `provenance-tags.md`.
8. Output a maintenance report. Ask before editing index rows or archiving files.

## Output format

```markdown
## Wiki maintenance

**Verdict:** Healthy / Needs attention

### Index drift
- Missing from index: ...
- Broken index rows: ...

### Provenance decay
- [file] — [claim/tag/date] — [action]

### Orphans
- [file] — [recommended location/index row]

### Recommended updates
1. ...
```

## Rules

- Never delete Knowledge files silently.
- Preserve conflicting claims with their evidence tags; do not merge them into
  false consensus.
- Do not create `Knowledge/People/` entries for named people without user
  confirmation.
- `Knowledge/Source/` is immutable raw source material. Read it, never edit it.
