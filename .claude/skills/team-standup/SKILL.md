# /team-standup

Synthesize the weekly team standup from all members' active task files and the team board.

## Usage

- `/team-standup` — full team standup
- `/team-standup [name]` — standup for one person only

## Steps

1. Read `TEAM.md` — get the full roster and member names
2. Read `Tasks/team-board.md` — cross-functional blockers, handoffs, decisions needed
3. Read `Tasks/active.md` — current user's in-progress and done tasks
4. For each other member listed in `TEAM.md`, note their name and role (individual active.md files live in each member's own OS clone — if accessible, read them; if not, note "Tasks/active.md not accessible — ask [Name] for update")
5. Read `Projects/README.md` — flag any campaign status changes or launches this week
6. Synthesize into the standup output format below

## Output format

```
# Team Standup — [DATE]

## [Name] — [Role]
**Shipped:** [completed items from active.md Done section]
**In flight:** [top 3 in-progress items]
**Blocked:** [blocker → who unblocks it]

(repeat for each team member)

---

## Cross-functional

### Blockers
| Blocked | Waiting on | Who unblocks | ETA |

### Handoffs due this week
| From | To | What | Due | Status |

### Decisions needed from Growth Lead
- [item]

### Campaign updates
[any status changes from Projects/README.md]
```

## After output

Ask:
1. "Save to `Meetings/standup-[DATE].md`?"
2. "Any updates before I finalize?"
3. "Want me to update `Tasks/team-board.md` with any new blockers or handoffs?"

## Notes

- Do not invent status — if a member's file is inaccessible, write "[Name] — no update available"
- Cap each person's section at 5 lines; if longer, summarize the pattern
- Blockers and cross-functional dependencies are always shown in full — never summarize those
- If running as the Growth Lead, add a "Team health signal" line: one sentence on the biggest risk to team OKR delivery this week
