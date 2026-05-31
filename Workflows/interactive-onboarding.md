# Workflow: Interactive Onboarding — Digital Growth OS

Use this workflow when a team member first sets up or clones the DigitalGrowth-OS.

This workflow is harness-neutral — it runs the same way in Claude Code, Codex CLI, or Gemini CLI. The configuration it writes lives in `CLAUDE.md` and is respected by all harnesses.

Trigger phrases:
- `Computer, onboard me into this OS`
- `Set up this OS for me`
- `Help me configure my growth OS`
- `Start onboarding`

## Operating rules

1. **Be interactive.** Do not assume the user's role, channels, KPIs, company, goals, or stakeholders.
2. **Ask in small batches.** 3–5 questions at a time so the user can answer quickly.
3. **Offer choices, but always allow custom answers.** Never lock the user into a dropdown.
4. **Role-branch after Phase 1.** Once the user confirms their role, the rest of the interview adapts to that role's specific channels and KPIs.
5. **Summarize before writing.** Show a Phase 9 confirmation summary before editing any files.
6. **Only write files after explicit confirmation.** "Sounds good" does not count — ask for explicit yes.
7. **Preserve placeholders when the user is unsure.** Do not invent values.

## Setup capture schema

Maintain this working schema during the interview. Preserve placeholders or mark `Unknown` when the user is unsure; do not invent details.

```markdown
## Setup capture

### Lark connection
- Status: [✅ verified / ❌ failed / ⏭ skipped]
- Documents found in test search: [N]
- Lark domain:
- Wiki space / root node:

### Team setup (Phase 0C)
- OS mode: [personal / team]
- Team name:
- Team manager:
- Shared Lark space ID:
- Roster collected: [N members / skipped]
- TEAM.md status: [ready / placeholder / skipped]
- TEAM-GOALS.md status: [ready / placeholder / skipped]

### Identity
- Name:
- Role on growth team:
- Company / organization:
- Team / domain:
- Manager or primary sponsor:

### Role context (filled in Phase 1B based on role selected)
- Channels / areas owned:
- Primary KPIs:
- Key tools / platforms:
- Reporting cadence:

### OS purpose
- Primary jobs-to-be-done this week:
- Useful within 7 days if:

### Operating style
- Default persona:
- Tone:
- Detail level:
- Pushback level:
- Work style:
- Decision style:
- Review style:
- Turn-offs:
- Ideal response feel:

### Thought frameworks
- Tradeoff priority:
- Evidence standard:
- Decision certainty bar:
- Acceptable failure:

### Cadence
- Planning rhythm:
- Week starts on:
- Recurring meetings / reviews:

### Active work
- P0 this week:
- P1 soon:
- P2 / backlog:
- Blockers:

### Goals and metrics
- 30-day outcomes:
- 60-day outcomes:
- 90-day outcomes:
- Primary proof metric:
- Goal 1 kill condition:

### Stakeholders
- Manager / approver:
- Key collaborators:
- Agency or external partners:
- Open decisions:

### Boundaries
- Never write to files:
- May edit without asking:
- Requires confirmation:
```

---

## Phase 0 — Confirm first-run context

Ask:

1. Is this OS for your day-to-day work on the growth team, a side project, learning, or a mix?
2. What name, role, and company should the OS use? (e.g., "Sarah, Performance Marketing Manager at Acme")
3. Are there any placeholders you want to preserve for now?

Record identity in the setup capture.

---

## Phase 0B — Lark MCP connection check

**Run this phase immediately after Phase 0, before any role branching.**

This OS searches your team's Lark wiki to answer project questions. The Lark MCP uses the shared team app (`cli_a944aca53c381ed3`) with per-user OAuth — each user logs in with their own Lark account and sees only what they have access to. Each user must have the `lark-mcp` server configured in their own `~/.claude.json` with the App Secret pasted locally (see `Workflows/lark-setup.md`).

### Connection test

1. Tell the user: "Let me confirm your Lark MCP connection is working before we continue."
2. Call `mcp__lark-mcp__docx_builtin_search` with `search_key: "digital growth"` (or the user's company name if they provided it in Phase 0).
3. Evaluate the result:

**✅ Pass — results returned:**
> "Great — Lark MCP is connected under your account. Found [N] documents. The wiki is ready."
Record `Lark connection: ✅ verified · N documents found` in setup capture.

Then ask the user for the Lark domain and, if they know it, the wiki space / root node label to write into `CLAUDE.md`. If they do not know either value, record `Unknown / to confirm` and add a dated follow-up in `Tasks/follow-ups.md`; do not leave silent bracket placeholders.

Proceed to Phase 1.

**❌ Fail — error or 0 results:**
> "Lark MCP isn't connected yet. Before we continue onboarding, you'll need to configure it with your personal Lark credentials."
> "Open `Workflows/lark-setup.md` for step-by-step instructions. Come back once you can run a successful search."
Record `Lark connection: ❌ failed` in setup capture. **Pause onboarding here.** Do not proceed to Phase 1 until the user confirms the connection test passes.

### Re-entry after fixing
When the user returns, re-run the connection test once more. Only mark as `✅ verified` and proceed to Phase 1 after a successful search.

### If the user wants to skip Lark setup
If the user explicitly says they want to skip Lark for now:
> "Understood — you can set up Lark later via `Workflows/lark-setup.md`. Wiki search won't work until it's configured."
Record `Lark connection: ⏭ skipped by user`. Continue to Phase 0C. Add a dated follow-up in `Tasks/follow-ups.md`: "Configure Lark MCP and confirm Lark domain / wiki root — see Workflows/lark-setup.md."

---

## Phase 0C — Team setup

**Run this phase after the Lark check, before role branching.**

This phase determines whether this OS is a personal install or a shared team OS, and populates `TEAM.md` and `TEAM-GOALS.md` if it's shared.

Ask:

> "Is this OS being set up for you individually, or are you setting it up as a shared OS for your whole growth team?"

### If personal install

Record `OS mode: personal`. Skip to Phase 1.

Add a note in the setup capture: "Team files (TEAM.md, TEAM-GOALS.md) left as templates — populate if the team adopts a shared OS later."

### If shared team OS

Tell the user:
> "Great — I'll set up the team coordination layer. I'll need a few details about your team. You can fill in what you know now and leave the rest as placeholders."

Ask in two batches:

**Batch 1 — Team identity:**
1. What is the team name? (e.g., "Digital Growth Team", "KPay Growth")
2. Who is the team manager / head?
3. What is the shared Lark space ID and root node label for the team wiki? (If different from what we found in Phase 0B — or skip if unknown)

**Batch 2 — Team roster** (collect for each member, including the current user):
For each team member:
- Name
- Role (Performance Marketer / Content & SEO / Lifecycle / Website Owner / Analytics Lead / Growth Lead / Custom)
- Channels they own
- Which team OKR metric they're accountable for
- Lark handle (optional)

Tell the user: "You can add yourself first, then go through each teammate. Skip anyone you're unsure about — I'll leave them as placeholders."

**After collecting roster:**

1. Show a preview of `TEAM.md` populated with the collected data
2. Ask: "What are the team's top 1–2 OKRs for this quarter? I'll set up `TEAM-GOALS.md` with owners assigned."
3. Show a preview of `TEAM-GOALS.md`
4. Ask for explicit confirmation before writing either file

Record `OS mode: team · [N] members · TEAM.md ready · TEAM-GOALS.md ready` in setup capture.

Continue to Phase 1 (the current user's role and personal config).

---

## Phase 1 — Role on the digital growth team

**This is the branching gate.** The user's role determines which channels, KPIs, templates, and agents are surfaced for the rest of onboarding.

Ask:

> "What is your primary role on the digital growth team? Pick the one that's closest to your day-to-day, or choose Custom."

| Role option | Day-to-day description |
|---|---|
| **Performance Marketing Manager** | Paid media (Google, Meta, TikTok, display), budget management, campaign optimisation, ROAS/CAC tracking |
| **Content & SEO Lead** | Editorial calendar, content briefs, keyword strategy, on-page SEO, blog/landing page output |
| **Lifecycle Marketing Manager** | User lifecycle stages, email/push flows, segmentation, activation funnels, retention/churn |
| **Website Product Owner** | Website CRO, landing page roadmap, A/B testing, web analytics, site speed and UX |
| **Analytics & Data Lead** | Attribution modelling, dashboards, experiment design, weekly/monthly KPI reporting |
| **Growth Lead** | Cross-channel strategy, OKR ownership, experiment prioritisation, team alignment |
| **Custom** | Mix of the above, or a different specialism |

After the user confirms their role, proceed to **Phase 1B** for that role.

---

## Phase 1B — Role-specific channel and KPI capture

Run the sub-phase that matches the user's role. If the user selected Custom, ask the equivalent questions in free-form.

### 1B-A: Performance Marketing Manager

Ask:

1. Which paid channels do you actively manage? (Google Search / Google Display / Meta / TikTok / LinkedIn / Programmatic / Other)
2. What are your primary KPIs? (ROAS, CAC, CPA, CPL, CTR, conversion rate, spend efficiency — pick the ones you're accountable for)
3. What tools do you use day-to-day? (Google Ads, Meta Ads Manager, SA360, DV360, Looker, other)
4. What does your weekly reporting cycle look like? (Weekly to manager / bi-weekly exec update / monthly review)
5. What is your approximate monthly budget range? (Optional — used to calibrate cost benchmarks)

Record: channels, primary KPIs, tools, reporting cadence in the setup capture under "Role context."

Configure:
- Primary agent: `performance-marketer.md`
- Secondary agent: `data-analyst.md` (for attribution and reporting tasks)
- Area tags: `#paid` · `#analytics` · `#strategy`
- Default templates to surface: `campaign-brief.md`, `weekly-performance-report.md`, `experiment-brief.md`

---

### 1B-B: Content & SEO Lead

Ask:

1. What content types do you produce? (Blog posts / landing pages / case studies / social copy / email newsletters / video scripts / Other)
2. What SEO tools do you use? (Semrush / Ahrefs / Moz / Google Search Console / Screaming Frog / Other)
3. What is your publishing cadence? (e.g., 4 blog posts/month, 2 landing pages/quarter)
4. What are your primary KPIs? (Organic traffic, keyword rankings, content-attributed leads, backlinks, engagement rate — pick the ones you're accountable for)
5. Who reviews and approves content before publish? (Your manager / brand team / legal / no formal review)

Record: content types, tools, cadence, KPIs, approval chain in setup capture.

Configure:
- Primary agent: `content-strategist.md`
- Secondary agent: `creative-reviewer.md` (pre-publish gate)
- Area tags: `#content` · `#seo` · `#analytics`
- Default templates: `content-brief.md`, `channel-review.md`, `competitor-snapshot.md`

---

### 1B-C: Lifecycle Marketing Manager

Ask:

1. What lifecycle stages do you own? (Acquisition / Onboarding / Activation / Engagement / Retention / Re-engagement / Win-back — select all that apply)
2. What email/push platform do you use? (Braze / Klaviyo / Iterable / Salesforce Marketing Cloud / HubSpot / Other)
3. What are your primary KPIs? (Email open rate, click rate, activation rate, day-30 retention, churn rate, LTV — pick yours)
4. How do you segment users? (By behaviour / by plan tier / by cohort / by geography / by persona / Other)
5. Do you run A/B tests on email/push flows? If so, how often?

Record: stages owned, platform, KPIs, segmentation approach in setup capture.

Configure:
- Primary agent: `lifecycle-marketer.md`
- Secondary agent: `data-analyst.md`
- Area tags: `#email` · `#lifecycle` · `#analytics`
- Default templates: `lifecycle-stage-doc.md`, `email-brief.md`, `experiment-brief.md`

---

### 1B-D: Website Product Owner

Ask:

1. What CMS/platform powers the site? (WordPress / Webflow / Custom / Contentful / Other)
2. What CRO and analytics tools do you use? (VWO / Optimizely / Google Analytics 4 / Heap / Hotjar / Other)
3. What are your primary KPIs? (Conversion rate, bounce rate, session duration, page load speed, form completion, LCP — pick yours)
4. What does your A/B testing cadence look like? (How many tests running at once? How long do tests run?)
5. Who are the main stakeholders you serve? (Marketing team / Performance team / Leadership / Engineering / All)

Record: CMS, tools, KPIs, test cadence, stakeholders in setup capture.

Configure:
- Primary agent: `website-owner.md`
- Secondary agent: `data-analyst.md`
- Area tags: `#web` · `#analytics` · `#paid` (for landing pages)
- Default templates: `experiment-brief.md`, `channel-review.md`, `campaign-brief.md`

---

### 1B-E: Analytics & Data Lead

Ask:

1. What BI / analytics tools do you own? (Looker / Tableau / Metabase / Google Data Studio / BigQuery / Amplitude / Mixpanel / Other)
2. What attribution model does the team use? (Last-click / first-click / linear / data-driven / multi-touch / MTA — or is this being debated?)
3. What does your weekly reporting cadence look like? (Weekly dashboards / bi-weekly exec reports / ad hoc pulls)
4. What are the 3–5 KPIs the team is most focused on right now?
5. Who are the main consumers of your reports? (Growth Lead / Performance Manager / Marketing Director / Exec team)

Record: tools, attribution model, KPIs, report consumers in setup capture.

Configure:
- Primary agent: `data-analyst.md`
- Secondary agent: `growth-lead.md` (for strategy-layer questions)
- Area tags: `#analytics` · `#strategy` · `#paid` · `#email`
- Default templates: `weekly-performance-report.md`, `channel-review.md`, `experiment-brief.md`

---

### 1B-F: Growth Lead

Ask:

1. What channels / functions does your growth team own? (Select all that apply from the role list above)
2. What are the team's top 3 OKRs or north-star metrics for this quarter?
3. How do you run experiment prioritisation? (ICE scoring / weekly experiment review / backlogs / ad hoc)
4. What is your planning and reporting cadence? (Weekly syncs / bi-weekly OKR reviews / monthly board report)
5. Who is your primary exec sponsor or approver for growth decisions?

Record: functions owned, OKRs, prioritisation method, cadence in setup capture.

Configure:
- Primary agent: `growth-lead.md`
- Secondary agents: routes to all other agents based on topic
- Area tags: `#strategy` · `#paid` · `#content` · `#email` · `#web` · `#analytics`
- Default templates: `campaign-brief.md`, `weekly-performance-report.md`, `experiment-brief.md`

---

## Phase 2 — Operating style

Ask in one batch:

> "Four quick questions about how you like to work:
> 1. **Tone:** What voice should the assistant use? (data-first and concise / strategic and direct / creative and engaging / custom)
> 2. **Detail level:** Brief bullet summaries, standard depth, or thorough with full rationale?
> 3. **Pushback:** When should the assistant push back — always when the evidence is thin, only on high-stakes calls, or rarely?
> 4. **Turn-offs:** What's one thing an assistant does that immediately makes you tune out? (e.g., 'opens with Certainly!', 'buries the number', 'too much preamble')"

Ask a 5th:
> "What does your ideal response to a hard marketing question look and feel like?"

Record as `Tone`, `Detail level`, `Pushback level`, `Turn-offs`, and `Ideal response feel` in the capture schema.

---

## Phase 3 — Operating cadence

Ask:

1. What day does your work week start?
2. What is your planning rhythm? (Weekly / campaign sprint / monthly / ad hoc)
3. What recurring meetings or reviews should the OS prepare you for? (e.g., weekly channel review, Monday standup, monthly exec update)
4. What are the first 3 commands you'd want to use in this OS?

Reflect the cadence in `CLAUDE.md` and recurring workflow suggestions.

---

## Phase 4 — How you think (optional, skip any)

Ask in one batch:

> "Four quick questions about how you make marketing decisions — skip any you want:
> 1. **Tradeoff hierarchy:** When performance, brand quality, and speed are in tension, what's your usual order?
> 2. **Evidence standard:** What convinces you more — experiment data, channel analytics, competitor benchmarks, or your own synthesis?
> 3. **Decision bar:** Can you move forward with 70% confidence, or do you typically need 90%+?
> 4. **Acceptable failure:** What kind of failure is OK (a learning experiment), vs. what kind is not OK (an avoidable mistake)?"

Record in `Thought frameworks`. If skipped, mark `Not specified` — do not invent defaults.

---

## Phase 5 — Active tasks

Ask:

1. What are your top 1–3 priorities this week? (P0 — must happen)
2. What should happen soon but isn't urgent? (P1 — this week or next)
3. Any backlog items worth capturing? (P2)
4. Any blockers right now — things waiting on someone else?

**Read-back rule:** After capture, read each priority level back separately and confirm before moving to the next. Do not batch-confirm all levels in one ask.

After user confirms all levels, propose updates to:
- `Tasks/active.md`
- `Tasks/backlog.md`

---

## Phase 6 — Goals and metrics

Ask:

1. What do you want to have achieved in the next 30 days? (Campaign launched, metric improved, team process established — be specific)
2. 60 days?
3. 90 days?

Then three focused follow-ups:

> "Three more:
> 1. Which team or company OKR does your 90-day goal ladder up to? ('Unknown / not set yet' is fine.)
> 2. If you had to name ONE metric that, if it moves, proves your quarter was a success — what is it and what's the target?
> 3. What specific thing would force you to abandon or pivot your top goal?"

Record as `OKR ladder-up`, `Single proof metric`, and `Goal 1 kill condition`. Pre-populate `GOALS.md` with KPI placeholder labels relevant to the user's role (from Phase 1B configuration).

---

## Phase 7 — Stakeholders

Ask:

1. Who are the 3–6 people the OS should know first? (Manager, direct collaborators, agency contacts, exec stakeholders)
2. Who approves, blocks, or influences your work?
3. What decisions are currently open on your primary campaign, project, or workstream?
4. What risks are already visible?

**Per-stakeholder rule:** For each person named, ask in conversation before drafting any file:
1. "[Name] — what's their role and seniority?"
2. "Why do they matter — approver, collaborator, agency partner, exec stakeholder?"
3. "Anything about their working style I should know?"

Only after those three fields are confirmed, propose a `Knowledge/People/[name].md` stub. Confirm per person before moving to the next.

---

## Phase 8 — Privacy boundaries

Run a guided privacy scan:

> "Quick privacy check — which of these should stay out of all files?
> - Budget numbers or spend data
> - Customer names or customer data
> - Competitive intelligence (pricing, strategy, M&A)
> - Agency fees or contract terms
> - HR or performance feedback
> - Health or family information
> - Anything else specific to your situation?"

Then ask:
1. Which files may the assistant edit without asking each time?
2. Which files require confirmation before edits?
3. Is this repo private, shared internally, or intended as a sanitized template?

---

## Phase 9 — Confirmation summary

Before writing any files, show:

```markdown
## Proposed setup

### Lark connection
- Status: [✅ verified / ❌ failed / ⏭ skipped]

### Identity
- Name: ...
- Role: ...
- Company: ...

### Role configuration
- Primary channels / areas: ...
- Primary KPIs: ...
- Key tools: ...
- Primary agent: ...
- Secondary agent: ...
- Area tags: ...

### Operating style
- Tone: ...
- Turn-offs: ...
- Ideal response feel: ...

### Cadence
- ...

### Initial tasks
- P0: ...
- P1: ...
- P2: ...

### Goals
- 30 days: ...
- 60 days: ...
- 90 days: ...

### Strategic alignment
- OKR ladder-up: ...
- Single proof metric: ...
- Goal 1 kill condition: ...

### Stakeholders
- ...

### Files I propose to update
- `CLAUDE.md`
- `GOALS.md`
- `Tasks/active.md`
- `Tasks/backlog.md`
- `Knowledge/People/...`
- `Projects/.../brief.md` if the user named a primary campaign/project that needs a dedicated brief

### Boundaries
- Never write: ...
- Ask before editing: ...

### File-by-file edit plan
- `CLAUDE.md`: identity, role, operating style, agent routing, area tags, cadence, quality gates, privacy boundaries
- `GOALS.md`: 30-60-90 outcomes, role-specific KPI placeholders, strategic alignment (OKR, proof metric, kill condition)
- `Tasks/active.md`: P0/P1 work, blockers, near-term commitments; area tags updated to match role
- `Tasks/backlog.md`: P2 work and future candidates
- `Knowledge/People/...`: confirmed stakeholder profiles only
- `Projects/.../brief.md`: primary campaign/project context, open decisions, risks, if the user explicitly wants a dedicated project file
```

**Mandatory display rule.** Show the full Phase 9 summary — including file-by-file edit plan — before asking for approval. Do not ask "Ready?" without showing the summary first. If the user requests changes, revise and re-display before re-asking.

Ask: `Should I apply these setup changes? (Yes / No / Change X)`

Only proceed after an explicit "yes." "Sounds good" or "ok" do not count — re-confirm explicitly.

---

## Phase 10 — Write files

**Per-file write rule.** For each file in the confirmed edit plan, in order:

1. Ask: "Ready for me to update `[filename]`?"
2. Wait for explicit "yes."
3. Write the file.
4. Show a one-line confirmation: "Updated `[filename]`. Next: `[next filename]`."
5. Move to the next file.

Only after every file is written:

1. Show a concise change summary.
2. Recommend the first three commands based on the confirmed role:
   - Performance Marketing Manager: `/today`, `/weekly-performance-report`, `/campaign-brief [name]`
   - Content & SEO Lead: `/today`, `/content-brief [topic]`, `/channel-review`
   - Lifecycle Marketing Manager: `/today`, `/email-brief [campaign]`, `/experiment-brief [test]`
   - Website Product Owner: `/today`, `/experiment-brief [test]`, `/channel-review`
   - Analytics & Data Lead: `/today`, `/weekly-performance-report`, `/channel-review`
   - Growth Lead: `/today`, `/team-standup`, `/weekly-performance-report`
3. Ask whether the user wants to run `/today` immediately.

---

## Phase 11 — Verify onboarding completed cleanly

Run this check before declaring onboarding finished.

| Check | How to verify | If it fails |
|---|---|---|
| **Lark connected** | Setup capture shows `✅ verified`, or user explicitly skipped with a follow-up logged. | Re-run Phase 0B, or open `Workflows/lark-setup.md`. |
| **OS mode confirmed** | Setup capture shows `OS mode: personal` or `OS mode: team`. | Re-run Phase 0C. |
| **TEAM.md populated (team OS only)** | `TEAM.md` has ≥1 non-placeholder member row. | Re-run Phase 0C team roster collection. |
| **TEAM-GOALS.md populated (team OS only)** | `TEAM-GOALS.md` has ≥1 OKR objective with at least one KR and an owner. | Re-run Phase 0C OKR capture. |
| **Projects/README.md initialized** | `Projects/README.md` exists. | Create it from `Projects/README.md` template. |
| **Placeholders filled** | Grep `CLAUDE.md`, `GOALS.md`, `Tasks/active.md` for `[YOUR_`, `[STAKEHOLDER_`, `[METRIC_`. Any remaining brackets must be explicit user choices. | Ask user to fill or confirm keeping. |
| **Role set** | `CLAUDE.md` → `Role` is not a bracketed list. | Re-run Phase 1. |
| **Area tags match role** | `CLAUDE.md` → `Conventions` area tags match the role's configured tag set. | Re-run Phase 1B. |
| **Primary agent set** | `CLAUDE.md` → `Primary agent` is not placeholder text. | Re-run Phase 1B. |
| **KPIs specific** | Each KPI in `GOALS.md` names an actual metric and target, not just a category. | Re-run Phase 6. |
| **Active tasks present** | `Tasks/active.md` has ≥1 P0 or P1 item that is not a template placeholder. | Re-run Phase 5. |
| **At least one stakeholder started** | `Knowledge/People/` has ≥1 non-template file, or user explicitly deferred. | Re-run Phase 7. |
| **Privacy boundaries recorded** | `CLAUDE.md` → `Privacy boundaries` is not a bracketed placeholder. | Re-run Phase 8. |

Report as a checklist (✅ / ❌) to the user.

**Three-way resolution for ❌ items:**
- **(a) Fill it now** — capture the value and update the file.
- **(b) Defer with a follow-up** — record in `Tasks/follow-ups.md` with a date.
- **(c) Accept intentionally** — user states written reason why the placeholder stays; record that reason in `CLAUDE.md` next to the field.

Only say "Onboarding complete" after every ❌ row is resolved.

---

## Re-running onboarding

The user can re-run at any time by saying `Computer, onboard me into this OS` again. On re-run:

1. Read current `CLAUDE.md`, `GOALS.md`, `Tasks/active.md` to see what's already set.
2. **Always re-confirm the role and primary KPIs explicitly** — e.g., "You previously set your role as Performance Marketing Manager. Still right?"
3. For non-critical fields, ask which sections the user wants to update rather than restarting from scratch.
4. Do not silently carry over role, KPIs, or quality gates — confirm each explicitly in this run.

---

## Dry-run acceptance test

Use this test before shipping onboarding changes.

### Test profile

```markdown
- Name: Jamie Tan
- Role: Performance Marketing Manager
- Company: Acme Growth Co.
- Channels: Google Search, Meta
- Primary KPIs: CAC, ROAS, CPL
- Tools: Google Ads, Meta Ads Manager, Looker
- Manager: Sarah Chen
- Anchor project: Q3 Paid Acquisition Campaign
- Privacy boundaries: no budget numbers, no customer names, no agency fees
```

### Pass criteria

The dry run passes only if the assistant:

1. Starts from the trigger phrase without requiring knowledge of internal file structure.
2. Asks role-selection question and branches correctly to Phase 1B-A.
3. Captures channels, KPIs, and tools in Phase 1B before moving on.
4. Asks about operating style, cadence, goals, and stakeholders separately.
5. Does not write any files until Phase 9 summary is shown and explicitly approved.
6. Produces a Phase 9 summary with role-specific agent routing, area tags, and file-by-file edit plan.
7. Recommends `/today`, `/weekly-performance-report`, and `/campaign-brief` after setup.

### Fail signals

Tighten before shipping if the assistant:

- Assumes a role or channels without asking.
- Skips Phase 1B branching.
- Writes files before confirmation.
- Uses PM-specific terminology (PRD, roadmap, sprint, engineering handoff).
- Produces generic goals that don't reflect the user's stated channels and KPIs.
- Ignores privacy boundaries the user set.
