# SpeakLab — AI-assisted Language Practice Concept

## Interactive visual case study
**[Explore the live dashboard, roadmap, journey map and research register](visuals/index.html)**. Figures are synthetic and findings are unvalidated hypotheses.
### Duolingo-inspired independent MVP and growth experiment

**Role:** Product Manager / Product Analyst / Prototyper  
**Status:** Working **local browser prototype**; deterministic coaching simulation, NOT a live AI model, hosted product or Duolingo release.

## Genuine AI-powered MVP (deployable backend)

**[AI-powered application source and Vercel deployment instructions](ai-app/README.md)** · [AI interface](ai-app/index.html) · [Secure server endpoint](ai-app/api/coach.js)

The new full-stack version uses a server-side OpenAI Responses API integration, structured feedback, input validation and an error-handling interface. **Live AI is not active until Vercel is deployed and an API key is configured privately.** The existing [rule-based browser demo](demo/index.html) remains available.

## The challenge
Some language learners may feel uncomfortable speaking in realistic situations, even when they recognise vocabulary. **Hypothesis:** a low-stakes speaking preparation flow with transparent, actionable feedback will increase learner confidence and repeat practice.

Duolingo already provides AI-supported Roleplay and Video Call for some users. This case study is **not** a claim that Duolingo lacks AI conversation. [Official Duolingo AI learning feature](https://blog.duolingo.com/duolingo-max/).

## Product concept
**SpeakLab** is an independently designed conversational micropractice tool. A learner chooses a real-world situation, types a response, gets specific rule-based feedback, and tries again.

### Try the prototype
**[Open the interactive MVP source](demo/index.html)**. Download/open the HTML file in a browser. GitHub does not directly run HTML source; public live hosting would require GitHub Pages.

The prototype includes:
- Scenario selection (coffee order, directions, introductions).
- A guided prompt, answer input and feedback rules.
- Session progress, attempts and confidence check.
- A simulated product analytics view (no external tracking or stored personal data).
- Mobile-responsive design, keyboard-accessible controls and explanatory limitations.

**Implementation:** A single HTML file with embedded CSS and JavaScript; no server, API key, paid AI service or personal data collection.

## What I decided
| Decision | Why | Alternative rejected | Trade-off |
| --- | --- | --- | --- |
| Text-before-voice MVP | Lower technical/consent barrier | Speech recognition now | Less realistic speaking practice |
| Deterministic coach for demo | Reliable, zero cost, transparent | Pretending to run live AI | Limited language understanding |
| One short practice loop | Test habit formation quickly | Full adaptive curriculum | Limited depth |
| Confidence check, not only correctness | Captures learner-perceived progress | Score-only feedback | Subjective metric |
| Anonymised event design | Privacy minimisation | Detailed transcripts by default | Less diagnostic detail |

## Core user story
“As a hesitant language learner, I want a safe, short practice conversation and understandable feedback so I can try speaking in real situations with greater confidence.”

## Success criteria
**Primary (future pilot):** percent of activated learners completing a second practice session within 7 days.  
**Secondary:** task completion, median attempts per session, confidence uplift (pre/post), feedback usefulness.  
**Guardrails:** incorrect feedback reports, frustration, privacy incidents and accessibility failures.

No measured user conversion or educational outcome is claimed.

## Product documents
- [Experiment design and A/B testing](experiments.md)
- [Product roadmap, prioritisation and delivery stages](roadmap.md)
- [PRD, AI decision framework and ethics](prd-and-ai-controls.md)
- [Proposed SQL analytics](analytics.sql)

## How to turn prototype into real AI MVP
1. Test prompt/response flow with 5–8 learners and document evidence.
2. Add secure backend proxy with LLM provider and capped token usage.
3. Use tightly scoped prompt contracts and content safety rules.
4. Evaluate feedback quality with educator-reviewed examples.
5. Capture only consented, minimal event data; do not expose API keys client-side.
6. Add monitoring, escalation and manual fallback.

## Resume-ready statement
“Designed and implemented a working browser-based language practice prototype with scenario flows, deterministic feedback and session measurement; built an AI integration plan, roadmap, analytics framework and proposed growth experiment.”