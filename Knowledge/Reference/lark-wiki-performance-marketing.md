# Lark Wiki — Performance Marketing Folder
*Wiki node: [YOUR_PERF_MARKETING_WIKI_NODE]*
*URL: https://[YOUR_LARK_DOMAIN]/wiki/[YOUR_PERF_MARKETING_WIKI_NODE]*
*Space ID: [YOUR_SPACE_ID] · Last indexed: [Date]*

This folder is the **authoritative source** for all Performance Marketing docs at [YOUR_COMPANY].
Search here first for: paid media guidelines, ad creative, channel performance, budgets, SEM, Meta/Google/LinkedIn.

**How to populate this file:**
1. Connect Lark MCP (`Workflows/lark-setup.md`)
2. Run a search: `mcp__lark-mcp__docx_builtin_search` with `search_key: "performance marketing"`
3. Add the relevant results to the table below

---

## Indexed documents

| Title | Type | Token | Direct link |
|---|---|---|---|
| [Performance marketing guidelines] | docx | `[token]` | [open](https://[YOUR_LARK_DOMAIN]/docx/[token]) |
| [Channel metrics sheet] | sheet | `[token]` | [open](https://[YOUR_LARK_DOMAIN]/sheets/[token]) |
| [Campaign requests tracker] | bitable | `[token]` | [open](https://[YOUR_LARK_DOMAIN]/base/[token]) |
| [Paid media guidelines PDF] | file | `[token]` | (file — download from Lark Drive) |

---

## Key intel
*Fill in after reviewing the indexed docs. Tag each finding with a provenance tag.*

- **[Finding 1]** — [detail]. `[doc-research]`
- **[Finding 2]** — [detail]. `[verbal-stake]`
- **[Stack owner]** — [Name] has access to [platforms]. Key contact for audits.

---

## How to search this folder

```
mcp__lark-mcp__docx_builtin_search
  search_key: "<your topic>"
  count: 20
  useUAT: true
```

Then pull full content:
```
mcp__lark-mcp__docx_v1_document_rawContent
  path.document_id: "<token from search result>"
  useUAT: true
```
