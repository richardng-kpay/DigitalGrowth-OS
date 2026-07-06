# Dimension grid — onboarding fixtures

Modeled on the `generate-synthetic-data` skill from `hamelsmu/evals-skills`. Instead of authoring fixtures from intuition, enumerate the dimensions that meaningfully change runner behavior, then sample tuples. Coverage gaps become visible.

## Dimensions

| # | Dimension | Values | Why it matters |
|---|---|---|---|
| D1 | Growth role | Performance Marketing Manager / Content & SEO Lead / Lifecycle Marketing Manager / Website Product Owner / Analytics & Data Lead / Growth Lead / Custom | Different Phase 1B branch, different agents, area tags, KPIs, gates, and starter commands. The single biggest behavior-changing input. (Legacy fixtures carry pre-migration PM personas — Batman, Executive operator, Researcher, Builder — kept only for historical comparison; they do not count toward D1 coverage.) |
| D2 | Identity completeness | Fully provided / Some deferred / Mostly deferred | Stresses "no invented identity" (eval 01) and "deferred fields annotated" (eval 04 C5). |
| D3 | OKR alignment provided | Provided / Skipped by user / User unsure | Stresses Phase 6 (eval 08). |
| D4 | Thought-framework answers | Provided / Skipped / Partial | Stresses Phase 4 (eval 09). |
| D5 | Taste preferences | Provided / "I don't know yet" / Contradictory across phases | Stresses Phase 2 (eval 10). |
| D6 | Quality-gate selection | Role-default / Explicit override / Ambiguous | Stresses eval 06; especially adversarial when role defaults differ from explicit choice. |
| D7 | Privacy boundaries | None set / Standard / Sensitive domain (legal, health, comp) | Stresses eval 11. |
| D8 | Anchor campaign/project | Named real project / "Not sure yet" / Multiple candidates | Stresses brief-creation guardrail and routing. |
| D9 | Re-run behavior | First run / Re-run with same role / Re-run with new role | Catches silent role preservation (eval 03, observed failure mode #12). |
| D10 | Polite-but-non-explicit acknowledgements | None / Mid-flow / At Phase 9–10 gates | Stresses confirmation gates (eval 02, criterion 5 — "polite acks ≠ authorization"). |
| D11 | Run completion (v1.1.0) | Completes cleanly / Aborted before Phase 10 Gate 1 / Aborted mid-Gate-1 (before `config.md` + memory finish) / Lark connection fails | Stresses the v1.1.0 write mechanics (eval 15): `Users/.active-user` written last — an aborted run must NOT leave the clone marked configured; a Lark failure must surface an explicit skip option, not strand the user. |

## Coverage map — current fixtures

All nine fixtures in `inputs/` are mapped. Rows marked *(legacy PM)* predate the growth-role migration — their D1 value is a retired PM persona; they run only for historical comparison and do not close D1 gaps.

| Fixture | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 | D10 | D11 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `mardiana-content-seo.md` | Content & SEO Lead | Full | Provided | Provided | Provided | Role-default | Standard | Real | First run | None | Completes |
| `devi-performance-marketing-manager.md` | Performance Marketing Manager | Full | Provided | Provided | Provided | Role-default | Standard | Real | First run | None | Completes |
| `riley-park-minimalist.md` | *(none — deferral profile)* | Mostly deferred | Skipped | Skipped | "Don't know" | Role-default | None | Not sure | First run | None | Completes |
| `morgan-chen-custom-persona.md` | Custom | Full | Provided | Provided | Provided | Explicit override | Sensitive | Real | First run | None | Completes |
| `taylor-polite-acks.md` | *(legacy PM: Builder)* | Full | Provided | Provided | Provided | Role-default | Standard | Real | First run | At Phase 9–10 gates | Completes |
| `jordan-lee-profile.md` | *(legacy PM: Executive)* | Full | Provided | Provided | Provided | Role-default | None | Real | First run | None | Completes |
| `sam-okafor-batman-variant.md` | *(legacy PM: Batman)* | Full | Provided | Provided | Provided | Role-default | Standard | Real | First run | None | Completes |
| `dev-rerun-persona-switch.md` | *(legacy PM: Executive → Batman)* | Full | Provided | Provided | Provided | Role-default | Standard | Real | Re-run new persona | None | Completes |
| `wei-ambiguous-anchor.md` | *(legacy PM: Researcher)* | Full | Provided | Provided | Provided | Ambiguous | Standard | Multiple candidates | First run | None | Completes |

## Visible gaps (parking lot, ordered by leverage)

1. **D1 = Lifecycle / Website / Analytics / Growth Lead.** Four of the seven growth roles have no current fixture — Phase 1B branches C–F have never been exercised by this suite. Highest-leverage additions.
2. **D11 = Aborted run.** No fixture simulates an abort after Phase 9 approval but before Gate 1 completes — the exact scenario the `.active-user`-written-last rule exists for (eval 15 C5 can currently only be graded from write ordering, not from a real abort).
3. **D11 = Lark connection fails.** No fixture scripts a failed Phase 0B connection test, so eval 15 C2 (explicit skip option via `AskUserQuestion`) is graded only when it happens to occur.
4. **D2 = Mostly deferred + a named growth role.** Riley Park defers most fields but carries no role; no fixture stresses role defaults *under deferral pressure* — does the assistant fall back to role-branch defaults or preserve the deferrals?
5. **D7 = Sensitive domain + a named growth role.** Only the custom-persona fixture stresses sensitive boundaries; no growth-role fixture (e.g. Performance + budget confidentiality) does.
6. **D10 = At the taste/thought-framework phases** (currently only at the write gates), and **taylor-polite-acks refresh** — the fixture's profile is still a PM persona; a growth-role remake would let it count toward D1 too.

## Previously addressed (closed gaps)

| Gap | Fixture added |
|---|---|
| D9 = Re-run with new persona | `dev-rerun-persona-switch.md` |
| D10 = Polite-but-non-explicit acknowledgements | `taylor-polite-acks.md` |
| D8 = Multiple candidate projects | `wei-ambiguous-anchor.md` |
| D6 = Ambiguous gate selection | `wei-ambiguous-anchor.md` |

## Anti-patterns when authoring fixtures

- **Adding a fixture without naming the dimension it covers.** If you can't fill in a row in the coverage map, the fixture is decorative.
- **Authoring two fixtures that differ only in cosmetic details** (name, company, role) but trigger the same code paths. Two fixtures, one signal.
- **Building a fixture to make a known-good behavior look thorough.** Fixtures exist to catch bugs, not to inflate pass rates.

## Sampling policy

When the matrix grows large, do not exhaustively enumerate. Sample by:

1. Always cover **every value of D1** (growth role) at least once — it's the dominant variable.
2. Cover **every named failure mode** in the suite README with at least one fixture that targets it.
3. Beyond that, prefer **tuples that combine two adversarial dimensions** (e.g., Batman + deferred fields; Custom + sensitive privacy). Single-dimension fixtures usually grade only the dimension they target.
