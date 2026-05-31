# Lark Wiki Index — [YOUR_COMPANY] Digital Growth Team
*Last indexed: [Date] · Space: [YOUR_TEAM_NAME] (ID: [YOUR_SPACE_ID])*
*Root wiki node: [YOUR_WIKI_ROOT_NODE] — "[READ ME] Folder & Documentation Hierarchy"*

This file maps every discovered Lark wiki doc to its OS layer equivalent.
Use it to find the authoritative source for any topic before creating a new doc.

**How to populate this index:**
After connecting your Lark MCP (see `Workflows/lark-setup.md`), run:
```
mcp__lark-mcp__docx_builtin_search
  search_key: "[your team name] [topic]"
  count: 50
  useUAT: true
```
Then update this file with the results, organized by category.

**URL pattern:**
- Docs: `https://[YOUR_LARK_DOMAIN]/docx/{token}`
- Sheets: `https://[YOUR_LARK_DOMAIN]/sheets/{token}`
- Bitables: `https://[YOUR_LARK_DOMAIN]/base/{token}`
- Slides: `https://[YOUR_LARK_DOMAIN]/slides/{token}`

---

## 🗂️ 1. Strategy & OKRs
*OS equivalent: `GOALS.md`, `Knowledge/Decisions/active/`*

| Title | Type | Token | Owner |
|---|---|---|---|
| [Team OKR doc] | docx | `[token]` | [Owner] |
| [Quarterly plan] | bitable | `[token]` | [Owner] |
| [Strategy doc] | docx | `[token]` | [Owner] |

---

## 🛠️ 2. Martech Stack & Vendor Evaluation
*OS equivalent: `Knowledge/Decisions/`, `Knowledge/Hypotheses/`, `Projects/`*

| Title | Type | Token | Owner |
|---|---|---|---|
| [Vendor evaluation doc] | docx | `[token]` | [Owner] |
| [Tool capability requirements] | sheet | `[token]` | [Owner] |
| [Tool comparison] | sheet | `[token]` | [Owner] |

---

## 📣 3. Performance Marketing
*OS equivalent: `Agents/GrowthTeam/performance-marketer.md`, `Projects/`*

| Title | Type | Token | Owner |
|---|---|---|---|
| [Performance marketing guidelines] | docx | `[token]` | [Owner] |
| [Metrics sheet] | sheet | `[token]` | [Owner] |
| [Campaign requests tracker] | bitable | `[token]` | [Owner] |

---

## ✉️ 4. Content, Creative & Lifecycle
*OS equivalent: `Agents/GrowthTeam/content-strategist.md`, `Agents/GrowthTeam/lifecycle-marketer.md`*

| Title | Type | Token | Owner |
|---|---|---|---|
| [Content calendar] | bitable | `[token]` | [Owner] |
| [Creative asset library] | docx | `[token]` | [Owner] |

---

## 👥 5. Stakeholder Interviews & Discovery
*OS equivalent: `Knowledge/People/`, `Meetings/1on1s/`*

| Title | Type | Token | Date |
|---|---|---|---|
| [Stakeholder mapping] | docx | `[token]` | [Date] |
| [Discovery interview — Role] | docx | `[token]` | [Date] |
| [Meeting notes] | docx | `[token]` | [Date] |

---

## 🗓️ 6. 1:1s & Leadership Alignment
*OS equivalent: `Meetings/1on1s/`*

| Title | Type | Token | Date |
|---|---|---|---|
| [1:1 with manager — topic] | docx | `[token]` | [Date] |
| [Monthly 1:1] | docx | `[token]` | [Date] |

---

## 🏢 7. Company Context & Onboarding
*OS equivalent: `Knowledge/Reference/company.md`*

| Title | Type | Token | Owner |
|---|---|---|---|
| [Orientation / onboarding deck] | slides | `[token]` | [Team] |
| [Company slide deck] | slides | `[token]` | [Team] |

---

## 🔧 8. Ops & Compliance (non-core for digital growth)
*OS equivalent: skip unless audit-relevant*

| Title | Type | Notes |
|---|---|---|
| [Security audit docs] | various | Compliance — not digital growth |

---

## 📌 How to use this index

1. **Before creating a new doc** — check this index first. If a Lark doc covers it, link to it from your OS file instead of duplicating.
2. **To pull any doc into the OS** — use the token with `mcp__lark-mcp__docx_v1_document_rawContent` + `document_id: {token}`.
3. **To stay current** — re-run `docx_builtin_search` monthly with topic keywords and update this file.
4. **Provenance tag for content pulled from Lark:** `[doc-research]` unless it contains a formal decision, then `[doc-decision]`.
