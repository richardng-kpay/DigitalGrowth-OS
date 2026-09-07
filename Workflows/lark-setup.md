# Workflow: MCP Setup (Lark + fathippo)

Use this guide when an MCP connection test fails during onboarding, or when you're setting up the
Digital Growth OS for the first time on a new machine.

The repo ships **two** MCP servers in `.mcp.json` — `lark-mcp` (the live team wiki) and `fathippo`
(portable memory). Neither contains a credential: each reads one environment variable you export
yourself. Lark is covered first and in full; fathippo is at the end and takes about a minute.

---

## What is Lark MCP and why do I need it?

The Digital Growth OS searches your team's Lark wiki to answer project questions — strategy docs, experiment notes, vendor evaluations, stakeholder interviews, and more. It does this via the `lark-mcp` MCP server, which connects Claude Code to Lark's API.

**Your account, your access.** The MCP server uses your personal Lark credentials (User Access Token). You can only see documents your Lark account has been granted access to — the OS never uses someone else's token.

---

## Before you start

You need:
- An active **Lark account** for your organization (e.g. `yourname@yourcompany.com`) — you'll log in with this account via OAuth
- The **App Secret** for the shared team app `cli_a944aca53c381ed3` — ask Richard or your team lead for it via password manager or secure DM

If you don't have a Lark account, ask your IT or Lark admin to create one.

---

## Setup steps

### Step 1 — Confirm you have a Lark account

You need an active Lark account for your organization. If you don't have one, ask your IT or Lark admin to create it.

---

### Step 2 — The MCP server ships with the repo (`.mcp.json`)

**You do not need to hand-edit any JSON.** This repo includes a committed `.mcp.json` at its root that already defines the `lark-mcp` server (shared App ID, domain, token mode, tool list). When you open this folder in Claude Code, you'll be prompted to **approve the project MCP server** — say yes.

The one thing `.mcp.json` does **not** contain is the App Secret. It reads the secret from an environment variable:

```json
"env": {
  "APP_ID": "cli_a944aca53c381ed3",
  "APP_SECRET": "${LARK_APP_SECRET}"
}
```

So all you do is set that one env var before launching Claude Code:

```bash
# add to your ~/.zshrc (or ~/.bashrc), then restart your shell
export LARK_APP_SECRET="paste-the-secret-here"
```

**The App ID `cli_a944aca53c381ed3` is the shared team app** — same for everyone, safe to keep in the repo.

**Where to get the secret:**
- It is **not** stored in this repo. Ask Richard (or your team lead) for it via a password manager or secure DM.
- Put it in your **own** shell env (`LARK_APP_SECRET`) only — never in `.mcp.json`, Slack, email, or any commit.
- If it leaks, it gets rotated in the Lark dev console and everyone re-exports.

> **Don't paste the secret into a config file.** Older setup notes described defining the server under `"mcpServers"` in `~/.claude.json` with the secret inline. That still technically works, but it writes a live credential to disk in plain text where a backup, sync client, or screen-share can pick it up. The `.mcp.json` + env-var path above is the only supported route.

**Access model — per-user OAuth.** The MCP runs in `--token-mode user_access_token`. On first use, you'll be prompted to **log in with your own Lark account** via an OAuth flow. The app credentials just identify which Lark app brokers the auth — **your results are scoped to what your own Lark account can access.** If a doc doesn't show up, you need access to it in Lark under your own account, not the bot's.

---

### Step 3 — Restart Claude Code

After exporting the env var, fully quit and reopen Claude Code (the variable is read at launch, so a
running session will not pick it up). Both `.mcp.json` servers must load fresh.

---

### Step 4 — Run the connection test

Ask the assistant:
> "Search Lark for [your team name] strategy"

**✅ Pass:** The assistant returns doc titles and links from your team's wiki. You're connected.

**❌ Fail:** See troubleshooting below.

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `lark-mcp` tools not available in the assistant | Project MCP server not approved, or `LARK_APP_SECRET` unset in the shell that launched Claude Code | Re-do Step 2, `echo $LARK_APP_SECRET` to confirm it's set, then fully restart Claude Code |
| Tools available but 0 results returned | Wrong `LARK_DOMAIN` or app credentials | Double-check the domain and app ID/secret |
| Error: `Unauthorized` or `token invalid` | Token expired or wrong | Re-generate the UAT or get fresh app credentials |
| Results returned but missing specific docs | Your Lark account doesn't have access to those docs | Ask the doc owner or wiki admin to share them with your Lark account |
| Everything works on your machine but not a colleague's | They haven't done this setup yet | Share this guide with them |

---

## Permission note

The Lark MCP runs under **your own** Lark identity via OAuth (`--token-mode user_access_token`). The shared app credentials (`cli_a944aca53c381ed3`) just identify the app — your search results are scoped to your personal Lark account's access. Different team members may see different results depending on their access.

If a document exists in the wiki but doesn't appear in your search results:
1. Open the doc URL in Lark (from `Knowledge/Reference/lark-wiki-index.md` or a colleague's link)
2. You'll see a "Request access" prompt — or ask the document owner to share it with your account
3. Re-run the search — it will now appear for you

---

## After connecting — record the values in your own config

Once your Lark MCP is working, fill in the **Lark** block of `Users/<your-name>/config.md`:

```markdown
## Lark
- Lark domain: `your-org.larksuite.com`
- Wiki space ID: `...`
- Wiki root node: `...`
```

> **Never put these in `CLAUDE.md`.** That file is template-layer — shared by the whole team and
> overwritten by `/os-update`. Personal and org-specific values live in your user layer only.
> Onboarding Phase 0B writes this block for you; this section is for fixing it up later.

You can find your Space ID and root node by running:
```
mcp__lark-mcp__wiki_v2_space_getNode
  wiki_token: [the token from your wiki URL]
```

---

## Team distribution — shared app, per-user access

The team shares one Lark app (`cli_a944aca53c381ed3`). The app is the auth broker — each user logs in with their own Lark account via OAuth and sees only what their account can access. What is **not** shared in git is the App Secret — each person exports it as `LARK_APP_SECRET` in their own shell.

Why this matters:
- The App ID is the same for everyone and is safe to keep in the repo.
- The App Secret is a live credential. **Never commit it** — a secret in a repo with GitHub remotes is exposed on push and must be rotated.
- Each user authenticates with their own Lark account. Results are scoped to that user's personal access, not the app's.

### How to distribute this OS to a teammate

1. Share the repo (or your fork) with them — it already contains `.mcp.json`.
2. Tell them to open `Workflows/lark-setup.md` before anything else.
3. Send them the **App Secret** over a password manager or secure DM — never Slack, email, or git. This is the *shared app's* secret (the same value everyone uses), not a personal one.
4. They set it as an env var: `export LARK_APP_SECRET="…"` in their `~/.zshrc`, then restart their shell.
5. They open the folder in Claude Code, approve the project MCP server, and on first use log in with their own Lark account via OAuth.
6. They run the connection test, then trigger `Computer, onboard me into this OS` — Phase 0B verifies the connection.
7. Optionally, send them a **fathippo** API key too (see the fathippo section below) — memory works without it, just not across non-Cowork sessions.

The only credential they share back with you is their **Lark handle** (for `TEAM.md`).

---

## fathippo — portable memory

`fathippo` is hosted memory that follows you across Claude sessions, including ones outside this
Cowork folder. It is **optional but recommended**, and it is a *complement* to the OS's file-based
memory, not a replacement.

**Precedence — this matters.** `Users/<you>/memory/` in this repo stays canonical. fathippo is a
projection of it for sessions that can't see these files. If fathippo recall ever disagrees with a
workspace file, **the file wins** — see §Memory & persistence in `CLAUDE.md`.

### Setup

1. Get your API key from your fathippo account (or ask Richard if the team is on a shared plan).
2. Export it in your shell, exactly like the Lark secret:

```bash
# add to your ~/.zshrc (or ~/.bashrc), then restart your shell
export FATHIPPO_API_KEY="paste-the-key-here"
```

3. Fully restart Claude Code and approve the project MCP server if prompted.

### Verify

Ask the assistant: *"What do you remember about me?"* — with the key set, it can call fathippo's
recall tools. Without the key the server still starts (approving it runs `npx @fathippo/mcp-server` either
way) but has no credential, so **no memory is sent anywhere** and its tools fail closed. The OS
keeps working on file memory alone and will say so once rather than failing.

### Secret handling

Same non-negotiables as the Lark secret: the key goes in **your own shell env only**. Never in
`.mcp.json`, never in a commit, never in Slack or email. `.mcp.json` references it as
`${FATHIPPO_API_KEY}` precisely so the repo can be pushed to GitHub without carrying anyone's key.

---

## Done?

Once your connection test passes, return to onboarding:
> "Computer, onboard me into this OS"

The assistant will pick up from Phase 0B and confirm your connection before continuing.
