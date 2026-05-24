# /today

Daily brief for the growth team. Run this at the start of every working day.

## What this does

Reads `Tasks/active.md`, `GOALS.md`, and `CLAUDE.md` to surface:
1. Top 3 priorities for today (from P0 and P1 tasks)
2. Any blockers that need movement
3. Meetings or deadlines coming up today or tomorrow
4. One-line progress check on this week's north-star metric

## Steps

1. Read `Tasks/active.md` — identify all P0 items and any P1 items that are time-sensitive today
2. Read `GOALS.md` — check if today's priorities ladder up to the 30/60/90 goals
3. Read `CLAUDE.md` — use role, channels, and KPIs to frame the brief correctly
4. Check `Tasks/follow-ups.md` — surface any overdue follow-ups
5. Output the daily brief in the format below

## Output format

```
## Today — [DAY, DATE]

**Top 3 priorities**
1. [Task] — [why today, what done looks like]
2. [Task] — [context]
3. [Task] — [context]

**Blockers that need a move today**
- [Blocker] — [who owns it, what's the ask]

**Watch item**
- [One metric or campaign to check today and why]

**Follow-ups overdue**
- [Name] — [what was promised, when]
```

Keep it to one screen. No preamble. If there are no blockers, skip that section.

## Voice

Match the tone set in `CLAUDE.md`. Default for Performance Marketer: data-first, concise, no filler.
