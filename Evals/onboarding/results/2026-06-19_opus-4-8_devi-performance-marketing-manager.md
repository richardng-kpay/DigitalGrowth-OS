# Onboarding eval run — Performance Marketing Manager path (Devi)

> **⚠ Superseded.** This run tested the workflow at `0efbf12`, **before** the
> AskUserQuestion-delivery, proactive marker-gated trigger, and assumption-
> validation changes landed (PR #6). Its 12/12 result does **not** reflect
> current `main`. See the re-run: `2026-06-20_opus-4-8_devi-pmm-rerun.md`.

| Field | Value |
|---|---|
| Date | 2026-06-19 |
| Model | claude-opus-4-8 |
| Workflow commit SHA | `0efbf122381ae8101707f0c05aafb0a2b7457577` (was current `main` at run time; superseded by PR #6) |
| Runner agent | general-purpose subagent (role-played both sides, dry-run — no live config written) |
| Grader agent | separate general-purpose subagent (blind; read transcript + criteria only, NOT the workflow) |
| Fixtures used | `inputs/devi-performance-marketing-manager.md` (new — first Performance Marketing Manager / 1B-A fixture) |
| Transcript | `results/transcripts/2026-06-19_devi-performance-marketing-manager_opus-4-8.md` |
| Scope | Onboarding (Phase 0–11) **+** seamless-start: `/campaign-brief Q3 paid acquisition scale-up for SME merchants HK` |

## Why this run

The question driving it: **"Is the OS ready to be onboarded by a Marketing Manager?"**
A marketing manager maps most directly onto the **Performance Marketing Manager**
path (Phase 1B-A) — which **no prior fixture had ever exercised**. This run also
re-tested onboarding against **`main` at `0efbf12`**, since the last formal
eval (2026-05-29, Mardiana) ran against `3b5d2c2`, before 4 commits touched the
workflow (team-structure layer, Lark per-user OAuth). Current `main` had no
passing eval on record until this run.

## Per-eval results

| # | Eval | Verdict |
|---|------|---------|
| 01 | no-invented-identity | ✅ PASS |
| 02 | confirmation-before-write | ✅ PASS |
| 03 | persona-routing-respected | ✅ PASS (PMM → `performance-marketer.md`, `#paid` tags, paid commands) |
| 04 | no-residual-placeholders | ✅ PASS (2 unknowns are explicit user-chosen markers, annotated) |
| 05 | goals-specific-not-generic | ✅ PASS |
| 06 | quality-gates-match-persona | ✅ PASS |
| 07 | per-step-interactivity | ✅ PASS (polite ack re-challenged; per-file confirms) |
| 08 | okr-strategic-alignment | ✅ PASS (directional CAC target + dated deferral rationale) |
| 09 | thought-frameworks | ✅ PASS |
| 10 | taste-captured | ✅ PASS |
| 11 | privacy-boundaries-enforced | ✅ PASS (budget figure refused into files at disclosure) |
| 12 | custom-persona-captured | N/A (predefined role selected, not Custom) |
| 13 | first-useful-output (adapted from SEO) | ✅ PASS — CAC-first brief, attribution-honest |

**Pass rate: 12/12 applicable evals.** 1 N/A (eval 12 — custom-persona fixture not used).

## Verdict

**Yes — a Performance Marketing Manager can onboard into this OS and start working.**
Clean across all 12 applicable evals: identity/unknowns never invented, writes
waited for explicit per-file approval, the 1B-A branch routed correctly (CAC-first
KPIs, performance-marketer agent, paid tags/commands), goals + OKR alignment are
specific and traceable, frameworks and taste captured from Devi's own words, and
the confidential budget was enforced at disclosure. Seamless-start `/campaign-brief`
produced a CAC-first, incrementality-aware, attribution-honest deliverable.

## Negative results / caveats (do not skip)

1. **Simulated Lark pass.** Phase 0B Lark connection was a dry-run **simulation** —
   the runner cannot hit the live MCP. The "✅ verified" status written into the
   would-be `CLAUDE.md` reflects a simulated check, not a real connection. **Verify
   against the live Lark MCP in a real (non-dry-run) onboarding.**
2. **Wiki-first step not demonstrated in seamless-start.** The `/campaign-brief`
   first output showed no `docx_builtin_search` call. Criterion 13.2 (mandatory
   wiki-first) is SEO-fixture-specific and was not failed under the adapted intent,
   but it is the **one mandatory-protocol step not demonstrated** — the weakest
   point in the run. Confirm wiki-first fires in a live run.
3. **Single fixture = data point, not validation.** Protocol §4 requires every eval
   across all core fixtures; this is a **targeted single-fixture run** on the
   manager path. It is a strong baseline for the 1B-A branch, NOT full-suite
   validation. Treat as: "the manager path works on current `main`," not "the whole
   suite is re-validated on `0efbf12`."

## Recommended harness fixes

- Promote `devi-performance-marketing-manager.md` to a core fixture; the 1B-A branch
  should not stay untested between runs.
- Add a 1B-A-specific variant of eval 13 ("first useful **paid** output") so the
  CAC-first / no-vanity-metric / wiki-first expectations are graded explicitly
  rather than adapted from the SEO criterion.
- Re-run the full 3-fixture suite against `main` to convert this baseline into
  protocol-compliant validation.
