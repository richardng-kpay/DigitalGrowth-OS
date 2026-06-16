# Knowledge/Ingestion

Staging area for raw findings pulled from Lark wiki searches. Every file here is a **candidate for promotion** — it holds intel that has been extracted but not yet routed to its permanent Knowledge layer home.

The CLAUDE.md search protocol writes here automatically after every useful Lark search (step 5). Run `/wiki-ingest` to promote files to their permanent layer.

---

## What belongs here

| Type | What to save | Promoted to |
|---|---|---|
| Channel insight | A metric, benchmark, or performance finding from a Lark doc | `Knowledge/Reference/` or inline in `GOALS.md` |
| Stakeholder intel | Something a person said, prefers, or decided | `Knowledge/People/[name].md` |
| Testable belief | A hypothesis surfaced from research | `Knowledge/Hypotheses/candidate/` |
| Vendor / tool verdict | An evaluation finding or recommendation | `Knowledge/Decisions/pending/` or `Reference/` |
| Process or strategy doc | A doc that defines how the team operates | `Knowledge/Reference/` |

## What does NOT belong here

- Raw document dumps — summarize, don't paste
- Task items — those go in `Tasks/`
- Copy or campaign drafts — those go in `Projects/`

---

## File format

Every ingestion file uses this template:

```markdown
# [Topic] — Ingestion note
*Source: [doc title](https://[YOUR_LARK_DOMAIN]/docx/[token]) · Searched: [YYYY-MM-DD] · Search key: "[search_key]"*
*Provenance: [doc-research] · Promote by: [YYYY-MM-DD + 14 days]*

## Summary
[2–4 sentences: what this doc says that is useful to the OS]

## Key findings
- [Finding 1] `[doc-research, YYYY-MM-DD]`
- [Finding 2] `[doc-research, YYYY-MM-DD]`
- [Finding 3] `[verbal-stake, YYYY-MM-DD, Name]` ← if the finding is someone's stated opinion

## Promotion candidates
- [ ] Hypothesis: [testable belief, if any]
- [ ] Decision: [pending decision triggered, if any]
- [ ] Stakeholder: [person mentioned with insight worth saving]
- [ ] Reference: [doc worth adding to lark-wiki-index.md]

## Raw token
`[token]` — use with `mcp__lark-mcp__docx_v1_document_rawContent` to re-pull full content
```

---

## Lifecycle

```
Search result → Ingestion/[file].md → /wiki-ingest → permanent layer
```

Files older than **14 days** without promotion are flagged by `/wiki-maintain`. Either promote them or delete them — stale ingestion files are noise.

---

## Related

- `CLAUDE.md` §Search protocol — step 5 writes here
- `.claude/skills/wiki-ingest/SKILL.md` — promotes files to the right layer
- `Knowledge/log.md` — every ingestion appends a row here
- `Knowledge/Reference/provenance-tags.md` — tagging rules
