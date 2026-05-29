# Workflow: Lark MCP Setup

Use this guide when the Lark MCP connection test fails during onboarding, or when you're setting up the Digital Growth OS for the first time on a new machine.

---

## What is Lark MCP and why do I need it?

The Digital Growth OS searches the KPay Digital Growth wiki to answer project questions — strategy docs, experiment notes, vendor evaluations, stakeholder interviews, and more. It does this via the `lark-mcp` MCP server, which connects Claude Code to Lark's API.

**Your account, your access.** The MCP server uses your personal Lark credentials (User Access Token). You can only see documents your Lark account has been granted access to — the OS never uses someone else's token.

---

## Team wiki

All KPay Digital Growth documentation lives here:

> **Wiki root:** https://kpay-group.sg.larksuite.com/wiki/ATQ3wXAlvisKHJkLhJwl7ywBgCP
> **Performance Marketing folder:** https://kpay-group.sg.larksuite.com/wiki/M5Hmw8xEpivuCik5ka2l6hwXgqe

---

## Setup steps

### Step 1 — Confirm you have a Lark account

You need an active KPay Lark account (`yourname@kpay-group.com` or your team's Lark domain). If you don't have one, ask your IT or Lark admin to create it.

---

### Step 2 — Add `lark-mcp` to your Claude Code global settings

Claude Code MCP servers are configured in your global settings file: `~/.claude/settings.json`.

Open it (or create it if it doesn't exist) and add the following under `"mcpServers"`:

```json
{
  "mcpServers": {
    "lark-mcp": {
      "command": "npx",
      "args": ["-y", "@larksuite/lark-mcp"],
      "env": {
        "LARK_APP_ID": "<your-app-id>",
        "LARK_APP_SECRET": "<your-app-secret>",
        "LARK_DOMAIN": "https://kpay-group.sg.larksuite.com"
      }
    }
  }
}
```

**Where to get `LARK_APP_ID` and `LARK_APP_SECRET`:**
- These come from the KPay Lark developer app shared with the Digital Growth team.
- Ask Richard or your team's Lark admin for the app credentials.
- Do **not** share these in Slack, email, or commit them to any repo.

**Alternative — Personal User Access Token (UAT):**
If you prefer to use a personal token instead of the shared app:
```json
"env": {
  "LARK_USER_ACCESS_TOKEN": "<your-personal-UAT>",
  "LARK_DOMAIN": "https://kpay-group.sg.larksuite.com"
}
```
Generate a UAT from the Lark developer console under your account. Note: UATs expire (typically after a few hours); app credentials are longer-lived.

---

### Step 3 — Restart Claude Code

After editing `settings.json`, fully quit and reopen Claude Code (or run `/restart` if available). The `lark-mcp` server must load fresh.

---

### Step 4 — Run the connection test

Ask the assistant:
> "Search Lark for digital growth strategy"

**✅ Pass:** The assistant returns doc titles and links from the KPay wiki. You're connected.

**❌ Fail:** See troubleshooting below.

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `lark-mcp` tools not available in the assistant | Server not in `~/.claude/settings.json` | Re-do Step 2 and restart Claude Code |
| Tools available but 0 results returned | Wrong `LARK_DOMAIN` or app credentials | Double-check the domain and app ID/secret |
| Error: `Unauthorized` or `token invalid` | Token expired or wrong | Re-generate the UAT or get fresh app credentials |
| Results returned but missing specific docs | Your account doesn't have access to those docs | Ask the wiki admin to share them with your Lark account |
| Everything works on your machine but not a colleague's | They haven't done this setup yet | Share this guide with them |

---

## Permission note

The Lark MCP runs under **your** Lark identity. If a document exists in the wiki but doesn't appear in your search results, it means your Lark account hasn't been granted access to it.

To request access:
1. Open the doc URL (from `Knowledge/Reference/lark-wiki-index.md` or a colleague's link)
2. You'll see a "Request access" prompt in Lark
3. Or ask the document owner or wiki admin to share it directly with your account

---

## Done?

Once your connection test passes, return to onboarding:
> "Computer, onboard me into this OS"

The assistant will pick up from Phase 0B and confirm your connection before continuing.
