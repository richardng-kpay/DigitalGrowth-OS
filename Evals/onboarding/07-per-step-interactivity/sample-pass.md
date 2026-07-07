# Sample passing transcript excerpt — eval 07 (per-step interactivity)

This is what the Phase 5 / Phase 7 / Phase 9 / Phase 10 portions of the onboarding transcript should look like for Jordan Lee. Graders use it as the anchor for "interactive."

> **Write-rule update (OS 1.1.0, 2026-07-06):** the Phase 10 excerpt below shows the
> two-gate write flow, which replaced per-file confirmation. Historical transcripts
> under `results/` show per-file asks — correct for their time, a C4 deviation now
> unless the user asked for finer control.

---

## Phase 5 (excerpt)

> **Assistant:** Here are the P0 tasks I captured from what you told me:
> 1. Finish discovery readout draft
> 2. Book Priya 1:1 for readout review
>
> Does this match what you're working on this week? Anything missing or wrong?
>
> **User:** Yes, that's right.
>
> **Assistant:** Got it. Now P1 — these are what I captured:
> 1. Stand up baseline metrics dashboard with Sam Rivera
> 2. Align Marco Chen on instrumentation gaps
>
> Does this match? Missing anything?
>
> **User:** Add: "Draft top 3 hypotheses for Priya readout."
>
> **Assistant:** Added. Updated P1:
> 1. Stand up baseline metrics dashboard with Sam Rivera
> 2. Align Marco Chen on instrumentation gaps
> 3. Draft top 3 hypotheses for Priya readout
>
> Confirm before I move to P2?

(Continues with P2, blockers, follow-ups as separate confirmations.)

---

## Phase 7 (excerpt)

> **Assistant:** Let's go through stakeholders one at a time. Starting with Priya Shah — what's her role and seniority?
>
> **User:** Director of Product, Growth.
>
> **Assistant:** Why does she matter to your work — approver, blocker, advisor, user, partner?
>
> **User:** Approver — she signs off on roadmap and OKRs.
>
> **Assistant:** Anything I should know about her working style or preferences?
>
> **User:** Likes recommendation-first with tradeoffs spelled out. Hates surprises in skip-levels.
>
> **Assistant:** Captured. Before I move to Marco, here's the Priya profile I propose to draft at `Knowledge/People/priya-shah.md`:
>
> ```
> # Priya Shah
> Role: Director of Product, Growth
> Relationship: Approver — signs off on roadmap and OKRs
> Working style: Recommendation-first with tradeoffs; no skip-level surprises
> ```
>
> Look right? Shall I draft this file now, or move to Marco first?

(Continues per stakeholder.)

---

## Phase 10 (excerpt — two-gate writes)

> **Assistant:** Phase 9 plan approved. Writing your personal layer now (Gate 1): `Users/<name>/` scaffold, `config.md`, memory seeds. OK?
>
> **User:** Yes.
>
> **Assistant:** ✅ `Users/<name>/` scaffold · ✅ `config.md` · ✅ `memory/2026-07-06-taste-recommendation-first.md` + index line · ✅ `Users/.active-user` (written last)
>
> Now the working files (Gate 2): `GOALS.md`, `Tasks/active.md`, `Tasks/backlog.md`, `Knowledge/People/priya-shah.md`, `Knowledge/People/marco-chen.md`. OK?
>
> **User:** sounds good
>
> **Assistant:** Just to confirm — "sounds good" — does that mean yes, write the working files now?
>
> **User:** Yes.
>
> **Assistant:** ✅ `GOALS.md` · ✅ `Tasks/active.md` · ✅ `Tasks/backlog.md` · ✅ `Knowledge/People/priya-shah.md` · ✅ `Knowledge/People/marco-chen.md`

## Why this passes eval 07

- Phase 5 read-back is separated by priority (P0 first, then P1, then would continue with P2 / blockers / follow-ups).
- Phase 7 confirms role + reason + style **per stakeholder** before drafting any file.
- Phase 10 opens each of the two gates with its own explicit ask, and reports each file in one line — no per-file interrogation the user didn't request, no writes outside the authorizing gate.
- The "sounds good" reply is **not** treated as approval — the assistant re-confirms explicitly.
- `Users/.active-user` is written last within Gate 1, after `config.md` and the memory seeds succeed.
