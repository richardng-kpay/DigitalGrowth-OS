# /campaign-brief

Start a new campaign brief. Opens an interactive interview to fill `Templates/campaign-brief.md`.

## Usage

- `/campaign-brief` — start a new brief from scratch
- `/campaign-brief [name]` — start a brief for a named campaign
- `/campaign-brief review [file]` — review an existing brief for completeness

## Steps (new brief)

1. Read `CLAUDE.md` — pull the user's channels, primary KPIs, and default audience context
2. Read `GOALS.md` — understand what quarter goal this campaign should ladder up to
3. Read `Knowledge/Segments/` — check for existing audience segment profiles to reference

4. Ask in one batch:
   - "Campaign name?"
   - "What is the objective? (Acquire leads / Drive purchases / Build awareness / Re-engage lapsed users)"
   - "Primary channel(s) for this campaign?"
   - "Target audience — which segment or describe them?"
   - "Flight dates — when does this run?"

5. Ask in a second batch:
   - "Primary KPI and target? (e.g., CAC ≤ $28, CPL ≤ $15, ROAS ≥ 3.5x)"
   - "Budget — total or per channel? (Skip if you'd prefer not to record)"
   - "What's the core message or offer? (e.g., Free trial, 20% off, Demo)"
   - "CTA — what do you want the audience to do?"

6. Draft the brief using `Templates/campaign-brief.md`, pre-filling all confirmed fields
7. Output the draft inline
8. Ask: "Want me to save this to `Projects/[campaign-name]/brief.md`?"

## Steps (review existing brief)

1. Read the specified file
2. Check against `Templates/campaign-brief.md` structure — flag any missing required sections
3. Check: Is the audience specific enough? Is the KPI measurable with a target number? Is the CTA clear? Is the timeline complete? Are approvals listed?
4. Output a gap list:

```
## Brief review — [FILE]

**Complete ✅**
- [Section]

**Missing or too vague ⚠️**
- [Section] — [what's needed, e.g., "KPI has no target number — add ≤ $X"]

**Recommendation**
[One sentence on the most important thing to fix before approval]
```

5. Route to `/brief-review` for full Creative Reviewer pass once gaps are closed

## File location

Save briefs to `Projects/[campaign-name]/brief.md`. Create the `Projects/[campaign-name]/` directory if it doesn't exist.
