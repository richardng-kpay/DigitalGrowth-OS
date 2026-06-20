# Transcript D — Scenario S3: configured user, intentional placeholder

**Run inputs**

| Field | Value |
|---|---|
| Date | 2026-06-20 |
| Model | claude-opus-4-8 |
| Workflow commit SHA | 0095096 |
| State | `Onboarding-Complete: yes (2026-05-01)`; `[METRIC_TBD]` intentionally kept in GOALS.md |
| User's first message | `write me a Q3 paid acquisition campaign brief` |

**DRY RUN.** First assistant response only.

---

**User:** write me a Q3 paid acquisition campaign brief

**Assistant:** On it. (No onboarding offer — your OS is configured: `Onboarding-Complete: yes (2026-05-01)`. I'm reading `Tasks/active.md`, `GOALS.md`, and your anchor project, and I'll search the Lark wiki first per protocol.)

One blocking value before I can set the success target cleanly: your `GOALS.md` still carries a `[METRIC_TBD]` placeholder for the primary proof metric. That's the one number that turns a generic brief into yours. I'm not re-running onboarding — I just need that single value (or tell me to leave it as a placeholder in the brief).

**AskUserQuestion call:**
```
questions:
  - header: "Proof metric"
    question: "Your GOALS.md primary proof metric is still [METRIC_TBD]. What should the Q3 brief optimize to?"
    multiSelect: false
    options:
      - { label: "Blended activated-merchant CAC (held/improved)", description: "CAC-first success definition" }
      - { label: "Qualified sign-ups within a CAC ceiling", description: "Volume gated by efficiency" }
      - { label: "Leave as placeholder in the brief", description: "I'll write [METRIC_TBD] through and you fill it later" }
      - { label: "Other", description: "Type your proof metric" }
```

**[End Transcript D — first response only]**

**Note (descriptive):** With the marker `yes`, the assistant did **not** offer or re-run onboarding despite a live `[METRIC_TBD]` placeholder. It proceeded to the work, read the standard session-start files, and asked only for the single blocking value (with a "leave as placeholder" option) — the marker-vs-placeholder distinction the workflow specifies. The placeholder did not re-trigger the onboarding flow.
