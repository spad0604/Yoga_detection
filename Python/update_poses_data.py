"""
Update yoga pose details with realistic descriptions, levels, calorie burn, and duration.
Then sync with Supabase database.
"""

import os
import sys
import csv
from pathlib import Path
from typing import Dict, Tuple
import psycopg

APP_DIR = Path(__file__).resolve().parent
CSV_PATH = APP_DIR / "yoga_pose_details_rows.csv"

# Yoga pose metadata: (description_vi, level, total_calos, total_minutes)
POSE_METADATA = {
    "Bound Angle or Baddha Konasana": (
        "Tư thế góc hạn chế - mở rộng hông và ẻo mở cơ bụng dưới. Tốt cho linh hoạt hông.",
        "BEGINNER", 4, 2
    ),
    "Cow Face or Gomukhasana": (
        "Tư thế khuôn mặt bò - giãn vai, cánh tay và sâu lưng. Đang tìm cải thiện khả năng uốn dẻo của tay.",
        "INTERMEDIATE", 5, 3
    ),
    "Downward-Facing Dog or Adho Mukha Svanasana": (
        "Tư thế chó nhìn xuống - tăng cường toàn bộ cơ thể, đặc biệt vai, lưng và chân. Tư thế cơ bản quan trọng.",
        "BEGINNER", 8, 3
    ),
    "Side Plank or Vasisthasana": (
        "Tư thế xà lan bên - xây dựng sức mạnh lõi, vai và tay. Thử thách độ cân bằng.",
        "INTERMEDIATE", 12, 2
    ),
    "Low Lunge or Anjaneyasana": (
        "Tư thế phát lung thấp - giãn hip flexor và cúc dục. Tốt cho sở thích đi bộ và chạy bộ.",
        "BEGINNER", 6, 2
    ),
    "Supta Virasana Vajrasana": (
        "Tư thế chiến binh nằm - giãn sâu hip, thằn lưng và đùi. Tư thế nâng cao.",
        "ADVANCED", 7, 3
    ),
    "Peacock or Mayurasana": (
        "Tư thế công - xây dựng sức mạnh cánh tay và lõi. Tư thế cân bằng nâng cao.",
        "ADVANCED", 15, 1
    ),
    "Half Lord of the Fishes or Ardha Matsyendrasana": (
        "Tư thế xoay nửa - cải thiện linh hoạt cột sống và tiêu hoá. Tốt cho căng thẳng khuôn mặt.",
        "INTERMEDIATE", 5, 2
    ),
    "Standing Split or Urdhva Prasarita Eka Padasana": (
        "Tư thế tách đứng - giãn chân sau và xây dựng sự cân bằng. Thử thách tính linh hoạt và ổn định.",
        "ADVANCED", 10, 2
    ),
    "Half Moon or Ardha Chandrasana": (
        "Tư thế nửa mặt trăng - giãn hông, chân và sâu lưng. Xây dựng sức mạnh chân và cân bằng.",
        "INTERMEDIATE", 10, 2
    ),
    "Akarna Dhanurasana": (
        "Tư thế cung cầm tai - giãn chân và ứu mở cơ bụng dưới. Tư thế thách đố linh hoạt.",
        "ADVANCED", 8, 2
    ),
    "Upward Facing Two-Foot Staff or Dwi Pada Viparita Dandasana": (
        "Tư thế gậy ngược hai chân - mở lồng ngực và xây dựng sức mạnh lưng. Tư thế nâng cao.",
        "ADVANCED", 12, 2
    ),
    "Four-Limbed Staff or Chaturanga Dandasana": (
        "Tư thế bốn chi - tương tự chất lượng đẩy nhưng trong yoga. Xây dựng sức mạnh toàn bộ cơ thể.",
        "INTERMEDIATE", 10, 1
    ),
    "Boat or Paripurna Navasana": (
        "Tư thế thuyền - luyện tập lõi sâu và hip flexor. Khởi tạo tốt để xây dựng nội lực.",
        "INTERMEDIATE", 12, 2
    ),
    "Crane (Crow) or Bakasana": (
        "Tư thế quạ - xây dựng sức mạnh cánh tay và lõi. Tư thế cân bằng nâng cao.",
        "ADVANCED", 12, 1
    ),
    "Upward Bow (Wheel) or Urdhva Dhanurasana": (
        "Tư thế bánh xe - mở lồng ngực và sâu lưng, tăng cường lưng. Tư thế nâng cao.",
        "ADVANCED", 14, 2
    ),
    "Scorpion or vrischikasana": (
        "Tư thế bò cạp - nâng cao tư thế chống đầu với sự uốn dẻo của lưng. Tư thế nâng cao.",
        "ADVANCED", 15, 2
    ),
    "Tortoise": (
        "Tư thế qua - giãn chân sau toàn bộ cơ thể. Tư thế sâu giãn dãn.",
        "ADVANCED", 8, 3
    ),
    "Fish or Matsyasana": (
        "Tư thế cá - mở lồng ngực và cải thiện hô hấp. Giãn ngực và cách bụng.",
        "INTERMEDIATE", 6, 2
    ),
    "Dolphin Plank or Makara Adho Mukha Svanasana": (
        "Tư thế xà lan cá heo - xây dựng sức mạnh vai và lõi. Biến số khó tử xà lan tiêu chuẩn.",
        "INTERMEDIATE", 11, 2
    ),
    "Standing Forward Bend or Uttanasana": (
        "Tư thế cúi phía trước đứng - giãn chân sau và lưng. Tu luyện đơn giản nhưng hiệu quả.",
        "BEGINNER", 7, 2
    ),
    "Frog or Bhekasana": (
        "Tư thế ếch - giãn sâu hip phía trước. Tư thế giãn mạnh mẽ cho ích)",
        "BEGINNER", 6, 2
    ),
    "Handstand or Adho Mukha Vrksasana": (
        "Tư thế bàn tay - xây dựng sức mạnh vai, lõi và cơ hứ. Tư thế cân bằng nâng cao.",
        "ADVANCED", 16, 1
    ),
    "Wild Thing or Camatkarasana": (
        "Tư thế điều công - mở lồng ngực và bên cạnh. Sự kết hợp của sự mạnh mẽ và linh hoạt.",
        "INTERMEDIATE", 11, 1
    ),
    "Eight-Angle or Astavakrasana": (
        "Tư thế tám góc - xây dựng sức mạnh lõi và cánh tay. Tư thế ép kèm nâng cao.",
        "ADVANCED", 13, 2
    ),
    "Lord of the Dance or Natarajasana": (
        "Tư thế chúa vũ - giãn đùi phía trước và mở lồng ngực. Xây dựng sự cân bằng và linh hoạt.",
        "INTERMEDIATE", 8, 2
    ),
    "Happy Baby or Ananda Balasana": (
        "Tư thế em bé vui vẻ - giãn hông và lưng dưới. Tư thế nghỉ ngơi dễ dàng.",
        "BEGINNER", 4, 2
    ),
    "Cat Cow or Marjaryasana": (
        "Tư thế mèo bò - sưởi ấm cột sống và cải thiện tính linh hoạt. Phần động vào lên.",
        "BEGINNER", 6, 3
    ),
    "Sitting 1 (normal)": (
        "Tư thế ngồi tiêu chuẩn - vị trí cơ bản cho các tư thế ngồi.",
        "BEGINNER", 2, 1
    ),
    "Revolved Head-to-Knee or Parivrtta Janu Sirsasana": (
        "Tư thế xoay đầu tới đầu gối - giãn chân sau và xây dựng ứng dụng. Tư thế xoay nâng cao.",
        "INTERMEDIATE", 7, 2
    ),
    "Chair or Utkatasana": (
        "Tư thế ghế - xây dựng sức mạnh chân toàn bộ. Tư thế nhạc mạnh mẽ chứa năng lượng.",
        "BEGINNER", 10, 2
    ),
    "Gate or Parighasana": (
        "Tư thế cổng - giãn bên cạnh và hông. Sự kết hợp giãn và tăng cường.",
        "INTERMEDIATE", 7, 1
    ),
    "Pigeon or Kapotasana": (
        "Tư thế bồ câu - giãn sâu hông và khớp hông. Tư thế giãn nổi tiếng cho hông.",
        "INTERMEDIATE", 8, 2
    ),
    "Heron or Krounchasana": (
        "Tư thế cáp - giãn chân sau khi ngồi. Tư thế giãn thách đố.",
        "INTERMEDIATE", 7, 2
    ),
    "Yogic sleep": (
        "Tư thế ngủ yoga - thư giãn toàn bộ cơ thể. Hạ cơ thể về trạng thái yên tĩnh.",
        "BEGINNER", 3, 5
    ),
    "Eagle or Garudasana": (
        "Tư thế đại bàng - xây dựng cân bằng và sức mạnh chân. Tư thế sắp hạn cháy.",
        "INTERMEDIATE", 9, 2
    ),
    "Shoulder-Pressing or Bhujapidasana": (
        "Tư thế ấn vai - tăng cường vai và lõi. Tư thế cân bằng nâng cao.",
        "ADVANCED", 13, 1
    ),
    "Firefly or Tittibhasana": (
        "Tư thế đom đóm - xây dựng sức mạnh cánh tay và linh hoạt hông. Tư thế cân bằng nâng cao.",
        "ADVANCED", 14, 1
    ),
    "Supta Baddha Konasana": (
        "Tư thế góc hạn chế nằm - mở hông khi nằm. Tư thế thụ động cụ thể.",
        "BEGINNER", 4, 2
    ),
    "Warrior I or Virabhadrasana I": (
        "Tư thế chiến binh I - xây dựng sức mạnh chân và lõi. Tư thế cơ bản quan trọng.",
        "BEGINNER", 9, 2
    ),
    "Plow or Halasana": (
        "Tư thế cày - giãn cột sống và cải thiện tuần hoàn. Tư thế sâu nâng cao.",
        "ADVANCED", 10, 2
    ),
    "Side-Reclining Leg Lift or Anantasana": (
        "Tư thế nâng chân nằm bên - xây dựng sức mạnh chân bên. Tư thế tăng cường nhạc nhàng.",
        "INTERMEDIATE", 8, 2
    ),
    "Reclining Hand-to-Big-Toe or Supta Padangusthasana": (
        "Tư thế chạm ngón chân nằm - giãn chân sau có sự hỗ trợ. Tư thế giãn tốt cho sự mềm mại.",
        "BEGINNER", 6, 2
    ),
    "Supported Headstand or Salamba Sirsasana": (
        "Tư thế xoay đầu có hỗ trợ - xây dựng sức mạnh vai và nhạc khí. Tư thế đảo nâng cao.",
        "ADVANCED", 14, 2
    ),
    "Child or Balasana": (
        "Tư thế em bé - thư giãn lưng và vai. Tư thế nghỉ ngơi cơ bản.",
        "BEGINNER", 3, 2
    ),
    "Plank or Kumbhakasana": (
        "Tư thế xà lan - xây dựng sức mạnh lõi toàn bộ cơ thể. Tư thế cơ bản quan trọng.",
        "BEGINNER", 11, 1
    ),
    "Extended Revolved Side Angle or Utthita Parsvakonasana": (
        "Tư thế góc bên xoay - xây dựng sức mạnh chân và mở hông. Tư thế nâng cao.",
        "ADVANCED", 12, 2
    ),
    "Dedicated to the Sage Koundinya or Eka Pada Koundinyanasana I and II": (
        "Tư thế một chân nha sĩ - sự kết hợp sức mạnh lõi và cảnh cao. Tư thế cân bằng tuyệt vời.",
        "ADVANCED", 13, 2
    ),
    "Side Crane (Crow) or Parsva Bakasana": (
        "Tư thế quạ bên - xây dựng sức mạnh cánh tay và lõi. Tư thế cân bằng môn khó.",
        "ADVANCED", 13, 1
    ),
    "viparita virabhadrasana or reverse warrior": (
        "Tư thế chiến binh ngược - giãn sâu cạnh bên. Sự kết hợp giãn và tăng cường.",
        "INTERMEDIATE", 8, 2
    ),
    "Head-to-Knee Forward Bend or Janu Sirsasana": (
        "Tư thế cúi đầu tới đầu gối - giãn chân sau và lưng. Tư thế giãn không đối xứng.",
        "INTERMEDIATE", 7, 2
    ),
    "Wind Relieving or Pawanmuktasana": (
        "Tư thế giải phóng gió - massage tiêu hoá. Tấu thể nhạc mạnh nhưng lợi ích sâu.",
        "BEGINNER", 5, 2
    ),
    "Scale or Tolasana": (
        "Tư thế cân - xây dựng sức mạnh cánh tay và lõi. Tư thế cân bằng nâng cao.",
        "ADVANCED", 12, 1
    ),
    "Extended Puppy or Uttana Shishosana": (
        "Tư thế chó con dàn dài - giãn sâu cột sống và vai. Sự kết hợp từ chó nhìn xuống và em bé.",
        "BEGINNER", 6, 2
    ),
    "Seated Forward Bend or Paschimottanasana": (
        "Tư thế cúi phía trước ngồi - giãn sâu chân sau. Tư thế giãn tối đa.",
        "INTERMEDIATE", 8, 3
    ),
    "Wide-Angle Seated Forward Bend or Upavistha Konasana": (
        "Tư thế cúi góc rộng - giãn nội chần và chân sau. Tư thế giãn nâng cao.",
        "INTERMEDIATE", 7, 3
    ),
    "Cobra or Bhujangasana": (
        "Tư thế rắn - mở lồng ngực và xây dựng lưng. Tư thế tương tự nằm ngửa.",
        "BEGINNER", 7, 1
    ),
    "Virasana or Vajrasana": (
        "Tư thế chiến binh ngồi - giãn đùi phía trước trong cơ thể. Tư thế ngồi cơ bản.",
        "BEGINNER", 4, 2
    ),
    "Bow or Dhanurasana": (
        "Tư thế cung - mở lồng ngực và thắt lưng. Tư thế đẹp như cung.",
        "INTERMEDIATE", 10, 1
    ),
    "Locust or Salabhasana": (
        "Tư thế châu chấu - xây dựng lưng đứng. Tư thế tăng cường lưng ngốc tạo,",
        "INTERMEDIATE", 9, 1
    ),
    "Warrior III or Virabhadrasana III": (
        "Tư thế chiến binh III - xây dựng cân bằng và sức mạnh chân một chân. Tư thế cân bằng nhạt.",
        "INTERMEDIATE", 10, 2
    ),
    "Feathered Peacock or Pincha Mayurasana": (
        "Tư thế công lông - xây dựng sức mạnh vai. Tư thế đảo nâng cao.",
        "ADVANCED", 15, 2
    ),
    "Staff or Dandasana": (
        "Tư thế gậy - vị trí cơ bản ngồi. Đặc biệt là bắt đầu cho những tư thế ngồi.",
        "BEGINNER", 3, 1
    ),
    "Corpse or Savasana": (
        "Tư thế xác chết - thư giãn toàn bộ cơ thể. Tư thế cuối cùng trong mọi lớp yoga.",
        "BEGINNER", 2, 10
    ),
    "Upward Plank or Purvottanasana": (
        "Tư thế xà lan hướng lên - xây dựng sức mạnh lưng. Tư thế nâng cao với lợi ích nhiều.",
        "INTERMEDIATE", 11, 1
    ),
    "Split": (
        "Tư thế tách - giãn chân sau tối đa. Tư thế phát triển linh hoạt.",
        "ADVANCED", 8, 2
    ),
    "Rajakapotasana": (
        "Tư thế bồ câu hoàng gia - giãn sâu hông. Tư thế nâng cao với yêu cầu cao.",
        "ADVANCED", 10, 2
    ),
    "Bridge or Setu Bandha Sarvangasana": (
        "Tư thế cầu - xây dựng lưng và mở hông. Tư thế cơ bản tuyệt vời.",
        "BEGINNER", 10, 2
    ),
    "Intense Side Stretch or Parsvottanasana": (
        "Tư thế duỗi bên sâu - giãn chân sau và sâu bên. Tư thế giãn mạnh.",
        "INTERMEDIATE", 7, 2
    ),
    "Camel or Ustrasana": (
        "Tư thế lạc đà - mở lồng ngực sâu. Tư thế mở trước nâng cao.",
        "INTERMEDIATE", 9, 2
    ),
    "Cockerel": (
        "Tư thế gà trống - xây dựng sức mạnh cánh tay và lõi. Tư thế cân bằng nhạc.",
        "ADVANCED", 13, 1
    ),
    "Noose or Pasasana": (
        "Tư thế vòng - giãn chân sau với xoay. Tư thế giãn và xoay nâng cao.",
        "ADVANCED", 8, 2
    ),
    "Extended Revolved Triangle or Utthita Trikonasana": (
        "Tư thế tam giác xoay - giãn chân sau có xoay. Tư thế giãn nâng cao.",
        "INTERMEDIATE", 8, 2
    ),
    "Dolphin or Ardha Pincha Mayurasana": (
        "Tư thế cá heo - tương tự xà lan cá heo nhưng trên khuôn mặt. Biến số đẹp của chống đầu.",
        "INTERMEDIATE", 12, 2
    ),
    "Standing big toe hold or Utthita Padangusthasana": (
        "Tư thế nắm ngón chân lớn đứng - giãn chân sau có sự hỗ trợ. Tư thế giãn cơ bản.",
        "INTERMEDIATE", 7, 2
    ),
    "Bharadvajas Twist or Bharadvajasana I": (
        "Tư thế xoay bê rô - xoay nhẹ nhàng cột sống. Tư thế xoay cơ bản.",
        "BEGINNER", 5, 2
    ),
    "Warrior II or Virabhadrasana II": (
        "Tư thế chiến binh II - xây dựng sức mạnh chân. Tư thế chiến binh cơ bản.",
        "BEGINNER", 9, 2
    ),
    "Supported Shoulderstand or Salamba Sarvangasana": (
        "Tư thế xoay vai có hỗ trợ - xây dựng sức mạnh vai. Tư thế đảo nâng cao.",
        "ADVANCED", 11, 2
    ),
    "Garland or Malasana": (
        "Tư thế hoa trang - giãn hông và mở cơ bụng dưới. Tư thế ngồi cơ bản ở các nền văn hoá khác.",
        "BEGINNER", 5, 2
    ),
    "Wide-Legged Forward Bend or Prasarita Padottanasana": (
        "Tư thế cúi góc rộng - giãn chân sau và lưng. Tư thế giãn tuyệt vời.",
        "BEGINNER", 8, 2
    ),
    "Tree or Vrksasana": (
        "Tư thế cây - xây dựng cân bằng và sức mạnh chân. Tư thế cân bằng cơ bản.",
        "BEGINNER", 7, 2
    ),
    "Legs-Up-the-Wall or Viparita Karani": (
        "Tư thế chân lên tường - thư giãn và phục hồi. Tư thế hỗ trợ tuyệt vời.",
        "BEGINNER", 3, 5
    ),
}


def _get_db_url() -> str:
    url = os.getenv("DATABASE_URL") or os.getenv("SUPABASE_DB_URL")
    if not url:
        raise SystemExit(
            "Missing DATABASE_URL (or SUPABASE_DB_URL). Example:\n"
            "  setx DATABASE_URL \"postgresql://USER:PASSWORD@HOST:5432/postgres\"\n"
        )
    return url


def update_csv_file():
    """Update CSV file with realistic metadata."""
    updated_rows = []
    
    with open(CSV_PATH, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            name = row.get('name', '').strip()
            
            if name in POSE_METADATA:
                description, level, calos, minutes = POSE_METADATA[name]
                row['description'] = description
                row['level'] = level
                row['total_calos'] = str(calos)
                row['total_minutes'] = str(minutes)
            else:
                # Fallback for poses not in metadata
                print(f"⚠️  Warning: No metadata for '{name}'")
            
            updated_rows.append(row)
    
    # Write back to CSV
    if updated_rows:
        with open(CSV_PATH, 'w', newline='', encoding='utf-8') as f:
            fieldnames = updated_rows[0].keys()
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(updated_rows)
        print(f"✅ Updated CSV file: {len(updated_rows)} poses")
    
    return updated_rows


def sync_to_supabase(rows):
    """Sync updated data to Supabase database."""
    db_url = _get_db_url()
    
    updated_count = 0
    error_count = 0
    
    try:
        with psycopg.connect(db_url) as conn:
            with conn.cursor() as cur:
                for row in rows:
                    try:
                        # Update existing record by code
                        code = row.get('code')
                        name = row.get('name')
                        description = row.get('description')
                        level = row.get('level')
                        total_calos = row.get('total_calos')
                        total_minutes = row.get('total_minutes')
                        image_url = row.get('image_url') or None
                        tutorial_video_url = row.get('tutorial_video_url') or None
                        
                        cur.execute(
                            '''UPDATE "yoga_pose_details" 
                               SET description = %s, level = %s, total_calos = %s, total_minutes = %s,
                                   image_url = %s, tutorial_video_url = %s
                               WHERE code = %s''',
                            (description, level, int(total_calos), int(total_minutes), 
                             image_url, tutorial_video_url, code)
                        )
                        
                        if cur.rowcount > 0:
                            updated_count += 1
                        
                    except Exception as e:
                        print(f"❌ Error updating {name}: {e}")
                        error_count += 1
                
                conn.commit()
        
        print(f"✅ Supabase sync complete: {updated_count} updated, {error_count} errors")
        
    except Exception as e:
        print(f"❌ Database connection error: {e}")
        raise


def main():
    print("🧘 Updating yoga pose details...")
    
    # Update CSV
    rows = update_csv_file()
    
    # Sync to Supabase
    print("\n🔄 Syncing to Supabase...")
    sync_to_supabase(rows)
    
    print("\n✨ Done!")


if __name__ == "__main__":
    main()
