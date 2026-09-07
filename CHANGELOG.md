# Changelog — Digital Growth OS

All template-layer changes ship through this file, newest first. `/os-update` reads the top
entry to greet users with what's new. Version format: `MAJOR.MINOR.PATCH` — MAJOR for breaking
layout changes (re-onboarding or migration needed), MINOR for new skills/workflows, PATCH for
fixes and copy.

---

## 1.2.0 — 2026-09-07

**Claude-only, self-updating, self-healing — and a 4-minute Quick onboarding path.**

- **Quick vs Full setup.** Onboarding Phase 0 now asks upfront: Quick setup (~3–4 min — role,
  top KPI, tone, one priority; everything else deferred) or Full interview. Quick lands a working
  config in about 8 question rounds and queues one `Tasks/follow-ups.md` row — say
  `finish my setup` anytime to pick up cadence, thought frameworks, goals, stakeholders, and
  privacy. Skipped phases are skipped outright, never asked-then-discarded.
- **Full path is shorter too.** Dropped the unused "first 3 commands" question; thought
  frameworks are opt-in; task read-back is one combined confirmation; OKR ladder-up and kill
  condition are asked only for Growth Lead / manager-facing roles; per-stakeholder interview is
  one question each, capped at the top 3; the privacy scan is a single batch.

- **Claude only.** `AGENTS.md` (Codex CLI), `GEMINI.md` (Gemini CLI), and the mirrored
  `.agents/skills/` tree are gone. One skill tree, one entry point (`CLAUDE.md`), one contract.
  `/os-contract-check` now flags any multi-harness residue instead of enforcing tree parity.
- **You're told when an update exists.** A tracked session-start hook
  (`.claude/settings.json` → `.claude/hooks/os-update-check.sh`) compares your copy with the
  team repo once per session and says **OS update available** when you're behind. Report-only,
  silent offline. `/os-update` now names every skill, agent, workflow, and template that arrived.
- **New `/os-publish`** (OS owner only) — the single sanctioned push path: contract check,
  secret + personal-data scan, change-acceptance criteria (moved here from the retired
  `AGENTS.md`), version bump, changelog entry, then commit + push behind an explicit gate.
- **Memory survives a re-clone.** `/eod` mirrors `Users/<you>/` to
  `~/.digitalgrowth-os-backup/<you>/` (off-repo). A fresh clone that finds that backup offers
  **Restore my previous setup** before onboarding. The hook warns when the backup is >7 days old.
- **Self-heal on load.** The hook reports memory-index drift (unindexed files, dangling index
  lines), a missing index, or a stale `.active-user`; `/daily-sync` repairs them and recreates
  any missing scaffold or per-user knowledge-log files, with a size guard on the memory index.
- Fixes: `.obsidian/` editor state and `.claude/settings.local.json` are no longer tracked
  (opening the vault in Obsidian used to dirty template files and trip the update warning);
  `/os-contract-check` gains sync-surface and version-parity checks; trailing-whitespace line
  breaks in `Templates/hypothesis.md` and `Templates/segment-profile.md` replaced with `<br>`;
  `README.md`'s Lark section now matches the real pause-or-skip behaviour.
- **Migration:** none for users. Start one fresh session after `/os-update` so the hook and
  `/os-publish` register.

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
