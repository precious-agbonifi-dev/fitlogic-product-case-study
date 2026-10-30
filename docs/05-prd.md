# Product Requirements Document — Proposed MVP

**Status:** Concept / unbuilt  
**Goal:** Help beginners reliably complete achievable weekly workouts.

## User problem
Users struggle to move from intent to repeatable action when they must source exercises, plan sessions and monitor progress separately.

## Outcomes (hypotheses)
- Increase the proportion of new users completing a first workout within 7 days.
- Support repeat weekly adherence in the first 4 weeks.
- Enable users to recognise progress without complex data entry.

## In scope
1. Onboarding: goal, weekly availability and experience.
2. Generate a starter weekly plan from curated templates.
3. View workout instructions and mark a session complete.
4. Show weekly planned-versus-completed progress.
5. Reschedule a missed session.

## Out of scope
Social feeds, medical guidance, wearable integrations, AI-generated personalised prescriptions and trainer marketplace.

## User stories and acceptance criteria
**US-01:** As a beginner, I want to choose my goal and available days so that the first plan suits my schedule.
- Given a valid goal and 1–5 training days, when onboarding finishes, then a weekly plan is displayed.
- The plan and chosen inputs remain available when the user returns.

**US-02:** As a user, I want to complete a planned workout so that I can track progress.
- A workout can be marked complete once.
- A completed workout updates the weekly progress count.
- Duplicate taps do not create duplicate completion events.

**US-03:** As a user, I want to move a missed workout so that an interrupted week remains manageable.
- A planned workout can be moved to an available day.
- The change is reflected in the weekly plan and logged as an event.

## Non-functional requirements
Accessible interactions, transparent data collection, secure authentication, reasonable page-load performance and data deletion workflows.

## Dependencies
Validated exercise content, user testing, security/privacy review and a documented event tracking plan.

## Release decision
A pilot should only proceed after usability checks, privacy review and completion-event instrumentation are working.