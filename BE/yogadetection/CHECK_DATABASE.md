# 🔍 Debug "Unknown Pose" Issue

## Vấn đề
API `/api/practice-sessions/{sessionId}/submit-pose` nhận `poseCode` từ database nhưng AI vẫn báo "Unknown Pose"

## Root Cause Analysis

### Flow hiện tại:
1. ✅ Client gửi `poseCode` (ví dụ: `SEATED_FORWARD_FOLD`) từ `routine_pose` table
2. ✅ `PracticeSessionServiceImpl.submitPose()` nhận `poseCode`
3. ✅ Gọi `aiEvaluationService.evaluatePose(imageUrl, landmarkData, poseCode)`
4. ❌ `AIPoseEvaluationServiceImpl` query:
   ```java
   YogaPoseDetails poseDetails = poseDetailsRepository.getYogaPoseDetails(poseCode);
   ```
5. ❌ Query trả về `null` vì bảng `yoga_pose_details` TRỐNG
6. ❌ Fallback: `poseName = "Unknown Pose"`

### Nguyên nhân:
**Bảng `yoga_pose_details` chưa có dữ liệu!**

## 🔧 Bước kiểm tra trên EC2

### 1. SSH vào EC2
```bash
ssh -i "C:\Users\LENOVO\Downloads\DucKey.pem" ec2-user@13.211.219.53
```

### 2. Kiểm tra database
```bash
sudo -u postgres psql -d yoga_detection
```

### 3. Kiểm tra bảng yoga_pose_details
```sql
-- Đếm số records
SELECT COUNT(*) FROM yoga_pose_details;

-- Xem tất cả records
SELECT code, name FROM yoga_pose_details;

-- Kiểm tra pose cụ thể
SELECT * FROM yoga_pose_details WHERE code = 'SEATED_FORWARD_FOLD';
```

## 📋 Expected Output

### Nếu bảng TRỐNG (COUNT = 0):
```
 count 
-------
     0
(1 row)
```

**Nghĩa là:** SocialDataSeeder chưa chạy hoặc bị skip vì profile.

### Nếu bảng CÓ DỮ LIỆU:
```
 count 
-------
    50
(1 row)

               code                |         name          
-----------------------------------+----------------------
 CAT_COW                           | Cat-Cow Pose
 DOWN_DOG                          | Downward Facing Dog
 SEATED_FORWARD_FOLD               | Seated Forward Fold
 BUTTERFLY                         | Butterfly Pose
 ...
```

## 🚀 Giải pháp

### Option 1: Manual INSERT (Quick Fix)

Nếu bảng trống, chạy script SQL này:

```sql
-- Insert tất cả poses từ routine_pose
INSERT INTO yoga_pose_details (code, name, description, total_minutes, total_calos, level, image_url) 
VALUES 
-- Routine 1: Morning Energizer
('CAT_COW', 'Cat-Cow Pose', 'Hít vào nâng đầu, thở ra cong lưng. Giúp khởi động cột sống.', 1, 5, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('DOWN_DOG', 'Downward Facing Dog', 'Duỗi gót chân, nhấn lòng bàn tay xuống sàn.', 2, 10, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('WARRIOR_1', 'Warrior I', 'Giữ đầu gối vuông góc, mở ngực, hít sâu.', 1, 8, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('TRIANGLE', 'Triangle Pose', 'Duỗi tay, mở vai, nhìn lên tay trên.', 1, 7, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('CHILD_POSE', 'Child Pose', 'Thả lỏng toàn thân, hít sâu thở chậm.', 2, 6, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 2: Evening Wind-Down
('SEATED_FORWARD_FOLD', 'Seated Forward Fold', 'Cúi gập người nhẹ, cảm nhận phần lưng được giãn.', 2, 8, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('BUTTERFLY', 'Butterfly Pose', 'Hai lòng bàn chân chạm nhau, nhẹ nhàng thả gối xuống.', 1, 6, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('LEGS_UP_WALL', 'Legs Up Wall', 'Nằm ngửa, hai chân dựa tường, thư giãn toàn thân.', 3, 5, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('RECLINED_TWIST', 'Reclined Twist', 'Xoay gối sang bên, mở vai đối diện.', 1, 7, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('SAVASANA', 'Savasana', 'Thả lỏng toàn thân, hít thở sâu và nghỉ ngơi.', 5, 3, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 3: Office Break
('NECK_ROLL', 'Neck Roll', 'Xoay cổ nhẹ nhàng, hít vào giữa, thở ra khi xoay.', 1, 4, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('SHOULDER_ROLL', 'Shoulder Roll', 'Cuộn vai về phía sau để giãn cơ cổ vai.', 1, 4, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('SEATED_TWIST', 'Seated Twist', 'Ngồi thẳng, xoay người sang phải rồi trái.', 1, 5, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('FORWARD_FOLD_CHAIR', 'Forward Fold Chair', 'Gập người về phía trước, chạm ngón tay xuống sàn.', 1, 6, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('WRIST_STRETCH', 'Wrist Stretch', 'Duỗi cổ tay và đổi bên.', 1, 3, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 4: Core Power
('PLANK', 'Plank Pose', 'Giữ vai, lưng và chân trên một đường thẳng.', 1, 12, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('CHAIR_POSE', 'Chair Pose', 'Ngồi xuống như ghế tưởng tượng, hít thở đều.', 1, 10, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('SIDE_PLANK', 'Side Plank', 'Chống một tay, nâng hông và giữ thăng bằng.', 1, 11, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('BOAT_POSE', 'Boat Pose', 'Giữ thăng bằng trên xương cụt, co chân, duỗi tay.', 1, 9, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('DOLPHIN_POSE', 'Dolphin Pose', 'Tăng sức mạnh vai và core, nhấn khuỷu tay xuống.', 1, 13, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 5: Cardio Yoga
('SUN_SALUTATION', 'Sun Salutation', 'Chuỗi động tác chào mặt trời – liên tục và đều nhịp.', 2, 20, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('JUMP_SQUAT', 'Jump Squat', 'Nhảy nhẹ khi chuyển từ squat sang tadasana.', 1, 15, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('PLANK_JACK', 'Plank Jack', 'Mở – khép chân khi ở tư thế plank.', 1, 14, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('CHAIR_TWIST', 'Chair Twist', 'Giữ ghế, xoay nhẹ phần thân trên.', 1, 11, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('MOUNTAIN_POSE', 'Mountain Pose', 'Đứng thẳng, hít sâu, cảm nhận năng lượng.', 1, 5, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 6: Back & Spine Health
('BRIDGE_POSE', 'Bridge Pose', 'Nằm ngửa, nâng hông lên, mở ngực.', 2, 10, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('COBRA_POSE', 'Cobra Pose', 'Nhấn tay, nâng ngực, giữ vai thư giãn.', 1, 8, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('CAMEL_POSE', 'Camel Pose', 'Chống tay vào lưng, mở ngực và ngửa đầu nhẹ.', 1, 9, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('THREAD_NEEDLE', 'Thread the Needle', 'Luồn tay phải dưới tay trái, giãn vai.', 1, 7, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 7: Advanced Balance
('CROW_POSE', 'Crow Pose', 'Tựa đầu gối lên tay, giữ thăng bằng.', 1, 12, 'ADVANCED', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('HANDSTAND', 'Handstand', 'Tập luyện đứng bằng tay với hỗ trợ tường.', 1, 15, 'ADVANCED', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('WARRIOR_3', 'Warrior III', 'Giữ một chân, duỗi tay ra trước, tập trung nhìn điểm cố định.', 1, 11, 'ADVANCED', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('SIDE_PLANK_LEG_UP', 'Side Plank Leg Up', 'Nâng chân trên khi giữ plank nghiêng.', 1, 13, 'ADVANCED', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('UPWARD_BOW', 'Upward Bow', 'Nằm ngửa, chống tay và chân, nâng cơ thể thành vòng cung.', 1, 16, 'ADVANCED', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 8: Meditation & Mindfulness
('SEATED_MEDITATION', 'Seated Meditation', 'Ngồi thẳng, tập trung vào hơi thở và ý niệm bình an.', 3, 5, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('SIDE_STRETCH', 'Side Stretch', 'Duỗi tay sang bên, kéo giãn cơ liên sườn.', 1, 6, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 9: Core Stability
('FOREARM_PLANK', 'Forearm Plank', 'Giữ chắc core, lưng phẳng.', 1, 11, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('TWIST_CRUNCH', 'Twist Crunch', 'Co chân, chạm khuỷu tay trái – gối phải, đổi bên.', 1, 10, 'INTERMEDIATE', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),

-- Routine 10: Deep Stretch & Recovery
('SUPINE_TWIST', 'Supine Twist', 'Xoay đầu gối sang bên, mở vai.', 1, 7, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'),
('HAPPY_BABY', 'Happy Baby', 'Nắm chân, kéo đầu gối hướng ngực, mỉm cười.', 1, 6, 'BEGINNER', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b')

ON CONFLICT (code) DO NOTHING;

-- Verify insertion
SELECT COUNT(*) as total_poses FROM yoga_pose_details;
SELECT code, name, level FROM yoga_pose_details ORDER BY code;
```

### Option 2: Redeploy với SocialDataSeeder đã fix

Đảm bảo `SocialDataSeeder` không bị skip:

```java
// Xóa @Profile("!production") nếu đang deploy production
@Configuration
// @Profile("!production")  <-- Comment dòng này
@RequiredArgsConstructor
public class SocialDataSeeder {
```

## ✅ Verify Fix

Sau khi insert data, test lại:

```bash
# Từ EC2, test query
sudo -u postgres psql -d yoga_detection -c "SELECT * FROM yoga_pose_details WHERE code = 'SEATED_FORWARD_FOLD';"
```

Expected output:
```
        code         |         name          |      description       | total_minutes | total_calos |   level   
---------------------+----------------------+------------------------+---------------+-------------+-----------
 SEATED_FORWARD_FOLD | Seated Forward Fold  | Cúi gập người nhẹ...  |             2 |           8 | BEGINNER
```

## 🧪 Test API lại

```bash
curl --location --request POST 'http://13.211.219.53:9090/api/practice-sessions/{sessionId}/submit-pose' \
--header 'Authorization: Bearer YOUR_TOKEN' \
--form 'image=@pose.jpg' \
--form 'poseCode=SEATED_FORWARD_FOLD' \
--form 'timeSpentSeconds=60'
```

Expected log:
```
📤 Sending image to OpenAI Vision: https://...
📥 Raw OpenAI response: {"score": 85, "feedback": "Bạn đang thực hiện dáng Seated Forward Fold rất tốt! ..."}
✅ AI evaluation completed for pose SEATED_FORWARD_FOLD → score=85.0
```

## 📊 Summary

| Issue | Root Cause | Solution |
|-------|-----------|----------|
| AI returns "Unknown Pose" | `yoga_pose_details` table is empty | Insert 40+ poses matching `routine_pose` codes |
| Query returns NULL | Missing data for pose codes | Run SQL INSERT script above |
| SocialDataSeeder not running | `@Profile("!production")` blocks it | Remove profile annotation or set active profile |

