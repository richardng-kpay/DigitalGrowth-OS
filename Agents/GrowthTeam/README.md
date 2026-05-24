# Growth Team Agents — Architecture

## "Computer" — The Invocation Pattern

When you say **"Computer, [task]"**, the system routes to the right agent automatically.

### Routing table

| "Computer, ..." | Routes to | Model | Voice |
|---|---|---|---|
| what should I focus on today | Growth Lead | Sonnet | Strategic, outcome-first |
| how is paid performing / what's our CAC | Performance Marketer | Haiku → Sonnet | Data-first, channel-specific |
| what should we write about / why isn't [page] ranking | Content Strategist | Sonnet | Evidence-first, audience-centric |
| what do we send to users who haven't activated | Lifecycle Marketer | Sonnet | User-empathetic, sequence-aware |
| why is our landing page CVR dropping / start a CRO test | Website Owner | Sonnet | Conversion-obsessed, hypothesis-driven |
| is this experiment significant / pull the funnel data | Data Analyst | Haiku → Sonnet | Precise, uncertainty-aware |
| review this email / is this ad copy clear | Creative Reviewer | Haiku → Sonnet | Reader-first, honest, specific |
| what should the team prioritise this quarter / experiment backlog | Growth Lead | Opus | Strategic, OKR-connected |

### Model complexity tiers

| Tier | Model | When |
|---|---|---|
| **Fast** | `claude-haiku-4-5-20251001` | Daily ops, quick metric pulls, triage, QA checks. Never in agentic loops with untrusted input. |
| **Standard** | `claude-sonnet-4-6` | Default — campaign briefs, channel analysis, experiment design, weekly reports, most skills |
| **Deep** | `claude-opus-4-7` | Quarterly strategy, attribution model review, complex experiment design, long-form content |

---

## Agent roster

| Agent | File | Primary domain | Quality gate |
|---|---|---|---|
| Growth Lead | `growth-lead.md` | Strategy, OKRs, experiment prioritisation, exec reporting | Owns strategic decisions |
| Performance Marketer | `performance-marketer.md` | Paid media, SEM, CAC/ROAS, budget | Routes to Creative Reviewer pre-launch |
| Content & SEO Strategist | `content-strategist.md` | Editorial calendar, content briefs, SEO, organic traffic | Routes to Creative Reviewer pre-publish |
| Lifecycle Marketer | `lifecycle-marketer.md` | Email/push flows, segmentation, activation, retention | Routes to Creative Reviewer pre-send |
| Website Product Owner | `website-owner.md` | CRO, A/B tests, landing pages, web analytics | Routes to Creative Reviewer pre-publish |
| Analytics & Data Lead | `data-analyst.md` | Attribution, dashboards, experiment reads, KPI reporting | Owns data truth |
| Creative Reviewer | `creative-reviewer.md` | Pre-publish gate for all external artifacts | **Mandatory gate — all channels** |

---

## 3-Layer architecture

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
│  Marketing-domain specialists. Each owns a set      │
│  of tasks and reads/writes specific files.          │
└─────────────────────────────────────────────────────┘
                       ↑
┌─────────────────────────────────────────────────────┐
│  Layer 1 — KNOWLEDGE  (CLAUDE.md, GOALS.md,         │
│  Knowledge/, Tasks/, Projects/)                     │
│  Persistent context. The "memory" agents read       │
│  before they answer.                                │
└─────────────────────────────────────────────────────┘
```

---

## File ownership (no conflicts)

Each agent writes to its own files. No two agents write to the same file.

| File / directory | Sole writer |
|---|---|
| Campaign briefs in `Projects/[campaign]/` | Performance Marketer (paid), Content Strategist (organic), Lifecycle Marketer (email) |
| `Tasks/active.md` priorities | Initiating agent writes its own section |
| `Knowledge/Hypotheses/` results | Agent who ran the experiment |
| `Knowledge/Decisions/` strategic calls | Growth Lead |
| Weekly performance report | Data Analyst (metrics); each channel agent contributes its section |
| `Knowledge/Segments/` | Lifecycle Marketer owns; others read |

---

## Pre-publish quality gate

Every external artifact — ad, email, landing page, content piece, campaign brief — must pass through **Creative Reviewer** before shipping.

```
Any channel agent
       │
       ├──► writes artifact draft
       │
       └──► routes to Creative Reviewer
               │
               ├──► Pass → ship
               ├──► Pass with changes → agent fixes, ships
               └──► Revise and resubmit → back to agent
```

This is not optional. The Creative Reviewer is the mandatory pre-ship gate for all external artifacts.

---

## User-configured primary agent

During onboarding (Phase 1B), the user's role determines which agent is their primary:

| User's role | Primary agent | Secondary agent |
|---|---|---|
| Performance Marketing Manager | `performance-marketer.md` | `data-analyst.md` |
| Content & SEO Lead | `content-strategist.md` | `creative-reviewer.md` |
| Lifecycle Marketing Manager | `lifecycle-marketer.md` | `data-analyst.md` |
| Website Product Owner | `website-owner.md` | `data-analyst.md` |
| Analytics & Data Lead | `data-analyst.md` | `growth-lead.md` |
| Growth Lead | `growth-lead.md` | routes to all others |
