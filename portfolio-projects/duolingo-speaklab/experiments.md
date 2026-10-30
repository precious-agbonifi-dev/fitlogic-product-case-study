# SpeakLab — growth experiment design

**Experiment status:** Proposed; no live traffic, randomisation or results.

## Why experiment?
A practice tool can drive superficial engagement yet fail to build confidence. Test whether a more supportive explanation encourages repeat sessions without worsening learning quality.

## Hypothesis
New learners receiving **actionable, encouraging next-step feedback** after a practice response will be more likely to return within 7 days than learners receiving only a short correctness indicator.

## Experiment design
- Population: new eligible adult learners who opt into practice.
- Unit of randomisation: learner account; 50:50 stable assignment.
- A: basic correctness feedback.
- B: correctness + one clear suggested improvement and encouragement.
- Primary metric: learner 7-day return-to-practice rate.
- Secondary: completed sessions per learner, retry frequency, confidence change.
- Guardrails: content-error reports, session abandonment, frustration and latency.
- Exclusions defined before launch: internal QA, bot traffic, invalid instrumentation.
- Run length/sample size: calculate using baseline, MDE, power and confidence level before launch; do not invent a universal duration.

## Instrumentation events
| Event | User-level properties |
| --- | --- |
| practice_opened | variant, scenario_id, timestamp |
| response_submitted | variant, scenario_id, attempt_number |
| feedback_viewed | variant, feedback_type |
| practice_completed | variant, scenario_id |
| practice_returned | variant, days_since_first_practice |
| feedback_flagged | variant, issue_type |

**Privacy:** Use pseudonymous identifiers. Do not log raw response text to the analytics pipeline by default.

## Analysis plan
1. Verify sample-ratio mismatch and assignment stability.
2. Check event completeness by treatment and platform.
3. Compare return rate per assigned learner, with confidence intervals.
4. Report effect size and uncertainty, not only a p-value.
5. Check educational correctness and subgroup guardrails.
6. Choose ship/iterate/stop with documented reasoning.

## Stop/iterate criteria
Stop immediately for material safety or privacy issues. Consider rollback if significant content-error increase. If no convincing benefit, improve feedback content or terminate the experiment.

## Growth loop hypothesis
Useful practice → confidence improvement → more sessions → stronger habit → optional sharing/referral. **Every edge requires validation.**

## Worked **hypothetical** interpretation
If treatment improves short-term return but also raises inaccurate-feedback reports, **do not ship**. The learning/safety guardrail outweighs growth.

## Anti-patterns avoided
- Calling pre-post survey changes causal evidence.
- Treating sessions instead of users as independent observations.
- Cherry-picking segments after seeing outcomes.
- Concluding success from simulated traffic.