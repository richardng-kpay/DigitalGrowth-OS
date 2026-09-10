# Experiment Brief: [EXPERIMENT_NAME]

**Status:** Proposed / Running / Complete / Rejected  
**Owner:** [YOUR_NAME]  
**Channel / surface:** [Paid / Email / Web / Lifecycle / SEO]  
**Proposed start date:** [DATE]  
**Expected read date:** [DATE]  
**Last updated:** [DATE]

---

## Hypothesis

> "We believe [CHANGE] will cause [METRIC] to [DIRECTION] for [AUDIENCE] because [RATIONALE]."

[e.g., "We believe changing the email subject line from feature-led to benefit-led copy will increase open rate by 10%+ for the onboarding cohort because our previous test on the re-engagement segment showed benefit framing outperformed by 14%."]

---

## Background and motivation

[Why are we running this experiment now? What signal, hypothesis, or prior result prompted it? 2–4 sentences.]

---

## Variants

| Variant | Description | Traffic / list split |
|---|---|---|
| **Control** | [Current state — what exists today] | [50% / N users] |
| **Variant A** | [What changes] | [50% / N users] |
| **Variant B (optional)** | [Second challenger] | [— / —] |

---

## Success metrics

| Metric | Type | Control baseline | Target for Variant | Minimum detectable effect |
|---|---|---|---|---|
| [Primary metric — e.g., Open rate] | Primary | [Current rate] | [Target] | [MDE — e.g., +5%] |
| [Secondary metric] | Secondary | — | — | — |
| [Guardrail — e.g., Unsubscribe rate] | Guardrail | [Baseline] | ≤ [Threshold] | — |

**Statistical confidence target:** [95% / 90%]  
**Minimum sample size (per variant):** [N users or N sends — calculated or estimated]

---

## Test duration and timing

**Planned run time:** [e.g., 14 days / 1,000 sends per variant]  
**Why this duration:** [Sample size math or business reason]  
**Contamination risks:** [e.g., Do not run during holiday period; avoid overlap with [other campaign]]

---

## Implementation

| Task | Owner | Status |
|---|---|---|
| Variant copy / creative ready | [Name] | [To do / Done] |
| Tracking / tagging set up | [Name] | [To do / Done] |
| QA passed | [Name] | [To do / Done] |
| Experiment live | [Name] | — |

**Tracking method:** [GA4 event / email platform A/B / VWO / internal BI]  
**Where to read results:** [Dashboard URL or report location]

---

## Read date and decision criteria

**Read date:** [DATE] — do not call early.

| Outcome | Decision |
|---|---|
| Variant wins with ≥ [confidence]% confidence | Ship Variant A; document learning |
| No significant difference | Keep Control; document null result; deprioritise similar tests |
| Variant loses | Keep Control; document anti-pattern; tag as learning |
| Guardrail triggered (e.g., unsub rate ↑) | Stop test immediately; investigate |

---

## Results *(fill after experiment completes)*

**Actual run period:** [DATE] → [DATE]  
**Final sample size (per variant):** [N]  
**Confidence level reached:** [%]

| Metric | Control | Variant A | Δ | Significant? |
|---|---|---|---|---|
| [Primary metric] | — | — | — | Yes / No |
| [Secondary metric] | — | — | — | — |

**Winner:** [Control / Variant A / No significant difference]  
**Action taken:** [Shipped / Archived / Extended]

---

## Learning

> What did this experiment teach us? One sentence that future experiments can build on.

[e.g., "Benefit-led subject lines outperform feature-led by ~12% for onboarding cohorts — apply to all lifecycle emails targeting first-week users."]

---

*Run `/experiment-readiness [file]` before starting. Archive in `Knowledge/Hypotheses/` after completion.*
