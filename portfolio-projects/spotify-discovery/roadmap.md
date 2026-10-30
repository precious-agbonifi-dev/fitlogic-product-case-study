# Spotify Discovery Sprint — opportunity tree and roadmap

## Outcome
Reduce the time needed to reach a satisfying new track, without reducing overall listening satisfaction.

### Opportunity solution tree (hypothetical)
- **Outcome:** faster satisfying discovery
  - *Opportunity A:* hard to translate mood into a query → intent chips → prototype test.
  - *Opportunity B:* too many options → three-track mini-queue → time-to-play experiment.
  - *Opportunity C:* unclear recommendations → concise “why this” → trust/usability test.
  - *Opportunity D:* skip recovery is hard → instant refresh → behavioural test.

## Sequence
| Stage | Window (illustrative) | Deliverable | Go/no-go criterion |
| --- | --- | --- | --- |
| Discover | Weeks 1–2 | Interviews, behavioural map | Evidence that problem exists |
| Prototype | Weeks 3–4 | Clickable low-fidelity Sprint | Faster completion without loss of confidence |
| Instrument | Week 5 | Event taxonomy and QA | Reliable save/skip/play events |
| Experiment | Weeks 6–7 | Randomised test proposal | Meets primary and guardrails |
| Decide | Week 8 | Ship, iterate or stop recommendation | Decision grounded in results |

## Proposed experiment
Eligible users who explicitly seek new music: compare current journey (A) against optional Sprint entry (B). Randomisation unit: user, avoid cross-device contamination. Primary metric: time to meaningful play; guardrails: listening minutes and 7-day retention. Set sample size and analysis plan before test.

## Backlog
| Priority | Story | Acceptance criterion |
| --- | --- | --- |
| P0 | Choose an intent | Can select and change one intent |
| P0 | Preview 3 picks | Three recommendations surfaced promptly |
| P0 | Save or skip | Actions recorded without duplicates |
| P1 | Feedback reasons | User can optionally select an explanation |
| P2 | Share mini-queue | Only if there is measured demand |

## Biggest trade-off
A small recommendation set may speed decisions but reduce diversity. Add a diversity guardrail and do not force the flow.