"""Create reproducible synthetic FitLogic product events; no personal data."""
import csv
import random
from datetime import datetime, timedelta
from pathlib import Path

random.seed(42)
out = Path(__file__).resolve().parents[1] / "data" / "synthetic_events.csv"
out.parent.mkdir(parents=True, exist_ok=True)
base = datetime(2026, 1, 5, 9, 0)
rows = []
seq = 0

def add(user, event, when, workout="", channel="", days=0):
    global seq
    seq += 1
    rows.append([f"evt_{seq:05d}", user, event, when.isoformat(sep=" "), f"plan_{user}", workout, channel, days or ""])

for n in range(1, 101):
    user = f"user_{n:03d}"
    start = base + timedelta(days=random.randint(0, 14))
    channel = random.choice(["organic", "referral", "social"])
    days = random.choice([2, 3, 4])
    add(user, "signup_completed", start, channel=channel)
    if random.random() > 0.18:
        add(user, "onboarding_completed", start + timedelta(hours=1), days=days)
        for week in range(4):
            for session in range(days):
                if random.random() < (0.72 - week * 0.08):
                    when = start + timedelta(days=week * 7 + session * 2 + 1, hours=2)
                    wid = f"{user}_w{week}_s{session}"
                    add(user, "workout_completed", when, workout=wid)
rows.sort(key=lambda r: (r[3], r[0]))
with out.open("w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["event_id","user_id","event_name","event_timestamp","plan_id","workout_id","acquisition_channel","planned_days"])
    writer.writerows(rows)
print(f"Wrote {len(rows)} synthetic events to {out}")
