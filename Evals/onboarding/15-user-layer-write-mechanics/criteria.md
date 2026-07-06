# Pass criteria — User-layer write mechanics (OS 1.1.0)

**Failure modes:** The v1.1.0 onboarding write mechanics regress — the Phase 0
orientation is skipped, a failed Lark check strands the user, the Phase 10
two-gate rule is collapsed or bypassed, memory seeds are missing or malformed,
`Users/.active-user` is written before the user layer lands, or personal values
leak into template-layer files. (README failure modes #16–#20.)

## Why this matters

Everything the 1.1.0 release promises — a personal layer that survives weekly
template updates, memory that persists across sessions, a completion marker
that stops onboarding from re-firing — depends on onboarding writing the right
files in the right order. A run that finishes "successfully" but writes the
marker early, skips memory seeds, or personalizes `CLAUDE.md` silently breaks
the OS for that user in ways they only discover days later.

## What the grader needs

The captured transcript (per `protocol.md`: one row per file write, with the
gate that authorized it) **plus** the resulting `Users/<name>/` tree. Criteria
C4–C7 are ungradeable from the runner's recollection alone.

## Criteria (binary; grade ✅ / ❌ / ⚠ partial — partials are not rounded up)

| # | Criterion | How to check |
|---|---|---|
| 1 | **Phase 0 orientation delivered.** The scripted one-paragraph orientation (personal data lands in `Users/<your-name>/`, stays local, survives template updates; the folder is the assistant's memory; `/eod` does the saving) is delivered in Phase 0, immediately after identity capture — in plain conversational text, not buried in a file listing or README pointer. | Transcript: orientation paragraph (or a faithful paraphrase covering all three points — local user folder, memory-as-files, `/eod`) appears before Phase 0B starts. |
| 2 | **Lark-fail path offers an explicit skip.** If the Phase 0B connection test fails, the assistant offers the choice via `AskUserQuestion` — `Pause — I'll set up Lark now` / `Skip for now — continue onboarding` — records the outcome in the setup capture, and queues a dated follow-up in the Phase 9 edit plan on skip. The user is never stranded at the Lark wall without a surfaced skip option. | Transcript: on a failed/0-result search, an `AskUserQuestion` call with both options follows. N/A (pass) if the connection test succeeded. |
| 3 | **Two-gate write rule followed.** Phase 10 writes happen under exactly two explicit approvals: Gate 1 (user layer — `Users/<name>/` scaffold, `config.md`, memory seeds) then Gate 2 (shared working files — `GOALS.md`, `Tasks/*.md`, and `Knowledge/People/` / `Projects/` as applicable). No write precedes its gate; no single blanket "yes" covers both gates; per-file confirmation only if the user asked for finer control. Overlaps eval 07 C4 — grade there for interactivity, here for which files landed under which gate. | Transcript: match each write row to its authorizing gate. |
| 4 | **Gate 1 write order.** Within Gate 1: scaffold → `config.md` → memory seeds, in that order, each reported in one line. | Transcript write rows. |
| 5 | **`.active-user` written LAST.** `Users/.active-user` (containing exactly the user's folder name, one line) is written only after `config.md` and the memory seeds succeed — and `config.md` records `Onboarding completed: yes (YYYY-MM-DD)` plus the OS-version fields. **Abort test:** if the run aborts after Phase 9 approval but before `config.md` lands, `.active-user` must NOT exist — an aborted run must not leave the clone marked configured. The marker IS written when the user intentionally kept placeholders: completion = finishing the flow, not zero placeholders. | Transcript write order + `ls Users/.active-user` and `grep "Onboarding completed" Users/<name>/config.md`. |
| 6 | **Memory seeds well-formed.** 1–3 memory files seeded from the interview, each following `Users/_template/memory/MEMORY.md`'s documented format: filename `YYYY-MM-DD-<slug>.md`, frontmatter `name` / `description` / `type` (user \| feedback \| project \| reference) / `date`, **one fact per file**, and one index line per file added under `## Index` in `MEMORY.md`. Facts must trace to something the user said. | Inspect `Users/<name>/memory/`: file names, frontmatter keys, index lines; cross-check content against transcript. |
| 7 | **Template layer untouched.** `git status` after the run shows no modifications to `CLAUDE.md`, `AGENTS.md`, `Workflows/`, or skills. Every personal value lives in `Users/<name>/` or user-owned files (`GOALS.md`, `Tasks/`, `Knowledge/People/`, `Projects/`). | `git status --short` captured post-run. |

## Failure modes this catches

- Orientation skipped — the user never hears the core value proposition (user
  layer + persistent memory) and discovers it, or doesn't, in a README.
- Lark check fails and onboarding either halts with no way forward or silently
  proceeds without recording the skip and follow-up.
- All files written after one "yes" (gates collapsed), or Gate 2 files written
  under Gate 1's approval.
- `.active-user` written first "to mark progress" — an abort then leaves the
  clone permanently configured and onboarding never re-offers.
- Memory "seeded" as one blob file, without frontmatter, or without index
  lines — invisible to future sessions.
- Personal identity or style written into `CLAUDE.md`/`AGENTS.md`, which the
  next `/os-update` template pull will clobber or conflict on.

## Fixtures

Any current growth-role fixture exercises C1, C3–C7 on a normal completion.
C2 requires a scripted Lark failure and the abort half of C5 requires an
aborted-run scenario — neither has a fixture yet (tracked as dimension-grid
gaps #2 and #3, D11). Until those exist, grade C2 as N/A on a successful
connection and grade C5 from write ordering alone, noting the reduced
coverage in the run log.

## Introspection prompt for ❌

> "Why did the runner break the write mechanics? Was it: (a) the workflow step
> was skipped entirely, (b) the assistant optimized the ceremony away (batched
> gates, marker-first), (c) the format spec (memory frontmatter, marker
> contents) was never read, (d) the assistant treated a template-layer file as
> the write target out of pre-1.1.0 habit?"

Capture the answer — it is the harness bug report.
