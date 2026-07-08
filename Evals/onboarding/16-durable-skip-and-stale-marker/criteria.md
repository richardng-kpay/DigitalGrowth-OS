# Pass criteria — Durable skip + stale-marker recovery

Covers the OS 1.1.1 behavior set: a declined onboarding offer must be remembered
(`Users/.onboarding-skipped`), and a corrupt `Users/.active-user` must recover to
first-run instead of dead-ending. Before 1.1.1, "Skip for now" re-triggered the
full blocking offer every session forever, and an empty/stale marker left the user
neither onboarded nor re-offered.

Graded across **four scenario transcripts**:

- **S1 — skip is recorded:** `.active-user` absent, user answers the first-run offer with `Skip for now`.
- **S2 — skip is durable:** `.active-user` absent, `.onboarding-skipped` present (dated earlier), user opens with a substantive request.
- **S3 — skip then onboard:** same state as S2, user says `onboard me`.
- **S4 — stale marker:** `.active-user` present but empty, or naming a folder that does not exist under `Users/`; user opens with any message.

## Criteria (binary)

1. ✅ / ❌ **Skip writes the marker (S1).** On `Skip for now`, the assistant writes `Users/.onboarding-skipped` (one line: date) and then proceeds with the user's request — it does not simply drop the decline.
2. ✅ / ❌ **No blocking re-offer (S2).** With the skip marker present, the assistant opens with a **one-line nudge** (e.g. "Not onboarded yet — say `onboard me` anytime") and answers the user's request. It does not fire the blocking `AskUserQuestion` offer again.
3. ✅ / ❌ **Explicit trigger still works (S3).** `onboard me` starts the full onboarding flow despite the skip marker.
4. ✅ / ❌ **Completion clears the skip (S3).** On finishing Phase 10, `Users/.active-user` is written (last) and `Users/.onboarding-skipped` is deleted. Phase 11 includes the skip-marker-cleared check.
5. ✅ / ❌ **Stale marker recovers (S4).** With an empty or folder-less `.active-user`, the assistant says the marker is stale and treats the session as first-run (offer or nudge per skip-marker state) — it does not silently proceed unconfigured, and does not claim the user is onboarded.
6. ✅ / ❌ **Orphan folder merged, not clobbered (S4 follow-through).** If onboarding then runs and `Users/<name>/` already exists from an aborted run, the assistant reads and fills gaps in the existing folder — it does not re-copy the `_template` scaffold over it.

## Failure modes this catches

- Re-nagging a user every session after an explicit "Skip for now" (pre-1.1.1 loop).
- A blank or stale `.active-user` silently disabling both onboarding and config loading.
- A leftover `.onboarding-skipped` after completion suppressing first-run offers on a re-clone.
- An aborted run's partial `Users/<name>/` folder being overwritten by the scaffold on re-run.
