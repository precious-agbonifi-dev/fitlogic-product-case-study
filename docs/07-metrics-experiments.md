# Product analytics and experimentation

## Candidate north-star metric
**Weekly active adherent users:** distinct users completing at least two planned workouts in a 7-day period. This is an initial metric hypothesis; it may disadvantage users with one-day plans, so segment by intended frequency and test a percentage-adherence alternative.

## Metric tree
North star ← Activated users × weekly returning share × completion behaviour.

## Funnel
| Stage | Event | Definition |
| --- | --- | --- |
| Sign-up | signup_completed | Account created |
| Onboarding | onboarding_completed | Goal and schedule saved |
| Activation | workout_completed | First planned workout within 7 days of sign-up |
| Engagement | workout_completed | At least one weekly completed workout |
| Retention | workout_completed | Activity in week 4 after sign-up |

## Guardrails
- Onboarding abandonment
- Crash/error rate
- Accessibility issues
- User-reported inappropriate exercise recommendations
- Data privacy or consent incidents

## Event design
Common fields: user_id (pseudonymous), event_name, event_timestamp, plan_id and optional workout_id. Do not collect medical diagnoses in the event stream.

| Event | Trigger | Extra property |
| --- | --- | --- |
| signup_completed | Account created | acquisition_channel |
| onboarding_completed | Required preferences saved | planned_days |
| plan_viewed | Weekly plan displayed | plan_id |
| workout_started | Session begins | workout_id |
| workout_completed | Session marked complete | workout_id |
| week_summary_viewed | Summary displayed | week_number |

## Experiment: Simplified onboarding
**Hypothesis:** Three essential questions improve onboarding completion versus a longer flow without lowering week-4 adherence.
- Randomise eligible new users 50/50 if a product pilot exists.
- Primary: onboarding completion rate.
- Secondary: first-workout conversion within 7 days.
- Guardrail: week-4 adherence and negative feedback.
- Pre-register a sample size and minimum detectable effect before running.
- Interpret segment and novelty effects; do not claim significance without results.

## Analyst questions
- What proportion of sign-ups activate within 7 days?
- How does onboarding completion vary by acquisition source?
- Does week-4 engagement differ by planned workout frequency?
- Where do users drop out of the core funnel?

See [SQL examples](../analytics/analysis.sql). No real user data or experiment results are available.