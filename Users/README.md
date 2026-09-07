# Users/ — the user layer

This directory holds everything personal to each person who attaches this OS to their Claude
Cowork (or opens it in a supported CLI): identity, operating style, persistent memory, and
feedback history.

**If you're a team member, you don't need to read past this paragraph.** Onboarding creates
your folder here automatically, the assistant maintains it for you, and `/eod` mirrors it to
`~/.digitalgrowth-os-backup/<your-name>/` outside this folder — so if the OS folder is ever
deleted or set up again from scratch, the first session offers **Restore my previous setup**
and brings your memory back. Run `/eod` at least weekly to keep that copy fresh (the session
start check reminds you when it is older than 7 days). Everything below is reference for the
curious and for the OS owner.

**Why this layer exists.** The rest of the OS (rules, skills, templates) receives improvements
from the OS owner once a week via `/os-update`. Anything personal that lived in those shared
files would be overwritten. So the rule is simple:

> **Shared template files are never personalized. Personal files are never touched by updates.**

## Structure

```
Users/
  .active-user              ← one line: the folder name of the person using this copy.
                              Written by onboarding. Its ABSENCE is the first-run signal.
  .onboarding-skipped       ← one line: date the user picked "Skip for now". Downgrades the
                              first-run offer to a one-line nudge. Deleted when onboarding completes.
  README.md                 ← this file (shared, part of the template)
  _template/                ← blank per-user scaffold, copied at onboarding (shared)
  <your-name>/              ← your personal layer (yours alone — never committed to git)
    config.md               ← identity, role, operating style, thought frameworks, boundaries
    memory/
      MEMORY.md             ← memory index, loaded every session
      *.md                  ← one durable fact per file
      claude-project-digest.md  ← compact export for your claude.ai Project knowledge
    feedback-log.md         ← your /os-feedback entries (local copy)
    usage-log.md            ← one line per day: which skills you used (written by /eod)
```

## Rules

1. **Private by design.** `Users/*` (except this README and `_template/`) is excluded from git,
   so your memory, identity, and feedback stay on your machine and never reach the team repo.
2. **One real user per copy.** Each team member attaches their own copy of the OS to their own
   Cowork. `Users/.active-user` names the single active user directory.
3. **Backed up automatically, off-repo.** `/eod` (and `/daily-sync` when the copy is >7 days
   old) mirrors this folder to `~/.digitalgrowth-os-backup/<your-name>/`. Re-creating the OS
   folder from GitHub does not restore it — the first session detects the backup and offers a
   restore. Moving to a new machine? Copy that backup folder across first.
4. **Memory format.** One fact per file with a `name`, `description`, and `type`
   (user / feedback / project / reference) header, indexed by one line in `MEMORY.md`.
   See `_template/memory/MEMORY.md` for the canonical format.

## What happens automatically (you run nothing by hand)

- **When you open a session:** the assistant reads `.active-user`, then loads your `config.md`
  and memory index — so it already knows your role, style, and history before your first message.
- **While you work:** any correction you make, decision you take, or durable preference you
  state gets written to memory immediately. Corrections matter most — they stop the same wrong
  answer from ever coming back.
- **`/eod` (end of day):** sweeps the day's conversation for durable facts, updates memory,
  refreshes `claude-project-digest.md`, logs which skills you used, and refreshes the off-repo backup.
- **`/daily-sync` (morning):** consolidates yesterday's memory, prunes duplicates, repairs index
  drift and missing scaffold files, refreshes the digest, then hands off to `/today`.
- **Every session start:** a small check compares your copy with the team repo and your memory
  index with its files. It only speaks up when there is an update to pull or something to repair.
