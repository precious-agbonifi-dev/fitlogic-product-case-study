-- Product Analyst exercise, hypothetical 'web_events' table, SQLite dialect.
-- event_id, visitor_id, session_id, event_name, event_time, device, variant
-- The table and examples are illustrative, not Uber data.

CREATE TABLE IF NOT EXISTS web_events (
  event_id TEXT PRIMARY KEY,
  visitor_id TEXT NOT NULL,
  session_id TEXT NOT NULL,
  event_name TEXT NOT NULL,
  event_time TEXT NOT NULL,
  device TEXT NOT NULL,
  variant TEXT NOT NULL
);

-- Handoff conversion by experiment variant and device.
WITH sessions AS (
 SELECT variant, device, session_id,
        MAX(CASE WHEN event_name = 'page_view' THEN 1 ELSE 0 END) AS eligible,
        MAX(CASE WHEN event_name = 'handoff_click' THEN 1 ELSE 0 END) AS converted
 FROM web_events
 GROUP BY variant, device, session_id
)
SELECT variant, device,
       SUM(eligible) AS eligible_sessions,
       SUM(CASE WHEN eligible = 1 THEN converted ELSE 0 END) AS handoff_sessions,
       ROUND(100.0 * SUM(CASE WHEN eligible = 1 THEN converted ELSE 0 END) /
         NULLIF(SUM(eligible), 0), 2) AS handoff_rate_pct
FROM sessions GROUP BY variant, device ORDER BY variant, device;

-- Event coverage & schema QA: missing assignment/session fields.
SELECT event_name,
       COUNT(*) AS total_events,
       SUM(CASE WHEN variant = '' OR session_id = '' THEN 1 ELSE 0 END) AS invalid_events
FROM web_events GROUP BY event_name;

-- Repeat visits vs first time visits (a possible behavioural segment).
WITH indexed AS (
 SELECT DISTINCT visitor_id, session_id,
        MIN(event_time) AS first_seen
 FROM web_events WHERE event_name = 'page_view'
 GROUP BY visitor_id, session_id
), numbered AS (
 SELECT visitor_id, session_id,
        ROW_NUMBER() OVER (PARTITION BY visitor_id ORDER BY first_seen) AS visit_number
 FROM indexed
)
SELECT CASE WHEN visit_number = 1 THEN 'first_visit' ELSE 'return_visit' END AS segment,
       COUNT(*) AS sessions
FROM numbered GROUP BY segment;
