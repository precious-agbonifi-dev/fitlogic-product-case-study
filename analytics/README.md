# Analytics workstream

This folder shows how FitLogic would support data-informed product decisions.

Files:
- `schema.sql` — illustrative event table
- `analysis.sql` — funnel and engagement queries for SQLite-style SQL
- `generate_sample_data.py` — reproducible synthetic dataset generator

The generator creates **synthetic** events only, not real customer behaviour.

## Run locally
```bash
python analytics/generate_sample_data.py
sqlite3 :memory: ".read analytics/schema.sql" ".mode csv" ".import --skip 1 data/synthetic_events.csv events" ".read analytics/analysis.sql"
```
Your SQLite CLI may require separate commands for CSV import. See the generator and schema for data fields.

## Interpretation
Compare rates by cohort, verify event deduplication and report denominators. Do not extrapolate business performance from simulated data.