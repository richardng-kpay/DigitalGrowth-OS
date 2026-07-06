# Pass criteria — First useful SEO output (seamless start)

**What this catches:** Onboarding can finish cleanly and still leave the user
stranded — a perfectly filled `Users/<name>/config.md` that produces a generic,
ungrounded first deliverable. This eval tests the *seamless start*: immediately after
onboarding, the Content & SEO user runs `/content-brief` and must get a brief
that (a) reuses what onboarding already captured, (b) follows the mandatory
wiki-first protocol, and (c) is grounded in her actual context — not generic
SaaS filler.

**Fixture:** `inputs/mardiana-content-seo.md`
**Trigger replayed:** after onboarding completes, user types
`/content-brief payment gateway Hong Kong`

## Criteria (binary)

1. ✅ / ❌ **Reuses captured config.** The skill reads `Users/<name>/config.md`
   and does NOT re-ask role, channels, KPIs, or approval chain already captured
   in onboarding. It may ask the per-brief questions (topic, reader, funnel stage,
   keyword, CTA, length) — those are piece-specific, not config.

2. ✅ / ❌ **Wiki-first protocol followed.** Because this is a project question,
   the assistant searches the Lark wiki (`docx_builtin_search`) before producing
   the brief, and either surfaces a relevant doc with a source link or states
   plainly that no relevant doc was found (no fabricated URL).

3. ✅ / ❌ **Grounded in Mardiana's context.** The brief's audience, objective,
   and success metrics reflect her captured reality — SME merchants, HK/SG
   payments, her KPIs (organic sessions / top-10 rankings / content-attributed
   MQLs), her reviewer chain (Jervis → brand). It would read differently if the
   fixture were a generic SaaS company.

4. ✅ / ❌ **SEO section actually filled.** Primary keyword, search intent, and a
   target SERP position are populated. Competitor field is either filled or
   explicitly flagged as "to research" — not left as raw `[bracketed]` template
   text.

5. ✅ / ❌ **No fabricated metrics.** Any search volume, difficulty, or traffic
   figure is either sourced (Ahrefs/GSC) or labeled an estimate. No invented
   precise numbers presented as fact (respects her "no 10x overclaim" turn-off).

6. ✅ / ❌ **Routes to the gate.** The brief ends by routing to `/brief-review`
   (and audience check) before publish — the required pre-publish gate for
   external content, consistent with her captured review style.

7. ✅ / ❌ **Honors the data-trust constraint.** Success metrics do NOT silently
   assume content-attributed MQL tracking works — they acknowledge the known
   attribution gap (her kill condition) or fall back to sessions/rankings as the
   measurable proxy. Catches the assistant overpromising attribution the OS
   can't yet deliver.

## Failure modes this catches

- Skill re-interrogates the user for role/KPIs onboarding already stored (the
  "did onboarding even matter?" failure).
- Brief is generic content-marketing boilerplate that ignores payments / SME /
  HK-SG context.
- SEO fields left as template placeholders, making the brief non-actionable.
- Assistant invents a search volume ("3,400/mo") with no source.
- Assistant skips the wiki-first protocol that `CLAUDE.md` makes mandatory.
- Success metrics promise MQL attribution the team's data can't yet support.

## Why this is the decisive eval for "can she start using it"

Evals 01–12 prove onboarding *configures* correctly. This eval proves the
configuration *pays off on the very next action*. If 13 passes, the answer to
"can Mardiana onboard and seamlessly start using the OS?" is yes with evidence.
