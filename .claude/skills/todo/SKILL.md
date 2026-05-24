# /todo

Quick task capture and triage. Use when you want to add, reprioritise, or review tasks without running the full daily brief.

## Usage

- `/todo` — show current task list, grouped by priority
- `/todo add [task] [#priority] [#area]` — add a new task
- `/todo done [task]` — mark a task complete and move to Done
- `/todo block [task] — [reason]` — flag a task as blocked
- `/todo triage` — review the full list and suggest reprioritisation based on current goals

## Steps

### `/todo` (view)
1. Read `Tasks/active.md`
2. Output tasks grouped by P0 / P1 / P2 / Blocked
3. Flag any P0 tasks with no progress note as at-risk

### `/todo add [task] [#priority] [#area]`
1. Confirm the task, priority, and area tag with the user
2. Ask: "Add to In Progress or To Do?"
3. Write to `Tasks/active.md` under the correct section
4. Confirm: "Added: [task] [#priority] [#area]"

### `/todo done [task]`
1. Move the matching task from active to Done This Sprint with today's date
2. Confirm: "Done: [task] — [date]"

### `/todo block [task] — [reason]`
1. Move the matching task to the Blocked section with the reason
2. Confirm: "Blocked: [task] — [reason]"

### `/todo triage`
1. Read `Tasks/active.md` and `GOALS.md`
2. Check: does the P0 list match the 30-day goals?
3. Flag any tasks that look misaligned with current priorities
4. Suggest: what to promote, demote, or drop
5. Do not rewrite the file — show suggestions and ask for confirmation

## Output format (view)

```
## Tasks — [DATE]

**P0 — must happen**
- [ ] [task] #area — [note]

**P1 — this week**
- [ ] [task] #area

**Blocked**
- [ ] [task] — [blocker]

**P2 — backlog**
- [ ] [task] #area
```

No preamble. If a section is empty, skip it.
