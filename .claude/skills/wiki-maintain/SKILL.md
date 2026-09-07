# /wiki-maintain

Run a weekly health check on the Knowledge wiki so the OS keeps compounding
instead of becoming a pile of stale notes.

## What this does

1. Checks `Knowledge/index.md` against the actual files under `Knowledge/`.
2. Reviews `Knowledge/log.md` for recent ingest/query/maintenance activity.
3. Flags stale provenance tags using `Knowledge/Reference/provenance-tags.md`.
4. Finds orphan Knowledge files that are not listed in the index.
5. Finds index rows whose target files no longer exist.
6. Audits `Knowledge/overview.md` — staleness, unresolved contradictions, unranked unknowns.
7. Rebuilds `Knowledge/Decisions/team-log.md` from the decision files.
8. Runs `/wiki-ingest` first if `Knowledge/Ingestion/` contains pending files.

## Steps

1. Read `Knowledge/index.md`, `Knowledge/overview.md`, `Knowledge/log.md`, and
   `Knowledge/Reference/provenance-tags.md`. The first three are per-user and
   gitignored — if any is absent, **copy it from `Knowledge/_seeds/`** (never
   improvise the structure) rather than reporting an error, and note in the
   report that the spine was seeded.
2. Inventory files under:
   - `Knowledge/Concepts/`
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
8. **Audit the synthesis layer** (`Knowledge/overview.md`):
   - Not edited in 30+ days while `log.md` shows ingests since → flag as stale synthesis.
   - Rows in *Open contradictions* older than 30 days → propose the experiment that would settle
     each one. A contradiction that never resolves is a decision nobody is making.
   - Claims in *What's working* / *What's not working* whose provenance is `[assumption]` or
     `[marketer-intuition]` and is 60+ days old → propose promoting or retiring them.
   - *Biggest unknowns* unranked or empty while open contradictions exist → flag.
9. **Rebuild `Knowledge/Decisions/team-log.md`** from the files in
   `Knowledge/Decisions/{pending,active,archived}/`: one row per decision, archived section
   trimmed to the last 30 days. This file is a derived roll-up — rebuilding it is safe.
10. Output a maintenance report. Ask before editing index rows or archiving files.

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

### Synthesis health (`overview.md`)
- Last edited: [date] — [fresh / stale, N ingests since]
- Open contradictions: [N] — [oldest, and the experiment that would settle it]
- Decayed claims: [claim] — [tag, age, promote or retire]

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
- Never overwrite a live spine with its seed. Seeds fill absences only.
- `Knowledge/Concepts/` pages are **rewritten in place**, not appended to. When a rewrite reverses
  a prior claim, record it in the *Superseded* table of `overview.md` — a silent reversal is worse
  than a contradiction you can see.
