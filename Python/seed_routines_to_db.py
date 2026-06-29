from __future__ import annotations

import argparse
import csv
import datetime as dt
import os
import sys
import uuid
import zlib
from dataclasses import dataclass
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

import psycopg

APP_DIR = os.path.dirname(os.path.abspath(__file__))
DB_URL_FILE = os.path.join(APP_DIR, ".db_url")
POSE_DETAILS_CSV = os.path.join(APP_DIR, "yoga_pose_details_rows.csv")


def _get_db_url() -> str:
    url = os.getenv("DATABASE_URL") or os.getenv("SUPABASE_DB_URL")
    if not url and os.path.exists(DB_URL_FILE):
        with open(DB_URL_FILE, "r", encoding="utf-8") as f:
            for line in f.read().splitlines():
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


def _utc_now() -> dt.datetime:
    return dt.datetime.now(dt.timezone.utc)


def _stable_int_seed(text: str) -> int:
    return zlib.crc32(text.encode("utf-8")) & 0xFFFFFFFF


def _fetch_table_columns(conn: psycopg.Connection, table_name: str, schema: str = "public") -> set[str]:
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT column_name
            FROM information_schema.columns
            WHERE table_schema = %s AND table_name = %s
            """,
            (schema, table_name),
        )
        return {r[0] for r in cur.fetchall()}


def _ensure_schema(conn: psycopg.Connection) -> None:
    with conn.cursor() as cur:
        cur.execute('ALTER TABLE "yoga_routine" ALTER COLUMN description TYPE TEXT')
        cur.execute('ALTER TABLE "yoga_routine" ALTER COLUMN image_url TYPE TEXT')
        cur.execute('ALTER TABLE "routine_pose" ALTER COLUMN instructions TYPE TEXT')


@dataclass(frozen=True)
class Pose:
    code: str
    name: str
    level: str
    total_minutes: int
    total_calos: int
    description: str = ""


def fetch_poses(conn: psycopg.Connection, *, level: Optional[str] = None) -> List[Pose]:
    params: List[object] = []
    where = ""
    if level:
        where = "WHERE upper(level) = upper(%s)"
        params.append(level)

    with conn.cursor() as cur:
        cur.execute(
            f"""
            SELECT code, name, level, total_minutes, total_calos, description
            FROM \"yoga_pose_details\"
            {where}
            ORDER BY upper(level) ASC, lower(name) ASC
            """,
            params,
        )
        rows = cur.fetchall()

    poses: List[Pose] = []
    for code, name, lvl, minutes, calos, description in rows:
        poses.append(
            Pose(
                code=str(code),
                name=str(name),
                level=str(lvl) if lvl is not None else "",
                total_minutes=int(minutes) if minutes is not None else 0,
                total_calos=int(calos) if calos is not None else 0,
                description=str(description) if description is not None else "",
            )
        )
    return poses


def fetch_poses_from_csv(*, level: Optional[str] = None) -> List[Pose]:
    poses: List[Pose] = []
    with open(POSE_DETAILS_CSV, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        for row in reader:
            lvl = row["level"]
            if level and lvl.upper() != level.upper():
                continue
            poses.append(
                Pose(
                    code=row["code"],
                    name=row["name"],
                    level=lvl,
                    total_minutes=int(row["total_minutes"]),
                    total_calos=int(row["total_calos"]),
                    description=row.get("description") or "",
                )
            )
    return poses


@dataclass(frozen=True)
class RoutinePlan:
    name: str
    description: str
    level: str
    tags_json: str
    is_premium: bool
    order_index: int
    pose_level: Optional[str]
    pose_count: int
    pose_names: Tuple[str, ...] = ()


DEFAULT_ROUTINES: List[RoutinePlan] = [
    RoutinePlan(
        name="Morning Foundation Flow",
        description=(
            "Bài tập buổi sáng giúp đánh thức cơ thể theo nhịp nhẹ: bắt đầu bằng vận động cột sống, "
            "mở vai-hông, sau đó tăng nhiệt qua các tư thế đứng cơ bản. Phù hợp khi cần tỉnh táo, "
            "giảm cứng lưng sau khi ngủ và chuẩn bị năng lượng cho ngày mới."
        ),
        level="BEGINNER",
        tags_json='["morning","mobility","beginner","energy"]',
        is_premium=False,
        order_index=0,
        pose_level=None,
        pose_count=8,
        pose_names=(
            "Cat Cow or Marjaryasana",
            "Child or Balasana",
            "Downward-Facing Dog or Adho Mukha Svanasana",
            "Low Lunge or Anjaneyasana",
            "Warrior I or Virabhadrasana I",
            "Warrior II or Virabhadrasana II",
            "Tree or Vrksasana",
            "Standing Forward Bend or Uttanasana",
        ),
    ),
    RoutinePlan(
        name="Evening Deep Relaxation",
        description=(
            "Bài phục hồi cuối ngày, ưu tiên thả lỏng hệ thần kinh và giảm căng vùng lưng-hông. "
            "Các tư thế được giữ lâu hơn, chuyển động chậm, phù hợp sau ngày làm việc hoặc trước khi ngủ."
        ),
        level="BEGINNER",
        tags_json='["evening","relax","sleep","beginner"]',
        is_premium=False,
        order_index=1,
        pose_level=None,
        pose_count=8,
        pose_names=(
            "Child or Balasana",
            "Bound Angle or Baddha Konasana",
            "Supta Baddha Konasana",
            "Happy Baby or Ananda Balasana",
            "Wind Relieving or Pawanmuktasana",
            "Legs-Up-the-Wall or Viparita Karani",
            "Corpse or Savasana",
            "Yogic sleep",
        ),
    ),
    RoutinePlan(
        name="Neck Shoulder Back Reset",
        description=(
            "Bài giãn cổ-vai-lưng cho người ngồi nhiều. Trình tự mở ngực, kéo dài lưng trên, "
            "giải phóng vai và xoay cột sống nhẹ để giảm cảm giác gù/căng sau thời gian làm việc."
        ),
        level="BEGINNER",
        tags_json='["desk","shoulders","back","mobility"]',
        is_premium=False,
        order_index=2,
        pose_level=None,
        pose_count=8,
        pose_names=(
            "Cat Cow or Marjaryasana",
            "Extended Puppy or Uttana Shishosana",
            "Cobra or Bhujangasana",
            "Staff or Dandasana",
            "Cow Face or Gomukhasana",
            "Bharadvajas Twist or Bharadvajasana I",
            "Fish or Matsyasana",
            "Child or Balasana",
        ),
    ),
    RoutinePlan(
        name="Hip Opening Basics",
        description=(
            "Bài mở hông và đùi trong, hữu ích cho người hay căng hông, chạy bộ hoặc ngồi lâu. "
            "Tập trung vào việc đặt điểm tựa chắc, thở sâu và không ép đầu gối."
        ),
        level="BEGINNER",
        tags_json='["hips","flexibility","lower-body","beginner"]',
        is_premium=False,
        order_index=3,
        pose_level=None,
        pose_count=8,
        pose_names=(
            "Garland or Malasana",
            "Bound Angle or Baddha Konasana",
            "Low Lunge or Anjaneyasana",
            "Frog or Bhekasana",
            "Pigeon or Kapotasana",
            "Reclining Hand-to-Big-Toe or Supta Padangusthasana",
            "Wide-Angle Seated Forward Bend or Upavistha Konasana",
            "Happy Baby or Ananda Balasana",
        ),
    ),
    RoutinePlan(
        name="Core & Balance Builder",
        description=(
            "Bài trung cấp để xây core, thăng bằng và khả năng giữ trục cơ thể. "
            "Chuỗi này kết hợp plank, twist và tư thế đứng một chân để tăng sự ổn định toàn thân."
        ),
        level="INTERMEDIATE",
        tags_json='["core","balance","intermediate"]',
        is_premium=False,
        order_index=4,
        pose_level=None,
        pose_count=10,
        pose_names=(
            "Plank or Kumbhakasana",
            "Dolphin Plank or Makara Adho Mukha Svanasana",
            "Boat or Paripurna Navasana",
            "Side Plank or Vasisthasana",
            "Eagle or Garudasana",
            "Half Moon or Ardha Chandrasana",
            "Warrior III or Virabhadrasana III",
            "Lord of the Dance or Natarajasana",
            "Half Lord of the Fishes or Ardha Matsyendrasana",
            "Seated Forward Bend or Paschimottanasana",
        ),
    ),
    RoutinePlan(
        name="Intermediate Strength Flow",
        description=(
            "Bài flow tăng sức mạnh thân trên và chân, chuyển nhịp rõ ràng giữa các tư thế chịu lực. "
            "Phù hợp khi muốn tập cường độ vừa-cao nhưng vẫn giữ kỹ thuật an toàn."
        ),
        level="INTERMEDIATE",
        tags_json='["strength","flow","intermediate","sweat"]',
        is_premium=False,
        order_index=5,
        pose_level=None,
        pose_count=10,
        pose_names=(
            "Chair or Utkatasana",
            "Warrior I or Virabhadrasana I",
            "Four-Limbed Staff or Chaturanga Dandasana",
            "Upward Plank or Purvottanasana",
            "Dolphin or Ardha Pincha Mayurasana",
            "Bow or Dhanurasana",
            "Locust or Salabhasana",
            "Camel or Ustrasana",
            "Extended Revolved Triangle or Utthita Trikonasana",
            "Wide-Legged Forward Bend or Prasarita Padottanasana",
        ),
    ),
    RoutinePlan(
        name="Backbend Mobility",
        description=(
            "Bài mở ngực-lưng sau có tiến trình từ nhẹ đến sâu. Mục tiêu là mở vai, cơ gập hông "
            "và lưng trên trước khi vào các tư thế backbend mạnh hơn."
        ),
        level="INTERMEDIATE",
        tags_json='["backbend","chest","mobility","intermediate"]',
        is_premium=True,
        order_index=6,
        pose_level=None,
        pose_count=8,
        pose_names=(
            "Cobra or Bhujangasana",
            "Locust or Salabhasana",
            "Bow or Dhanurasana",
            "Bridge or Setu Bandha Sarvangasana",
            "Camel or Ustrasana",
            "Fish or Matsyasana",
            "Upward Bow (Wheel) or Urdhva Dhanurasana",
            "Child or Balasana",
        ),
    ),
    RoutinePlan(
        name="Advanced Arm Balance & Inversion",
        description=(
            "Bài nâng cao dành cho người đã vững plank, core và vai. Chuỗi tập đi từ kích hoạt core "
            "đến arm balance/inversion, yêu cầu khởi động kỹ cổ tay-vai và nên tập gần tường hoặc có người hỗ trợ."
        ),
        level="ADVANCED",
        tags_json='["arm-balance","inversion","advanced","strength"]',
        is_premium=True,
        order_index=7,
        pose_level=None,
        pose_count=10,
        pose_names=(
            "Dolphin Plank or Makara Adho Mukha Svanasana",
            "Crane (Crow) or Bakasana",
            "Side Crane (Crow) or Parsva Bakasana",
            "Eight-Angle or Astavakrasana",
            "Firefly or Tittibhasana",
            "Peacock or Mayurasana",
            "Feathered Peacock or Pincha Mayurasana",
            "Handstand or Adho Mukha Vrksasana",
            "Supported Headstand or Salamba Sirsasana",
            "Child or Balasana",
        ),
    ),
]


def _pick_poses_for_routine(all_poses: Sequence[Pose], plan: RoutinePlan) -> List[Pose]:
    if plan.pose_names:
        by_name = {p.name.lower(): p for p in all_poses}
        selected = [by_name[name.lower()] for name in plan.pose_names if name.lower() in by_name]
        if selected:
            return selected

    poses = [p for p in all_poses if (not plan.pose_level or p.level.upper() == plan.pose_level.upper())]
    if not poses:
        raise RuntimeError(
            f"No poses available for level={plan.pose_level!r}. "
            "Seed yoga_pose_details first (e.g. Python/seed_poses_to_db.py)."
        )

    seed = _stable_int_seed(plan.name)
    start = seed % len(poses)

    selected: List[Pose] = []
    for i in range(plan.pose_count):
        selected.append(poses[(start + i) % len(poses)])
    return selected


def _ensure_routine(
    conn: psycopg.Connection,
    *,
    table_cols: set[str],
    plan: RoutinePlan,
    duration_minutes: int,
    estimated_calories: int,
) -> Tuple[str, bool]:
    """Return (routine_id, created)."""

    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT id FROM \"yoga_routine\"
            WHERE lower(name) = lower(%s)
            LIMIT 1
            """,
            (plan.name,),
        )
        row = cur.fetchone()
        if row is not None:
            routine_id = str(row[0])
            now = _utc_now()
            updates: Dict[str, object] = {
                "description": plan.description,
                "level": plan.level,
                "duration_minutes": duration_minutes,
                "estimated_calories": estimated_calories,
                "tags": plan.tags_json,
                "is_premium": plan.is_premium,
                "order_index": plan.order_index,
                "updated_at": now,
            }
            cols = [c for c in updates.keys() if c in table_cols]
            if cols:
                set_sql = ", ".join([f'"{c}" = %s' for c in cols])
                values = [updates[c] for c in cols]
                cur.execute(
                    f'UPDATE "yoga_routine" SET {set_sql} WHERE id = %s',
                    [*values, routine_id],
                )
            return routine_id, False

        routine_id = str(uuid.uuid4())
        now = _utc_now()

        data: Dict[str, object] = {
            "id": routine_id,
            "name": plan.name,
            "description": plan.description,
            "level": plan.level,
            "duration_minutes": duration_minutes,
            "estimated_calories": estimated_calories,
            "image_url": None,
            "tags": plan.tags_json,
            "is_premium": plan.is_premium,
            "order_index": plan.order_index,
            "created_at": now,
            "updated_at": now,
        }

        cols = [c for c in data.keys() if c in table_cols]
        values = [data[c] for c in cols]
        placeholders = ", ".join(["%s"] * len(cols))
        col_sql = ", ".join([f'"{c}"' for c in cols])

        cur.execute(
            f"INSERT INTO \"yoga_routine\" ({col_sql}) VALUES ({placeholders})",
            values,
        )

        return routine_id, True


def _ensure_routine_pose(
    conn: psycopg.Connection,
    *,
    table_cols: set[str],
    routine_id: str,
    pose: Pose,
    order_index: int,
    duration_seconds: int,
    rest_after_seconds: int,
    repetitions: int,
) -> bool:
    """Return created?"""
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT id FROM \"routine_pose\"
            WHERE routine_id = %s AND pose_code = %s
            LIMIT 1
            """,
            (routine_id, pose.code),
        )
        if cur.fetchone() is not None:
            cur.execute(
                """
                UPDATE "routine_pose"
                SET pose_name = %s,
                    order_index = %s,
                    duration_seconds = %s,
                    repetitions = %s,
                    rest_after_seconds = %s,
                    instructions = %s
                WHERE routine_id = %s AND pose_code = %s
                """,
                (
                    pose.name,
                    order_index,
                    duration_seconds,
                    repetitions,
                    rest_after_seconds,
                    _pose_instruction(pose, order_index),
                    routine_id,
                    pose.code,
                ),
            )
            return False

        row_id = str(uuid.uuid4())
        now = _utc_now()

        data: Dict[str, object] = {
            "id": row_id,
            "routine_id": routine_id,
            "pose_code": pose.code,
            "pose_name": pose.name,
            "order_index": order_index,
            "duration_seconds": duration_seconds,
            "repetitions": repetitions,
            "rest_after_seconds": rest_after_seconds,
            "instructions": _pose_instruction(pose, order_index),
            "created_at": now,
        }

        cols = [c for c in data.keys() if c in table_cols]
        values = [data[c] for c in cols]
        placeholders = ", ".join(["%s"] * len(cols))
        col_sql = ", ".join([f'"{c}"' for c in cols])

        cur.execute(
            f"INSERT INTO \"routine_pose\" ({col_sql}) VALUES ({placeholders})",
            values,
        )
        return True


def _pose_instruction(pose: Pose, order_index: int) -> str:
    hold = max(30, pose.total_minutes * 60)
    return (
        f"Bước {order_index + 1}: vào {pose.name} chậm trong 2-3 nhịp thở. "
        f"Giữ khoảng {hold} giây, ưu tiên hơi thở đều và form ổn định. "
        f"Nếu thấy đau nhói, giảm biên độ hoặc thoát thế. {pose.description[:220]}"
    ).strip()


def cmd_list_poses(argv: List[str]) -> int:
    parser = argparse.ArgumentParser(prog="seed_routines_to_db.py list-poses")
    parser.add_argument("--level", default=None, help="BEGINNER / INTERMEDIATE / ADVANCED")
    parser.add_argument("--limit", type=int, default=30)
    args = parser.parse_args(argv)

    db_url = _get_db_url()
    with psycopg.connect(db_url, prepare_threshold=None) as conn:
        poses = fetch_poses(conn, level=args.level)

    print(f"Total poses: {len(poses)}")
    for p in poses[: args.limit]:
        print(f"- {p.level:<12} {p.code} | {p.name}")
    if len(poses) > args.limit:
        print(f"... and {len(poses) - args.limit} more")
    return 0


def cmd_seed(argv: List[str]) -> int:
    parser = argparse.ArgumentParser(prog="seed_routines_to_db.py seed")
    parser.add_argument("--dry-run", action="store_true", help="Print what would be inserted")
    parser.add_argument(
        "--csv-dry-run",
        action="store_true",
        help="Preview plans from yoga_pose_details_rows.csv without connecting to the database",
    )
    parser.add_argument("--pose-duration", type=int, default=None, help="Override durationSeconds for every pose")
    parser.add_argument("--rest-after", type=int, default=5, help="Default restAfterSeconds")
    parser.add_argument("--repetitions", type=int, default=1, help="Default repetitions")
    args = parser.parse_args(argv)

    if args.dry_run and args.csv_dry_run:
        all_poses = fetch_poses_from_csv()
        plan_preview = [(plan, _pick_poses_for_routine(all_poses, plan)) for plan in DEFAULT_ROUTINES]
        for plan, selected in plan_preview:
            print(f"DRY RUN routine: {plan.name} ({plan.level}) -> {len(selected)} poses")
            for i, p in enumerate(selected[:5]):
                print(f"  {i:02d}. {p.name} ({p.level})")
            if len(selected) > 5:
                print(f"  ... and {len(selected) - 5} more")
        return 0

    db_url = _get_db_url()

    with psycopg.connect(db_url, prepare_threshold=None) as conn:
        _ensure_schema(conn)
        routine_cols = _fetch_table_columns(conn, "yoga_routine")
        routine_pose_cols = _fetch_table_columns(conn, "routine_pose")

        all_poses = fetch_poses(conn)
        if not all_poses:
            print("No poses found in yoga_pose_details. Seed poses first.", file=sys.stderr)
            return 2

        plan_preview: List[Tuple[RoutinePlan, List[Pose]]] = []
        for plan in DEFAULT_ROUTINES:
            selected = _pick_poses_for_routine(all_poses, plan)
            plan_preview.append((plan, selected))

        if args.dry_run:
            for plan, selected in plan_preview:
                print(f"DRY RUN routine: {plan.name} ({plan.level}) -> {len(selected)} poses")
                for i, p in enumerate(selected[:5]):
                    print(f"  {i:02d}. {p.name} ({p.level})")
                if len(selected) > 5:
                    print(f"  ... and {len(selected) - 5} more")
            return 0

        created_routines = 0
        skipped_routines = 0
        created_links = 0
        skipped_links = 0

        for plan, selected in plan_preview:
            # Compute totals from pose details when available
            total_minutes = sum(max(1, p.total_minutes) for p in selected)
            total_calos = sum(max(1, p.total_calos) for p in selected)

            routine_id, created = _ensure_routine(
                conn,
                table_cols=routine_cols,
                plan=plan,
                duration_minutes=total_minutes,
                estimated_calories=total_calos,
            )
            if created:
                created_routines += 1
            else:
                skipped_routines += 1

            for i, pose in enumerate(selected):
                duration_seconds = args.pose_duration if args.pose_duration is not None else max(30, pose.total_minutes * 60)
                did_create = _ensure_routine_pose(
                    conn,
                    table_cols=routine_pose_cols,
                    routine_id=routine_id,
                    pose=pose,
                    order_index=i,
                    duration_seconds=duration_seconds,
                    rest_after_seconds=args.rest_after,
                    repetitions=args.repetitions,
                )
                if did_create:
                    created_links += 1
                else:
                    skipped_links += 1

        conn.commit()

    print(
        "Done. "
        f"routines(created={created_routines}, skipped={skipped_routines}), "
        f"routine_pose(created={created_links}, skipped={skipped_links})"
    )
    return 0


def cmd_verify(argv: List[str]) -> int:
    parser = argparse.ArgumentParser(prog="seed_routines_to_db.py verify")
    parser.add_argument(
        "--names",
        default="Morning Energizer,Evening Relaxation,Core & Balance,Advanced Strength Flow",
        help="Comma-separated routine names to display",
    )
    args = parser.parse_args(argv)

    names = [s.strip() for s in str(args.names).split(",") if s.strip()]

    db_url = _get_db_url()
    with psycopg.connect(db_url, prepare_threshold=None) as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT count(*) FROM "yoga_routine"')
            routine_count = cur.fetchone()[0]
            cur.execute('SELECT count(*) FROM "routine_pose"')
            routine_pose_count = cur.fetchone()[0]

            print(
                f"yoga_routine count = {routine_count}\n"
                f"routine_pose count = {routine_pose_count}"
            )

            if names:
                placeholders = ",".join(["%s"] * len(names))
                cur.execute(
                    f'SELECT id, name, level, duration_minutes, estimated_calories, order_index '
                    f'FROM "yoga_routine" '
                    f'WHERE lower(name) IN ({placeholders}) '
                    f'ORDER BY order_index ASC NULLS LAST, created_at DESC',
                    tuple([n.lower() for n in names]),
                )
                rows = cur.fetchall()
                print("routines:")
                for r in rows:
                    print("-", r)

    return 0


def main(argv: List[str]) -> int:
    if not argv:
        print("Usage: seed_routines_to_db.py <list-poses|seed|verify> ...", file=sys.stderr)
        return 2

    cmd, rest = argv[0], argv[1:]
    if cmd == "list-poses":
        return cmd_list_poses(rest)
    if cmd == "seed":
        return cmd_seed(rest)
    if cmd == "verify":
        return cmd_verify(rest)

    print(f"Unknown command: {cmd}", file=sys.stderr)
    return 2


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
