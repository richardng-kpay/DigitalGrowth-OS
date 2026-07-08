# Changelog — Digital Growth OS

All template-layer changes ship through this file, newest first. `/os-update` reads the top
entry to greet users with what's new. Version format: `MAJOR.MINOR.PATCH` — MAJOR for breaking
layout changes (re-onboarding or migration needed), MINOR for new skills/workflows, PATCH for
fixes and copy.

---

## 1.1.1 — 2026-07-07

**Fail-loop and onboarding hardening + the learn→optimize loop.**

- **Durable skip.** Declining the first-run onboarding offer now writes
  `Users/.onboarding-skipped` — later sessions show a one-line nudge instead of re-offering
  every session. Completing onboarding clears the marker.
- **Stale-marker guard.** A `Users/.active-user` that is empty or names a missing folder is
  treated as first-run instead of silently dead-ending; an aborted run's partial
  `Users/<name>/` folder is merged into, never re-copied over.
- **Your knowledge survives updates.** `Knowledge/index.md`, `Knowledge/log.md`, and
  `Knowledge/Decisions/team-log.md` are now per-user (gitignored, created on first use) —
  `/os-update` can no longer clobber accumulated rows. The user-owned protected list is
  unified, with `.claude/skills/os-update/SKILL.md` as the single source of truth.
- **Personal extensions.** Net-new, uniquely-named skills/workflows/templates/tags are
  user-owned and survive updates. `/os-update` now detects untracked-file collisions with
  incoming template paths and backs your copy up to `Users/<you>/backups/` instead of aborting.
- **Learn → optimize.** `/eod` and `/daily-sync` now propose an optimization (personal skill,
  workflow tweak, tag, or routing rule) when memory + usage show a pattern recurring ≥3 times.
  Propose-then-confirm, never auto-write. `/daily-sync` also reconciles the memory index, and
  the digest carries a `Last refreshed:` date.
- **Scaffold completed.** `Users/_template/` now ships `feedback-log.md` and `usage-log.md`;
  `config.md` gains a dedicated Lark block (domain, space, root node) that the search
  protocol's source links are built from — no more literal `[YOUR_LARK_DOMAIN]` placeholders.
- Fixes: dead `/experiment-prioritisation` reference, overbroad "never commit `Users/`" rule,
  `/os-contract-check` now compares the two skill trees by content, stale pre-1.1.0 worktree
  removed.

## 1.1.0 — 2026-07-06

**The enterprise release: user layer, persistent memory, weekly updates, feedback loop.**

- **Contract hardening:** added `/os-contract-check`, `/wiki-maintain`,
  `/synthesize-research`, `/evals`, and `/eval-review`, plus missing Knowledge
  scaffolds for segments and hypotheses.
- **New `Users/` layer.** All personal config now lives in `Users/<name>/` (gitignored):
  `config.md`, `memory/`, `feedback-log.md`, `usage-log.md`. `CLAUDE.md` is template-only and
  never personalized. First-run signal moved from the `Onboarding-Complete` marker to the
  presence of `Users/.active-user`.
- **Persistent memory protocol.** Per-user memory survives 3P gateway accounts: one fact per
  file, `MEMORY.md` index loaded each session, corrections written immediately.
- **New skills:** `/eod` (end-of-day memory sweep + usage log), `/daily-sync` (morning memory
  consolidation + digest refresh), `/os-update` (weekly template pull with user-file
  protection), `/os-feedback` (rating + comments → local log + shared Lark base).
- **`claude-project-digest.md`** — compact per-user snapshot to manually upload into claude.ai
  Project knowledge, so non-Cowork chats stay personalized.
- **Onboarding rewired** to write only to the user layer and user-owned files.
- **Migration from 1.0.x:** run onboarding's re-run flow — it moves your identity/style out of
  `CLAUDE.md` into `Users/<you>/config.md` and writes `Users/.active-user`. Your `GOALS.md`,
  `Tasks/`, `Knowledge/People/`, and `Projects/` files are untouched.

## 1.0.0 — 2026-06 (baseline)

- Role-adaptive onboarding (6 growth roles), growth agent roster, Lark wiki integration with
  per-user OAuth, knowledge provenance layers, the /brief-review quality gate, team files
  (`TEAM.md`, `TEAM-GOALS.md`), eval suites for onboarding and research synthesis.
