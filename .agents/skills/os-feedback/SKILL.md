# /os-feedback — tell the OS owner how this is going

Collects structured feedback about the OS itself (not about campaigns or work content) and
delivers it to the OS owner through two sinks: a local log and the team's shared Lark base.

## When to run

- The user invokes `/os-feedback`
- Proactively (sparingly): after the user's first full week on the OS, or when they express
  clear delight or frustration **with the OS itself**. Never more than once a week.

## Steps

1. Read `Users/.active-user` → resolve user dir; read `config.md` (name, role) and the
   `OS-Version` from `CLAUDE.md`.
2. Ask via `AskUserQuestion` (one batch, all four):
   - **Rating** — "How useful has the OS been this week?" (Very useful / Somewhat / Not really / Getting in the way)
   - **Best part** — options seeded from their most-used skills per `usage-log.md`, plus Other
   - **Friction** — (Onboarding / Memory–personalization / Skills / Lark search / Speed–verbosity / Other)
   - **Wish** — "If one thing improved next release, what should it be?" (free-text via Other, plus 2–3 guesses from context)
3. Compose the entry:
   ```
   ## YYYY-MM-DD · [name] · [role] · OS [version]
   - Rating: ...
   - Best: ...
   - Friction: ...
   - Wish: ...
   - Usage (last 7 days): [summarised from usage-log.md — skill names and counts only]
   ```
4. **Sink 1 — local log (always):** append to `Users/<active-user>/feedback-log.md`.
5. **Sink 2 — shared Lark base (when available):** create a record in the team's OS-feedback
   Base (app token and table id below). If the Lark MCP has no record-create tool or the call
   fails, do NOT drop the feedback — output the entry as a copy-paste block and ask the user to
   post it in the team's OS feedback thread. Say plainly which sink worked.
6. Thank the user in one line. No follow-up interrogation.

## Lark feedback base (configured by the OS owner)

- **Base app token:** `[FEEDBACK_BASE_APP_TOKEN]` · **Table:** `[FEEDBACK_TABLE_ID]`
- Fields: Date · Name · Role · OS version · Rating · Best · Friction · Wish · Usage summary
- **Owner setup note:** the shared Lark app needs the Bitable **write** scope
  (`bitable:app`) and the MCP config must enable `bitable_v1_appTableRecord_create`. Until
  then, sink 2 gracefully degrades to the copy-paste block.

## Privacy

- Usage summary shares skill names and counts only — never task content, metrics, or memory.
- Respect `config.md` privacy boundaries; the user sees exactly what will be sent before it goes
  to the shared base (show the entry, ask "send this?").
