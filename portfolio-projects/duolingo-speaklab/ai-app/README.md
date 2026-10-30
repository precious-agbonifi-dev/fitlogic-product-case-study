# SpeakLab AI — deployable full-stack MVP

**Status: Implementation committed; live AI service requires Vercel deployment and a private OpenAI API key.**
This app upgrades the existing deterministic SpeakLab demo with a server-side OpenAI Responses API integration.

## Architecture
```text
Browser (index.html)
  ↓ POST /api/coach (scenario + typed response)
Vercel Serverless Function (api/coach.js)
  ↓ OpenAI Responses API (secret in server environment only)
Structured feedback JSON → browser
```

**Model:** `gpt-6-luna` by default (override with `OPENAI_MODEL`). Model access and billing depend on your API account. The model is a tool for formative feedback, not a formal assessment.

## Deploy
1. Open [Vercel New Project](https://vercel.com/new) and import the GitHub repository `precious-agbonifi-dev/fitlogic-product-case-study`.
2. Set **Root Directory** to `portfolio-projects/duolingo-speaklab/ai-app`.
3. Choose **Other** (no framework); leave build command unset. Deploy.
4. In Vercel → Project → Settings → Environment Variables add `OPENAI_API_KEY` (secret value copied directly from your OpenAI API dashboard). Optionally set `OPENAI_MODEL=gpt-6-luna`.
5. **Redeploy**. Never paste the key into GitHub, client JavaScript, a chat, issue or screenshot.
6. Visit your Vercel deployment URL, open one scenario and submit a response. Expect structured AI feedback.
7. Configure deployment protection, budget limits and a persistent rate limiter **before** sharing a public link widely.

**Vercel hosting and OpenAI API usage can incur costs.** ChatGPT subscriptions do not automatically include API credits.

## Local development
Requires Node 20+ and Vercel CLI.
```bash
npm install -g vercel
cd portfolio-projects/duolingo-speaklab/ai-app
vercel dev
```
Set the environment variable through Vercel or a local gitignored `.env` file.

## Acceptance criteria
- [x] Front end handles server responses and errors without leaking keys.
- [x] Server calls actual language model using Responses API and strict JSON schema.
- [x] Input length and scenario restricted; upstream timeout and token cap.
- [x] Zero transcript storage in application code; `store:false` in provider request.
- [x] Fallback feedback explicitly labelled simulated.
- [ ] Live Vercel deployment and private key configured.
- [ ] Live end-to-end API test (not possible without an authorised key).
- [ ] Production rate limits / abuse prevention and budget caps.
- [ ] Human review of AI accuracy and usability testing.

## Safeguards and limitations
This is **not production hardened**: there is no authentication, durable rate limiter, bot protection or cost quota, so keep it protected during initial testing. Provider infrastructure may process input under its own policies. Do not enter names, health information or confidential data. Avoid storing answer text in analytics. Model feedback may be inaccurate.

## Evaluation plan
Test 20 educator-authored examples across three scenarios: natural answer, incorrect answer, synonym, prompt injection, blank/invalid input, and unsafe/sensitive information. Score accuracy, actionability, unjustified correction, latency and failure rates. Document all outcomes before claiming performance.

## Related documents
[Product strategy](../README.md) · [A/B experiment](../experiments.md) · [Roadmap](../roadmap.md)

## Sources
- [OpenAI Responses API](https://developers.openai.com/api/docs/guides/text)
- [Vercel environment variables](https://vercel.com/docs/environment-variables)
