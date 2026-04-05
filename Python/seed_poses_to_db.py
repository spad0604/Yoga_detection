from __future__ import annotations

import os
import re
import sys
import uuid
import argparse
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List

import pandas as pd
import psycopg

APP_DIR = Path(__file__).resolve().parent
CSV_PATH = APP_DIR / "yoga_keypoints.csv"


def _clean_label_to_name(label: str) -> str:
    # Example label: "Head-to-Knee_Forward_Bend_pose_or_Janu_Sirsasana_"
    s = (label or "").strip()
    s = s.strip("_, ")
    s = s.replace("_", " ")
    s = re.sub(r"\s+", " ", s).strip()

    # Remove generic words while keeping meaning
    s = re.sub(r"\bpose\b", "", s, flags=re.IGNORECASE)
    s = re.sub(r"\s+", " ", s).strip()

    return s


@dataclass
class PoseRow:
    code: str
    name: str
    image_url: str | None
    total_minutes: int
    total_calos: int
    level: str
    description: str | None
    tutorial_video_url: str | None


def _iter_pose_rows(
    labels: Iterable[str],
    *,
    image_url: str | None,
    total_minutes: int,
    total_calos: int,
    level: str,
    limit: int | None,
) -> Iterable[PoseRow]:
    count = 0
    for label in sorted(set(labels)):
        if limit is not None and count >= limit:
            break

        name = _clean_label_to_name(label)
        if not name:
            continue

        yield PoseRow(
            code=str(uuid.uuid4()),
            name=name,
            image_url=image_url,
            total_minutes=total_minutes,
            total_calos=total_calos,
            level=level,
            description=f"Yoga-82 label: {label}",
            tutorial_video_url=None,
        )
        count += 1


def _get_db_url() -> str:
    url = os.getenv("DATABASE_URL") or os.getenv("SUPABASE_DB_URL")
    if not url:
        raise SystemExit(
            "Missing DATABASE_URL (or SUPABASE_DB_URL). Example:\n"
            "  setx DATABASE_URL \"postgresql://USER:PASSWORD@HOST:5432/postgres\"\n"
        )
    return url


def main(argv: List[str]) -> int:
    parser = argparse.ArgumentParser(description="Seed Yoga-82 poses into yoga_pose_details")
    parser.add_argument("--image-url", default=None, help="Use one imageUrl for all poses")
    parser.add_argument("--minutes", type=int, default=1, help="Default totalMinutes")
    parser.add_argument("--calos", type=int, default=5, help="Default totalCalos")
    parser.add_argument(
        "--level",
        default="BEGINNER",
        choices=["BEGINNER", "INTERMEDIATE", "ADVANCED"],
        help="Default level",
    )
    parser.add_argument("--limit", type=int, default=None, help="Limit number of unique poses seeded")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be inserted without writing")
    args = parser.parse_args(argv)

    if not CSV_PATH.exists():
        print(f"CSV not found: {CSV_PATH}", file=sys.stderr)
        return 2

    db_url = _get_db_url()

    df = pd.read_csv(CSV_PATH, usecols=["label"])
    labels = df["label"].dropna().astype(str).tolist()

    rows = list(
        _iter_pose_rows(
            labels,
            image_url=(args.image_url.strip() if isinstance(args.image_url, str) and args.image_url.strip() else None),
            total_minutes=args.minutes,
            total_calos=args.calos,
            level=args.level,
            limit=args.limit,
        )
    )
    print(f"Found {len(rows)} unique poses from Yoga-82 labels")

    if args.dry_run:
        for r in rows[:10]:
            print(f"DRY RUN: would insert name='{r.name}', level={r.level}")
        if len(rows) > 10:
            print(f"DRY RUN: ... and {len(rows) - 10} more")
        return 0

    inserted = 0
    skipped = 0

    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            for r in rows:
                # Skip if a pose with the same name already exists
                cur.execute(
                    'SELECT code FROM "yoga_pose_details" WHERE lower(name) = lower(%s) OR description = %s LIMIT 1',
                    (r.name, r.description),
                )
                if cur.fetchone() is not None:
                    skipped += 1
                    continue

                cur.execute(
                    'INSERT INTO "yoga_pose_details" '
                    '(code, name, image_url, total_minutes, total_calos, level, description, tutorial_video_url) '
                    'VALUES (%s, %s, %s, %s, %s, %s, %s, %s)',
                    (
                        r.code,
                        r.name,
                        r.image_url,
                        r.total_minutes,
                        r.total_calos,
                        r.level,
                        r.description,
                        r.tutorial_video_url,
                    ),
                )
                inserted += 1

        conn.commit()

    print(f"Inserted: {inserted}, skipped(existing): {skipped}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
