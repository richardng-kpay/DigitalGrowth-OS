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

That's it. Claude will run an interactive session that captures:

- Your name, role, company, and reporting line
- Channels you own and KPIs you track
- 30-60-90 goals and key stakeholders
- Your operating style (tone, detail level, pushback, decision style)
- Thought frameworks (evidence standard, tradeoff priority, certainty bar)

After reviewing a full summary, you confirm — then Claude writes your config files.

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

---

## Privacy

Before committing or sharing this folder, uncomment the relevant lines in `.gitignore` to exclude your personal config files (CLAUDE.md, GOALS.md, Tasks/, Knowledge/People/, Projects/).

---

## Further reading

- [README.md](README.md) — full setup reference and folder map
- [HOW-IT-WORKS.md](HOW-IT-WORKS.md) — how a real team week flows through the system
- [AGENTS.md](AGENTS.md) — agent roster and routing logic
