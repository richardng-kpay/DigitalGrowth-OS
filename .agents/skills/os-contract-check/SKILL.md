# /os-contract-check

Check that the OS surface is internally consistent: docs, skills, workflows,
templates, Knowledge folders, and eval suites all point to real files.

Run weekly before `/os-update`, before tagging a release, and after any large
architecture change.

## What this checks

1. Skill parity: `.claude/skills/` and `.agents/skills/` are **byte-identical**
   (`diff -rq .claude/skills .agents/skills`) — same command names AND same
   content; a fix applied to one tree but not the other is a finding.
2. Command inventory: commands listed in `README.md`, `ONBOARDING.md`,
   `GEMINI.md`, and `HOW-IT-WORKS.md` exist as skill folders, unless explicitly
   labeled as a workflow rather than a slash command.
3. Referenced folders: core folders named by agents and skills exist
   (`Knowledge/Segments/`, `Knowledge/Hypotheses/`, `Knowledge/Decisions/`,
   `Knowledge/Ingestion/`, `Projects/`, `Tasks/`).
4. Referenced templates: templates named by skills exist in `Templates/`.
5. Eval wiring: every suite in `Evals/` has a `README.md`, a protocol or clear
   run instructions, and a `results/` location when the suite claims one.
6. User-layer contract: `.gitignore` keeps `Users/*` ignored while allowing
   `Users/README.md` and `Users/_template/**`, and ignores the per-user
   knowledge logs (`Knowledge/index.md`, `Knowledge/log.md`,
   `Knowledge/Decisions/team-log.md`).
7. Protected-list parity: the user-owned file list in `CLAUDE.md` §two layers
   matches the canonical list in `.claude/skills/os-update/SKILL.md`.
8. Onboarding markers: docs consistently describe `Users/.active-user`
   (completion, written last) and `Users/.onboarding-skipped` (durable skip,
   deleted on completion) — flag any file still describing the retired
   `Onboarding-Complete` marker outside historical eval transcripts.
9. Generated residue: report `.DS_Store`, `*.riddler-passed`, and
   `*.vicki-passed` files.

## Steps

1. Inventory shipped skills:
   - `find .claude/skills -maxdepth 2 -name SKILL.md`
   - `find .agents/skills -maxdepth 2 -name SKILL.md`
2. Compare the two harness folders by content: `diff -rq .claude/skills .agents/skills`
   (any differing or one-sided file is a P1 finding).
3. Search active docs for slash commands:
   - Include `README.md`, `ONBOARDING.md`, `HOW-IT-WORKS.md`, `AGENTS.md`,
     `CLAUDE.md`, `GEMINI.md`, `Workflows/`, `Knowledge/`, and `Agents/`.
   - Exclude historical eval transcripts and sample pass/fail files unless the
     user explicitly asks for a legacy scan.
4. For every command found, classify it:
   - **Shipped skill**: folder exists under both skill trees.
   - **Workflow-only**: docs clearly point to a `Workflows/.../workflow-spec.md`
     file instead of a slash command.
   - **Broken reference**: no skill and no workflow target.
5. Check Knowledge folders and template references.
6. Run lightweight hygiene:
   - `git diff --check`
   - merge-marker scan for `<<<<<<<`, `=======`, `>>>>>>>`
   - `.mcp.json` JSON validation when present
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
- Skill parity: ...
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
