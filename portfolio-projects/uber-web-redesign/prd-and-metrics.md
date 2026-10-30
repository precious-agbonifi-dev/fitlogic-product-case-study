# Uber Rider Web — PRD and data specification (proposal)

## Why now
A bounded experience hypothesis: clearer mobile-first information and handoff may increase informed user progression. No actual conversion baseline is available.

## Functional requirements
| ID | User story | Acceptance criteria |
| --- | --- | --- |
| F1 | As a first-time rider I can understand the next step | 3-step guidance visible; accessible navigation |
| F2 | As a rider I can locate safety information | Clear link to official rider safety page; no invented claims |
| F3 | As a returning rider I can proceed rapidly | Prominent official handoff CTA |
| F4 | As any user I can use my keyboard | Semantic links, visible focus state, logical tab order |
| F5 | As an analyst I can understand funnel loss | Documented event schema and deduplicated session IDs |

## Non-functional requirements
Responsive at 320px+, good contrast, no location capture in portfolio prototype, fast loading, privacy review before actual data collection.

## Funnel event taxonomy (proposal)
| Event | Meaning | Required properties |
| --- | --- | --- |
| page_view | Eligible landing view | visitor_id, session_id, timestamp, device |
| how_it_works_view | Steps section viewed | same + variant |
| safety_link_click | User opens official safety information | same + variant |
| handoff_click | Visitor proceeds to official journey | same + variant |
| page_error | Front-end issue | same + error_code |

## KPI contract
**Qualified handoff:** count(distinct eligible sessions with handoff_click) / count(distinct eligible landing sessions). Attribute by experiment assignment, not each event property.  
**Secondary:** how-it-works exploration, trust information usage and median time to handoff.  
**Guardrails:** errors and page performance, accessibility failures, misleading messaging.

## Analyst decisions
- Use session denominator rather than raw page events to prevent reload inflation.
- Assign users persistently to one variant to reduce contamination.
- Exclude bots/internal QA with documented rules, not opportunistic post-hoc filters.
- Interpret a higher handoff rate together with support complaints and user comprehension.

## Analysis plan
Compare conversion by variant and device, audit missing event properties, check telemetry completeness, and estimate uncertainty rather than treating descriptive differences as proof of causality.

See [SQL queries](analytics.sql).