# /synthesize-research

Turn a bounded research corpus into a grounded synthesis with themes, pain
points, conflicting signals, implications, and open questions.

Use this for interview notes, customer-call excerpts, survey free text, Lark
wiki research dumps, and discovery notes.

## Usage

- `/synthesize-research [file or folder]`
- `/synthesize-research` — use the research notes already discussed in context

## Steps

1. Read the provided corpus. If no corpus is provided, ask for the file, folder,
   or pasted notes before synthesizing.
2. Preserve source identity. Track speaker, role, date, and source file when
   available.
3. Extract evidence into a working table:
   - source
   - quote or close paraphrase
   - topic
   - sentiment / severity
   - affected audience or segment
4. Build the synthesis:
   - 3-6 grounded themes
   - distinct pain points
   - conflicting signals or minority views
   - implications for the stated use case
   - open questions with next steps
5. Do not invent quotes, numbers, source names, or participants.
6. If the corpus is too thin, say so and lower confidence.
7. Offer to file useful findings into `Knowledge/Ingestion/` for later
   `/wiki-ingest` promotion.

## Output format

```markdown
## Research synthesis

**Corpus:** [files / source count]
**Use case:** [decision this synthesis informs]
**Confidence:** low / medium / high

### Executive read
[3-5 bullets, each tied to evidence]

### Themes
| Theme | Evidence | Who it affects | Confidence |
|---|---|---|---|

### Pain points
| Pain point | Evidence | Severity | Next action |
|---|---|---|---|

### Conflicting signals
- [Signal A] vs [Signal B] — [what to investigate next]

### Implications
1. [Recommendation tied to use case]
2. [Recommendation tied to use case]

### Open questions
| Question | Why it matters | How to answer |
|---|---|---|
```

## Eval contract

This skill is covered by `Evals/research-synthesis/`. Before citing a result
externally, run the suite with transcript capture and independent grading.
