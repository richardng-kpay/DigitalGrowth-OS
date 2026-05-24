# /email-brief

Start a new email campaign brief. Fills `Templates/email-brief.md` through a short interactive interview.

## Usage

- `/email-brief` — start a new email brief from scratch
- `/email-brief [name]` — start a brief for a named campaign
- `/email-brief review [file]` — review an existing email brief before send

## Steps (new brief)

1. Read `CLAUDE.md` — get the user's lifecycle context and email platform
2. Read `Knowledge/Segments/` — check for existing audience segment definitions
3. Read `Knowledge/Hypotheses/` — surface any prior email test results relevant to this audience

4. Ask in one batch:
   - "Email name / campaign?"
   - "Email type? (One-off blast / Newsletter / Triggered / Drip step)"
   - "Who is this going to? (Segment name or describe the filter criteria)"
   - "What should this email achieve? One sentence."

5. Ask in a second batch:
   - "Subject line ideas? Give me 1–3 options (or I'll suggest some based on the objective)"
   - "Primary CTA — what do you want the reader to do?"
   - "CTA URL?"
   - "Target send date?"

6. Generate UTM parameters automatically:
   - `utm_source=email`
   - `utm_medium=[blast/drip/trigger]`
   - `utm_campaign=[campaign-slug]`
   - `utm_content=[cta-label]`
   - Show these and ask for confirmation before writing to the brief

7. Draft the brief using `Templates/email-brief.md`
8. Output the draft inline
9. Route to `/brief-review` for Creative Reviewer pass before send — remind the user this is required

## Steps (review existing brief)

1. Read the specified file
2. Check completeness:
   - Is the segment defined with suppression rules?
   - Are subject line A/B variants set up (if volume ≥ 1,000)?
   - Are UTMs attached to all links?
   - Is the QA checklist complete?
   - Is the send time and timezone specified?
3. Output:

```
## Email brief review — [FILE]

**Ready to send ✅ / Not ready ❌**

Issues:
- [Issue — e.g., "No UTM on secondary CTA link"]
- [Issue — e.g., "Subject line B missing — add for A/B test"]

QA checklist status:
- [ ] / [x] [each item from the template checklist]
```

## Reminder

Always run `/brief-review [file]` on the email copy before sending. The email brief review above checks completeness — `/brief-review` checks the actual message quality.
