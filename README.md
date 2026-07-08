# DigitalGrowth-OS

A shared AI assistant setup for a digital growth team. Attach it to your Claude Cowork and it remembers your role, your channels, your KPIs, and your working style — so you're not re-explaining yourself every time you open a chat. It walks you through setup itself, gets smarter the more you use it, and receives improvements from the OS owner every week without ever touching your personal data.

(For the technically inclined: a multi-agent operating-system template — marketing templates, repeatable workflows, Claude/Codex skills, a persistent per-user memory layer, and role-adaptive configuration.)

**Roles supported:** Performance Marketing Manager · Content & SEO Lead · Lifecycle Marketing Manager · Website Product Owner · Analytics & Data Lead · Growth Lead

---

## Start here: first-run setup

**Using Claude Cowork (most team members)?** Attach this folder inside your Cowork and say anything (even just `hi`) — on first run the OS offers to set itself up, whatever your first message is. That's the whole step 1; skip the table below, it's for command-line setups.

The OS is harness-neutral. Onboarding also works in **Claude Code**, **Codex CLI**, and **Gemini CLI**:

| Harness | Entry-point file | What you do |
|---|---|---|
| Claude Code | `CLAUDE.md` | Open the repo in Claude Code (CLI, desktop, or VS Code extension) |
| Codex CLI | `AGENTS.md` | Run `codex` from the repo root |
| Gemini CLI | `GEMINI.md` | Run `gemini` from the repo root |

Then, in any harness:

1. Say anything — on a fresh copy the OS offers onboarding by itself. The explicit trigger also works:
   ```text
   Computer, onboard me into this OS.
   ```

2. Answer the setup interview. You will be asked your **role on the growth team** first — the rest of the interview branches based on that answer. A Performance Marketer gets different questions from a Lifecycle Marketer.

3. Review the proposed file edits before approving. The workflow shows a full summary before writing anything, then confirms the writes in two explicit gates (your personal layer, then the shared working files) — "sounds good" does not count as approval.

4. After setup, start your first session:
   ```text
   /today
   ```

**Expected first-run outcome:** your personal layer created at `Users/<you>/` — `config.md` with your role, channels, KPIs, operating style, and agent routing, plus a seeded memory index. `GOALS.md` with your 30-60-90 marketing goals. `Tasks/active.md` with this week's priorities. Stakeholder stubs in `Knowledge/People/`. `CLAUDE.md` itself is never personalized — it stays template-only so weekly updates never conflict with your data.

> **One thing to do after onboarding:** your personal layer (`Users/<you>/`) exists only on your machine. Copy that folder somewhere safe occasionally — if the OS folder is ever deleted or re-created from GitHub, that backup is what restores your memory.

---

## The two layers: how updates and personal data coexist

Two kinds of files, two rules:

- **Shared template** — rules, agents, skills, workflows, templates. Updated weekly from this repo via `/os-update`. (In git terms: tracked.)
- **Your personal layer** — `Users/<you>/`: identity, operating style, memory, feedback. Updates never touch it, and it is never committed to the team repo. (In git terms: gitignored.)

Claude doesn't reliably remember you between chats — most team accounts run through a gateway that keeps little or no chat memory. So **this folder does the remembering instead**: anything durable (your role, preferences, decisions, corrections) is saved as a file in `Users/<you>/memory/` and reloaded at every session start. You don't have to manage it — `/eod` saves the day's learnings automatically, and a compact digest (`claude-project-digest.md`) can be re-uploaded to your claude.ai Project knowledge so chats outside this folder know you too.

See `Users/README.md` for the full layer contract.

---

## Lark wiki integration

This OS reads your team's Lark wiki to answer project questions — strategy docs, experiment notes, vendor evaluations, stakeholder interviews. Search happens under **your personal Lark credentials**, not a shared account, so each team member must connect their own Lark MCP once before the wiki features work.

**Onboarding (Phase 0B) runs a connection test automatically.** If the test fails, it pauses and points you to `Workflows/lark-setup.md` — follow that guide, then resume onboarding.

- **Setup guide:** `Workflows/lark-setup.md`
- **Full doc index:** `Knowledge/Reference/lark-wiki-index.md` (populate after connecting)

---

## What this is

A growth marketer's daily work is high-context, multi-channel, and fast-moving. On any given day you're switching between campaign briefs, performance reviews, experiment design, email segmentation, and stakeholder updates — each needing different context, different templates, and different output formats.

A single AI assistant with one long prompt can't handle this well. It conflates channels, loses context, and produces generic output.

**This OS solves that** with a multi-agent architecture where:
- Each agent owns a specific marketing domain
- Agents coordinate through a shared file system (not direct calls)
- Each team member's configuration and memory live in their own user layer
- The assistant gets more accurate with use — corrections are written to memory so wrong answers don't repeat, and every claim is grounded in wiki sources or labeled as conjecture
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

20 slash commands ship with the OS. Available immediately after onboarding.

**Daily work:**

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
| `/synthesize-research` | Turns research notes into grounded themes, pain points, implications |
| `/team-standup` | Weekly team sync — blockers, handoffs, decisions across members |
| `/wiki-ingest` | Knowledge maintenance — promotes Lark findings into durable Knowledge files |

**OS rhythm (memory, updates, feedback):**

| Skill | When | What it does for you |
|---|---|---|
| `/daily-sync` | Morning | Consolidates memory, refreshes the claude.ai project digest, hands off to `/today` |
| `/eod` | End of day | Saves the day's decisions, corrections, and insights so tomorrow starts smarter |
| `/os-update` | Weekly | Pulls the latest template improvements; your personal files always win on conflict |
| `/os-feedback` | Anytime | Rates the OS and routes feedback to the OS owner (local log + shared Lark base) |
| `/wiki-maintain` | Weekly | Checks Knowledge index drift, stale evidence, and orphan pages |
| `/os-contract-check` | Before releases | Confirms docs, skills, workflows, templates, and evals still line up |
| `/evals` | Before model/workflow changes | Runs eval suites with transcript capture and independent grading |
| `/eval-review` | Before citing evals | Audits whether an eval result is citable |

---

## Templates

12 templates in `Templates/` — marketing docs, Knowledge scaffolds, and the reviewer-verdict schema:

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
| `hypothesis.md` | Hypothesis candidates and experiment learnings |
| `segment-profile.md` | Audience segment profiles used by briefs and review gates |
| `reviewer-verdict-schema.md` | Verdict format used by the review gates (pass / changes / revise) |

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
├── CLAUDE.md                         ← Team-wide rules: routing, gates, Lark protocol (never personalized)
├── CHANGELOG.md                      ← Versioned template releases, newest first
├── GOALS.md                          ← 30-60-90 goals, KPI targets, stakeholders
│
├── Users/                            ← THE USER LAYER (personal, stays on your machine)
│   ├── .active-user                  ← Names the active user; absence = first run
│   ├── _template/                    ← Blank scaffold copied at onboarding
│   └── <you>/                        ← config.md · memory/ · feedback-log.md · usage-log.md
│
├── Agents/
│   ├── README.md                     ← Agent overview and routing table
│   └── GrowthTeam/                   ← 7 marketing role agents + team-lead view
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
│       ├── company.md                ← Company and brand context
│       ├── provenance-tags.md        ← Evidence-tag rules and decay windows
│       └── lark-wiki-index.md        ← Lark wiki doc index (populated after connecting)
│
├── Templates/                        ← 12 document templates
├── Workflows/
│   ├── interactive-onboarding.md     ← Role-adaptive setup interview (11 phases)
│   └── lark-setup.md                 ← Lark MCP credential setup + troubleshooting
├── Evals/                            ← Onboarding and synthesis eval suites
├── Meetings/                         ← Meeting notes
└── .claude/
    └── skills/                       ← 20 slash commands (mirrored in .agents/skills/)
```

---

## Staying up to date

The OS owner ships template improvements through this repo — new skills, better workflows, fixes. Each release bumps the `OS-Version` marker in `CLAUDE.md` and adds a `CHANGELOG.md` entry.

Run `/os-update` weekly (or schedule it). It fetches the latest template, shows what changed in plain language, and merges with a hard guarantee: **your personal files always win on conflict**. `GOALS.md`, `Tasks/`, `Knowledge/People/`, `Projects/`, and everything in `Users/` survive every update.

Have opinions about the OS? `/os-feedback` sends them to the OS owner — rating, friction points, and a wish for the next release.

---

## Privacy and GitHub

**Know what is and isn't committed by default:**

- **Only `Users/<you>/` is excluded from git by default.** Your identity, memory, and feedback never reach the team repo — but they also exist only on your machine, so back that folder up occasionally.
- **`GOALS.md`, `Tasks/`, `Knowledge/People/`, and `Projects/` are tracked.** If you fill them with real budgets, stakeholder names, or campaign data and then commit and push, that data ships to the repo. The real protection for team members is simple: **never commit or push — `/os-update` only pulls.**
- **Forking or pushing a personalised copy (OS owner territory):** uncommenting the `.gitignore` entries for those files is **not enough on its own** — git keeps tracking files it already knows about. You must also run `git rm --cached <file>` to untrack each one, and remove or anonymise stakeholder names, company strategy, budget figures, and customer data before pushing.

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
