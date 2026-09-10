# Growth Toolkit

> **Generated directory — do not edit these files.** They are rebuilt from the Digital Growth OS
> sources by `scripts/build-plugin.sh`. Edit `.claude/skills/`, `Agents/GrowthTeam/`, `Templates/`
> or `Evals/` in the repo root instead, then re-run the build.

Seven growth role agents and ten campaign skills, packaged for people who want the tools without
adopting the whole Digital Growth OS.

## Install

```bash
claude plugin marketplace add richardng-kpay/DigitalGrowth-OS
```

```bash
claude plugin install growth-toolkit@kpay-growth
```

## What you get

**Agents** — invoke by name, or let Claude route to them.

| Agent | Owns |
|---|---|
| `growth-lead` | Cross-channel strategy, prioritisation, budget trade-offs |
| `performance-marketer` | Paid media, SEM, pacing, CAC/ROAS |
| `content-strategist` | Editorial calendar, keyword and search-intent strategy |
| `lifecycle-marketer` | Email/push flows, segmentation, activation, retention |
| `website-owner` | CRO, landing pages, on-site tests |
| `data-analyst` | Attribution, dashboards, experiment reads |
| `creative-reviewer` | Pre-publish gate on copy and briefs |

**Skills** — `/campaign-brief` · `/content-brief` · `/email-brief` · `/experiment-brief` ·
`/channel-review` · `/weekly-performance-report` · `/brief-review` · `/synthesize-research` ·
`/evals` · `/eval-review`

Prefix with `growth-toolkit:` if a name collides with something else you have installed.

## What you do not get

The OS's workspace layer — `Tasks/`, `Knowledge/`, per-user memory, the Lark wiki connection,
and the daily-routine skills (`/today`, `/eod`, `/daily-sync`) that depend on them. These skills
and agents ask you for that context inline instead. If you want the full system, clone
[DigitalGrowth-OS](https://github.com/richardng-kpay/DigitalGrowth-OS) and run onboarding —
but then do **not** also install this plugin, or these 10 skills will appear twice.

## Updates

New versions arrive automatically as the source repo changes. To force a check:

```bash
claude plugin update growth-toolkit
```
