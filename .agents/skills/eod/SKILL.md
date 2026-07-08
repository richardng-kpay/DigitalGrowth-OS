# /eod — end-of-day memory sweep

Run when a working session wraps up, or whenever the user says "eod", "wrap up", or "save
today". This is the ritual that makes memory persist across 3P gateway accounts: if it isn't
in a file, it didn't happen.

## What this does

1. Harvests durable facts from today's conversation into `Users/<active-user>/memory/`
2. Updates task state in `Tasks/active.md`
3. Refreshes `Users/<active-user>/memory/claude-project-digest.md`
4. Appends today's usage line to `Users/<active-user>/usage-log.md`

## Steps

1. Read `Users/.active-user` → resolve the user directory. If absent, stop: onboarding first.
2. **Memory sweep.** Scan the conversation for durable facts, in priority order:
   - **Corrections** the user made to your outputs (highest value — write the wrong belief,
     the correction, and **Why** + **How to apply**) → `type: feedback`
   - **Decisions** made, with reasoning and reversal conditions → `type: project`
   - **Preferences / working-style signals** observed or stated → `type: user`
   - **Stakeholder, channel, or metric insights** → `type: project` (canonical versions belong
     in `Knowledge/People/` or `Knowledge/` — write there too if confirmed)
   - **Useful pointers** (dashboards, docs, threads) → `type: reference`
   For each: check the existing index first — update the existing file rather than duplicating;
   delete entries proven wrong. One fact per file, format per `Users/_template/memory/MEMORY.md`.
   Add/refresh one index line per file in `MEMORY.md`.
3. **Task state.** Mark completed items in `Tasks/active.md`, move stalled items with notes,
   surface anything that became a blocker.
4. **Digest refresh.** Regenerate `claude-project-digest.md` (identity + style from `config.md`,
   top priorities from `Tasks/active.md`, highest-value memory entries, privacy boundaries).
   Keep it under ~120 lines and set `Last refreshed: YYYY-MM-DD` in its header. If it changed
   materially, remind the user: "digest updated — re-upload it to your claude.ai Project
   knowledge when you get a chance."
5. **Usage log.** Append one line to `usage-log.md`:
   `YYYY-MM-DD · skills used: /x, /y · sessions: N · OS-Version: <from CLAUDE.md>`
6. **Learn → optimize.** Scan memory and `usage-log.md` for patterns that have now recurred
   **≥3 times**: the same manual step sequence, the same correction class, a recurring topic
   with no matching area tag, or a routing choice made repeatedly. If found, **propose** one
   optimization — a personal skill (net-new, uniquely named — survives `/os-update`), a
   workflow tweak, a new tag, or a `config.md` routing rule — with the evidence ("you've done
   X manually 3 times"). Offer to scaffold it; never auto-write. At most one proposal per
   sweep, and drop a proposal the user has declined before (check `config.md` notes).
7. Close with a 3-line summary: memories written (count + names), tasks updated, digest status.

## Rules

- Do not save task state, draft copy, or raw data as memory — those live in `Tasks/` and `Projects/`.
- Respect the privacy boundaries in `config.md` — excluded categories never enter memory files.
- If nothing durable happened today, say so and write nothing. An empty sweep is a valid sweep.
