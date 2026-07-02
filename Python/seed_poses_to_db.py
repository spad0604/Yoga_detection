from __future__ import annotations

import os
import re
import sys
import uuid
import argparse
import csv
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List

import pandas as pd
import psycopg

APP_DIR = Path(__file__).resolve().parent
CSV_PATH = APP_DIR / "yoga_keypoints.csv"
DETAILS_CSV_PATH = APP_DIR / "yoga_pose_details_rows.csv"
DB_URL_FILE = APP_DIR / ".db_url"


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


def _focus_from_name(name: str) -> tuple[str, str, str]:
    n = name.lower()
    if any(k in n for k in ["forward bend", "paschimottanasana", "uttanasana", "janu", "padottanasana"]):
        return (
            "chuỗi cơ sau chân, lưng dưới và khả năng gập hông",
            "gập từ khớp hông, giữ lưng dài trước khi thả người sâu hơn",
            "tránh khóa gối hoặc kéo cổ; ưu tiên cảm giác kéo giãn đều hai bên thân",
        )
    if any(k in n for k in ["warrior", "chair", "lunge", "side angle"]):
        return (
            "sức mạnh chân, độ vững của hông và kiểm soát thân người",
            "ấn đều hai bàn chân xuống thảm, kéo dài cột sống và giữ gối đi cùng hướng mũi chân",
            "không để gối sụp vào trong; giảm biên độ nếu hông hoặc thắt lưng bị căng",
        )
    if any(k in n for k in ["plank", "staff", "boat", "side plank", "chaturanga"]):
        return (
            "core, vai, cổ tay và sức bền toàn thân",
            "siết nhẹ bụng dưới, đẩy sàn ra xa và giữ thân người thành một đường ổn định",
            "dừng lại nếu đau cổ tay/vai; có thể hạ gối để giữ form trước khi tăng độ khó",
        )
    if any(k in n for k in ["cobra", "bow", "bridge", "camel", "wheel", "locust", "upward"]):
        return (
            "mở ngực, lưng trên, cơ gập hông và chuỗi cơ trước thân",
            "nâng ngực bằng lực lưng trên, kéo vai ra sau và giữ cổ dài",
            "không ép thắt lưng; vào thế từ từ và thoát thế nếu thấy chèn ép vùng lưng dưới",
        )
    if any(k in n for k in ["twist", "revolved", "bharadvaja", "noose"]):
        return (
            "xoay cột sống, mở lồng ngực và giải phóng căng vùng hông-lưng",
            "kéo dài thân người khi hít vào, xoay nhẹ khi thở ra và giữ hai vai mềm",
            "không vặn giật; người có vấn đề đĩa đệm nên giảm biên độ và giữ hơi thở đều",
        )
    if any(k in n for k in ["pigeon", "frog", "angle", "garland", "happy baby", "baddha", "virasana"]):
        return (
            "mở hông, đùi trong, mông và vùng chậu",
            "đặt điểm tựa chắc, thư giãn cơ mặt và thở chậm vào vùng đang căng",
            "không ép đầu gối; dùng gối/chăn kê nếu khớp hông hoặc gối bị nhói",
        )
    if any(k in n for k in ["tree", "eagle", "half moon", "dance", "standing split", "big toe"]):
        return (
            "thăng bằng, cảm nhận trọng tâm và sự ổn định cổ chân-hông",
            "nhìn vào một điểm cố định, kích hoạt bàn chân trụ và giữ hơi thở chậm",
            "đứng gần tường nếu cần; không hy sinh trục gối hoặc hông để vào thế sâu",
        )
    if any(k in n for k in ["headstand", "shoulderstand", "handstand", "peacock", "scorpion", "firefly", "crane", "crow"]):
        return (
            "sức mạnh vai-core, định tuyến trọng lượng và khả năng kiểm soát nâng cao",
            "khởi động kỹ cổ tay/vai, vào thế từng bước và giữ cổ trung lập",
            "chỉ tập khi đã có nền tảng; nên có giáo viên hoặc tường hỗ trợ để tránh ngã/chèn ép cổ",
        )
    if any(k in n for k in ["corpse", "savasana", "sleep", "legs-up", "child"]):
        return (
            "phục hồi hệ thần kinh, thả lỏng lưng-hông và điều hòa hơi thở",
            "đỡ cơ thể thoải mái, thả vai-hàm-bụng và quan sát hơi thở tự nhiên",
            "giữ ấm cơ thể; nếu lưng dưới khó chịu hãy kê gối dưới đầu gối",
        )
    return (
        "nhận thức cơ thể, sự linh hoạt và kiểm soát hơi thở",
        "vào thế chậm, giữ cột sống dài và duy trì nhịp thở ổn định",
        "giảm biên độ nếu có đau nhói; ưu tiên form sạch hơn việc vào sâu",
    )


def _detailed_description(name: str, level: str, minutes: int, calos: int, original: str | None) -> str:
    focus, cue, safety = _focus_from_name(name)
    level_text = {
        "BEGINNER": "phù hợp người mới hoặc ngày tập nhẹ",
        "INTERMEDIATE": "phù hợp người đã có nền tảng và muốn tăng kiểm soát",
        "ADVANCED": "dành cho người tập vững kỹ thuật, cần khởi động kỹ và kiểm soát tốt",
    }.get(level.upper(), "phù hợp tập có kiểm soát")
    base = (original or "").strip()
    intro = f"{name} là tư thế {level_text}, tập trung vào {focus}."
    detail = (
        f"Thời lượng gợi ý {minutes} phút, ước tính khoảng {calos} kcal tùy nhịp thở và cường độ. "
        f"Khi vào thế, {cue}. Giữ hơi thở mũi đều, quan sát hai bên cơ thể có bị lệch không và thoát thế chậm để tránh căng đột ngột. "
        f"Lưu ý an toàn: {safety}."
    )
    if base and not base.startswith("Yoga-82 label"):
        return f"{base} {detail}"
    return f"{intro} {detail}"


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
            description=_detailed_description(name, level, total_minutes, total_calos, None),
            tutorial_video_url=None,
        )
        count += 1


def _read_details_rows(limit: int | None) -> list[PoseRow]:
    if not DETAILS_CSV_PATH.exists():
        raise SystemExit(f"Details CSV not found: {DETAILS_CSV_PATH}")

    rows: list[PoseRow] = []
    with DETAILS_CSV_PATH.open(newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if limit is not None and len(rows) >= limit:
                break

            rows.append(
                PoseRow(
                    code=row["code"],
                    name=row["name"],
                    image_url=row.get("image_url") or None,
                    total_minutes=int(row["total_minutes"]),
                    total_calos=int(row["total_calos"]),
                    level=row["level"],
                    description=_detailed_description(
                        row["name"],
                        row["level"],
                        int(row["total_minutes"]),
                        int(row["total_calos"]),
                        row.get("description") or None,
                    ),
                    tutorial_video_url=row.get("tutorial_video_url") or None,
                )
            )
    return rows


def _get_db_url() -> str:
    url = os.getenv("DATABASE_URL") or os.getenv("SUPABASE_DB_URL")
    if not url and DB_URL_FILE.exists():
        for line in DB_URL_FILE.read_text(encoding="utf-8").splitlines():
            s = line.strip()
            if not s or s.startswith("#"):
                continue
            url = s.strip('"').strip("'")
            break
    if not url:
        raise SystemExit(
            "Missing DATABASE_URL (or SUPABASE_DB_URL).\n\n"
            "Windows PowerShell (current terminal only):\n"
            "  $env:DATABASE_URL = 'postgresql://USER:PASSWORD@HOST:5432/postgres?sslmode=require'\n\n"
            "Windows CMD (current terminal only):\n"
            "  set DATABASE_URL=postgresql://USER:PASSWORD@HOST:5432/postgres?sslmode=require\n\n"
            "Or create a local file Python/.db_url containing the full connection string.\n\n"
            "Note: If your password contains special characters (e.g. '@'), URL-encode it.\n"
            "Example: 'Giap123@123' -> 'Giap123%40123'\n"
        )
    return url


def _ensure_schema(conn: psycopg.Connection) -> None:
    with conn.cursor() as cur:
        cur.execute('ALTER TABLE "yoga_pose_details" ALTER COLUMN description TYPE TEXT')
        cur.execute('ALTER TABLE "yoga_pose_details" ALTER COLUMN image_url TYPE TEXT')
        cur.execute('ALTER TABLE "yoga_pose_details" ALTER COLUMN tutorial_video_url TYPE TEXT')


def main(argv: List[str]) -> int:
    parser = argparse.ArgumentParser(description="Seed Yoga-82 poses into yoga_pose_details")
    parser.add_argument(
        "--source",
        default="details",
        choices=["details", "labels"],
        help="Use the rich details CSV by default, or derive rows from yoga_keypoints labels",
    )
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

    if args.source == "labels" and not CSV_PATH.exists():
        print(f"CSV not found: {CSV_PATH}", file=sys.stderr)
        return 2

    if args.source == "details":
        rows = _read_details_rows(args.limit)
    else:
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
    print(f"Found {len(rows)} poses from {args.source}")

    if args.dry_run:
        for r in rows[:10]:
            print(f"DRY RUN: would insert name='{r.name}', level={r.level}")
        if len(rows) > 10:
            print(f"DRY RUN: ... and {len(rows) - 10} more")
        return 0

    db_url = _get_db_url()

    inserted = 0
    skipped = 0

    with psycopg.connect(db_url, prepare_threshold=None) as conn:
        _ensure_schema(conn)
        with conn.cursor() as cur:
            for r in rows:
                if args.source == "labels":
                    cur.execute(
                        'SELECT code FROM "yoga_pose_details" WHERE lower(name) = lower(%s) OR description = %s LIMIT 1',
                        (r.name, r.description),
                    )
                else:
                    cur.execute(
                        'SELECT code FROM "yoga_pose_details" WHERE code = %s OR lower(name) = lower(%s) LIMIT 1',
                        (r.code, r.name),
                    )

                existing_row = cur.fetchone()
                existing_code = existing_row[0] if existing_row is not None else None
                exists = existing_code is not None
                if args.source == "labels" and exists:
                    skipped += 1
                    continue

                if exists:
                    cur.execute(
                        'UPDATE "yoga_pose_details" SET '
                        'name = %s, '
                        'image_url = %s, '
                        'total_minutes = %s, '
                        'total_calos = %s, '
                        'level = %s, '
                        'description = %s, '
                        'tutorial_video_url = %s '
                        'WHERE code = %s',
                        (
                            r.name,
                            r.image_url,
                            r.total_minutes,
                            r.total_calos,
                            r.level,
                            r.description,
                            r.tutorial_video_url,
                            existing_code,
                        ),
                    )
                    skipped += 1
                else:
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

    print(f"Inserted: {inserted}, updated/skipped(existing): {skipped}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
