# Spotify — Discovery Lab
### Independent product teardown & discovery case study

**My role:** Product Manager / Product Analyst (independent simulation)  
**Challenge:** Improve the experience of deciding *what to play next* when a listener wants something new but has little patience for browsing.  
**Status:** Strategy/design proposal; no Spotify data access or validated user interviews.

> **PM recommendation:** Test an intent-led **Discovery Sprint**: three short, explainable recommendations with one-tap feedback. Do **not** build another endless discovery feed.

## 1. Current product and opportunity
Spotify already offers personalised recommendations and AI Playlist. The gap explored here is not an absence of personalisation; it is the **hypothesis** that users sometimes need low-effort, high-confidence discovery in a specific moment.

**Observed public capability:** Spotify describes personalisation across Home, playlists and Search, and offers prompt-driven AI Playlist for eligible Premium users.  
**Sources:** [Spotify recommendations](https://www.spotify.com/uk/safetyandprivacy/understanding-recommendations) · [AI Playlist support](https://support.spotify.com/sl/article/ai-playlist/).

**Not a verified usability defect:** The hypothesis that choice overload creates unwanted browsing must be validated.

## 2. Jobs to be done
“When I have ten minutes to listen to something new, help me choose quickly and confidently, so that I spend more time enjoying music than searching.”

**Primary segment:** casual discovery seekers in short sessions.  
**Secondary:** users who want a change from their usual rotation.

## 3. Teardown: diagnosis → opportunity
| Touchpoint | Product strength | Hypothesised friction | Opportunity | Trade-off |
| --- | --- | --- | --- | --- |
| Home | Broad discovery | Too many choices for a particular intent | Narrow to one session goal | Less exploration |
| Search | Powerful explicit intent | User may not know what to type | Guided intent chips | Might constrain discovery |
| AI Playlist | Flexible text prompting | Prompt construction can be effortful | Suggested starter intents | Risk of duplicating current product |
| Feedback | Implicit listening signals | Hard to state *why* a recommendation misses | “More like this / not now” | Added interaction cost |

## 4. Solution concept: Discovery Sprint
**User flow:** Choose mood/time → preview three tracks → give lightweight feedback → save a mini-queue → play.

**Why three?** A deliberately small initial set allows an experiment in decision speed; the ideal number is not established.

**MVP:** Three intent chips, short recommendations, 'play', 'skip', 'save' and reason feedback.  
**Not MVP:** new recommendation model, social feed, open-ended AI chat.

## 5. How I'd decide
### Opportunity scores — illustrative RICE
| Opportunity | Reach | Impact | Confidence | Effort | Score |
| --- | ---: | ---: | ---: | ---: | ---: |
| Intent chips | 80 | 2 | 0.7 | 2 | 56 |
| Three-choice mini-queue | 65 | 2 | 0.65 | 3 | 28.2 |
| Explain recommendation | 40 | 1.5 | 0.5 | 4 | 7.5 |
| Social discovery feed | 60 | 1 | 0.3 | 9 | 2 |

Units are hypothetical and relative; do not interpret as performance data.

## 6. Metrics and countermetrics
**Primary:** minutes from entering discovery to meaningful play (defined as a track heard for 30+ seconds).  
**Secondary:** save rate, skip rate, 7-day repeat use and exploration diversity.  
**Guardrails:** total listening time, unwanted repetition, complaints and recommendation fairness.

**Analyst segmentation:** new vs existing listeners, Premium vs Free (where accessible), discovery intent, session length.

## 7. Decision log
- **Choose contextual discovery instead of more content:** Optimise task completion, not feed volume.
- **Reuse recommendation infrastructure:** Avoid inventing an expensive new model before validating behavioural demand.
- **Start with narrow cohort:** Reduce risk of negatively impacting habitual listeners.
- **Disconfirm with research:** If quick discovery isn't a meaningful problem, stop.

## 8. Research and roadmap
[Discovery research protocol](research-plan.md) · [Opportunity tree and phased roadmap](roadmap.md)

## 9. Interview-ready story
“I evaluated Spotify’s existing discovery surfaces and identified a testable, unvalidated hypothesis around decision effort. Instead of proposing another AI feature, I prioritised an intent-led microjourney, documented alternatives and trade-offs, and defined activation and guardrails that could disprove my idea.”

**No affiliation. No actual Spotify experiment or product release claimed.**