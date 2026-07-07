# Changelog — Digital Growth OS

All template-layer changes ship through this file, newest first. `/os-update` reads the top
entry to greet users with what's new. Version format: `MAJOR.MINOR.PATCH` — MAJOR for breaking
layout changes (re-onboarding or migration needed), MINOR for new skills/workflows, PATCH for
fixes and copy.

---

## 1.1.0 — 2026-07-06

**The enterprise release: user layer, persistent memory, weekly updates, feedback loop.**

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
  per-user OAuth, knowledge provenance layers, quality-gate skills, team files
  (`TEAM.md`, `TEAM-GOALS.md`), eval suites for onboarding and research synthesis.
