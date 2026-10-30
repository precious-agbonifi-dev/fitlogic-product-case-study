# SpeakLab — roadmap and decision framework

## Vision
Lower the barrier to meaningful language practice with safe, supportive micro-sessions.

## Prioritisation (illustrative)
RICE = reach × impact × confidence / effort.

| Capability | Reach | Impact | Confidence | Effort | Score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Scenario-based practice | 100 | 2 | 0.8 | 3 | 53.3 |
| Actionable feedback | 80 | 2 | 0.7 | 4 | 28 |
| Confidence check | 50 | 1.2 | 0.65 | 2 | 19.5 |
| Voice interaction | 65 | 2 | 0.4 | 9 | 5.8 |
| Social streaks | 45 | 1 | 0.4 | 5 | 3.6 |

Scores reflect assumptions, not empirical user counts.

## NOW — Working local prototype
- ✅ Three scenarios and guided conversation loop.
- ✅ Rule-based feedback explicitly labelled.
- ✅ Progress and attempt counters.
- ✅ Responsive interface.
- ✅ Event taxonomy and measurement spec.
- ☐ User validation with real participants.

## NEXT — Discovery and technical validation
- Interview and usability-test 5–8 prospective learners.
- Test feedback comprehension and false guidance.
- Design backend LLM proxy, data retention and cost guardrails.
- Evaluate prompts against educator-labelled response set.
- Establish baseline from opt-in pilot.

## LATER — Controlled pilot
- A/B test actionable versus minimal feedback.
- Review content-quality and safety outcomes.
- Consider opt-in speech input only if validated.
- Test monetisation only after learning value is demonstrated.

## Ship / iterate / stop
**Ship to larger pilot only if:** users understand feedback, repeat practice, and content correctness meets pre-agreed rubric without privacy issues.  
**Iterate:** high engagement but inconsistent feedback or confidence.  
**Stop:** negative learning outcomes, unresolved data protection issues or low demand.

## Trade-off: AI versus no-code
A deterministic prototype is less intelligent, but more honest, auditable and cheap. Live AI may improve adaptation but introduces error, latency, cost, privacy and evaluation responsibilities.