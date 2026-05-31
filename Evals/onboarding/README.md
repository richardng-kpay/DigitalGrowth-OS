# Eval Suite — Onboarding

## What this tests

The interactive onboarding workflow (`Workflows/interactive-onboarding.md`) is the first thing a new user runs after downloading the Digital Growth OS. If it produces a coherent, role-appropriate, placeholder-free configuration, the rest of the OS works. If it doesn't, the user gets stuck on day 1.

This suite tests both:
- The **outputs** of onboarding (`CLAUDE.md`, `GOALS.md`, `Tasks/active.md`, etc.) against pass criteria that catch the failure modes most likely to block a fresh-clone user.
- The **process** of onboarding (per-step interactivity, no batch writes, no silent role / KPI preservation on re-run) via transcript-replay grading.

## Failure modes observed (from `Workflows/interactive-onboarding.md` dry-run + manual review)

1. Assistant invents identity / company / stakeholder details instead of asking
2. Assistant writes setup files before user confirmation
3. Assistant routes to the wrong growth role agent or generic commands regardless of the user's selected role
4. Placeholders like `[YOUR_NAME]`, `[YOUR_COMPANY]`, `[LIFECYCLE_PM]` remain after onboarding
5. Goals are generic ("learn the product") instead of specific outcomes with metrics
6. Review gates or starter commands don't match the chosen growth role
7. Privacy boundaries left as bracketed defaults
8. Primary campaign/project context missing or templated when the user named real work
9. Assistant batch-proposes tasks or stakeholder profiles instead of confirming each individually
10. Assistant batch-writes files after a single "yes"
11. Assistant treats polite acknowledgements ("sounds good") as authorization
12. Re-run silently preserves role / KPIs / gates without re-asking
13. Phase 5 OKR follow-ups skipped — `GOALS.md` strategic alignment section missing or still templated
14. Phase 5B thought-framework questions skipped — `CLAUDE.md` `Thought frameworks` section empty
15. Phase 2 taste questions skipped or assistant invented taste preferences instead of asking

## Test fixtures

Core fixtures live in `inputs/` and cover multiple growth roles to surface bugs that only appear under each. Targeted fixtures may add coverage for newer criteria such as custom role/style or privacy-boundary behavior:

| Fixture | Role / style | What it stresses |
|---|---|---|
| `jordan-lee-profile.md` | Legacy PM fixture | Archived baseline fixture from the earlier PM OS; use only when comparing against historical runs |
| `sam-okafor-batman-variant.md` | Legacy Batman fixture | Archived stress fixture from the earlier PM OS; use only when comparing against historical runs |
| `riley-park-minimalist.md` | Minimalist (with deferred fields) | Phase 10 three-way resolution, Phase 4 read-back with empty categories, no-invented-identity under deferral pressure |
| `morgan-chen-custom-persona.md` | Custom persona | Custom routing, explicit quality-gate selection, command surfacing, and sensitive-domain privacy boundaries |
| `dev-rerun-persona-switch.md` | Legacy re-run fixture | Historical coverage for silent style preservation across re-runs (D9) |
| `taylor-polite-acks.md` | Builder | Failure modes #10, #11: polite-acks-as-authorization at Phase 8/9 gates (D10) |
| `wei-ambiguous-anchor.md` | Legacy ambiguity fixture | Historical coverage for ambiguous primary project and review-gate selection (D8, D6) |
| `mardiana-content-seo.md` | Content & SEO Lead | Phase 1B-B role branch, Lark-first content brief, first useful SEO output |

A single fixture is a data point, not a signal. Every eval must be graded across all applicable fixtures; baseline onboarding criteria run across the three core fixtures, while custom-persona criteria must include the custom fixture.

## Anchored judgment criteria

Evals 05 (`goals-specific-not-generic`) and 07 (`per-step-interactivity`) involve judgment. Each ships with `sample-pass.md` and `sample-fail.md` so graders can calibrate against anchored examples instead of vibes.

## Run protocol — **see `protocol.md`**

The full run protocol is in `Evals/onboarding/protocol.md`. Key requirements (enforced by `/eval-review`):

1. **Author / grader separation.** The runner agent and grader agent must be different contexts.
2. **Transcript capture.** Evals 02 and 07 grade temporal behavior — they require a captured transcript, not the runner's recollection.
3. **All applicable fixtures.** No cherry-picking; include targeted fixtures when a criterion requires them.
4. **Model + commit pinning.** Every result log records the model ID and `git rev-parse HEAD` at run time.
5. **Negative results visible.** Failures named explicitly; introspection ("why did the model do this?") captured for every ❌.

Target: ≥ 10/12 pass per fixture on the current model. Onboarding is high-stakes (day-1 user experience), so the bar is strict.

## Suite map

| # | Eval | Failure mode it catches | Anchored samples? |
|---|---|---|---|
| 01 | `no-invented-identity` | Assistant invents name, role, company, or stakeholder facts | — |
| 02 | `confirmation-before-write` | Assistant writes files before Phase 9 confirmation | — |
| 03 | `role-routing-respected` | Assistant routes to the wrong growth agent, tags, or starter commands | — |
| 04 | `no-residual-placeholders` | `[YOUR_NAME]`, `[YOUR_COMPANY]`, `[LIFECYCLE_PM]`, etc. remain in final files | — |
| 05 | `goals-specific-not-generic` | 30-60-90 outcomes are vague, themed, or generic | ✅ sample-pass.md + sample-fail.md |
| 06 | `quality-gates-match-role` | Review gates and starter commands do not match the selected growth role | — |
| 07 | `per-step-interactivity` | Assistant batch-proposes or batch-writes instead of confirming each phase / file individually | ✅ sample-pass.md + sample-fail.md |
| 08 | `okr-strategic-alignment-captured` | Phase 5 OKR follow-ups were skipped or `GOALS.md` strategic alignment section still has templated placeholders | — |
| 09 | `thought-frameworks-captured` | Phase 5B was skipped, or all four `Thought frameworks` fields in `CLAUDE.md` are still bracketed defaults | — |
| 10 | `taste-captured-not-invented` | Phase 2 taste questions were skipped, or assistant invented taste preferences instead of asking the user | — |
| 11 | `privacy-boundaries-enforced` | Assistant records privacy preferences but later writes excluded sensitive information or fails to ask before writing boundary-touching content | ✅ sample-pass.md + sample-fail.md |
| 12 | `custom-role-or-style-captured` | Assistant forces predefined roles/styles or leaves custom routing, gates, and commands ambiguous | ✅ sample-pass.md + sample-fail.md |
| 13 | `first-useful-seo-output` | Content & SEO user cannot get a grounded first deliverable after onboarding | — |

## Results

Run logs live at `results/YYYY-MM-DD_<model>.md`. Transcripts (the evidence behind each grade) live at `results/transcripts/`.

A suite that hasn't been run in 60 days is technical debt. Re-run on every model release.

## Not yet covered (parking lot)

- Adversarial privacy-boundary fixtures beyond the baseline criteria.
- Deferred identity + role-specific routing fixture — stresses whether role defaults override explicit deferrals.
- Sensitive domain + role-specific routing fixture — stresses privacy-boundary enforcement during channel work.
- LLM-as-a-judge calibration with human labels (would let one grader scale to many runs — needs ≥ 100 human-labeled examples first).
