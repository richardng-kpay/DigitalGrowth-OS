# Pass criteria — Cowork-attach onboarding behavior

Covers the PR #6 behavior set: the OS is built to be attached inside a user's
Cowork and must (a) onboard proactively on first run, (b) drive questions
through the `AskUserQuestion` tool, (c) validate inferred values before
recording, and (d) gate the trigger on a durable completion marker so
configured users are never re-triggered. The pre-PR-#6 eval
(`2026-06-19_...`) does not test any of these.

> **Marker update (OS 1.1.0, 2026-07-06):** the completion marker is now the
> presence of `Users/.active-user` (absent = first run), not the
> `Onboarding-Complete` line in `CLAUDE.md`. In the scenarios below read
> "marker `no`/absent" as "`Users/.active-user` absent" and "marker `yes`" as
> "`Users/.active-user` present". Historical transcripts under `results/`
> predate this change and are graded against the old marker.

This eval is graded across **four scenario transcripts**, not one onboarding
run, because the behaviors are about *when* and *how* onboarding fires:

- **S1 — fresh template, bare greeting:** marker `no`/absent, user's first message is `hi`.
- **S2 — fresh template, substantive request:** marker `no`/absent, first message is a real work request (e.g. "write me a campaign brief"), no onboarding phrase.
- **S3 — configured user, intentional placeholder remains** (Codex regression case): marker `yes`, a `[METRIC_TBD]`-style placeholder was deliberately kept; user asks for substantive work.
- **S4 — completed onboarding** (Codex regression case): a full onboarding run that finishes Phase 10–11.

## Criteria (binary)

1. ✅ / ❌ **Proactive trigger (S1).** On a bare "hi" with marker `no`/absent, the assistant's first response is the onboarding offer — it does not answer as if configured and does not wait for a trigger phrase.
2. ✅ / ❌ **Trigger beats substantive work (S2).** With marker `no`/absent, the assistant offers onboarding before producing the requested deliverable; it does not silently do the work as if configured.
3. ✅ / ❌ **No re-trigger when configured (S3).** With marker `yes`, the assistant does **not** offer or run onboarding even though a placeholder remains; it proceeds to the requested work. (If a specific placeholder blocks the task, it asks for that one value — it does not re-run the flow.)
4. ✅ / ❌ **AskUserQuestion delivery.** In S1/S2/S4, onboarding questions are delivered through the `AskUserQuestion` tool as selectable options, not as a numbered free-text chat list. (Fallback to chat is acceptable only if the harness lacks the tool, and must be stated.)
5. ✅ / ❌ **Assumption validation.** When the assistant infers a value (e.g. company from an email domain), it surfaces the inference as a confirmable `AskUserQuestion` option for the user to accept/correct — it does not write the inferred value into a file as if the user stated it, and does not ask it inline as open free-text.
6. ✅ / ❌ **Completion writes the marker (S4).** On finishing onboarding, `Users/.active-user` is written (naming the user's folder) and `Users/<name>/config.md` records `Onboarding completed: yes (YYYY-MM-DD)` — and this happens even if the user intentionally left placeholders behind. No personal value is written into `CLAUDE.md`.

## Failure modes this catches

- Re-offering onboarding to a configured user every session because a placeholder remains (the original Codex high-severity bug).
- Treating a greeting as "too trivial" and answering as if configured on a fresh template.
- Reverting to free-text chat questions instead of option chips.
- Silently writing an inferred company/role as fact instead of confirming it.
- Finishing onboarding without setting the completion marker, so the OS re-triggers forever.
- Using placeholder presence (not the marker) as the first-run signal.
