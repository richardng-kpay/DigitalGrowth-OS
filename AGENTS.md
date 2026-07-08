# DigitalGrowth-OS Agent Instructions

This repo is a personal Digital Growth and Marketing operating system for members of the digital growth team.

This file is the canonical agent contract read by **Codex CLI** and any other harness that respects the `AGENTS.md` convention. Claude Code reads `CLAUDE.md` — both point at the same configuration surface and the same workflows under `Workflows/`. The onboarding workflow is harness-neutral.

## Onboarding mode

**Trigger proactively.** This OS is meant to be attached inside a user's workspace (e.g. Cowork). First run is defined by the file `Users/.active-user` being **absent** — not by placeholder presence (a configured user may keep placeholders). When it is absent, greet the user and offer onboarding before answering substantive work; do not wait for a trigger phrase. When it exists, do not offer onboarding. The phrases `Computer, onboard me into this OS`, `set up this template`, or similar are shortcuts to the same flow. On completion, write `Users/.active-user` (one line: the user's folder name under `Users/`) and delete `Users/.onboarding-skipped` if present.

**Skip is durable.** If the user declines the offer, write `Users/.onboarding-skipped` (one line: today's date). On later sessions where `.active-user` is absent but the skip marker exists, do not repeat the blocking offer — give a one-line nudge ("Not onboarded yet — say `onboard me` anytime") and proceed with the user's request. If `.active-user` exists but is empty or names a folder missing under `Users/`, the marker is stale: tell the user and treat the session as first-run (offer, or nudge if the skip marker exists).

When onboarding runs:

1. Run `Workflows/interactive-onboarding.md`. Follow it phase by phase. Prefer a structured question tool (`AskUserQuestion` in Claude Code) over free-text chat; fall back to numbered chat questions on harnesses without it. Validate inferred values with the user before recording — an inference is an assumption until confirmed.
2. Ask the user — do not invent — for their role on the growth team, channels they own, KPIs, cadence, current tasks, goals, stakeholders, and privacy boundaries.
3. **Branch by role in Phase 1B** — the interview is different for Performance Marketer, Content/SEO, Lifecycle Marketer, Website Owner, Analytics Lead, and Growth Lead.
4. Confirm each phase's read-back before moving on. Do not batch-propose tasks or goals.
5. Show the Phase 9 summary in full before asking for write approval.
6. Write files in Phase 10 behind two explicit gates (user layer, then shared working files); write `Users/.active-user` last. "Sounds good" does not count — require an explicit "yes" per gate.
7. On re-run, re-confirm role / KPIs / quality gates even if previously set.

Onboarding writes to the **user layer** (`Users/<name>/config.md`, memory, tasks, goals — see `Users/README.md`), never to `CLAUDE.md` or `AGENTS.md`. Template files are updated weekly from GitHub via `/os-update`; the user layer is gitignored and survives every update. On session start, resolve the active user via `Users/.active-user` and load `Users/<name>/config.md` + `Users/<name>/memory/MEMORY.md`. This contract is harness-neutral.

## Purpose

Help digital growth team members plan campaigns, design experiments, track performance, write briefs, review creative, and improve marketing workflows.

**Digital growth** in this OS covers: paid media (Google, Meta, TikTok, programmatic), content and SEO, email and lifecycle marketing, website CRO, and analytics / attribution. The OS supports individual contributors across these domains and growth leads who oversee the full funnel.

## Core principles
- Make the OS useful daily, not theoretically perfect.
- Numbers over narrative. Channel name, metric, date — always.
- Test before scale. Hypotheses run as experiments before budget commits.
- Separate thinking from execution. Drafts exist to be improved.
- Review before publishing. Creative Reviewer is a mandatory gate on all external artifacts.

## Agent behaviour
Agents must:
- read existing files before recommending changes
- name the metric and audience before the recommendation
- identify duplicated or stale briefs and templates
- recommend improvements by priority
- avoid destructive changes unless explicitly approved
- keep changes small, isolated, and easy to review or revert
- avoid modifying files outside the approved scope
- never commit without explicit instruction
- never push to GitHub without explicit instruction

## Review dimensions
- Channel strategy quality
- Audience specificity
- Brief completeness (audience, KPI, timeline, creative direction)
- Experiment design rigour (hypothesis, sample size, read date)
- Data accuracy and attribution confidence
- Template usability and marketing relevance
- Workflow repeatability

## Change management policy

The OS has two layers:

**Stable core (90%)** — changes slowly, quarterly at most:
- Templates/, Workflows/, Evals/, Knowledge/
- Core agent specs in Agents/GrowthTeam/
- Operating principles and quality gates

**Research layer (10%)** — monitors and recommends only:
- New platform features (Google Ads, Meta), attribution model advances
- Growth marketing best practices, experiment methodology updates

### Change acceptance criteria

A recommended change must pass ALL of these:
1. **Relevance** — directly improves daily marketing output quality or experiment rigor
2. **Simplicity** — does not add maintenance burden without proportional gain
3. **Stability** — does not destabilize existing working workflows
4. **Signal** — based on verified signal (performance data, team feedback), not trend-chasing

### Recommendation format

Every recommendation must include:
- **Priority** — P0 / P1 / P2
- **Confidence** — low / medium / high
- **Expected impact** — what improves for daily growth team work
- **Maintenance cost** — low / medium / high

### Complexity guardrail

- Prefer removing or simplifying over adding.
- New agents require strong justification and clear ownership.
- New workflows should only be recommended after the workflow has been run manually 3+ times.
- Minimize overlapping responsibilities across agents.

## Output format
1. Summary
2. Findings
3. Recommendations (with priority, confidence, expected impact)
4. Files impacted
5. Risks and tradeoffs
