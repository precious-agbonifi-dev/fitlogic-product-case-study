# Uber redesign — RAID and decision register

## Risk register
| Risk | Impact | Likelihood | Mitigation | Owner role |
| --- | --- | --- | --- | --- |
| Project simulates incorrect pricing/booking | High | Medium | No fares or booking; link official journey | PM |
| Safety wording inaccurate | High | Medium | Link verified official information, review | Legal/content |
| Analytics double-count sessions | Medium | High | Session-level contract, event QA | Analyst |
| Engineering contention delays release | Medium | Medium | Reserve capacity, freeze MVP | PM/Eng |
| Mobile accessibility defects | High | Medium | Early accessibility testing | QA |
| Redesign reduces returning-user speed | High | Medium | Direct CTA, segment analysis, rollback | PM |
| Experiment inadequate sample | Medium | High | Power analysis, extend or report inconclusive | Analyst |

## Decision log
**D1 — Choose rider entry funnel over full-site redesign.**  
Reason: narrower scope gives earlier learning. Trade-off: limited cross-site consistency.

**D2 — No fake fare quotes.**  
Reason: simulated prices risk misleading viewers. Trade-off: less visually impressive demo.

**D3 — Explain trust before asking for personal data.**  
Reason: safety information can inform visitor choice. Trade-off: longer content and potential CTA competition.

**D4 — Instrument before testing.**  
Reason: prevents winning with an unmeasurable result. Trade-off: initial engineering effort.

**D5 — Release behind a controlled experiment.**  
Reason: validate conversion and adverse effects. Trade-off: slower broad rollout.

## Dependencies / assumptions
Access to real product teams, research participants and first-party analytics is not available in this independent portfolio. All timeline and staffing values are assumptions.

## Open questions
- What is actual baseline handoff conversion?
- What is the website's existing architecture?
- Which user segments have the highest journey failure?
- What legal and accessibility reviews are mandatory?
- How is app/web identity linked across surfaces?