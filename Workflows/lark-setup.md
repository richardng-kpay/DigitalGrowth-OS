# Workflow: Lark MCP Setup

Use this guide when the Lark MCP connection test fails during onboarding, or when you're setting up the Digital Growth OS for the first time on a new machine.

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

### Step 2 — Add `lark-mcp` to your Claude Code config

Claude Code MCP servers are configured in your global config file: `~/.claude.json`.

Open your `~/.claude.json` (or create it if it doesn't exist) and add the following under `"mcpServers"`:

```json
{
  "mcpServers": {
    "lark-mcp": {
      "command": "/usr/local/bin/npx",
      "args": [
        "--yes",
        "@larksuiteoapi/lark-mcp",
        "mcp",
        "--domain", "https://open.larksuite.com",
        "--token-mode", "user_access_token",
        "--tools", "bitable.v1.appTable.list,bitable.v1.appTableField.list,bitable.v1.appTableRecord.search,docx.v1.document.rawContent,docx.builtin.search,wiki.v2.space.getNode,wiki.v1.node.search,contact.v3.user.batchGetId,calendar.v4.calendar.primary,calendar.v4.calendarEvent.get,calendar.v4.freebusy.list"
      ],
      "env": {
        "PATH": "/usr/local/bin:/usr/bin:/bin",
        "APP_ID": "cli_a944aca53c381ed3",
        "APP_SECRET": "<paste-app-secret-here>"
      },
      "type": "stdio"
    }
  }
}
```

**The App ID `cli_a944aca53c381ed3` is the shared team app** — it's the same for everyone and safe to keep here.

**Where to get the `APP_SECRET`:**
- The secret is **not** stored in this repo. Ask Richard (or your team lead) for it via a password manager or secure DM.
- Paste it into the `<paste-app-secret-here>` slot in your **own** `~/.claude.json` only.
- Do **not** share it in Slack, email, or commit it to any repo. If it leaks, it gets rotated in the Lark dev console and everyone re-pastes.

**Access model — per-user OAuth.** The MCP runs in `--token-mode user_access_token`. On first use, you'll be prompted to **log in with your own Lark account** via an OAuth flow. The app credentials just identify which Lark app brokers the auth — **your results are scoped to what your own Lark account can access.** If a doc doesn't show up, you need access to it in Lark under your own account, not the bot's.

---

### Step 3 — Restart Claude Code

After editing `settings.json`, fully quit and reopen Claude Code (or run `/restart` if available). The `lark-mcp` server must load fresh.

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
| `lark-mcp` tools not available in the assistant | Server not in `~/.claude/settings.json` | Re-do Step 2 and restart Claude Code |
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

## After connecting — update your CLAUDE.md

Once your Lark MCP is working, fill in the Lark Wiki section in `CLAUDE.md` with your team's details:

```markdown
- **Wiki space:** [YOUR_TEAM_NAME] · Space ID `[YOUR_SPACE_ID]` · Root node: `[YOUR_WIKI_ROOT_NODE]`
- **Lark domain:** `[YOUR_LARK_DOMAIN]`
```

You can find your Space ID and root node by running:
```
mcp__lark-mcp__wiki_v2_space_getNode
  wiki_token: [the token from your wiki URL]
```

---

## Team distribution — shared app, per-user access

The team shares one Lark app (`cli_a944aca53c381ed3`). The app is the auth broker — each user logs in with their own Lark account via OAuth and sees only what their account can access. What is **not** shared in git is the App Secret — each person pastes it into their own machine's `~/.claude.json`.

Why this matters:
- The App ID is the same for everyone and is safe to keep in the repo.
- The App Secret is a live credential. **Never commit it** — a secret in a repo with GitHub remotes is exposed on push and must be rotated.
- Each user authenticates with their own Lark account. Results are scoped to that user's personal access, not the app's.

### How to distribute this OS to a teammate

1. Share the repo (or your fork) with them.
2. Tell them to open `Workflows/lark-setup.md` before anything else.
3. Send them the **App Secret** over a password manager or secure DM — never Slack, email, or git.
4. They paste it into the `<paste-app-secret-here>` slot in their own `~/.claude.json`.
5. On first use, they'll be prompted to log in with their own Lark account via OAuth.
6. They run the connection test, then trigger `Computer, onboard me into this OS` — Phase 0B verifies the connection.

The only credential they share back with you is their **Lark handle** (for `TEAM.md`).

---

## Done?

Once your connection test passes, return to onboarding:
> "Computer, onboard me into this OS"

The assistant will pick up from Phase 0B and confirm your connection before continuing.
