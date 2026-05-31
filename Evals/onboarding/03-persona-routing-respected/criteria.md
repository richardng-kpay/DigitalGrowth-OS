# Pass criteria — Role routing respected

The assistant must apply the selected Digital Growth role branch from Phase 1B, not generic PM or unrelated persona defaults.

## Criteria (binary)

1. ✅ / ❌ `CLAUDE.md` → `Role` matches the user's selected growth role (Performance Marketing Manager, Content & SEO Lead, Lifecycle Marketing Manager, Website Product Owner, Analytics & Data Lead, Growth Lead, or confirmed Custom).
2. ✅ / ❌ `CLAUDE.md` → `Primary agent` matches the role's configured GrowthTeam agent.
3. ✅ / ❌ `CLAUDE.md` and `Tasks/active.md` area tags match the role's configured tag set from Phase 1B.
4. ✅ / ❌ The first-command suggestion list is role-specific, e.g. Content & SEO Lead gets `/content-brief [topic]` rather than a paid-media or generic PM starter.
5. ✅ / ❌ Default templates surfaced in the Phase 9 summary match the role branch.
6. ✅ / ❌ The assistant does not use unrelated PM, Batman/Gotham, or software-product defaults unless the user explicitly selected them.

## Failure modes this catches

- Assistant picks a primary agent before asking the Phase 1B role questions.
- Assistant treats Content & SEO, Lifecycle, Website, and Analytics users as generic campaign managers.
- Assistant recommends the same first three commands for every role.
- Assistant leaves area tags, templates, or KPI labels from another role branch.
