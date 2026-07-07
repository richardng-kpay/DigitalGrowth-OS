# Pass criteria — Review gates match role

The review-gate config must reflect the user's selected growth role, channel, and approval chain.

## Criteria (binary)

1. ✅ / ❌ External artifacts always route to `/brief-review` or an explicitly confirmed equivalent pre-publish review gate.
2. ✅ / ❌ Role-specific gates are present where relevant: content routes to `/brief-review` plus audience/brand approval, experiments route to `/experiment-brief` / experiment readiness, performance work routes to campaign or weekly-performance review.
3. ✅ / ❌ The user's named approval chain is reflected in `Users/<name>/config.md` (`Quality gates selected`) or the Phase 9 edit plan.
4. ✅ / ❌ Gates do not invent approvers, agencies, legal review, or data sign-off the user did not name.
5. ✅ / ❌ Different roles produce meaningfully different starter commands and gate notes; if all roles get identical gates and commands, role-aware onboarding failed.

## Failure modes this catches

- Assistant treats `/brief-review` as optional for public content, ads, emails, or landing pages.
- Assistant gives Content & SEO users paid-media launch gates but no content approval chain.
- Assistant invents legal, brand, or data approvers instead of asking.
- Assistant produces identical configs for Content & SEO, Performance, Lifecycle, and Analytics roles.
