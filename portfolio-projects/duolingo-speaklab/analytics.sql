-- SpeakLab proposed analytics schema and queries, SQLite dialect.
-- No live customer data exists for this independent prototype.
CREATE TABLE IF NOT EXISTS practice_events (
 event_id TEXT PRIMARY KEY,
 learner_id TEXT NOT NULL,
 event_name TEXT NOT NULL,
 event_time TEXT NOT NULL,
 variant TEXT NOT NULL,
 scenario_id TEXT,
 attempt_number INTEGER
);

-- 7-day return rate: a practice event in days 1–7 after initial opened event.
WITH first_open AS (
 SELECT learner_id, MIN(event_time) AS first_at FROM practice_events
 WHERE event_name = 'practice_opened' GROUP BY learner_id
), assignments AS (
 SELECT learner_id, MIN(variant) AS variant FROM practice_events GROUP BY learner_id
), returning AS (
 SELECT f.learner_id,
 MAX(CASE WHEN e.event_name='practice_opened'
              AND julianday(e.event_time)-julianday(f.first_at)>=1
              AND julianday(e.event_time)-julianday(f.first_at)<8 THEN 1 ELSE 0 END) AS returned
 FROM first_open f LEFT JOIN practice_events e ON e.learner_id=f.learner_id
 GROUP BY f.learner_id
)
SELECT a.variant, COUNT(*) AS eligible_learners,
 SUM(r.returned) AS returning_learners,
 ROUND(100.0*SUM(r.returned)/NULLIF(COUNT(*),0),2) AS return_rate_pct
FROM returning r JOIN assignments a USING(learner_id) GROUP BY a.variant;

-- Feedback problems per 100 feedback views: a guardrail, not an effectiveness metric.
SELECT variant,
 ROUND(100.0*SUM(CASE WHEN event_name='feedback_flagged' THEN 1 ELSE 0 END)
 / NULLIF(SUM(CASE WHEN event_name='feedback_viewed' THEN 1 ELSE 0 END),0),2) AS flags_per_100_feedback_views
FROM practice_events GROUP BY variant;

-- Sample-ratio monitoring
SELECT variant,COUNT(DISTINCT learner_id) AS learner_count
FROM practice_events GROUP BY variant;
