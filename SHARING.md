# Sharing this OS with other people

There are two ways to give someone what's in here, and picking the wrong one is the most common
mistake. Start with the question: **do they want a system, or do they want the tools?**

| | Full OS | Growth Toolkit plugin |
|---|---|---|
| **Who it's for** | The digital growth team | Anyone else — other KPay teams, colleagues who just want the briefs |
| **They get** | Everything: 7 agents, all 21 skills, `Tasks/`, `Knowledge/`, per-user memory, Lark wiki, daily routines | 7 agents, 10 of the 21 skills, the templates |
| **They must** | Run onboarding, keep the folder, run `/eod` | Nothing. Install and go. |
| **Updates via** | `/os-update` (a git pull) | Automatic on the marketplace path, or `claude plugin update`. The `.plugin` zip fallback is a manual re-send. |
| **Setup cost** | ~20 minutes | Two commands |

**Nobody should have both.** A full clone already exposes all 21 skills as project skills. Install
the plugin on top and its 10 skills appear a second time, namespaced `growth-toolkit:`.

---

## Path 1 — the full OS

Unchanged: they get the repo folder, attach it to Cowork (or open it in Claude Code), and the OS
offers onboarding on their first message. See [README.md](README.md) and
[ONBOARDING.md](ONBOARDING.md). They stay current with `/os-update`, which the session-start hook
prompts for whenever their copy is behind.

---

## Path 2 — the Growth Toolkit plugin

### What they run

```bash
claude plugin marketplace add richardng-kpay/DigitalGrowth-OS
```

```bash
claude plugin install growth-toolkit@kpay-growth
```

In **Cowork**, the same thing through the plugin UI. If a custom marketplace can't be added in
their build, fall back to a `.plugin` file:

```bash
cd plugins/growth-toolkit && zip -r /tmp/growth-toolkit.plugin . -x "*.DS_Store"
```

Drop that file into a Cowork chat and they can install it with one click. **A `.plugin` zip is a
snapshot with no auto-updates** — every fix means re-sending the file. Prefer the marketplace.

### How updates reach them

The marketplace metadata refreshes on its own, and because the plugin declares **no `version`**,
Claude resolves it by commit SHA — so **every push to `main` is an update**. That is deliberate;
`claude plugin validate` warns about the missing version, and the warning is expected. To force a
check:

```bash
claude plugin update growth-toolkit
```

New or changed skills load in their **next** session, not the current one.

### Pre-wiring it for a whole team

A team that wants it on by default in their own repo can commit this to their
`.claude/settings.json`, and it installs after they trust the folder:

```json
{
  "extraKnownMarketplaces": {
    "kpay-growth": {
      "source": { "source": "github", "repo": "richardng-kpay/DigitalGrowth-OS" }
    }
  },
  "enabledPlugins": { "growth-toolkit@kpay-growth": true }
}
```

### What the plugin deliberately leaves out

- `/today`, `/todo`, `/eod`, `/daily-sync`, `/team-standup`, `/wiki-ingest`, `/wiki-maintain` —
  they read `Tasks/`, `Users/`, and the `Knowledge/` spines, which plugin users don't have.
- `/os-update`, `/os-publish`, `/os-feedback`, `/os-contract-check` — clone-model plumbing.
- The `.mcp.json` servers (Lark, fathippo) and the session-start hook. **Verified absent from the
  built plugin** — an installer gets no KPay wiring and no request for a Lark secret.

The skills and agents that *do* ship each carry a "Running outside the full OS" note: they resolve
templates through `${CLAUDE_PLUGIN_ROOT}` and ask the user for goals, targets and audience context
inline rather than failing on a missing file.

---

## For the OS owner: how the plugin is built

`plugins/growth-toolkit/` is **generated — never edit it by hand.** Edit the canonical sources
(`.claude/skills/`, `Agents/GrowthTeam/`, `Templates/`, `Evals/`) and rebuild:

```bash
./scripts/build-plugin.sh
```

`/os-publish` runs `./scripts/build-plugin.sh --check` and blocks the release if the generated
tree is stale.

**Why generated instead of pointing the manifest at the real files?** Two findings from testing
the actual installs:

1. The `agents` path override in `plugin.json` is parsed — `claude plugin list` even reports
   *"Default agents/ folder is ignored because the manifest sets agents"* — but it loads **zero
   agents**. Only a default lowercase `agents/` directory at the plugin root works.
2. A plugin rooted at the repo (`"source": "./"`) auto-discovers the repo's `.mcp.json` and ships
   the Lark and fathippo servers to every installer. Setting `mcpServers` to `{}` does not
   suppress it.

A lowercase `agents/` can't sit beside the existing `Agents/` on a case-insensitive filesystem,
so the plugin needs its own root — hence the generated subtree. Adding a skill to the plugin means
adding its name to the `SKILLS` array in `scripts/build-plugin.sh` and rebuilding.

---

## Not yet: agents inside Lark chat

Letting colleagues use these agents by chatting to a bot in a Lark group is a **separate service**,
not a packaging change. The nearest existing thing — the Lark adapter in the Pricing Analyst
Copilot — is inbound-webhook-only (`LarkClient.send_text` raises `NotImplementedError`), scoped to
pricing governance, and not deployed. A growth bot needs an `im:message:send` scope, hosting, and a
decision about whose Lark identity the wiki searches run under. It also runs headfirst into two
rules in `CLAUDE.md`: no Haiku in agentic loops with untrusted input, and no untrusted input +
credentials + egress in one agent. Group-chat messages are untrusted input.

Scope it as its own repo, consuming this plugin as its skill source.
