# Sample failing output — eval 05 (goals specific, not generic)

This is one failure example for the Jordan Lee fixture. Graders use it as the anchor for "generic" behavior: goals that could be pasted into any role without preserving the user's stated work, metrics, or stakeholders.

## 30-60-90 Day Goals

### Day 1–30: Listen, Learn, Align

- [ ] Complete stakeholder mapping
- [ ] Conduct discovery interviews with relevant partners
- [ ] Audit existing tools and data flows
- [ ] Align with manager on priorities and success metrics
- [ ] Identify top use case candidates

**Success looks like:** Manager-aligned 30-60-90 plan, clear picture of gaps, shortlist of use cases.

### Day 31–60: Define and Decide

- [ ] Finalize first use case (with business case)
- [ ] Define implementation scope, timeline, and dependencies
- [ ] Build roadmap v1.0 — sequenced with rationale

**Success looks like:** Approved use case, implementation kicked off, roadmap shared.

### Day 61–90: Execute and Show Value

- [ ] First use case live or in testing
- [ ] Measurable early results shared
- [ ] Increase activation by 20%

**Success looks like:** Tangible output visible to stakeholders.

## Why this fails eval 05

- **Generic verbs.** "Complete stakeholder mapping," "audit existing tools," "align on priorities" are themes, not deliverables — they could appear in any PM's 30-60-90 plan unchanged.
- **No traceability to Jordan's input.** Jordan's stated 30-day outcome ("Ship activation funnel discovery readout; align Priya on top 3 hypotheses") is nowhere to be found. The text reads as if the assistant ignored what the user actually said and pattern-matched to a "PM onboarding" template.
- **Hallucinated target.** "Increase activation by 20%" appears in Day 61–90 — Jordan never specified 20%. This is the model interpolating between Jordan's 30-day and 90-day outcomes and inventing a number.
- **No named stakeholders.** Jordan named Priya, Marco, Elena, Sam Rivera. None appear.
- **"Success looks like" lines are vague.** "Tangible output visible to stakeholders" cannot be falsified — any output qualifies.
- **Template scaffolding survived.** "Listen, Learn, Align" and "Define and Decide" are the literal headings from the template scaffold, not Jordan's themes.
- **Role-specific inputs would be lost in the same way.** For a Content & SEO fixture, the equivalent failure would omit Search Console, keyword map, target terms, rankings, content-attributed MQLs, Jervis/brand approval, or the attribution blocker.

Any of these alone would fail criterion 2 (50%+ outcomes name a deliverable or decision). Together they fail criteria 1, 3, 4, 5, 6, and 7.
