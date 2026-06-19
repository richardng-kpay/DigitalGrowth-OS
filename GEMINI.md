# DigitalGrowth-OS — Gemini CLI Entry Point

This file is the entry point for **Gemini CLI**. The OS is harness-neutral — Claude Code reads `CLAUDE.md`, Codex CLI reads `AGENTS.md`, and Gemini CLI reads this file. All three route to the same configuration surface and the same workflows.

## Configuration surface

- **`CLAUDE.md`** — user identity, persona, tone, routing, cadence, privacy boundaries, quality gates. Filename is historical; the contents apply to every harness. Read this on session start and respect what's there.
- **`AGENTS.md`** — agent behavior contract (change management, review dimensions, output format). Read this too.
- **`GOALS.md`** — 30-60-90 outcomes and metrics.
- **`Tasks/active.md`** — current sprint focus.
- **`Workflows/`** — repeatable interactive workflows.
- **`Templates/`** — document templates.
- **`Knowledge/People/`** — stakeholder profiles.
- **`Projects/`** — per-project briefs and artifacts.

## Onboarding mode

**Trigger proactively** on first run — when placeholders (`[YOUR_NAME]`, `[YOUR_COMPANY]`, etc.) remain, greet the user and offer onboarding before substantive work; do not wait for a trigger phrase. `Computer, onboard me into this OS`, `set up this template`, or similar are shortcuts to the same flow.

1. Run `Workflows/interactive-onboarding.md` phase by phase. Use a structured question tool where available; validate inferred values with the user before recording them.
2. Ask the user — never invent — for their role on the growth team, channels they own, KPIs, cadence, current tasks, goals, stakeholders, and privacy boundaries.
3. Branch by role in Phase 1B — the interview is different for Performance Marketer, Content/SEO, Lifecycle Marketer, Website Owner, Analytics Lead, and Growth Lead.
4. Confirm each phase's read-back before moving on. Do not batch-propose tasks or goals.
5. Show the Phase 9 summary in full before asking for write approval.
6. Write files one at a time in Phase 10, asking explicitly per file. Polite acknowledgements ("ok", "sounds good") do not count as approval — require an explicit "yes" per file.
7. On re-run, re-confirm role / KPIs / quality gates even if previously set.

## Operating contract (after onboarding)

Once `CLAUDE.md` is filled, treat it as the source of truth for how to respond — persona, tone, pushback level, review style, decision style, privacy boundaries. The principles, routing rules, quality gates, and DO-NOT list there apply regardless of harness.

## DO NOT

- Commit, push, or delete files without explicit approval.
- Write setup files during onboarding before the user confirms the Phase 9 summary.
- Replace placeholders (`[YOUR_NAME]`, `[YOUR_COMPANY]`, etc.) with invented values — ask the user.
- Create new top-level folders — extend existing structure.
- Ship any public artifact without the reviewer gates selected during onboarding.

## Trigger phrases

- `Computer, onboard me into this OS` → `Workflows/interactive-onboarding.md`
- `Computer, what should I focus on today?` → daily brief workflow
- `/today`, `/todo`, `/weekly-performance-report`, `/campaign-brief`, `/experiment-brief`, `/brief-review`, `/channel-review`, `/email-brief`, `/content-brief`, `/team-standup`, `/wiki-ingest` → corresponding skill under `.claude/skills/`.

Full routing table: `Agents/README.md`.
