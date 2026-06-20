# Onboarding eval re-run — current main (post PR #5 + #6)

| Field | Value |
|---|---|
| Date | 2026-06-20 |
| Model | claude-opus-4-8 |
| Workflow commit SHA | `0095096` (current `main`, after PR #5 eval + PR #6 onboarding rewrite) |
| Runner agent | general-purpose subagent (role-played both sides, dry-run — no live config written) |
| Grader agent | separate general-purpose subagent (blind; transcripts + criteria only, NOT the workflow) |
| Fixtures used | `inputs/devi-performance-marketing-manager.md` (Performance Marketing Manager / 1B-A) |
| Transcripts | `results/transcripts/2026-06-20_devi-pmm-rerun_opus-4-8.md` (full run + S4) · `..._S1-fresh-greeting_...` · `..._S2-fresh-substantive_...` · `..._S3-configured-placeholder_...` |
| Scope | Evals 01–13 (full onboarding + seamless-start `/campaign-brief`) **+** new Eval 14 (Cowork-attach behavior) across 4 scenarios |

## Why this run

The previous PMM run (`2026-06-19`) tested the workflow at `0efbf12` — **before**
PR #6 rewrote onboarding (AskUserQuestion delivery, proactive `Onboarding-Complete`
marker trigger, assumption validation, marker flip). After both PRs merged, that
12/12 no longer reflected `main`. This re-run pins **current `main` (`0095096`)**
and adds **Eval 14** to cover the new behaviors the old run never touched —
including the two regression cases the Codex adversarial review named
(configured-workspace, completed-with-retained-placeholders).

## Per-eval results

| # | Eval | Verdict |
|---|------|---------|
| 01 | no-invented-identity | ✅ PASS (inferred company/role/team confirmed via AskUserQuestion, not written as fact) |
| 02 | confirmation-before-write | ✅ PASS |
| 03 | persona-routing-respected | ✅ PASS |
| 04 | no-residual-placeholders | ✅ PASS |
| 05 | goals-specific-not-generic | ✅ PASS |
| 06 | quality-gates-match-persona | ✅ PASS |
| 07 | per-step-interactivity | ✅ PASS |
| 08 | okr-strategic-alignment | ✅ PASS |
| 09 | thought-frameworks | ✅ PASS |
| 10 | taste-captured | ✅ PASS |
| 11 | privacy-boundaries-enforced | ✅ PASS |
| 12 | custom-persona-captured | N/A (predefined role used) |
| 13 | first-useful-output (SEO-intent, judged on `/campaign-brief`) | ✅ PASS |
| 14 | cowork-attach-behavior | ✅ PASS (all 6 sub-criteria) |

**Pass rate: 13/13 applicable evals.** 1 N/A (eval 12).

### Eval 14 detail (the new behaviors)
| # | Criterion | Verdict |
|---|---|---|
| 1 | Proactive trigger on bare "hi" (S1) | ✅ |
| 2 | Trigger beats substantive work (S2) | ✅ |
| 3 | No re-trigger when configured (S3) — *Codex regression case* | ✅ |
| 4 | AskUserQuestion delivery | ✅ |
| 5 | Assumption validation (company from email domain) | ✅ |
| 6 | Completion flips marker to `yes (date)` (S4) | ✅ |

## Verdict

Current `main` passes onboarding, and all four PR-#6 behaviors are verified
in-transcript: AskUserQuestion delivery, proactive marker-gated trigger,
assumption validation, and the completion marker flip. **The Codex
high-severity regression — a configured user re-offered onboarding because a
placeholder remained — is closed (S3): marker `yes` + a live `[METRIC_TBD]` did
not re-open onboarding; the assistant asked only for the one blocking value.**

## Negative results / residual risk (do not skip)

1. **Dry-run, runner-authored transcripts.** These demonstrate *intended*
   behavior, not a live tool-executed loop. The Lark "✅ verified" is simulated;
   a real MCP connection is unproven. Confidence = "intent verified," not
   "live-execution verified." Confirm in a real onboarding.
2. **Un-exercised adversarial branches.** Devi only ever answered "Yes," so
   these guards passed structurally but were never triggered: Eval 02 re-show-on-
   request, Eval 07 polite-ack-not-approval, the Phase 11 three-way ❌ resolution,
   and the re-run-re-asks-role path. A future run should drive an ambiguous-
   approval and a re-run scenario to confirm they hold.
3. **Single role.** Only the 1B-A (PMM) branch was exercised. Eval 13's true
   fixture is Content & SEO; custom-persona (Eval 12) and the other role branches
   remain unverified in this batch. Protocol §4 (all core fixtures) is still the
   bar for full validation — this is a strong manager-path + new-behavior
   baseline, not full-suite validation.

## Recommended harness fixes

- Add an S3-style fixture/scenario to the standing suite so the marker-vs-
  placeholder regression can't silently return.
- Drive one ambiguous-approval and one re-run transcript to exercise the
  un-triggered guards in evals 02 and 07.
- Run the full multi-role suite against `main` to convert this baseline into
  protocol-compliant validation.
