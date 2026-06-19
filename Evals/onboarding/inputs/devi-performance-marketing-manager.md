# Test profile — Devi (Performance Marketing Manager)

Use this as the simulated user when running the onboarding workflow.
This fixture exercises the **Phase 1B-A (Performance Marketing Manager)** branch —
the role branch a "marketing manager" most directly maps onto, and one no prior
core fixture has exercised. It is grounded in real KPay context (B2B payments,
SME merchants, HK/SG markets, paid acquisition under a CAC-payback constraint)
so the goals-specific, OKR-alignment, and first-useful-output evals have concrete
material to grade.

```markdown
- Name: Devi
- Role: Performance Marketing Manager
- Company / organization: KPay (KPay Group)
- Team / domain: Digital Growth
- Manager or primary sponsor: Jervis (Martech & Digital Growth lead)
- Head of dept / skip: Martin Xie
- Primary purpose: Day-job execution — own paid acquisition for SME merchant sign-ups across HK + SG
- Default persona: Growth operator (performance-marketer voice)
- Tone: direct, data-first, no-fluff
- Detail level: standard
- Pushback level: high; challenge any spend increase without a CAC-payback or incrementality rationale
- Work style: daily budget pacing + weekly channel review
- Decision style: recommendation-first with the spend tradeoff named
- Review style: brief review + adversarial check on any claim before it goes to Jervis or finance
- Planning rhythm: daily `/today` pacing check, weekly channel review Monday, monthly spend/ROAS review with Jervis
- Week starts on: Monday
- Recurring reviews: Monday channel review, monthly spend + CAC review with Jervis, quarterly budget reforecast
- Channels owned: Google Ads (Search + PMax), Meta (FB/IG), TikTok Ads; display retargeting via Google
- Ad platforms / tools: Google Ads, Meta Ads Manager, TikTok Ads Manager, Looker Studio dashboards, no SA360/DV360
- Reporting cadence: weekly to Jervis, monthly exec spend review with Martin
- Monthly budget: ~HKD 600k blended across HK + SG (HK ~65% / SG ~35%)
- Primary KPIs: CAC (cost per activated merchant), ROAS, qualified sign-ups (MQL→activated), blended CPL
- Attribution model: last-click in Google + platform-reported, reconciled monthly in Looker (known to over-credit paid)
- Anchor project: Q3 paid acquisition scale-up for SME merchants (HK + SG) under a CAC-payback ceiling
- Key stakeholders: Jervis (manager / budget approver), Martin Xie (head, exec spend sign-off), Liam (data/attribution + platform access), finance (CAC payback owner), Lina (website owner — landing page CVR handoff)
- Privacy boundaries: actual spend figures, CAC by channel, agency/commission fees, merchant names, internal sign-up volumes
- Taste — turns me off: vanity metrics (CTR/impressions) reported as outcomes; "scale it because ROAS looks good" with no incrementality view; generic e-commerce playbooks that ignore B2B payments sales cycle
- Taste — ideal response feel: leads with CAC/payback, names the spend tradeoff, separates correlation from incrementality, cites the data source or labels it an estimate
- Tradeoff priority: efficiency (CAC payback) > volume > speed — profitable acquisition beats a big top-line number
- Evidence standard: incrementality/holdout test > platform-reported ROAS > intuition
- Decision certainty bar: 80% before a budget shift above HKD 50k/month; 70% for smaller creative/bid tests
- Acceptable failure: "Ran a channel test that didn't beat the baseline CAC" = fine, it's a learning. "Scaled spend without a payback rationale or finance sign-off" = not fine
- OKR ladder-up: Digital Growth team OKR — grow activated SME merchants from paid within a CAC-payback ceiling; exact target being set with Jervis
- Single proof metric: blended CAC for activated merchants → from an unreliable last-click number today to a reconciled, incrementality-checked baseline + held or improved CAC at higher spend by end of quarter
- Goal 1 kill condition: If attribution can't be trusted enough to measure true CAC (the known KPay data-trust problem), pivot the proof metric to a geo holdout / incrementality test on the largest channel until attribution is fixed
- 30-day outcome: Audit current paid spend vs activated-merchant CAC by channel in Looker; kill or cap the 2 worst-CAC campaigns; stand up a clean weekly CAC pacing view
- 60-day outcome: Run one incrementality/geo-holdout test on the largest channel (likely Google Search HK); rebuild the budget split off the result
- 90-day outcome: Hold or improve blended activated-merchant CAC while increasing qualified sign-up volume; reconciled CAC baseline agreed with Liam + finance
- P0 this week: Pull last-30-day spend + activated-merchant CAC by channel; flag the worst-CAC campaign for a pause decision with Jervis
- P1 soon: Draft the geo-holdout test design for Google Search HK; align Jervis + Liam on measurement
- P2 backlog: Build the weekly CAC pacing Looker view; TikTok creative refresh test for SG
- Blockers: No trusted CAC/attribution path yet (Google/Meta/TikTok platform numbers don't reconcile with CRM activated-merchant data — confirmed by Liam); finance and growth disagree on the CAC-payback ceiling
```

This profile is intentionally a Performance Marketing Manager to surface bugs in
the `1B-A` branch and to test whether the OS lets a paid-acquisition manager
*start working* (not just finish setup) — a CAC-first first useful output, not a
vanity-metric report.
