# Uber — Rider Web Experience Redesign
### Independent website redesign project plan + product analytics simulation

**Project:** Proposed UK rider acquisition and trip-planning journey redesign  
**Role simulated:** Product Manager / Delivery Lead / Product Analyst  
**Status:** Concept; no Uber access, proprietary metrics or delivered redesign.  
**North-star candidate:** Eligible web visitors who reach a clear, informed trip-intent action.

## Executive recommendation
**Redesign the decision journey, not the entire website.** Hypothesis: prospective riders want quick answers to *Can I take this trip? What happens next? Is it safe?* before proceeding. Preserve Uber's established mobile journey; prototype a focused responsive rider web entry page with clearer step-by-step explanations and relevant safety signposting.

Uber provides rider safety information, including trip-sharing and assistance features. This project **does not** assert these features are missing. [Official Uber UK safety information](https://www.uber.com/gb/en/ride/safety/).

## Problem / scope
**Problem hypothesis:** Mobile web visitors considering a ride may not have enough task-oriented guidance before app hand-off. This is unvalidated and requires testing.

**In scope:** Discovery and measurement; responsive landing-page UX; high-level trip information; trust/safety signposting; accessibility; instrumentation; app hand-off CTA; QA; controlled experiment design.

**Out of scope:** Fare quotation engine, live GPS, payments, driver dispatch, account security rewrite, native rider app redesign or changes to real safety capabilities.

## Proposed customer journeys
1. Airport visitor: arrive → understand journey options → see clear CTA to continue in app.
2. New rider: discover → understand process and safety tools → choose next step.
3. Returning rider: arrive → take shortest hand-off route to existing ride journey.

## MVP content hierarchy
1. **Destination/intent** (demonstrative; does not request a real ride).
2. **How it works** in three steps.
3. **Safety and support** with verified links.
4. **Continue to official Uber journey** clearly labelled, never a fake booking.
5. **Accessible FAQs**.

## Product decisions & trade-offs
| Choice | Why | Cost / trade-off | Validation |
| --- | --- | --- | --- |
| Redesign entry journey, not all pages | Reduced scope and delivery risk | Less overall visual consistency | Task completion tests |
| Link to official booking flow | Avoid fictional fare and payment system | Extra handoff step | Handoff clickthrough |
| Prioritise trust messages | Relevant to first-time visitors | Can displace CTA | Comprehension and CTA tests |
| Use event instrumentation before tests | Supports credible outcomes | Adds implementation time | Event QA |
| Prototype without real location data | Protect privacy | Less realistic estimation | User research |

## Delivery artefacts
- [Complete project plan, WBS, timeline, resources, RACI](delivery-plan.md)
- [Proposed PRD and measurement specification](prd-and-metrics.md)
- [SQL product analysis for synthetic website events](analytics.sql)
- [Risk register and decision log](risks-and-decisions.md)
- [Responsive redesign concept page](demo/index.html)

## Proposed product roadmap
| Horizon | Outcome | Work |
| --- | --- | --- |
| Now — Weeks 1–2 | Understand and baseline | Research, IA review, funnel definitions |
| Next — Weeks 3–4 | Validate solution | Responsive prototype, accessibility test |
| Build — Weeks 5–7 | Prepare experiment | Front-end, links, event QA, legal/security reviews |
| Pilot — Week 8 | Make evidence-led decision | Controlled test, guardrails, rollback criteria |
| Later | Improve based on evidence | Personalised content only if privacy and value established |

## Measurement and decision rule
**Primary:** qualified CTA hand-off rate (unique visitors clicking the official journey CTA / eligible unique visitors).  
**Secondary:** time to handoff, FAQ engagement, bounce rate, mobile task success.  
**Guardrails:** safety-content comprehension, page speed, accessibility, errors and misdirected clicks.

Set conversion targets only after establishing baseline. Project targets and timeframes are planning assumptions.

## Interview narrative
“I scoped a bounded web redesign, mapped stakeholders and delivery dependencies, produced an eight-week plan, and defined event data and SQL queries so the proposed changes could be evaluated objectively. I chose not to simulate live fares or booking because trust and technical feasibility matter more than a flashy but misleading demo.”