# Onboarding eval run — Content & SEO path (Mardiana)

| Field | Value |
|---|---|
| Date | 2026-05-29 |
| Model | claude-opus-4-8 |
| Workflow commit SHA | `3b5d2c2a38d5b0b595f3854f20a93d639299606c` |
| Runner agent | general-purpose subagent (role-played both sides, dry-run — no live config written) |
| Grader agent | separate general-purpose subagent (blind; read transcript + criteria only, NOT the workflow) |
| Fixtures used | `inputs/mardiana-content-seo.md` (new — first Content & SEO Lead / 1B-B fixture) |
| Transcript | `results/transcripts/2026-05-29_mardiana-content-seo_opus-4-8.md` |
| Scope | Onboarding (Phase 0–11) **+** seamless-start: `/content-brief payment gateway Hong Kong` |

## Why this run

First end-to-end test of the **Content & SEO Lead** path and the first test of
the new eval **13 — first-useful-seo-output** ("can she onboard *and start
working*, not just finish setup?"). All prior fixtures were PM/exec/analyst
personas; the `1B-B` branch had never been exercised.

## Per-eval results

| # | Eval | Verdict |
|---|---|---|
| 01 | no-invented-identity | ✅ PASS |
| 02 | confirmation-before-write | ✅ PASS |
| 04 | no-residual-placeholders | ✅ PASS (⚠ Lark block deferred w/ follow-up) |
| 05 | goals-specific-not-generic | ✅ PASS (criteria adapted to Mardiana — see fix #5) |
| 07 | per-step-interactivity | ✅ PASS (⚠ user-authorized batch at Phase 9) |
| 08 | okr-strategic-alignment | ✅ PASS |
| 10 | taste-captured | ✅ PASS |
| 11 | privacy-boundaries-enforced | ✅ PASS |
| 13 | first-useful-seo-output | ✅ **PASS (clean, 7/7)** — headline result |

**Pass rate: 9/9 evals.** Eval 13 (the decisive seamless-start eval) passed all
7 criteria with no caveats.

## Verdict

**Can Mardiana onboard and seamlessly start using the OS? → Yes, with two
minor already-logged caveats.** Her first real deliverable (`/content-brief`)
reused captured config (no re-interrogation), ran wiki-first search, honestly
downgraded a weak wiki hit instead of forcing relevance, grounded the brief in
SME/HK-SG payments with her exact KPIs and Jervis→brand approval gate, labeled
keyword volume an estimate (no fabricated number), routed to `/brief-review` +
`/audience-check`, and honored her data-trust/attribution kill-condition in the
success-metrics table.

## Negative results / seams observed (named explicitly)

1. **Lark block can't self-complete.** Onboarding makes a live `docx_builtin_search`
   call but has no step to capture space ID / root node / domain — so the
   template's Lark protocol section ships as "to confirm." Resolved correctly
   (deferred + dated follow-up, not fabricated), but it's the one headline
   feature that can't be filled from the interview alone.
2. **Non-useful wiki result is undefined behavior.** CLAUDE.md says "every
   useful search leaves a residue in `Knowledge/`" but is silent on what to do
   with a *non-useful* result. Assistant correctly logged nothing fabricated;
   the rule is just ambiguous.
3. **Phase 10 first-command trio is role-blind.** Hardcoded `/today` +
   `/weekly-performance-report` + `/campaign-brief` — for a Content & SEO Lead,
   `/content-brief` is the natural starter and `/weekly-performance-report` is
   awkward when her own blocker is untrusted metrics.

## Recommended harness fixes (prioritized)

1. **P1 — Auto-resolve the Lark block** from the authenticated MCP session
   (add `wiki_v1_node_search` / `wiki_v2_space_getNode` to Phase 0B) so
   CLAUDE.md ships complete. Eliminates the only residual-placeholder ⚠.
2. **P2 — Define batch-consent handling in Phase 9**: explicit user batch
   authorization overrides per-file asks, provided each `[WRITE]` line is still
   emitted and the batch list is confirmed once.
3. **P3 — Make Phase 10's first-3-commands role-conditional** (Content & SEO →
   `/content-brief`, `/today`, `/channel-review`).
4. **P3 — Clarify the null-wiki-result logging rule** in CLAUDE.md step 5.
5. **P3 — Add a Mardiana-specific `05/criteria.md`** (current file is hardcoded
   to Jordan Lee, forcing every grader to adapt).

## Status

A single run on a single model is a baseline, not validation. Re-run on the next
Opus release and after any edit to `interactive-onboarding.md` or the
`content-brief` skill.
