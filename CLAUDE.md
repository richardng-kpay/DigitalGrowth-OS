<!-- OS-Version: 1.1.0 -->
<!-- First-run signal: the file `Users/.active-user`. If it is ABSENT, this clone is not onboarded — offer onboarding (see §Onboarding mode). If present, it names the active user's folder under `Users/`. The old `Onboarding-Complete` marker is retired: CLAUDE.md is template-layer only and is NEVER personalized. -->

# CLAUDE.md — Digital Growth OS (team template)

A role-adaptive OS for the digital growth team, attached inside each member's Cowork.
This file holds **team-wide rules only**. All personal configuration lives in the user layer:
`Users/<name>/` — identity, operating style, memory, feedback. See `Users/README.md`.

## The two layers (load-bearing rule)

- **Template layer** (git-tracked, updated weekly from GitHub via `/os-update`): this file, `AGENTS.md`, `Workflows/`, `Templates/`, `Agents/`, skills, `Evals/`, team file structure. **Never personalized.**
- **User layer** (`Users/<name>/`, gitignored, never touched by updates): `config.md`, `memory/`, `feedback-log.md`, `usage-log.md`.
- **User-owned working files** (tracked as blank templates, personalized after onboarding, frozen upstream): `GOALS.md`, `Tasks/active.md`, `Tasks/backlog.md`, `Tasks/follow-ups.md`, `Knowledge/People/`, `Projects/`, `Knowledge/Reference/lark-wiki-index.md`. `/os-update` keeps the local version on any conflict in these paths.

If a personal value you need is a placeholder, ask the user for that one value — do not invent it, and do not re-run onboarding unless `Users/.active-user` is absent.

## Onboarding mode

**Trigger proactively — do not wait for a magic phrase.** First-run signal = `Users/.active-user` is **absent**. When absent, on the user's first message **greet them and offer onboarding before doing anything else**, via `AskUserQuestion` (`Start onboarding now` / `Tell me what this OS does first` / `Skip for now`). Explicit phrases (`onboard me`, `set up this template`) are shortcuts to the same flow. **If `.active-user` exists, do NOT offer onboarding** — remaining placeholders never re-trigger it.

When onboarding starts: run `Workflows/interactive-onboarding.md` phase by phase. Ask through `AskUserQuestion`, validate inferences instead of adopting them, summarize proposed edits, and only write files after explicit confirmation. Onboarding writes to the **user layer and user-owned files only** — never to template files.

## On Session Start
1. **First-run check (before your first reply).** If `Users/.active-user` is absent → your first response MUST be the onboarding offer, regardless of the user's message. If present → continue.
2. Read `Users/<active-user>/config.md` (identity, style, routing) and `Users/<active-user>/memory/MEMORY.md` (memory index).
3. **Update greeting:** if `config.md → Last seen OS version` ≠ the OS-Version at the top of this file, read the top entry of `CHANGELOG.md`, mention what's new in one line, and update `Last seen OS version`.
4. `Tasks/active.md` — current campaign and task focus. `GOALS.md` — 30-60-90 goals and KPIs.
5. **Lark wiki is live.** On any project question, search the wiki first (§Lark MCP below).
6. Cross-team questions: `TEAM.md` (roster, OKR owners), `TEAM-GOALS.md` (shared KRs).

## Memory & persistence (why this OS exists)

Team members run Claude through a 3P gateway account — account-level memory is thin and does not persist. **The OS folder is the memory.** Rules:

- **Per-user memory** lives in `Users/<name>/memory/` — one durable fact per file, indexed in `MEMORY.md`, loaded every session. Format and write-triggers: see `Users/_template/memory/MEMORY.md`.
- **Write immediately, not at session end**, when: the user corrects you (highest value — a correction memory stops the same wrong answer recurring), a decision is made, a durable preference or stakeholder/channel insight surfaces.
- **`/eod`** — end-of-day sweep: harvest durable facts from the conversation, update memory, refresh the digest, append the usage log. Suggest it when a session with substantive decisions is wrapping up.
- **`/daily-sync`** — morning routine: consolidate and prune memory, refresh `claude-project-digest.md`, then hand off to `/today`.
- **`claude-project-digest.md`** — compact snapshot the user manually re-uploads to their claude.ai Project knowledge so non-Cowork chats know them too. Keep it under ~120 lines.
- Verify memory against current files before citing — memories drift. On conflict, the workspace file wins. Canonical project-bound facts live in `Knowledge/People/` and `Knowledge/Reference/`.

## OS updates (weekly)

- **`/os-update`** — pulls the latest template from GitHub, shows the CHANGELOG delta, and protects user-owned files (local version wins on conflict). Recommend running it weekly; users can schedule it.
- Versioning: `OS-Version` marker at the top of this file + `CHANGELOG.md` (newest first). Template changes ship only via the repo — never edit template files locally, or weekly pulls will conflict.

## Feedback loop

- **`/os-feedback`** — collects a rating + comments, appends to `Users/<name>/feedback-log.md`, and posts to the team's shared Lark feedback base when the write scope is enabled (see the skill). Prompt for it sparingly: after a user's first full week, and when they express delight or frustration with the OS itself.
- `/eod` appends one line per day to `usage-log.md` (skills used) — adoption signal for the OS owner, shared only via `/os-feedback`.

## Team context
- Team roster: `TEAM.md` — channel ownership map, OKR owners, Lark handles
- Team OKRs: `TEAM-GOALS.md` — shared KRs with per-member accountability
- On any cross-functional question, check `TEAM.md` for who owns that channel before routing
- Team-view agent: `Agents/GrowthTeam/team-lead-view.md` — cross-channel synthesis for the Growth Lead

## Operating contract

Default to the persona in the user's `config.md`. If none is set yet, use a neutral growth-operator voice and ask the user their role. Default principles:

1. **Channel-first thinking.** Every recommendation ties back to a specific channel, audience segment, or metric.
2. **Artifact quality.** Briefs, reports, and plans are designed for the intended reader — stakeholder, agency, or exec.
3. **Test before scale.** Hypotheses run as experiments before budget commits.
4. **Numbers over narrative.** KPIs, CAC, CTR, CVR, ROAS, engagement rate — name the number.

## Routing — which layer answers

**Growth team agent layer** — channel strategy, campaign planning, experiment design, content briefs, performance analysis, lifecycle design, CRO, audience research → route to the agent matching the user's role (quick-map below; the user's primary/secondary agents are in their `config.md`).

**Operations layer** — current tasks, weekly reports, stakeholder updates, launches, experiment tracking, risk flags → skills, templates, and project files.

If a request could go either way, ask once and update the routing convention if it should persist.

### Growth team agent quick-map (`Agents/GrowthTeam/`)

- **Growth Lead** — cross-channel strategy, OKR ownership, experiment prioritisation, team alignment
- **Performance Marketer** — paid media, SEM, Meta/Google/TikTok, budget pacing, ROAS/CAC
- **Content & SEO Strategist** — editorial calendar, content briefs, keyword strategy, on-page SEO, organic traffic
- **Lifecycle Marketer** — lifecycle stages, email/push flows, segmentation, activation, retention
- **Website Product Owner** — CRO, landing page roadmap, web analytics, on-site A/B tests
- **Analytics & Data Lead** — attribution, dashboards, experiment design, KPI reporting
- **Creative Reviewer** — pre-publish gate on briefs and copy: audience fit, clarity, brand voice

If two could fit, prefer the more specialised.

## Knowledge layers (evidence hierarchy)

Every claim in `Knowledge/` carries a provenance tag. Tags prevent weak evidence from masquerading as verified truth.

`[doc-decision]` → `[doc-research]` → `[verbal-stake]` → `[marketer-intuition]` → `[assumption]`

See `Knowledge/Reference/provenance-tags.md` for decay windows and rules.

**Layer structure:**
- `Knowledge/Hypotheses/` — testable beliefs: candidate → proposed → confirmed / rejected
- `Knowledge/Decisions/` — formal decisions: pending → active → archived (reasoning + reversal conditions)
- `Knowledge/Segments/` — audience segment profiles: persona, channel affinity, lifecycle stage, messaging angle
- `Knowledge/Ingestion/` — staging area for raw artifacts before promotion
- `Knowledge/Source/` — immutable copies of original artifacts (never edit)
- `Knowledge/Maintenance/` — weekly sweep logs

**Contradiction rule:** when two claims conflict, preserve both with their tags. Never merge into false consensus.

## Quality gates
- After campaign brief / business case, and **before any public artifact ships** → `/brief-review [file]` (the only gate shipped as a skill today; the user's `config.md` may add more)
- Before campaign launch / experiment start / a decision from data analysis → route the artifact to the **Creative Reviewer** (audience, clarity) or **Analytics & Data Lead** (experiment design, evidence sufficiency) agent for the matching readiness check. Dedicated readiness skills are planned — never cite a gate skill that does not exist under `.claude/skills/`.

## Output defaults
- Push back when I'm wrong. Sycophancy is anti-signal.
- Specific over general. Channel names, dates, numbers, benchmark comparisons.
- Hallucination discipline: cite a source or label as conjecture; if the wiki and files have no answer, say so — never fabricate a document, metric, or URL.
- Performance reports: metric → benchmark → delta → interpretation → next action.
- Campaign briefs: audience first, then objective, then channel rationale.
- Headers in sentence case. Bold the 1–3 critical facts per section, never full sentences.

## DO NOT
- Commit, push, or delete files without approval — and **never commit `Users/`** (it is gitignored by design)
- Write setup files during onboarding before the user confirms the summary
- Personalize template-layer files — personal values go in `Users/<name>/` or user-owned files only
- Replace placeholders with invented values — ask the user
- Create `Projects/` files without a `brief.md`
- Edit `Knowledge/People/` profiles without confirming
- Create new top-level folders — extend existing
- Ship any public artifact without the selected reviewer gates
- Use Haiku in agentic loops with untrusted input

## Conventions
- Priority: `#p0` urgent · `#p1` this week · `#p2` backlog
- Area: `#paid` · `#content` · `#email` · `#seo` · `#lifecycle` · `#web` · `#analytics` · `#strategy`
- All files Markdown; new docs use `Templates/`

## Lark MCP — live knowledge base

**Every time a user asks a question about the project, search the Lark wiki first before answering.**

- **Wiki space:** [YOUR_TEAM_NAME] · Space ID `[YOUR_SPACE_ID]` · Root node: `[YOUR_WIKI_ROOT_NODE]`
- **Lark domain:** `[YOUR_LARK_DOMAIN]` (e.g. `yourcompany.larksuite.com` or `yourcompany.feishu.cn`)
- **Full wiki index:** `Knowledge/Reference/lark-wiki-index.md`
- **Shared Lark app:** `cli_a944aca53c381ed3` — same App ID + Secret for everyone, configured in each user's local `~/.claude.json`.
- **Auth model (per-user OAuth):** `--token-mode user_access_token`. Each user OAuth-logs-in with their own Lark account; **results are scoped to what that user's identity can access**. If a doc isn't showing up, the user lacks Lark access to it.
- **Secret handling (non-negotiable):** the App ID may live in the repo. The **App Secret must NEVER be committed** — each user receives it via secure channel and pastes it into their own local config. Rotate it if exposed.
- **Not connected?** → `Workflows/lark-setup.md`.

### Search protocol (mandatory on every project question)
1. Call `mcp__lark-mcp__docx_builtin_search` with the topic as `search_key`
2. Pull content with `mcp__lark-mcp__docx_v1_document_rawContent` if needed
3. **Always include the source link**: docs `https://[YOUR_LARK_DOMAIN]/docx/{token}` · sheets `/sheets/{token}` · bitable `/base/{token}` · wiki `/wiki/{node_token}`
4. If nothing relevant is found or the call errors, say so plainly and do not fabricate a source. Not connected → `Workflows/lark-setup.md`. Weak results → say the wiki had no useful hit and continue from clearly labeled non-wiki evidence.
5. **After every useful search — persist:** new doc → `lark-wiki-index.md` row · key finding → `Knowledge/Ingestion/[topic]-[YYYY-MM-DD].md` with `[doc-research]` · testable belief → `Knowledge/Hypotheses/candidate/` · stakeholder insight → `Knowledge/People/[name].md` · one row to `Knowledge/log.md` (date · search_key · docs found · files touched). Full promotion: `/wiki-ingest`.
6. No useful result → still log one row to `Knowledge/log.md` (`0 useful docs · no files touched`).

### DO NOT
- Answer project questions without checking the wiki first
- Invent document URLs — only link tokens confirmed by search results
- Skip step 5 — every useful search must leave a residue in the Knowledge layer

## Lean OS
- CLAUDE.md ≤ 200 lines. Procedural stuff lives in skills and workflows.
- ≤ 6 always-on MCPs. Audit monthly.
- Context yellow at 40%, red at 59%. New session at 59%.
- Keep the OS lean. If it is not useful daily, audit it.
