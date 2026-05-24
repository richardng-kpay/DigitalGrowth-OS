# How This Works

The goal of this OS is simple: **automate the recurring structure around digital growth and marketing work** so the team can spend more time on judgment, creative decisions, and experiments — less on typing the same status formats, finding the right templates, and re-assembling context.

This doc explains how the pieces fit together — agents, skills, workflows, templates, and Knowledge — and how a typical growth team week runs through them.

---

## Where work lives

This repository is the working OS. Each team member runs onboarding to configure it for their specific role, channels, KPIs, and stakeholders.

Run onboarding first:

```text
Computer, onboard me into this OS.
```

The onboarding workflow asks your role on the growth team (Performance Marketer, Content/SEO, Lifecycle, Website Owner, Analytics, or Growth Lead), your specific channels and KPIs, and your operating style — **before it writes any files**. Each role gets a different configuration.

---

## The 3-layer model

```
┌─────────────────────────────────────────────────────┐
│  Layer 3 — SKILLS  (.claude/skills/)                │
│  Slash commands. One-shot triggers.                 │
│  e.g. /today  /weekly-performance-report            │
│       /campaign-brief  /experiment-brief            │
└─────────────────────────────────────────────────────┘
                       ↑
┌─────────────────────────────────────────────────────┐
│  Layer 2 — AGENTS  (Agents/GrowthTeam/)             │
│  Marketing specialists. Each owns a domain          │
│  and reads/writes specific files.                   │
└─────────────────────────────────────────────────────┘
                       ↑
┌─────────────────────────────────────────────────────┐
│  Layer 1 — KNOWLEDGE  (CLAUDE.md, GOALS.md,         │
│  Knowledge/, Tasks/, Projects/)                     │
│  Persistent context. Agents read this               │
│  before they answer.                                │
└─────────────────────────────────────────────────────┘
```

**The trick to high automation: Layer 1 quality.**  
The more accurately `CLAUDE.md` and `GOALS.md` describe your role, channels, KPIs, and stakeholders, the more an agent can do without asking repeated questions.

---

## A typical growth team week, automated

| Moment | You type / say | What happens |
|---|---|---|
| **First setup** | `Computer, onboard me into this OS` | Asks your role, channels, KPIs, cadence — then proposes setup before writing any files |
| **Mon morning** — start the week | `/today` | Reads `Tasks/active.md`, surfaces 3 priorities for your channel, flags blockers |
| **Mon** — new campaign needed | `/campaign-brief [name]` | Opens `Templates/campaign-brief.md` pre-filled with your channel context; prompts for audience, budget, KPIs, flight dates |
| **Tue** — content needed for a campaign | `/content-brief [topic]` | Opens `Templates/content-brief.md`; asks for keyword, audience, funnel stage, CTA |
| **Wed** — experiment idea | `/experiment-brief [test]` | Opens `Templates/experiment-brief.md`; calculates sample size, sets read date, documents hypothesis |
| **Thu** — email campaign due | `/email-brief [campaign]` | Opens `Templates/email-brief.md`; prompts for segment, subject line options, CTA, UTM parameters |
| **Thu** — before anything ships | `/brief-review [file]` | Routes to Creative Reviewer for audience fit, message clarity, CTA check |
| **Fri morning** — weekly report due | `/weekly-performance-report` | Reads channel data from `Tasks/active.md` and `Projects/`, drafts the weekly report in `Templates/weekly-performance-report.md` format |
| **Fri** — channel not hitting target | `/channel-review [channel]` | Pulls this channel's performance, compares to target, surfaces what worked and what didn't, recommends next actions |
| **Quarter end** | `/quarterly-marketing-planning` | Reviews OKR progress, drafts next quarter's channel priorities and experiment backlog |
| **New campaign launch** | `new project [campaign name]` | Creates `Projects/[name]/` with campaign brief scaffolded from template |
| **Post-campaign** | `/campaign-retrospective [project]` | Structured retro: performance vs. goal, creative learnings, budget efficiency, recommendations for next campaign |

What's left for the human? **The judgment.** Reviewing drafts, deciding the call, approving the brief, making the creative choice. The OS automates the structure — not the strategy.

---

## How agents compose

Skills don't run in isolation. A single `/campaign-brief` triggers a chain:

```
/campaign-brief [campaign]
       │
       ▼
Performance Marketer (or relevant channel agent)
       │
       ├──► reads GOALS.md (KPI context)
       ├──► reads Knowledge/Segments/ (audience context)
       ├──► reads Tasks/active.md (current priorities)
       ├──► reads Knowledge/Decisions/ (prior channel decisions)
       │
       └──► drafts campaign brief using Templates/campaign-brief.md
               │
               └──► routes to Creative Reviewer before approval
```

This pattern repeats across the board. **Skills** are the trigger surface. **Agents** provide domain judgment. **Knowledge** is what agents read to stay current.

---

## What the implemented surface automates

| Capability | Implemented surface | Frees you from |
|---|---|---|
| **Onboarding** | `Workflows/interactive-onboarding.md` | Manually editing a blank template, guessing which fields matter |
| **Daily ops** | `/today` | Rebuilding context every morning |
| **Campaign planning** | `/campaign-brief`, `Templates/campaign-brief.md` | Blank-page syndrome on every new campaign |
| **Content production** | `/content-brief`, `Templates/content-brief.md` | Inconsistent brief formats across writers |
| **Experiment design** | `/experiment-brief`, `Templates/experiment-brief.md` | Missed sample sizes, no read dates, undocumented hypotheses |
| **Email campaigns** | `/email-brief`, `Templates/email-brief.md` | Incomplete briefs missing UTMs, segmentation, or QA checklists |
| **Performance reporting** | `/weekly-performance-report`, `Templates/weekly-performance-report.md` | Re-formatting the same numbers every week |
| **Channel reviews** | `/channel-review`, `Templates/channel-review.md` | Inconsistent retrospective quality across channels |
| **Pre-publish quality** | `/brief-review`, Creative Reviewer agent | Shipping copy that wasn't checked for audience fit |
| **Lifecycle design** | `Templates/lifecycle-stage-doc.md` | Undocumented lifecycle stages that only one person understands |
| **Competitor intel** | `Templates/competitor-snapshot.md` | Competitive learnings lost in Slack or email |
| **Decision records** | `Templates/decision.md`, `Knowledge/Decisions/` | Repeating past mistakes because decisions weren't documented |

---

## Templates vs Workflows vs Skills — when to use what

- **Template** (`Templates/*.md`) = a document **shape**. Use when you want consistent structure across many docs of the same kind. Example: `Templates/campaign-brief.md`.
- **Workflow** (`Workflows/*.md`) = a **process**. Step-by-step instructions the assistant follows for repeatable multi-step work. Example: `Workflows/interactive-onboarding.md`.
- **Skill** (`.claude/skills/*/SKILL.md`) = a **shortcut**. Fast trigger for a common task. Example: `/weekly-performance-report`.

**Rule of thumb:** Start with templates. Graduate to skills once you've used the same template 3+ times and want one-keystroke access.

---

## Role-based configuration — who gets what

Each team member who runs onboarding gets a tailored configuration based on their role:

| Role | Primary agent | Default templates surfaced | Area tags |
|---|---|---|---|
| Performance Marketer | `performance-marketer.md` | `campaign-brief`, `weekly-performance-report`, `experiment-brief` | `#paid` `#analytics` |
| Content & SEO Lead | `content-strategist.md` | `content-brief`, `channel-review`, `competitor-snapshot` | `#content` `#seo` |
| Lifecycle Marketer | `lifecycle-marketer.md` | `lifecycle-stage-doc`, `email-brief`, `experiment-brief` | `#email` `#lifecycle` |
| Website Product Owner | `website-owner.md` | `experiment-brief`, `channel-review`, `campaign-brief` | `#web` `#analytics` |
| Analytics & Data Lead | `data-analyst.md` | `weekly-performance-report`, `channel-review`, `experiment-brief` | `#analytics` `#strategy` |
| Growth Lead | `growth-lead.md` | `campaign-brief`, `weekly-performance-report`, `experiment-brief` | `#strategy` all channels |

---

## How to push automation further

1. **Update `Tasks/active.md` daily.** This is what `/today` and `/weekly-performance-report` read from. Stale tasks → stale automation.
2. **Fill `Knowledge/Segments/` with real audience profiles.** Every campaign brief, email brief, and content brief gets sharper when the segments are defined and current.
3. **Record experiment results in `Knowledge/Hypotheses/`.** The learning library compounds. Future experiments build on past results instead of starting from zero.
4. **Keep `Knowledge/Decisions/` updated.** Channel budget calls, attribution model choices, lifecycle strategy pivots — document them so the next person (or next session) knows why.

Done well, the work that *isn't* automated shrinks to:
- Approving the draft
- The actual creative call
- The strategic judgment only you can make

Everything else — finding the template, formatting the report, checking the hypothesis logic, sourcing the audience profile — is the OS's job.

---

## Quick-start checklist

- [ ] Day 1 (20 min): run `Computer, onboard me into this OS`
- [ ] Day 1 (15 min): review and approve proposed edits to `CLAUDE.md`, `GOALS.md`, and task files
- [ ] Day 2 (15 min): list your 3–5 key stakeholders in `Knowledge/People/`
- [ ] Day 2: try `/today` — see what's missing, fill those gaps
- [ ] Day 3: draft your first campaign or content brief using the relevant template
- [ ] Day 4: try `/weekly-performance-report` — see how well the format captures your channel reality
- [ ] Day 5: run your first `/experiment-brief` for a test you've been meaning to run

By week 2 you'll know which templates and agents you actually use. Keep those; simplify anything that doesn't earn its maintenance cost.
