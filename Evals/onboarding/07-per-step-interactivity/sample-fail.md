# Sample failing transcript excerpt — eval 07 (per-step interactivity)

This is what a failure looks like. Graders use it as the anchor for "batched, non-interactive."

---

## Phase 5 (excerpt — fails)

> **Assistant:** I captured the following from what you told me:
>
> P0: Finish discovery readout draft; book Priya 1:1 for readout review
> P1: Stand up baseline metrics dashboard with Sam; align Marco on instrumentation gaps
> P2: (none)
> Blockers: No baseline dashboard yet; activation event definition disputed
>
> Look right? Ready to capture all of this?
>
> **User:** Yes.

**Why this fails criterion 1:** all five categories collapsed into one bulk approval. The user can't selectively correct P0 without also implicitly approving P1, blockers, etc.

---

## Phase 7 (excerpt — fails)

> **Assistant:** Here are the four stakeholder profiles I drafted based on what you told me:
>
> - `Knowledge/People/priya-shah.md` — Director of Product, Growth; manager; approver
> - `Knowledge/People/marco-chen.md` — Eng lead; partner
> - `Knowledge/People/elena-torres.md` — Design lead; partner
> - `Knowledge/People/sam-rivera.md` — Data science; partner
>
> Ready to write all four?

**Why this fails criterion 2:** four profiles drafted upfront without conversational per-person confirmation of role + relationship + style. The user has no chance to correct Marco's role before Marco's file is proposed.

---

## Phase 10 (excerpt — fails)

> **Assistant:** Phase 9 approved. Writing all files now.
>
> ✅ Updated `Users/<name>/config.md`
> ✅ Updated `Users/.active-user`
> ✅ Updated `GOALS.md`
> ✅ Updated `Tasks/active.md`
> ✅ Updated `Tasks/backlog.md`
> ✅ Updated `Knowledge/People/priya-shah.md`
> ✅ Updated `Projects/activation-funnel-redesign/brief.md`
>
> Done. Want to run `/today`?

**Why this fails criterion 4:** both Phase 10 gates were collapsed into the Phase 9 approval — no Gate 1 ask for the user layer, no Gate 2 ask for the working files. (It also fails eval 15 C4/C5: `.active-user` was written before the memory seeds — which never happened at all.)

---

## Phase 10 (excerpt — also fails)

> **Assistant:** Now the working files (Gate 2): `GOALS.md`, `Tasks/active.md`, `Tasks/backlog.md`. OK?
>
> **User:** sounds good
>
> **Assistant:** ✅ Updated `GOALS.md`, `Tasks/active.md`, `Tasks/backlog.md`.

**Why this fails criterion 5:** the assistant interpreted "sounds good" as authorization to open Gate 2. Per the workflow rule, polite acknowledgements do not count — the assistant must re-ask for an explicit "yes."

---

## Phase 11 (excerpt — fails)

> **Assistant:** Verification results:
>
> ✅ Role set
> ✅ Quality gates match role
> ❌ Anchor project brief missing
> ✅ Privacy boundaries recorded
>
> Onboarding complete with one warning (anchor project not set). You can fill that in later. Want to run `/today`?

**Why this fails criterion 6:** the assistant declared "complete with warning" instead of forcing the three-way choice (fill now / defer to follow-ups with a date / accept the placeholder with a written reason).
