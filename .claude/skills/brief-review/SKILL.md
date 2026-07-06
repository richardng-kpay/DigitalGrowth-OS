# /brief-review

Pre-publish quality gate. Routes any external artifact to the Creative Reviewer agent for audience fit, message clarity, CTA strength, and tone check.

**This is a mandatory gate.** Nothing external ships without passing this review.

## Usage

- `/brief-review [file]` — review a specific file
- `/brief-review` — review the most recently discussed artifact in this session

## What gets reviewed

- Campaign briefs (before approval)
- Email briefs and subject lines (before send)
- Ad copy and creative direction (before campaign goes live)
- Content briefs and drafts (before publish)
- Landing page copy (before A/B test or launch)

## Steps

1. Read the specified file (or ask the user to paste the content if it's not saved yet)
2. Read `Users/<active-user>/config.md` (resolve via `Users/.active-user`) — get the user's role and audience context
3. Read `Knowledge/Segments/` — check if the target audience is profiled
4. Run the Creative Reviewer assessment:

### Review criteria

**Audience fit**
- Is the audience specified precisely enough? (Not "SMB owners" — "SMB finance managers at companies with 10–50 employees considering payroll software")
- Does the message address something this audience actually cares about?
- Is the lifecycle stage correct? (An activation message shouldn't read like an acquisition ad)

**Message clarity**
- Can a reader understand the core message in 3 seconds?
- Is the headline benefit-led or feature-led? (Benefit-led typically outperforms for acquisition)
- Does the body deliver on what the headline promises?

**CTA strength**
- Is there exactly one primary CTA?
- Is the CTA specific? ("Start your free trial" > "Learn more")
- Does the CTA match the audience's readiness to act at this funnel stage?

**Tone match**
- Does the tone match the brand voice in `Knowledge/Reference/company.md` (if it exists)?
- Is the tone appropriate for the channel? (Email vs. paid ad vs. landing page differ)
- Are there any phrases that feel off-brand, overly salesy, or unclear?

**Channel-specific checks**
- *Email:* Subject line ≤ 50 chars? Preview text set? Spam trigger words? Mobile-readable?
- *Paid ad:* Headline ≤ 30 chars (Google) or punchy enough for scroll stop (Meta/TikTok)?
- *Landing page:* Above-the-fold CTA? Message match with the ad that sends here?
- *Content:* Clear H1? Keyword in first 100 words? CTA placed before the fold and at the end?

5. Output the structured verdict:

```
## Creative Review — [ARTIFACT NAME]

**Verdict:** Pass ✅ / Pass with changes ⚠️ / Revise and resubmit ❌

### Audience fit
- [✅ / ⚠️ / ❌] [observation]

### Message clarity
- [✅ / ⚠️ / ❌] [observation]

### CTA strength
- [✅ / ⚠️ / ❌] [observation]

### Tone match
- [✅ / ⚠️ / ❌] [observation]

### Required fixes before shipping
1. [Exact fix — what to change and why]
2. [Second fix if needed]

### Optional improvements (not blocking)
- [Nice-to-have]
```

6. If verdict is **Pass** or **Pass with changes**: confirm "Cleared for [channel]. Fix required items before send."
7. If verdict is **Revise and resubmit**: do not approve. Ask the user to revise and re-run `/brief-review`.

## What the Creative Reviewer does NOT do

- Rewrite the copy. It flags issues; the author rewrites.
- Make strategy calls (route to Growth Lead for that).
- Pull performance data (route to Data Analyst).
