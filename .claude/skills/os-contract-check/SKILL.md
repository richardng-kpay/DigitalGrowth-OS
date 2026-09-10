# /os-contract-check

Check that the OS surface is internally consistent: docs, skills, workflows,
templates, Knowledge folders, and eval suites all point to real files.

Run weekly before `/os-update`, before tagging a release, and after any large
architecture change.

## What this checks

1. Skill inventory: every `.claude/skills/<name>/SKILL.md` is listed in the
   `README.md` command tables, and every command listed there has a skill folder.
   The OS is Claude-only since 1.2.0 — `AGENTS.md`, `GEMINI.md`, or an `.agents/`
   tree reappearing is a P1 finding (stale multi-harness surface).
2. Command inventory: commands listed in `README.md`, `ONBOARDING.md`,
   `HOW-IT-WORKS.md`, and `CLAUDE.md` exist as skill folders, unless explicitly
   labeled as a workflow rather than a slash command.
3. Referenced folders: core folders named by agents and skills exist
   (`Knowledge/Segments/`, `Knowledge/Hypotheses/`, `Knowledge/Decisions/`,
   `Knowledge/Ingestion/`, `Projects/`, `Tasks/`).
4. Referenced templates: templates named by skills exist in `Templates/`.
5. Eval wiring: every suite in `Evals/` has a `README.md`, a protocol or clear
   run instructions, and a `results/` location when the suite claims one.
6. User-layer contract: `.gitignore` keeps `Users/*` ignored while allowing
   `Users/README.md` and `Users/_template/**`, and ignores the per-user
   knowledge spines (`Knowledge/index.md`, `Knowledge/overview.md`, `Knowledge/log.md`,
   `Knowledge/Decisions/team-log.md`), `.obsidian/`, and
   `.claude/settings.local.json`. `git ls-files Users` must return only the
   README and `_template/**`.
7. Protected-list parity: the user-owned file list in `CLAUDE.md` §two layers
   matches the canonical list in `.claude/skills/os-update/SKILL.md`.
8. Onboarding markers: docs consistently describe `Users/.active-user`
   (completion, written last) and `Users/.onboarding-skipped` (durable skip,
   deleted on completion) — flag any file still describing the retired
   `Onboarding-Complete` marker outside historical eval transcripts.
9. Generated residue: report `.DS_Store`, `*.riddler-passed`, and
   `*.vicki-passed` files.
10. Sync surface: `.claude/settings.json` is valid JSON and its `SessionStart`
    hook points at `.claude/hooks/os-update-check.sh`; that script exists, is
    executable, and passes `bash -n`. `/os-publish` and `/os-update` both exist.
11. Version parity: the `OS-Version` marker in `CLAUDE.md` equals the version of
    the top `CHANGELOG.md` entry, and `README.md`'s skill count equals the number
    of skill folders.
12. Plugin channel: `.claude-plugin/marketplace.json` is valid JSON,
    `claude plugin validate .` passes (the "no version specified" warning is
    intentional), and `./scripts/build-plugin.sh --check` reports the generated
    `plugins/growth-toolkit/` tree is current. A stale tree is a P1 finding — it
    means plugin users are running older skills than clone users. Every skill in
    the build script's `SKILLS` array must carry a `## Running outside the full OS`
    block, and no shipped skill may be one of the clone-only ones (`today`, `todo`,
    `eod`, `daily-sync`, `team-standup`, `wiki-*`, `os-*`).

## Steps

1. Inventory shipped skills: `find .claude/skills -maxdepth 2 -name SKILL.md`.
2. Confirm no multi-harness residue: `ls AGENTS.md GEMINI.md .agents 2>/dev/null`
   must return nothing.
3. Search active docs for slash commands:
   - Include `README.md`, `ONBOARDING.md`, `HOW-IT-WORKS.md`, `CLAUDE.md`,
     `Workflows/`, `Knowledge/`, and `Agents/`.
   - Exclude historical eval transcripts and sample pass/fail files unless the
     user explicitly asks for a legacy scan.
4. For every command found, classify it:
   - **Shipped skill**: folder exists under `.claude/skills/`.
   - **Workflow-only**: docs clearly point to a `Workflows/.../workflow-spec.md`
     file instead of a slash command.
   - **Broken reference**: no skill and no workflow target.
5. Check Knowledge folders and template references.
6. Run lightweight hygiene:
   - `git diff --check`
   - merge-marker scan for `<<<<<<<`, `=======`, `>>>>>>>`
   - `.mcp.json` and `.claude/settings.json` JSON validation
   - `bash -n .claude/hooks/os-update-check.sh` and `test -x` on the same file
   - version parity: `grep OS-Version CLAUDE.md` vs the first `## x.y.z` heading in `CHANGELOG.md`
   - plugin channel: `claude plugin validate .` and `./scripts/build-plugin.sh --check`
7. Output findings by priority and name the file that should change.

## Output format

```markdown
## OS contract check

**Verdict:** Pass / Needs fixes

### P0
- [Issue] — [evidence file]

### P1
- [Issue] — [evidence file]

### P2
- [Issue] — [evidence file]

### Clean checks
- Skill inventory vs README: ...
- Sync surface (hook, settings, version parity): ...
- User layer ignore contract: ...
- Whitespace / merge markers: ...

### Recommended fixes
1. [Smallest fix]
2. [Next fix]
```

## Rules

- This skill is read-only unless the user explicitly says to fix the findings.
- Do not scan `Evals/**/results/transcripts/` by default; those are historical
  evidence, not current product promises.
- Prefer changing a broken reference to an existing workflow over adding a new
  skill, unless the repeated behavior is used weekly or is already in the main
  README command table.
