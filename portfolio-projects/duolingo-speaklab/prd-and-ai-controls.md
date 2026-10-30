# SpeakLab — PRD and responsible AI plan

## Problem
Learners may know vocabulary but avoid practicing conversation because the stakes feel high and feedback is unclear. This is an assumption to validate, not a documented Duolingo customer defect.

## Personas (hypothetical)
**Commuter learner:** 5 minutes per day, wants useful situational phrases.  
**Anxious beginner:** Fear of sounding incorrect, wants private repetition.

## Jobs to be done
“When I am about to speak a new language, let me rehearse a realistic exchange safely and understand one improvement at a time.”

## MVP features
| Requirement | Acceptance criteria |
| --- | --- |
| Select scenario | 3 selectable real-world scenarios |
| Receive prompt | Clear one-step question with scenario context |
| Submit text | Empty text blocked; keyboard support |
| Get feedback | Explicit rule-based feedback and actionable next step |
| Retry | Response can be revised without losing context |
| Track practice | Visible completed attempts and scenario progress |
| Privacy | No login or personal information requested |

## Not in scope
Live voice recognition, unrestricted generative chat, a speech accuracy claim, certification, payment or real Duolingo integration.

## AI architecture decision
**Prototype:** deterministic keyword-based feedback shown transparently.  
**Future design:** client → authenticated backend → language model with constrained rubric → validation layer → response to user. Log minimal metadata; avoid storing full transcripts unless user opts in.

## Generative AI safeguards before production
- Educator-reviewed rubric for safety, accuracy and age-appropriate content.
- Prompt injection and harmful-input tests.
- Clear uncertainty language and report-feedback control.
- PII minimisation, deletion workflow and UK GDPR review.
- Latency, cost-per-session and failure monitoring.
- Fallback to curated examples if the model fails.
- Human review of a quality sample before rollout.

## Definition of ready
Research evidence, test cases, tracking spec, safe copy, accessibility review and owner sign-off.

## Definition of done
Meets acceptance criteria, smoke tests pass, deterministic rules verified and limitations visible to users.