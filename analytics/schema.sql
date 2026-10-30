-- Synthetic FitLogic product events (SQLite)
CREATE TABLE IF NOT EXISTS events (
  event_id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  event_name TEXT NOT NULL,
  event_timestamp TEXT NOT NULL,
  plan_id TEXT,
  workout_id TEXT,
  acquisition_channel TEXT,
  planned_days INTEGER
);
CREATE INDEX IF NOT EXISTS idx_events_user_time ON events (user_id, event_timestamp);
