# /weekly-performance-report

Compile and draft the weekly performance report. Run every Friday or when a weekly update is due.

## Usage

- `/weekly-performance-report` — draft the full weekly report
- `/weekly-performance-report [channel]` — draft the section for one channel only (e.g., `/weekly-performance-report paid`)

## Steps

1. Read `AGENTS.md` — identify the user's role, channels, and KPIs
2. Read `Tasks/active.md` — pull what was completed this week, what's in progress, and any blockers
3. Read `GOALS.md` — check how this week's performance tracks against 30/60/90 goals and the proof metric
4. Check `Projects/` for any campaign briefs with active flight dates — pull their stated KPI targets for comparison
5. Check `Knowledge/Hypotheses/` for any experiments that were read or completed this week
6. Open `Templates/weekly-performance-report.md` and draft the report

## How to handle missing data

The user may not have all channel numbers ready. When a metric cell is empty:
- Do not invent numbers
- Leave the cell as `—` with a note: "[Pull from [platform] before sending]"
- Flag which metrics are still needed at the bottom of the draft

## Output

Draft the report in `Templates/weekly-performance-report.md` format. Output inline — do not create a new file unless the user asks.

After drafting, ask:
1. "Which metrics are still missing? I can flag them."
2. "Who is this going to — manager, team, exec? I'll adjust the level of detail."
3. "Want me to save this to `Projects/[project]/reports/week-of-[DATE].md`?"

## Tone

Match `AGENTS.md` tone setting. Default: lead with the headline number, then interpretation, then action. No filler sentences like "Overall it was a solid week."

## Role-specific focus

- **Performance Marketer:** lead with paid metrics (CAC, ROAS, spend pacing), then site CVR
- **Lifecycle Marketer:** lead with email metrics (open rate, click rate, conversions), then lifecycle stage progress
- **Website Owner:** lead with conversion rate and A/B test status, then traffic
- **Analytics Lead:** include all channels; flag attribution confidence level
- **Growth Lead:** blended summary across all channels; highlight the one number that matters most this week
