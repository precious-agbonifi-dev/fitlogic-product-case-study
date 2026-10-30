# Reproducible demo data — synthetic

This dataset is generated solely to demonstrate product analytics. It is **not** from Uber, not sampled from real customers and cannot establish whether a redesign works.

## Run the SQL

```bash
sqlite3 rider_demo.db < analytics.sql
sqlite3 rider_demo.db < synthetic_seed.sql
sqlite3 -header -column rider_demo.db < analytics.sql
```

The analysis script creates the event table if needed and computes handoff rates, event quality and visit segments. The seed includes 60 fictional eligible sessions and an intentionally different outcome pattern between fictional variants A and B. **Do not claim this is an A/B test or statistically valid uplift.** This exercise illustrates metric contracts and denominators, not causality.

## Example descriptive output from constructed seed
- Variant A: 13/30 synthetic sessions clicked through (43.3%).
- Variant B: 17/30 synthetic sessions clicked through (56.7%).

**Interpretation:** Since this is scripted data, the higher rate in B is baked into the generation. A product analyst should never call this evidence that a website redesign improved conversion. With genuine randomised data, we'd check assignment stability, confidence intervals, sample ratio, consent and guardrails before deciding.
