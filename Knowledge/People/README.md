# Stakeholder Index

Team-curated stakeholder profiles. Profiles marked `visible-to: team` are canonical for all members.

---

## Profile frontmatter convention

Each profile file should include:

```yaml
---
curated-by: [name]
last-verified: [YYYY-MM-DD]
visible-to: team  # or: personal
---
```

---

## Team-curated profiles

| Name | Role / relationship | File | Last verified | Curated by |
|------|---------------------|------|---------------|------------|
| [YOUR_MANAGER] | Manager / primary approver | `[YOUR_MANAGER].md` | — | — |

---

## Personal profiles

*(Files without `visible-to: team` in frontmatter. Not relied on by other team members.)*

---

## Adding a profile

1. Copy an existing profile as template
2. Add frontmatter with `curated-by`, `last-verified`, `visible-to`
3. Add a row to the team-curated table above (if `visible-to: team`)
4. Mention in the next standup so the team knows it's been added

## Maintenance

Run `/wiki-maintain` weekly to flag profiles not verified in 90+ days and rebuild this index.
