# /experiment-brief

Design a new experiment or A/B test. Fills `Templates/experiment-brief.md` with a valid hypothesis, sample size, and read date.

## Usage

- `/experiment-brief` — start a new experiment from scratch
- `/experiment-brief [test name]` — start a brief for a named test
- `/experiment-brief review [file]` — check an existing experiment brief for validity

## Steps (new brief)

1. Read `AGENTS.md` — identify the user's channel and KPI context
2. Read `Knowledge/Hypotheses/` — check if a similar test has been run before; surface prior results if relevant

3. Ask in one batch:
   - "What are you testing? (Subject line / Ad creative / Landing page / Audience / Offer / Send time / Other)"
   - "What's the hypothesis? Try: 'We believe [CHANGE] will cause [METRIC] to [DIRECTION] for [AUDIENCE] because [RATIONALE]'"
   - "What is the primary success metric? (e.g., Open rate, CVR, CAC, CTR)"
   - "What is the current baseline for that metric?"

4. Ask in a second batch:
   - "What's the minimum improvement that would make this test worth shipping? (e.g., +10% open rate)"
   - "How will you split traffic or list? (50/50, 80/20, other)"
   - "When can you start? When should the test be read — do not read early."

5. Calculate (or estimate) minimum sample size:
   - For email: use baseline rate + MDE + 95% confidence → estimate sends needed per variant
   - For paid: use baseline CVR + MDE → estimate clicks/sessions needed per variant
   - For web: use baseline CVR + MDE + weekly traffic → estimate run time in days
   - Show the calculation or flag: "[Exact sample size needs a stat calculator — estimate shown]"

6. Draft the experiment brief using `Templates/experiment-brief.md`
7. Output the draft inline
8. Ask: "Save to `Knowledge/Hypotheses/proposed/[date]-[slug].md`?"

## Steps (review existing brief)

1. Read the specified file
2. Check: Is the hypothesis testable (specific change, specific metric, specific audience)? Is the sample size calculated? Is there a read date? Are guardrail metrics defined?
3. Output verdict:

```
## Experiment review — [FILE]

**Valid ✅ / Invalid ❌**

Issues:
- [Issue — e.g., "Hypothesis is not falsifiable — rewrite as 'We believe X will cause Y to change by Z%'"]
- [Issue — e.g., "No sample size — add minimum N per variant before starting"]
- [Issue — e.g., "No guardrail metric — add unsubscribe rate ≤ X% to stop early if triggered"]
```

## After the experiment completes

When the user reports results, update the experiment brief with:
- Final sample size
- Results per variant
- Statistical significance
- Winner and action taken
- One-sentence learning for `Knowledge/Hypotheses/`

Then prompt: "Want me to move this to `Knowledge/Hypotheses/confirmed/` (win) or `Knowledge/Hypotheses/rejected/` (null/loss)?"
