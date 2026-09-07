# /wiki-ingest

Promotes raw Lark wiki findings from `Knowledge/Ingestion/` to their permanent Knowledge layer home. Run after any Lark search session, or whenever `Knowledge/Ingestion/` has unprocessed files.

---

## What this does

1. Seeds any missing knowledge spine from `Knowledge/_seeds/`
2. Reads all `.md` files in `Knowledge/Ingestion/` (excluding `README.md`)
3. For each file, determines the correct promotion target based on the "Promotion candidates" checklist
4. Routes each finding to the right layer — hypothesis, decision, concept, person, or reference
5. Updates `Knowledge/index.md` with any new entries, and `Knowledge/overview.md` if the standing picture changed
6. Updates `Knowledge/Reference/lark-wiki-index.md` with newly discovered doc tokens
7. Appends a row to `Knowledge/log.md`
8. Deletes the ingestion file once promoted (or archives if it spans multiple layers)

---

## Steps

### Step 0 — Seed the spines if missing

`Knowledge/index.md`, `Knowledge/overview.md`, `Knowledge/log.md`, and
`Knowledge/Decisions/team-log.md` are per-user and gitignored, so a fresh clone has none of them.
**Copy any missing one from `Knowledge/_seeds/` — never improvise the structure**, or two teammates
end up with wikis neither can read. If a destination already exists, leave it untouched.

```bash
for pair in "index.md:index.md" "log.md:log.md" "overview.md:overview.md" \
            "decisions-team-log.md:Decisions/team-log.md"; do
  src="Knowledge/_seeds/${pair%%:*}"; dst="Knowledge/${pair##*:}"
  [ -f "$dst" ] || { cp "$src" "$dst" && echo "seeded $dst"; }
done
```

---

### Step 1 — Inventory

Read every file in `Knowledge/Ingestion/` except `README.md`. For each, note:
- Type (channel insight / stakeholder intel / hypothesis / vendor verdict / reference doc)
- Promotion candidates checked in the file
- Age (how many days since "Searched" date)

Report the inventory: `[N] files pending promotion`.

---

### Step 2 — Route each file

For each ingestion file, run the appropriate promotion:

#### Hypothesis candidate
If the "Promotion candidates" checklist has a hypothesis entry:
1. Create `Knowledge/Hypotheses/candidate/[YYYY-MM-DD]-[slug].md` using `Templates/hypothesis.md`
2. Copy the finding as the opening claim; attach provenance tag
3. Set state: `candidate`
4. Link back: add `See also: Knowledge/Ingestion/[original-file].md` until the ingestion file is deleted

#### Stakeholder intel
If the file contains a named person's stated position or preference:
1. Read `Knowledge/People/[name].md` — create from template if it doesn't exist
2. Add the finding as a new entry under the relevant section, with provenance tag and date
3. Do not create new People files without confirming with the user first

#### Vendor / tool decision
If the file contains a vendor evaluation finding:
1. Check `Knowledge/Decisions/pending/` — does a decision already exist for this tool?
2. If yes: add the finding as an evidence row
3. If no: create `Knowledge/Decisions/pending/[YYYY-MM-DD]-[tool-slug].md` from `Templates/decision.md`

#### Concept / mechanic / metric definition
If the finding explains a **reusable idea** rather than reporting a result — how attribution windows
work, what the team means by "activated", why creative fatigue shows up as CTR decay:
1. Check `Knowledge/Concepts/[slug].md` — does a page for this concept already exist?
2. If yes: **rewrite the page in place** to incorporate the new understanding. Do not append a
   contradicting paragraph and leave both standing. If the change reverses a previous claim, log the
   reversal in the *Superseded* table of `Knowledge/overview.md`.
3. If no: create it — definition, why it matters for our channels, how we measure it, provenance tag,
   and links to the pages that depend on it.

#### Reference / channel intel
If the finding is a benchmark, process doc, or channel insight with no hypothesis or decision angle:
1. Add to `Knowledge/Reference/` as a new file, or append to an existing relevant reference file
2. Tag with `[doc-research, YYYY-MM-DD]`

---

### Step 3 — Update lark-wiki-index.md

For every doc token found in ingestion files, check `Knowledge/Reference/lark-wiki-index.md`:
- If the token is not already in the index → add a row under the right category
- Use the title, type (docx/sheet/bitable/slides), and token from the ingestion file source line

---

### Step 4 — Update Knowledge/index.md and overview.md

For each new file created in Step 2:
- Add a row to the relevant section in `Knowledge/index.md` (People / Reference / Concepts /
  Research / Segments / Hypotheses / Decisions)
- Set Lifecycle: `Candidate` and Last verified: today's date

Then ask whether this ingest **changes the standing picture**. If it does, edit
`Knowledge/overview.md`: update the affected claim in *What's working* / *What's not working*, add a
row to *Open contradictions* if it conflicts with an existing claim, and move any reversed belief to
*Superseded* with today's date. If nothing shifted, say so and leave `overview.md` alone — do not
manufacture a synthesis edit per ingest.

---

### Step 5 — Log and clean up

Append to `Knowledge/log.md` (per-user, gitignored — seed from `Knowledge/_seeds/log.md` if absent):
```
| [YYYY-MM-DD] | wiki-ingest | Promoted [N] files: [list of destinations] | [list of files created or updated] |
```

Then delete each processed ingestion file. If a single ingestion file spawned entries in multiple layers, archive it to `Knowledge/Ingestion/archive/[filename]` instead of deleting.

---

## Output format

```
## /wiki-ingest complete

**Files processed:** [N]
**Promoted to:**
- Hypotheses/candidate/: [N] new files
- Decisions/pending/: [N] new or updated
- Concepts/: [N] pages created or rewritten
- People/: [N] profiles updated
- Reference/: [N] entries added
- lark-wiki-index.md: [N] new rows

**Flagged for review:**
- [file] — [reason, e.g. "spans 3 layers, archived not deleted"]

**Knowledge/overview.md:** [updated — what shifted | unchanged, nothing shifted]
**Knowledge/log.md:** updated
```

---

## When to run

- After any Lark wiki search session where step 5 of the search protocol created ingestion files
- Weekly, as part of `/wiki-maintain`
- Before any major planning session (quarterly review, OKR reset) to ensure the Knowledge layer is current

---

## Related

- `Knowledge/Ingestion/README.md` — ingestion file format
- `Knowledge/Reference/provenance-tags.md` — tagging rules
- `Knowledge/Hypotheses/README.md` — hypothesis lifecycle
- `Knowledge/Decisions/README.md` — decision lifecycle
- `Knowledge/log.md` — operation log
- `Knowledge/_seeds/` — tracked skeletons for the gitignored spines
- `Knowledge/overview.md` — synthesis layer (contradictions, superseded beliefs)
