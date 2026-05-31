# Growth Team Agent System

The agent roster lives in `Agents/GrowthTeam/`. See `Agents/GrowthTeam/README.md` for the full routing table, model tiers, and architecture.

## Quick-map

| Role | Agent file |
|---|---|
| Growth Lead | `GrowthTeam/growth-lead.md` |
| Performance Marketing Manager | `GrowthTeam/performance-marketer.md` |
| Content & SEO Strategist | `GrowthTeam/content-strategist.md` |
| Lifecycle Marketing Manager | `GrowthTeam/lifecycle-marketer.md` |
| Website Product Owner | `GrowthTeam/website-owner.md` |
| Analytics & Data Lead | `GrowthTeam/data-analyst.md` |
| Creative Reviewer (pre-publish gate) | `GrowthTeam/creative-reviewer.md` |

## Invocation

Say `Computer, [task]` to route automatically. Or invoke a specific agent by name.

The user's **primary agent** is configured during onboarding based on their role. See `Workflows/interactive-onboarding.md` Phase 1 and 1B.

## Handoff pattern

When a task involves a specific team member (not just a role), frame it with their name:

> "For [Name]: [task]" → agent reads `TEAM.md` to confirm their role, then routes with that person's channel context

Use this when you need to draft a handoff note, prep something on their behalf, or anticipate their questions.

## Cross-functional routing

When a task spans two roles, invoke agents sequentially:

1. First agent (your role) produces the draft
2. Route the draft to the second agent: `"Review this as [second role]"`

Example: Performance Marketer drafts a landing page brief → route to Website Owner for CRO input → route to Creative Reviewer before sending to agency.

## Team-view routing

For Growth Lead cross-channel synthesis, use `team-lead-view.md`:

> `Computer, team view — [question]`

This agent reads `TEAM.md`, `TEAM-GOALS.md`, `Projects/README.md`, and `Tasks/team-board.md` before answering.
