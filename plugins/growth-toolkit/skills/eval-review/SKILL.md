---
name: eval-review
description: Audit an eval run before its result is cited or used to justify a change — checks runner/grader independence, transcript capture, model and commit pinning, fixture coverage and visible negative results. Use when the user says "review this eval run", "can I cite this result", or presents eval numbers as evidence.
---

# /eval-review

Audit an eval run before it is cited or used to justify an OS change.

## Running outside the full OS

Installed from the `growth-toolkit` plugin rather than a Digital Growth OS clone, the checklist
and suites live at `${CLAUDE_PLUGIN_ROOT}/Evals/`. Run logs stay wherever the user keeps them.

## Usage

- `/eval-review Evals/onboarding/results/YYYY-MM-DD_model.md`
- `/eval-review Evals/research-synthesis/results/YYYY-MM-DD_model.md`

## Steps

1. Read `Evals/eval-audit-checklist.md`.
2. Read the target suite README and protocol.
3. Read the run log.
4. Verify the P0 citation blockers:
   - runner and grader are different contexts
   - transcript captured where temporal behavior is graded
   - model and commit SHA pinned
   - all applicable fixtures run
   - negative results visible
   - pass-rate target stated before results
5. Verify P1 signal quality:
   - criteria are binary or partial, not vague scores
   - anchored examples exist for judgment-heavy criteria
   - fixture coverage is justified
   - failures produce harness fixes
6. Verify P2 hygiene:
   - filenames follow convention
   - no suite is stale beyond its documented window
   - links resolve
7. Output a citable / not-citable verdict.

## Output format

```markdown
## Eval review

**Verdict:** Citable / Not citable

### P0 blockers
- ...

### P1 signal issues
- ...

### P2 hygiene
- ...

### Required fixes before citing
1. ...
```

## Rules

- If any P0 item fails, the run is not citable.
- Do not edit result logs during review unless the user explicitly asks.
- Prefer naming the missing evidence over inferring that it probably happened.
