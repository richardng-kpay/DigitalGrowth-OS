# Ground Truth — [YOUR_NAME]'s Quality Bar

This file defines your personal quality standard. It calibrates `/brief-review` and channel reviews — the more specific it is, the sharper those gates become.

**Last updated:** [Date]  
**Maintained by:** [YOUR_NAME]

---

## Five core criteria

Applied to every artifact regardless of type.

### Criterion 1 — Audience specificity

**My bar:** [What does a specific audience definition look like? e.g., "Not 'SMB owners' — 'finance managers at companies with 10–50 employees actively evaluating payroll software.' If the audience could be anyone, the brief isn't ready."]

**Shortcuts I flag:** [e.g., "Audience defined only by demographics with no behavioural or intent signal."]

### Criterion 2 — Clarity and message

**My bar:** [e.g., "Core message is clear in 3 seconds. Headline delivers on the subject line promise. No filler phrases. CTA is specific — 'Start free trial' not 'Learn more'."]

**Shortcuts I flag:** [e.g., "Feature-led headlines when benefit-led would serve the audience better. Passive voice to avoid commitment."]

### Criterion 3 — KPI measurability

**My bar:** [e.g., "Every campaign has a KPI with a target number attached. 'Improve CAC' is not a KPI. 'CAC ≤ $28 by end of Q3' is."]

**Shortcuts I flag:** [e.g., "Goals stated as activities ('run a campaign') instead of outcomes ('generate 200 leads at ≤ $25 CPL')."]

### Criterion 4 — Actionability

**My bar:** [e.g., "Every recommendation has a named owner, a next action, and a timeframe. 'We should consider testing X' is not a recommendation."]

**Shortcuts I flag:** [e.g., "Performance reviews that report numbers without a 'so what' and a next action."]

### Criterion 5 — Reviewer comments addressed

**My bar:** [e.g., "Every comment from [YOUR_MANAGER] is explicitly addressed — accepted, modified, or rejected with rationale. No comment is silently ignored."]

**N/A condition:** No external reviewer comments in the document.

---

## Document-type required sections

Used by `/brief-review` and `/channel-review` for structural completeness checks.

### Campaign brief

Required: Objective / Audience / Channels + budget / KPI + target / Creative direction / CTA / Timeline / Approvals

### Content brief

Required: Audience / Funnel stage / Primary keyword + intent / Outline / CTA + URL / Distribution plan / Success metrics

### Experiment brief

Required: Hypothesis / Variants / Primary metric + baseline / Sample size / Read date / Guardrail metric / Tracking method

### Email brief

Required: Segment + suppressions / Subject line options / CTA + UTMs / Tone / QA checklist / Send date + timezone

### Weekly performance report

Required: Summary headline / Channel metrics vs. target / Highlights / Watch items / Actions / Next week focus

### Channel review

Required: Summary / Metrics vs. target table / What worked (with evidence) / What didn't (with root cause) / Budget recommendation / Actions

---

## Flags I always raise

Regardless of artifact type:

- [ ] Placeholder text remaining (`[TBD]`, `INSERT HERE`, `TODO`)
- [ ] KPIs without target numbers
- [ ] Audience defined too broadly
- [ ] CTA missing or not specific
- [ ] Actions without a named owner
- [ ] Risks listed without mitigation or owner
- [ ] Experiment brief missing sample size or read date

---

## Contradiction preservation rule

When two data sources conflict, preserve both with provenance tags. Never merge into false consensus.

1. Label explicitly: `[CONTRADICTION — see also: [other source]]`
2. Surface in the next weekly sweep for judgment
3. The dissenting metric is signal, not noise — the minority view is where insight lives

---

## How to update this file

Update any criterion when `/brief-review` consistently misses things that matter to you, or flags things that don't. This is a living calibration document — update it after any review that surprised you.
