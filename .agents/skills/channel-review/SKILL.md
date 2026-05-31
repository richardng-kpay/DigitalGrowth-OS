# /channel-review

Review a channel's performance over a defined period. Identifies what worked, what didn't, and what to do next.

## Usage

- `/channel-review [channel]` — review a specific channel (e.g., `/channel-review paid`, `/channel-review email`, `/channel-review seo`)
- `/channel-review [channel] [period]` — specify a period (e.g., `/channel-review meta last-month`)
- `/channel-review` — review all active channels (summary level)

## Steps

1. Read `AGENTS.md` — identify the user's role, channels, and KPI targets
2. Read `GOALS.md` — pull the target metrics this channel should be hitting
3. Read `Tasks/active.md` — check what campaigns or tests were running in this period
4. Read `Projects/` — find any active campaign briefs for this channel and their stated KPI targets
5. Read `Knowledge/Hypotheses/` — check for any experiments completed on this channel this period

6. Ask the user for the performance data if not already in context:
   - "What were the key metrics for [channel] this period? Paste or tell me: [relevant metrics for that channel]"

7. Draft the channel review using `Templates/channel-review.md`

8. Output the review inline with:
   - Metrics vs. target table
   - What worked (with evidence)
   - What didn't work (with root cause hypothesis)
   - Budget recommendation for next period
   - Top 2–3 actions

9. Ask: "Want me to save this to `Projects/[project]/reviews/[channel]-[period].md`?"

## Channel-specific metrics to pull

| Channel | Key metrics |
|---|---|
| Paid (Google/Meta/TikTok/LinkedIn) | Spend, CAC/CPA, ROAS, CTR, CVR, impressions |
| SEO / Organic | Sessions, keyword rankings (top 10), organic conversions, new backlinks |
| Email / Lifecycle | Open rate, click rate, conversion rate, unsubscribe rate, revenue attributed |
| Website / CRO | Conversion rate, bounce rate, session duration, A/B test status |
| All channels | Blended CAC, total conversions, channel mix efficiency |

## Output tone

Lead with the performance verdict (on track / off track / mixed), then evidence, then recommendation. No filler. If data is missing for a section, mark as `[Data needed — pull from [platform]]` rather than skipping or estimating.
