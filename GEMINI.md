# DigitalGrowth-OS — Gemini CLI Entry Point

This file is the entry point for **Gemini CLI**. The OS is harness-neutral — Claude Code reads `CLAUDE.md`, Codex CLI reads `AGENTS.md`, and Gemini CLI reads this file. All three route to the same configuration surface and the same workflows.

## Configuration surface

- **`CLAUDE.md`** — team-wide rules: routing, knowledge layers, quality gates, Lark protocol. Template-layer, never personalized; filename is historical — the contents apply to every harness.
- **`Users/<name>/config.md`** — user identity, persona, tone, cadence, privacy boundaries. Resolve the active user via `Users/.active-user`; load `config.md` and `Users/<name>/memory/MEMORY.md` on session start.
- **`AGENTS.md`** — agent behavior contract (change management, review dimensions, output format). Read this too.
- **`GOALS.md`** — 30-60-90 outcomes and metrics.
- **`Tasks/active.md`** — current sprint focus.
- **`Workflows/`** — repeatable interactive workflows.
- **`Templates/`** — document templates.
- **`Knowledge/People/`** — stakeholder profiles.
- **`Projects/`** — per-project briefs and artifacts.

## Onboarding mode

**Trigger proactively** on first run — defined by the file `Users/.active-user` being **absent** (NOT by placeholder presence; a configured user may keep placeholders). When absent, greet the user and offer onboarding before substantive work; do not wait for a trigger phrase. When it exists, do not offer. `Computer, onboard me into this OS`, `set up this template`, or similar are shortcuts. On completion, write `Users/.active-user` (one line: the user's folder name).

1. Run `Workflows/interactive-onboarding.md` phase by phase. Use a structured question tool where available; validate inferred values with the user before recording them.
2. Ask the user — never invent — for their role on the growth team, channels they own, KPIs, cadence, current tasks, goals, stakeholders, and privacy boundaries.
3. Branch by role in Phase 1B — the interview is different for Performance Marketer, Content/SEO, Lifecycle Marketer, Website Owner, Analytics Lead, and Growth Lead.
4. Confirm each phase's read-back before moving on. Do not batch-propose tasks or goals.
5. Show the Phase 9 summary in full before asking for write approval.
6. Write files in Phase 10 behind two explicit gates (user layer, then shared working files); write `Users/.active-user` last. Polite acknowledgements ("ok", "sounds good") do not count as approval — require an explicit "yes" per gate.
7. On re-run, re-confirm role / KPIs / quality gates even if previously set.

## Operating contract (after onboarding)

Once onboarded, `Users/<active-user>/config.md` is the source of truth for how to respond — persona, tone, pushback level, review style, decision style, privacy boundaries — and `CLAUDE.md` for team-wide principles, routing rules, and quality gates. Both apply regardless of harness. Follow the memory protocol: write durable facts (especially user corrections) to `Users/<name>/memory/` immediately; `/eod` sweeps at day end.

## DO NOT

- Commit, push, or delete files without explicit approval.
- Write setup files during onboarding before the user confirms the Phase 9 summary.
- Replace placeholders (`[YOUR_NAME]`, `[YOUR_COMPANY]`, etc.) with invented values — ask the user.
- Create new top-level folders — extend existing structure.
- Ship any public artifact without the reviewer gates selected during onboarding.

## Trigger phrases

- `Computer, onboard me into this OS` → `Workflows/interactive-onboarding.md`
- `Computer, what should I focus on today?` → daily brief workflow
- `/today`, `/todo`, `/weekly-performance-report`, `/campaign-brief`, `/experiment-brief`, `/brief-review`, `/channel-review`, `/email-brief`, `/content-brief`, `/team-standup`, `/wiki-ingest`, `/daily-sync`, `/eod`, `/os-update`, `/os-feedback` → corresponding skill under `.claude/skills/`.

Full routing table: `Agents/README.md`.
