-- FitLogic example SQL: synthetic data only, SQLite dialect.
-- 1. Signup-to-onboarding conversion
WITH signups AS (
  SELECT DISTINCT user_id FROM events WHERE event_name = 'signup_completed'
), onboarded AS (
  SELECT DISTINCT user_id FROM events WHERE event_name = 'onboarding_completed'
)
SELECT COUNT(*) AS signups,
       SUM(CASE WHEN o.user_id IS NOT NULL THEN 1 ELSE 0 END) AS onboarded,
       ROUND(100.0 * SUM(CASE WHEN o.user_id IS NOT NULL THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*), 0), 1) AS onboarding_pct
FROM signups s LEFT JOIN onboarded o ON o.user_id = s.user_id;

-- 2. First-workout activation within seven days of signup
WITH first_signup AS (
  SELECT user_id, MIN(event_timestamp) AS signed_up_at
  FROM events WHERE event_name = 'signup_completed' GROUP BY user_id
), first_workout AS (
  SELECT user_id, MIN(event_timestamp) AS first_completed_at
  FROM events WHERE event_name = 'workout_completed' GROUP BY user_id
)
SELECT COUNT(*) AS signed_up_users,
 SUM(CASE WHEN w.first_completed_at >= s.signed_up_at
               AND w.first_completed_at < datetime(s.signed_up_at, '+7 days') THEN 1 ELSE 0 END) AS activated_users,
 ROUND(100.0 * SUM(CASE WHEN w.first_completed_at >= s.signed_up_at
               AND w.first_completed_at < datetime(s.signed_up_at, '+7 days') THEN 1 ELSE 0 END)
       / NULLIF(COUNT(*),0),1) AS activation_pct
FROM first_signup s LEFT JOIN first_workout w USING (user_id);

-- 3. Weekly workout completions by user
SELECT user_id, strftime('%Y-%W', event_timestamp) AS year_week,
       COUNT(DISTINCT workout_id) AS workouts_completed
FROM events WHERE event_name = 'workout_completed'
GROUP BY user_id, year_week ORDER BY year_week, user_id;

-- 4. Cohort week-4 engagement (days 21–27 after signup)
WITH signups AS (
 SELECT user_id, MIN(event_timestamp) AS signup_at
 FROM events WHERE event_name='signup_completed' GROUP BY user_id
)
SELECT COUNT(*) AS signup_users,
       COUNT(DISTINCT CASE WHEN julianday(e.event_timestamp) - julianday(s.signup_at) >= 21
          AND julianday(e.event_timestamp) - julianday(s.signup_at) < 28 THEN e.user_id END) AS week4_engaged
FROM signups s LEFT JOIN events e ON e.user_id=s.user_id AND e.event_name='workout_completed';
