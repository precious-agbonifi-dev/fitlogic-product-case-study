# Uber rider website — detailed project delivery plan

**Disclaimer:** Illustrative independent delivery simulation. Not an Uber project.

## Objective
Improve clarity and confident progression for eligible mobile web visitors without changing trip dispatch or payment processing.

## Scope, deliverables and acceptance
| Deliverable | Acceptance criterion |
| --- | --- |
| Discovery pack | Problem, segments, baseline instrumentation risks and findings recorded |
| Responsive prototype | 3 priority journeys clickable at 320–1440px widths |
| Content + IA | Clear next steps and verified safety information |
| Accessibility | Keyboard operable, contrast review and screen-reader test plan |
| Data spec | Event contracts and QA checklist approved for hypothetical implementation |
| Pilot plan | Primary and guardrail metrics, target allocation and rollback rule |

## Work breakdown structure (WBS)
| ID | Workstream | Task | Owner role | Effort estimate | Dependency |
| --- | --- | --- | --- | --- | --- |
| 1.1 | Discovery | Stakeholder kickoff and success criteria | PM | 2d | — |
| 1.2 | Discovery | Existing journey review and usability interviews | UX researcher | 5d | 1.1 |
| 1.3 | Data | Define funnel and event tracking | Analyst | 3d | 1.1 |
| 2.1 | Design | Information architecture and wireframes | Product designer | 4d | 1.2 |
| 2.2 | Design | Responsive prototype + content | Designer/content | 5d | 2.1 |
| 2.3 | Validation | Accessibility and usability review | Researcher / QA | 4d | 2.2 |
| 3.1 | Build | Front-end implementation | Front-end engineer | 8d | 2.2 |
| 3.2 | Data | Event instrumentation and QA | Engineer / analyst | 4d | 1.3, 3.1 |
| 3.3 | Controls | Privacy, legal, brand and safety review | Risk/Legal | 3d | 2.2 |
| 4.1 | Pilot | Experiment setup + smoke test | PM / analyst | 3d | 2.3, 3.2, 3.3 |
| 4.2 | Decision | Analyse results, document ship/iterate/stop | PM / analyst | 3d | 4.1 |

Effort denotes working days per role and is illustrative, not a signed-off estimate.

## Week-by-week timeline
| Week | Milestone | Workstreams | Exit gate |
| --- | --- | --- | --- |
| 1 | Kickoff | PM, research, analytics | Baseline and scope agreed |
| 2 | Discovery complete | Research, analyst | Priority pain points evidenced |
| 3 | Concept review | UX, content | IA and key flow accepted |
| 4 | Prototype tested | UX, QA, accessibility | Usability risks addressed |
| 5 | Implementation starts | Engineering, analytics | Approved design and contracts |
| 6 | Build + review | Engineering, legal, security | Functional staging version |
| 7 | Instrumented QA | QA, analytics, engineering | Events, accessibility and links pass |
| 8 | Pilot decision | PM, analyst, stakeholders | Ship/iterate/stop recommendation |

**Critical path:** research → journey map → prototype → build → tracking QA → pilot. Legal and content review are parallel but must clear before release.

## Indicative resource plan
| Role | Assumed capacity | Contribution |
| --- | --- | --- |
| Product Manager | 0.6 FTE | Scope, alignment, trade-offs, go/no-go |
| Product Designer | 0.6 FTE weeks 2–5 | IA, prototypes, design system |
| Front-end Engineer | 1.0 FTE weeks 5–7 | Responsive implementation |
| Product Analyst | 0.4 FTE | Baseline, tracking and experiment |
| UX Researcher | 0.3 FTE weeks 1–4 | Interviews and prototype testing |
| QA/Accessibility | 0.3 FTE weeks 4–8 | Test and compliance review |
| Legal/Security/Brand | On demand | Approval and escalation |

Indicative only; budget and rates intentionally not fabricated. Resource contention on engineering is the main scheduling exposure.

## Stakeholders and RACI
R=responsible; A=accountable; C=consulted; I=informed.

| Activity | PM | Design | Engineering | Analyst | Legal/Security | Sponsor |
| --- | --- | --- | --- | --- | --- | --- |
| Prioritise scope | R | C | C | C | C | A |
| Prototype | A | R | C | C | C | I |
| Build & QA | A | C | R | C | C | I |
| Instrumentation | A | I | R | R | C | I |
| Release decision | R | C | C | C | C | A |

Stakeholders: rider/customer representative, growth/marketing, product leadership, content, engineering, UX research, analytics, privacy/legal, accessibility, brand, operations and customer support.

## Meetings and communication
- Weekly delivery stand-up (30 min): blockers, dependencies and priorities.
- Fortnightly sponsor review: decisions and scope changes.
- Design/analytics working session: definition of done and event quality.
- Risk log updated weekly; escalate high-severity privacy or safety concerns immediately.

## Change control
Log request, impact on customer outcome, effort/dependency, risk and decision owner. Any addition that threatens the week-7 QA gate requires explicit sponsor approval or re-scoping.

## Exit and rollback
No release if booking links misdirect, users are misled about availability/pricing, accessibility critical issues remain, or event measurement is unreliable. Pilot can revert to existing landing journey if guardrails worsen.