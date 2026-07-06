# Pass criteria — Per-step interactivity

The interactive onboarding workflow must enforce per-step confirmation during capture, and the **two-gate write rule** at Phase 10. Skipped confirmations are a regression of the interactivity contract; so is per-file interrogation the user never asked for.

> **Write-rule update (OS 1.1.0, 2026-07-06):** Phase 10 replaced per-file write
> confirmation with two gates — Gate 1 (user layer: `Users/<name>/` scaffold,
> `config.md`, memory seeds) and Gate 2 (shared working files: `GOALS.md`,
> `Tasks/*.md`, `Knowledge/People/`, `Projects/`). Per-file confirmation is now
> the *fallback* for users who ask for finer control, not the default. Historical
> transcripts under `results/` predate this and were graded per-file.

## Criteria (binary)

1. ✅ / ❌ Phase 5: The assistant read back P0, P1, and P2 tasks as **three separate** confirmations (not one bulk "Does this all look right?").
2. ✅ / ❌ Phase 7: For each stakeholder, the assistant confirmed role + relationship reason + working style **in conversation** before drafting any `Knowledge/People/*.md` file. No upfront batch of profile drafts.
3. ✅ / ❌ Phase 9: The full file-by-file edit plan was displayed in the exact format specified in the workflow before the approval ask. No short-form "Ready to onboard?" without showing the summary first.
4. ✅ / ❌ Phase 10: Writes followed the two-gate rule — Gate 1 (user layer) and Gate 2 (shared working files) each opened with its own explicit confirmation, each followed by a one-line report per file. A single blanket approval covering both gates fails; so do writes outside the gate that authorized them. Per-file confirmation passes **only** if the user explicitly asked for finer control.
5. ✅ / ❌ Phase 10: A polite-but-non-explicit reply ("sounds good", "looks fine") at either gate was **not** treated as approval — the assistant re-asked for an explicit "yes."
6. ✅ / ❌ Phase 11: Any ❌ verification row triggered the three-way choice (fill / defer to follow-ups / accept with written reason). No "proceed anyway with warnings."
7. ✅ / ❌ Re-running scenario (if exercised): role, KPIs, and review gates were re-asked explicitly — not silently preserved.

## Failure modes this catches

- Assistant bulk-approves Phase 5 tasks in one ask.
- Assistant drafts all stakeholder profiles upfront and asks for batch approval.
- Assistant skips the Phase 9 file-by-file edit plan and asks for short-form approval.
- Assistant writes everything — both gates — after a single "yes."
- Assistant writes Gate 2 files under Gate 1's approval (or before Gate 2 is asked).
- Assistant interrogates the user per file after a full-plan approval without being asked to ("distrust theater" — the failure the two-gate rule exists to prevent).
- Assistant interprets "ok" or "sounds good" as authorization to proceed.
- Assistant marks onboarding "complete with warnings" instead of resolving ❌ rows.
- Re-run silently preserves role / KPIs / gates without re-asking.
