# Reviewer Verdict Schema

Canonical format for verdict records written by `/brief-review`, `/campaign-readiness`, and `/experiment-readiness`.

A verdict record is a lightweight audit trail. It proves a gate ran, on what artifact, at what date, and with what outcome. It does not replace the full review output — it's a header plus the checklist scorecard.

---

## Verdict file naming

| Skill | Suffix |
|---|---|
| `/brief-review` | `<doc-path>.brief-review-passed` |
| `/campaign-readiness` | `<brief-path>.campaign-readiness-passed` |
| `/experiment-readiness` | `<brief-path>.experiment-readiness-passed` |

Place the verdict file in the same directory as the reviewed artifact.

Example:
```
Projects/q3-acquisition/brief.md
Projects/q3-acquisition/brief.md.brief-review-passed   ← verdict file
```

---

## Verdict file format

Every verdict file must contain exactly this header block, followed by the scorecard:

```
Gate:     <skill name>
File:     <reviewed file path>
Date:     YYYY-MM-DD
Verdict:  PASS | PASS WITH CHANGES | REVISE AND RESUBMIT
```

Followed immediately by the scorecard table from the skill output.

### Brief review verdict file example

```
Gate:     brief-review
File:     Projects/q3-acquisition/brief.md
Date:     2026-05-22
Verdict:  PASS WITH CHANGES

| Check              | Status |
|--------------------|--------|
| Audience fit       | ✅     |
| Message clarity    | ⚠️ Subject line too vague — fix before send |
| CTA strength       | ✅     |
| Tone match         | ✅     |
```

### Campaign readiness verdict file example

```
Gate:     campaign-readiness
File:     Projects/q3-acquisition/brief.md
Date:     2026-05-22
Verdict:  PASS

| Gate                        | Status |
|-----------------------------|--------|
| Audience specified          | ✅     |
| KPI with target number      | ✅     |
| Budget allocated            | ✅     |
| Creative assets ready       | ✅     |
| Tracking / UTMs in place    | ✅     |
| Approval obtained           | ✅     |
| Landing page live           | ✅     |
```

### Experiment readiness verdict file example

```
Gate:     experiment-readiness
File:     Knowledge/Hypotheses/proposed/2026-05-22-subject-line-test.md
Date:     2026-05-22
Verdict:  PASS WITH CHANGES

| Gate                        | Status |
|-----------------------------|--------|
| Hypothesis is falsifiable   | ✅     |
| Primary metric defined      | ✅     |
| Sample size calculated      | ⚠️ Estimate only — confirm with stat calculator |
| Read date set               | ✅     |
| Guardrail metric defined    | ✅     |
| Tracking confirmed          | ✅     |
```

---

## Verdict levels

| Verdict | Meaning |
|---|---|
| **PASS** | All gates clear. Artifact approved to ship / launch / start. |
| **PASS WITH CHANGES** | 1–2 items partial; none failing. Approved if listed changes are made before shipping. |
| **REVISE AND RESUBMIT** | One or more items failed. Artifact must be revised and re-reviewed before use. |

---

## Rules

1. Verdict files are written on PASS or PASS WITH CHANGES only — not on REVISE AND RESUBMIT.
2. A REVISE AND RESUBMIT result is documented in the skill's full output only; no verdict file is created.
3. Do not back-date verdict files. The date is the date the gate ran.
4. Verdict files are not edited after creation. If a re-review changes the verdict, write a new file with a new date suffix.
5. Verdict files are committed alongside the artifact they cover — they are part of the artifact's history.
