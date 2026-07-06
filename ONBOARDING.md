# Digital Growth OS — Quick Start

A role-adaptive operating system for digital growth teams. One folder, seven specialised agents, and a structured knowledge base — configured to your role, channels, and KPIs in a single interactive session.

---

## Requirements

**Claude Code desktop app** (not the claude.ai chat app — onboarding writes files to your local workspace).

- Download: [claude.ai/code](https://claude.ai/code)
- Open this folder as your workspace root in Claude Code

---

## One trigger to start

```
Computer, onboard me into this OS
```

That's it. (If you just attached this folder, Claude offers onboarding on its own — no phrase needed.) Claude will run an interactive session that captures:

- Your name, role, company, and reporting line
- Channels you own and KPIs you track
- 30-60-90 goals and key stakeholders
- Your operating style (tone, detail level, pushback, decision style)
- Thought frameworks (evidence standard, tradeoff priority, certainty bar)

After reviewing a full summary, you confirm — then Claude writes your personal config into `Users/<your-name>/` (gitignored — it never leaves your machine and is never touched by template updates).

---

## Daily commands (after onboarding)

| Command | What it does |
|---------|--------------|
| `/today` | Daily standup: tasks, blockers, focus |
| `/todo` | Add, complete, or block tasks in `Tasks/active.md` |
| `/campaign-brief` | Draft a campaign brief from a one-line prompt |
| `/content-brief` | Draft a content brief |
| `/experiment-brief` | Design an experiment with hypothesis + success criteria |
| `/email-brief` | Draft an email brief |
| `/weekly-performance-report` | Weekly channel performance summary |
| `/brief-review` | Pre-publish quality gate on any brief or copy |
| `/channel-review` | Channel strategy health check |
| `/team-standup` | Team sync for shared OS installs: blockers, handoffs, decisions |
| `/wiki-ingest` | Knowledge maintenance after useful Lark wiki searches |

## The standing rhythm (what makes memory persist)

| Command | When | What it does |
|---------|------|--------------|
| `/daily-sync` | Every morning | Consolidates your memory, refreshes your claude.ai project digest, hands off to `/today` |
| `/eod` | End of day | Sweeps the day's decisions, corrections, and insights into `Users/<you>/memory/` |
| `/os-update` | Weekly | Pulls the latest OS template from GitHub — your personal files are protected |
| `/os-feedback` | Anytime | Tells the OS owner what's working and what isn't |

Your Claude account may not retain memory between chats (3P gateway accounts usually don't).
This OS works around that: **everything durable lives in files inside this folder**, loaded at
every session start. `/eod` is the habit that makes it work.

---

## Privacy

Your identity, style, memory, and feedback live in `Users/<your-name>/`, which is **gitignored
by default** — it is never committed and never overwritten by updates. Because it's gitignored,
back it up occasionally (re-cloning the repo would lose it). If you also personalise the shared
working files (`GOALS.md`, `Tasks/`, `Knowledge/People/`, `Projects/`) and plan to push a fork,
uncomment the matching lines in `.gitignore` first.

---

## Further reading

- [README.md](README.md) — full setup reference and folder map
- [HOW-IT-WORKS.md](HOW-IT-WORKS.md) — how a real team week flows through the system
- [AGENTS.md](AGENTS.md) — agent roster and routing logic
