# /os-update — weekly template update from GitHub

Pulls the latest OS template from the team GitHub repo, shows what changed, and protects the
user's personal files. Recommend running weekly (e.g., Monday before `/daily-sync`).

## What this does

1. Fetches the latest template from `origin/main`
2. Shows the CHANGELOG delta since the user's current version
3. Merges, keeping the LOCAL version of all user-owned files on any conflict
4. Updates `Last seen OS version` in the user's `config.md`

## User-owned files (local always wins) — canonical list

`GOALS.md` · `Tasks/active.md` · `Tasks/backlog.md` · `Tasks/follow-ups.md` ·
`Tasks/dayjob-active.md` · `Tasks/team-board.md` · `Knowledge/People/**` · `Projects/**` ·
`Knowledge/Reference/company.md` · `Knowledge/Reference/ground-truth.md` ·
`Knowledge/Reference/lark-wiki-index.md` · `Knowledge/Reference/lark-wiki-*.md`

This list is the single source of truth — CLAUDE.md §two layers points here.
(`Users/` is gitignored and can never conflict. `Knowledge/index.md`, `Knowledge/log.md`,
and `Knowledge/Decisions/team-log.md` are gitignored per-user logs since 1.1.1 — they can
never conflict either.)

## Steps

1. Preflight: `git status --porcelain`. Note which modified files are user-owned vs template.
   If the user has modified **template** files, warn: local template edits are unsupported and
   will conflict — ask whether to keep theirs (stash) or take upstream before continuing.
2. `git fetch origin main`. If it fails (no network / no remote), report and stop — never guess.
2b. **Untracked-collision check.** Compare untracked local paths against incoming upstream
   paths (`git diff --name-only HEAD..origin/main`). A collision (e.g., the user created a
   personal skill and upstream now ships one with the same name) would abort the merge with
   "untracked working tree files would be overwritten." For each collision: move the local
   file to `Users/<active-user>/backups/<original-path>` (create dirs as needed), tell the
   user what was backed up, and after the merge show a diff between their version and the
   shipped one so they can port their customizations to a new, uniquely-named copy.
3. If `HEAD..origin/main` is empty: "You're on the latest version (X.Y.Z)." Stop.
4. Show the delta BEFORE merging:
   - `git log HEAD..origin/main --oneline`
   - New `CHANGELOG.md` entries between the user's version and upstream's top version
5. Merge with protection:
   a. `git stash push -u -- <modified user-owned files>` (only if any are dirty)
   b. `git merge origin/main --no-edit`
      - On conflict in a user-owned file: `git checkout --ours <file> && git add <file>`
      - On conflict in a template file: take upstream (`git checkout --theirs <file> && git add <file>`)
        and tell the user their local template edit was replaced
      - Then `git commit --no-edit` to complete the merge
   c. `git stash pop` — if a pop conflict occurs, keep the user's stashed version of user-owned
      files (their working state wins over both)
6. Post-update: read the new `OS-Version` from `CLAUDE.md` and the top `CHANGELOG.md` entry.
   Summarize what's new in 2–4 bullets, in the user's language (skills they can use, not commit
   hashes). Flag any entry marked **Migration** and offer to run it now.
7. Update `Users/<active-user>/config.md → Last seen OS version` to the new version.

## Hard rules

- **Never** `git push`, `git reset --hard`, or delete files. This skill only pulls. (Moving an
  untracked collision to `Users/<name>/backups/` is a move, not a delete — nothing is lost.)
- **Personal extensions are safe by construction:** net-new, uniquely-named skills, workflows,
  and templates the user created don't exist upstream, so the merge never touches them.
- Never resolve a user-owned conflict in upstream's favor — the user's data always survives.
- If the merge gets into a state you can't resolve cleanly, `git merge --abort`, restore the
  stash, report exactly what happened, and stop. A failed update must leave the OS as it was.

## Scheduling

If the user wants this automatic, suggest a weekly scheduled task (Cowork scheduled tasks or a
`/loop`-style reminder) that runs `/os-update` Monday morning. Do not set it up unasked.
