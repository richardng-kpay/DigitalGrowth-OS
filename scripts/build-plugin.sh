#!/usr/bin/env bash
# Regenerate plugins/growth-toolkit/ from the canonical OS sources.
#
# WHY THIS EXISTS
# The plugin needs its own root with lowercase `agents/` and `skills/` directories — the
# `agents` path override in plugin.json is parsed but does not load agents, and a lowercase
# `agents/` cannot sit beside the repo's `Agents/` on a case-insensitive filesystem. A plugin
# rooted at the repo would also ship the team's `.mcp.json` (Lark + fathippo) to every installer.
# So the plugin tree is GENERATED, never hand-edited.
#
# EDIT THE SOURCES, NOT THE OUTPUT:
#   .claude/skills/<name>/   Agents/GrowthTeam/<role>.md   Templates/   Evals/
#
# Usage:
#   scripts/build-plugin.sh          rebuild the plugin tree
#   scripts/build-plugin.sh --check  exit 1 if the tree is stale (used by /os-publish)

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/plugins/growth-toolkit"

# Portable skills only. Anything reading Tasks/, Users/, or the per-user Knowledge spines stays
# out — see the "Running outside the full OS" block each shipped skill carries.
SKILLS=(
  campaign-brief
  content-brief
  email-brief
  experiment-brief
  channel-review
  weekly-performance-report
  brief-review
  synthesize-research
  evals
  eval-review
)

AGENTS=(
  growth-lead
  performance-marketer
  content-strategist
  lifecycle-marketer
  website-owner
  data-analyst
  creative-reviewer
)

build() {
  local dest="$1"

  rm -rf "$dest"
  mkdir -p "$dest/agents" "$dest/skills" "$dest/Evals"

  for s in "${SKILLS[@]}"; do
    [ -f "$ROOT/.claude/skills/$s/SKILL.md" ] || { echo "missing skill: $s" >&2; exit 1; }
    cp -R "$ROOT/.claude/skills/$s" "$dest/skills/"
  done

  for a in "${AGENTS[@]}"; do
    [ -f "$ROOT/Agents/GrowthTeam/$a.md" ] || { echo "missing agent: $a" >&2; exit 1; }
    cp "$ROOT/Agents/GrowthTeam/$a.md" "$dest/agents/"
  done

  # Skills resolve these through ${CLAUDE_PLUGIN_ROOT} when running as a plugin.
  cp -R "$ROOT/Templates" "$dest/Templates"
  cp "$ROOT/Evals/eval-audit-checklist.md" "$dest/Evals/"
  cp -R "$ROOT/Evals/research-synthesis" "$dest/Evals/"
  # Evals/onboarding is deliberately excluded — it tests OS onboarding, which plugin users
  # never run, and it is 570K of transcripts.

  mkdir -p "$dest/.claude-plugin"
  cp "$ROOT/scripts/plugin-manifest.json" "$dest/.claude-plugin/plugin.json"
  cp "$ROOT/scripts/plugin-readme.md" "$dest/README.md"

  find "$dest" -name '.DS_Store' -delete
}

if [ "${1:-}" = "--check" ]; then
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  build "$TMP/growth-toolkit"
  if diff -r -q "$TMP/growth-toolkit" "$OUT" >/dev/null 2>&1; then
    echo "plugins/growth-toolkit is up to date"
  else
    echo "STALE: plugins/growth-toolkit does not match its sources." >&2
    diff -r -q "$TMP/growth-toolkit" "$OUT" >&2 || true
    echo "Run scripts/build-plugin.sh and commit the result." >&2
    exit 1
  fi
else
  build "$OUT"
  echo "Rebuilt $OUT"
  echo "  skills: ${#SKILLS[@]}   agents: ${#AGENTS[@]}"
fi
