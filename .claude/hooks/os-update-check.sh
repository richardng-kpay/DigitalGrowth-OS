#!/bin/bash
# DigitalGrowth-OS — SessionStart hook. Report-only: never edits, merges, or pushes.
#
# Prints a short notice into the session when:
#   1. origin/main is ahead of this clone (a template update is available → /os-update)
#   2. the active user's memory index has drifted from the files on disk (→ self-heal)
#   3. the user layer has no recent off-repo backup (→ /eod refreshes it)
#   4. the clone is not onboarded but a user-layer backup exists (→ offer restore)
# Silent when everything is healthy or the network is unreachable. Always exits 0.

cd "$(dirname "$0")/../.." 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0

notes=()
BACKUP_ROOT="${DGOS_BACKUP_ROOT:-$HOME/.digitalgrowth-os-backup}"

# ---- 1. Upstream check -------------------------------------------------------
if git remote get-url origin >/dev/null 2>&1; then
  if GIT_TERMINAL_PROMPT=0 git -c http.lowSpeedLimit=1000 -c http.lowSpeedTime=5 \
       fetch --quiet origin main >/dev/null 2>&1; then
    behind=$(git rev-list --count HEAD..origin/main 2>/dev/null || echo 0)
    if [ "${behind:-0}" -gt 0 ]; then
      local_v=$(sed -n 's/.*OS-Version: \([0-9][0-9.]*\).*/\1/p' CLAUDE.md 2>/dev/null | head -1)
      remote_v=$(git show origin/main:CLAUDE.md 2>/dev/null | sed -n 's/.*OS-Version: \([0-9][0-9.]*\).*/\1/p' | head -1)
      notes+=("OS update available: $behind new commit(s) on origin/main (local ${local_v:-?} → upstream ${remote_v:-?}). Offer /os-update in one line, then continue with the user's request.")
    fi
  fi
fi

# ---- 2–4. User layer health -----------------------------------------------------
mtime() { stat -f %m "$1" 2>/dev/null || stat -c %Y "$1" 2>/dev/null || echo 0; }

if [ -s Users/.active-user ]; then
  u=$(head -1 Users/.active-user | tr -d '[:space:]')
  if [ -n "$u" ] && [ -d "Users/$u" ]; then
    idx="Users/$u/memory/MEMORY.md"
    if [ -f "$idx" ]; then
      unindexed=0; dangling=0
      for f in "Users/$u/memory/"*.md; do
        [ -e "$f" ] || continue
        b=$(basename "$f")
        case "$b" in MEMORY.md|claude-project-digest.md) continue ;; esac
        grep -qF "$b" "$idx" || unindexed=$((unindexed + 1))
      done
      while IFS= read -r link; do
        [ -n "$link" ] && [ ! -f "Users/$u/memory/$link" ] && dangling=$((dangling + 1))
      done < <(grep -oE '\]\([^)]+\.md\)' "$idx" 2>/dev/null | sed -E 's/^\]\((.*)\)$/\1/')
      if [ "$unindexed" -gt 0 ] || [ "$dangling" -gt 0 ]; then
        notes+=("Memory index drift for '$u': $unindexed memory file(s) not in MEMORY.md, $dangling index line(s) pointing at missing files. Repair per CLAUDE.md §self-heal before relying on memory.")
      fi
    else
      notes+=("Memory index missing: $idx. Recreate it from Users/_template/memory/MEMORY.md and re-index the files in that folder.")
    fi

    stamp="$BACKUP_ROOT/$u/.last-backup"
    if [ -f "$stamp" ]; then
      age=$(( ( $(date +%s) - $(mtime "$stamp") ) / 86400 ))
      [ "$age" -gt 7 ] && notes+=("User-layer backup for '$u' is $age days old (~/.digitalgrowth-os-backup). /eod refreshes it.")
    else
      notes+=("No off-repo backup of Users/$u yet. /eod creates one at ~/.digitalgrowth-os-backup/$u — suggest running it today.")
    fi
  else
    notes+=("Stale marker: Users/.active-user names '$u' but Users/$u/ does not exist. Treat as first-run (CLAUDE.md §On Session Start).")
  fi
elif [ ! -f Users/.active-user ]; then
  if ls "$BACKUP_ROOT"/*/config.md >/dev/null 2>&1; then
    names=$(ls -d "$BACKUP_ROOT"/*/ 2>/dev/null | xargs -n1 basename | tr '\n' ' ')
    notes+=("Not onboarded, but a user-layer backup exists for: ${names}— offer 'Restore my previous setup' before offering onboarding (CLAUDE.md §On Session Start).")
  fi
fi

if [ ${#notes[@]} -gt 0 ]; then
  echo "[DigitalGrowth-OS session check]"
  printf ' - %s\n' "${notes[@]}"
fi
exit 0
