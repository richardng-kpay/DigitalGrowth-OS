# /os-publish — ship a template release to the team (OS owner only)

The owner-side counterpart of `/os-update`. Turns local template changes — new or edited
skills, agents, workflows, templates, rules — into a versioned release on `origin/main`, so
every team member's next session sees "OS update available" and `/os-update` pulls it.

**Who runs this:** only the OS owner (or a delegate with push rights). Team members never
push — `/os-update` only pulls. If `git push` is rejected for permissions, stop and say so.

## What this does

1. Preflight: nothing personal or secret is about to ship
2. Runs `/os-contract-check` — P0/P1 findings block the release
3. Applies the change-acceptance criteria to what is being shipped
4. Bumps `OS-Version` in `CLAUDE.md`, writes the `CHANGELOG.md` entry, refreshes counts in `README.md`
5. Commits and pushes (direct to `main`, or branch + PR) — behind one explicit "yes, publish" gate

## Steps

1. **Preflight (hard stops).** Run `git status --porcelain` and `git diff --stat HEAD`, then check:
   - `git ls-files Users` returns only `Users/README.md` and `Users/_template/**`. Anything else
     means a personal folder got force-added — stop.
   - No staged or modified path under `Users/<name>/`, `Knowledge/log.md`, `Knowledge/index.md`,
     `Knowledge/overview.md`, `Knowledge/Decisions/team-log.md`, `.claude/settings.local.json`,
     `.obsidian/`. (`Knowledge/_seeds/**` IS template and should ship — do not confuse the tracked
     seed with the gitignored live file it seeds.)
     (All are gitignored; a hit means someone bypassed the ignore.)
   - **Secret scan** on the diff: `git diff HEAD | grep -nE '(APP_SECRET|SECRET|TOKEN|PASSWORD)\s*[:=]\s*"?[A-Za-z0-9_\-]{12,}|ghp_[A-Za-z0-9]{20,}|xox[abp]-|sk-[A-Za-z0-9]{20,}'`.
     The Lark App ID (`cli_…`) is allowed; the App Secret is never. Any hit → stop.
   - **User-owned working files** (`GOALS.md`, `Tasks/*.md`, `Knowledge/People/**`, `Projects/**`,
     `Knowledge/Reference/company.md`, `ground-truth.md`, `lark-wiki-*.md`) are frozen upstream.
     If any are modified, ask: is this an intentional *template* change to the blank scaffold, or
     the owner's own personalised copy? Personal → unstage and exclude. Look for real names,
     budgets, or customer data before accepting a template change here.
2. **Contract check.** Run `/os-contract-check`. Any P0 or P1 → fix first, then re-run. Do not
   publish over a failing contract.
3. **Change acceptance.** For each change in the release, confirm it passes all four:
   **Relevance** (improves daily growth output or experiment rigour) · **Simplicity** (no
   maintenance burden without proportional gain) · **Stability** (does not destabilise a working
   workflow) · **Signal** (backed by team feedback, usage-log patterns, or a reproduced bug — not
   trend-chasing). Complexity guardrails: prefer removing over adding; a new agent needs clear
   ownership; a new shipped workflow should have been run manually 3+ times first. List anything
   that fails and ask the owner to drop it or justify it.
4. **Version.** Read the current `OS-Version` from `CLAUDE.md` and the top `CHANGELOG.md` entry.
   Propose the bump: **MAJOR** for layout changes needing re-onboarding or a migration ·
   **MINOR** for a new skill, agent, workflow, or template · **PATCH** for fixes and copy.
   Confirm with the owner.
5. **Release notes.** Write the new `CHANGELOG.md` entry at the top, in the user's language
   (what they can now do, not commit hashes). Name every new or changed skill (`/name`) and agent
   by name; mark anything requiring user action as **Migration**. Update `OS-Version` in
   `CLAUDE.md` and the skill/template counts in `README.md` if they changed. Stage the release.
6. **Gate.** Show `git diff --cached --stat`, the changelog entry, and the target
   (`origin/main` direct, or branch → PR). Ask for an explicit **"yes, publish"**. A polite
   acknowledgement does not count.
7. **Commit and push.**
   - Commit message: `OS vX.Y.Z: <one-line headline>`.
   - On `main`: `git push origin main`. On any other branch: `git push -u origin <branch>` then
     `gh pr create --base main --fill`; the owner merges the PR in GitHub.
   - Rejected as non-fast-forward → `git fetch origin main`, merge `origin/main` in, re-run step 2,
     then retry once. **Never force-push. Never `git push --delete`.**
8. **Verify and report.** Confirm `git rev-parse origin/main` matches the release commit (direct
   mode) or link the PR. Report: version, what shipped, and the sentence "team members see
   *OS update available* at their next session start and pull it with `/os-update`; new skills
   load in their following session."

## Hard rules

- Never publish anything from `Users/<name>/` — personal layers are not template.
- Never publish a release that fails `/os-contract-check` or the secret scan.
- One release per `/os-publish` run; do not batch unrelated work into a MINOR bump without saying so.
- This skill writes only `CHANGELOG.md`, `CLAUDE.md` (version line), and `README.md` (counts);
  every other change must already exist in the working tree.
