# DigitalGrowth-OS

A downloadable multi-agent operating-system template for digital growth and marketing teams. It combines marketing templates, repeatable workflows, Claude/Codex skills, and a role-adaptive configuration layer so each team member can turn a fresh clone into a useful daily work system.

**Roles supported:** Performance Marketing Manager · Content & SEO Lead · Lifecycle Marketing Manager · Website Product Owner · Analytics & Data Lead · Growth Lead

---

## Start here: first-run setup

The OS is harness-neutral. Onboarding works in **Claude Code**, **Codex CLI**, and **Gemini CLI**.

| Harness | Entry-point file | What you do |
|---|---|---|
| Claude Code | `CLAUDE.md` | Open the repo in Claude Code (CLI, desktop, or VS Code extension) |
| Codex CLI | `AGENTS.md` | Run `codex` from the repo root |

Then, in either harness:

1. Run:
   ```text
   Computer, onboard me into this OS.
   ```

2. Answer the setup interview. You will be asked your **role on the growth team** first — the rest of the interview branches based on that answer. A Performance Marketer gets different questions from a Lifecycle Marketer.

3. Review the proposed file edits before approving. The workflow shows a full summary before writing anything. Per-file confirmation is required — "sounds good" does not count.

4. After setup, start your first session:
   ```text
   /today
   ```

**Expected first-run outcome:** `CLAUDE.md` configured with your role, channels, KPIs, and agent routing. `GOALS.md` with your 30-60-90 marketing goals. `Tasks/active.md` with this week's priorities. Stakeholder stubs in `Knowledge/People/`.

---

## Lark wiki integration

This OS reads the KPay Digital Growth Lark wiki to answer project questions — strategy docs, experiment notes, vendor evaluations, stakeholder interviews. Search happens under **your personal Lark credentials**, not a shared account, so each team member must connect their own Lark MCP once before the wiki features work.

**Onboarding (Phase 0B) runs a connection test automatically.** If the test fails, it pauses and points you to `Workflows/lark-setup.md` — follow that guide, then resume onboarding.

- **Wiki root:** https://kpay-group.sg.larksuite.com/wiki/ATQ3wXAlvisKHJkLhJwl7ywBgCP
- **Setup guide:** `Workflows/lark-setup.md`
- **Full doc index:** `Knowledge/Reference/lark-wiki-index.md`

---

## What this is

A growth marketer's daily work is high-context, multi-channel, and fast-moving. On any given day you're switching between campaign briefs, performance reviews, experiment design, email segmentation, and stakeholder updates — each needing different context, different templates, and different output formats.

A single AI assistant with one long prompt can't handle this well. It conflates channels, loses context, and produces generic output.

**This OS solves that** with a multi-agent architecture where:
- Each agent owns a specific marketing domain
- Agents coordinate through a shared file system (not direct calls)
- Each team member's configuration is set by their role at onboarding
- A Creative Reviewer gate enforces quality before any external artifact ships

For how a typical growth team week runs through the system, see `HOW-IT-WORKS.md`.

---

## Onboarding: role-adaptive setup

The interview **branches by role** in Phase 1B. Each role gets different questions:

| Role | What's configured |
|---|---|
| **Performance Marketing Manager** | Channels (Google/Meta/TikTok/LinkedIn), KPIs (CAC, ROAS, CPA), budget cadence, reporting rhythm |
| **Content & SEO Lead** | Content types, SEO tools, publishing cadence, organic traffic KPIs |
| **Lifecycle Marketing Manager** | Lifecycle stages owned, email platform, segmentation approach, activation/retention KPIs |
| **Website Product Owner** | CMS, CRO tools, A/B test cadence, conversion rate KPIs |
| **Analytics & Data Lead** | BI tools, attribution model, reporting consumers, team KPIs |
| **Growth Lead** | Functions overseen, OKRs, experiment prioritisation method, planning cadence |

After Phase 1B, onboarding sets:
- Primary agent (matches the user's role)
- Secondary agent (closest analytical or review partner)
- Area tags for `Tasks/active.md`
- Default templates surfaced first
- KPI placeholders in `GOALS.md`

---

## Growth team agents

7 role agents in `Agents/GrowthTeam/`. Each team member's **primary agent** is configured during onboarding.

| Agent | Domain |
|---|---|
| **Growth Lead** | Cross-channel strategy, OKR ownership, experiment prioritisation |
| **Performance Marketer** | Paid media, SEM, budget pacing, CAC/ROAS |
| **Content & SEO Strategist** | Editorial calendar, content briefs, keyword strategy, organic traffic |
| **Lifecycle Marketer** | Email/push flows, segmentation, activation, retention |
| **Website Product Owner** | CRO, A/B tests, landing pages, web analytics |
| **Analytics & Data Lead** | Attribution, dashboards, experiment reads, KPI reporting |
| **Creative Reviewer** | **Mandatory pre-publish gate** — audience fit, message clarity, CTA, tone |

Invoke any agent with: `Computer, [task]` → routes automatically. Full routing table: `Agents/GrowthTeam/README.md`.

---

## Skills (slash commands)

9 slash commands ship with the OS. Available immediately after onboarding.

| Skill | What it does |
|---|---|
| `/today` | Daily brief — top 3 priorities, blockers, watch item |
| `/todo` | Add, complete, triage, or block tasks |
| `/weekly-performance-report` | Draft the weekly report across all channels |
| `/campaign-brief` | Interactive interview → fills `Templates/campaign-brief.md` |
| `/experiment-brief` | Designs an A/B test: hypothesis, sample size, read date |
| `/brief-review` | **Mandatory pre-publish gate** — checks any external artifact before it ships |
| `/channel-review` | Channel retrospective — vs. target, what worked, recommendations |
| `/email-brief` | Email campaign brief with UTMs and QA checklist |
| `/content-brief` | Content and SEO brief — keyword, intent, audience, outline |

---

## Templates

9 marketing-native templates in `Templates/`:

| Template | Use for |
|---|---|
| `campaign-brief.md` | Any paid, organic, or multi-channel campaign |
| `content-brief.md` | Blog posts, landing pages, case studies, SEO content |
| `weekly-performance-report.md` | Weekly channel metrics summary |
| `experiment-brief.md` | A/B tests across any channel or surface |
| `lifecycle-stage-doc.md` | Documenting a lifecycle stage: trigger, sequence, exit, metrics |
| `email-brief.md` | Email campaigns: segment, subject lines, UTMs, QA |
| `competitor-snapshot.md` | Paid, organic, and email competitive intelligence |
| `channel-review.md` | Post-period channel retrospective |
| `decision.md` | Channel decisions: options, reasoning, reversal conditions |

---

## Quality gate

Every external artifact — ad, email, landing page, content piece, campaign brief — must pass `/brief-review` before shipping. The Creative Reviewer agent checks:
- Audience fit
- Message clarity (3-second test)
- CTA strength
- Tone match for channel and lifecycle stage

Verdict: **Pass** / **Pass with changes** / **Revise and resubmit**. No exceptions.

---

## Directory structure

```
DigitalGrowth-OS/
├── CLAUDE.md                         ← Identity, role, routing, KPIs, operating contract
├── GOALS.md                          ← 30-60-90 goals, KPI targets, stakeholders
│
├── Agents/
│   ├── README.md                     ← Agent overview and routing table
│   └── GrowthTeam/                   ← 7 marketing role agents
│       ├── growth-lead.md
│       ├── performance-marketer.md
│       ├── content-strategist.md
│       ├── lifecycle-marketer.md
│       ├── website-owner.md
│       ├── data-analyst.md
│       └── creative-reviewer.md
│
├── Tasks/
│   ├── active.md                     ← Current priorities (#p0/#p1/#p2)
│   ├── backlog.md                    ← Ranked backlog
│   └── follow-ups.md                 ← Commitments from meetings and reviews
│
├── Projects/
│   └── [YOUR_ANCHOR_CAMPAIGN]/
│       └── brief.md                  ← Campaign brief (from template)
│
├── Knowledge/
│   ├── People/                       ← Stakeholder profiles
│   ├── Segments/                     ← Audience segment profiles
│   ├── Hypotheses/                   ← Experiment results: proposed → confirmed/rejected
│   ├── Decisions/                    ← Channel decisions with reversal conditions
│   └── Reference/
│       └── company.md                ← Company and brand context
│
├── Templates/                        ← 9 marketing document templates
├── Workflows/
│   ├── interactive-onboarding.md     ← Role-adaptive setup interview (11 phases)
│   └── lark-setup.md                 ← Lark MCP credential setup + troubleshooting
├── Evals/                            ← Onboarding and synthesis eval suites
├── Meetings/                         ← Meeting notes
├── _Registry/
│   └── reviewer-verdict-schema.md    ← Format for /brief-review verdict files
├── _temp/                            ← Working drafts (gitignored, not durable)
│
└── .claude/
    └── skills/                       ← 9 slash commands
        ├── today/
        ├── todo/
        ├── weekly-performance-report/
        ├── campaign-brief/
        ├── experiment-brief/
        ├── brief-review/
        ├── channel-review/
        ├── email-brief/
        └── content-brief/
```

---

## Privacy and GitHub

Before pushing a personalised copy:
- Remove or anonymise: stakeholder names, company strategy, budget figures, customer data
- The `.gitignore` includes commented-out entries for `CLAUDE.md`, `GOALS.md`, `Tasks/`, `Knowledge/People/`, and `Projects/` — uncomment these if you've filled in real personal context and want to share only the template shell

This repo is safe to push as-is while placeholders are still in place.

---

## Operating contract

Four default principles, configurable during onboarding:

1. **Channel-first thinking.** Every recommendation ties back to a specific channel, audience, or metric.
2. **Artifact quality.** Briefs and reports are designed for the intended reader.
3. **Test before scale.** Hypotheses run as experiments before budget commits.
4. **Numbers over narrative.** Name the metric, the target, and the delta.

---

Built on Claude Code and Codex CLI. Designed as a configurable, role-adaptive operating-system template for digital growth teams.
# DigitalGrowth-OS
