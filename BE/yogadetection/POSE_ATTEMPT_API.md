# Yoga Pose Attempt Tracking API

## Tổng Quan
Hệ thống theo dõi lịch sử luyện tập yoga của user, bao gồm:
- Upload ảnh tư thế lên Cloudinary
- Lưu landmarks data (33 điểm trên cơ thể từ MediaPipe/TensorFlow)
- **Tự động chấm điểm bằng AI** (OpenAI GPT-4 Vision hoặc tương tự)
- **AI feedback chi tiết bằng tiếng Việt**
- Xem lịch sử và tiến trình
- Thống kê điểm số

## Database Schema

### Bảng: `yoga_pose_attempt`
```sql
- id: STRING (UUID) - Primary key
- user_id: STRING - ID của user
- pose_code: STRING - Mã tư thế yoga
- pose_name: STRING - Tên tư thế
- image_url: STRING - URL ảnh trên Cloudinary
- score: DOUBLE - Điểm số từ AI (0-100)
- landmarks_data: TEXT - JSON string của 33 landmarks
- feedback: TEXT - Feedback chi tiết từ AI (tiếng Việt)
- created_at: TIMESTAMP - Thời gian tạo
```

## API Endpoints

### 1. Tạo Attempt Mới (Upload Ảnh + Lưu Dữ Liệu)
**POST** `/api/pose-attempts`

**⚠️ LƯU Ý QUAN TRỌNG:**
- **Client KHÔNG cần gửi `score`** - Server sẽ tự động gọi AI để chấm điểm
- **Client chỉ cần gửi:** `poseCode`, `image`, và `landmarkData`
- Server sẽ upload ảnh lên Cloudinary, sau đó gọi OpenAI GPT-4 Vision để phân tích và chấm điểm

**Headers:**
```
Authorization: Bearer <JWT_TOKEN>
Content-Type: multipart/form-data
```

**Request (Form Data):**
```
poseCode: string (REQUIRED) - Mã tư thế (UUID)
image: file (REQUIRED) - File ảnh của user thực hiện pose
landmarkData: JSON (REQUIRED) - Dữ liệu 33 landmarks từ MediaPipe
```

**Example using cURL:**
```bash
curl -X POST http://localhost:9090/api/pose-attempts \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -F "poseCode=11111111-1111-1111-1111-111111111111" \
  -F "image=@/path/to/user-pose.jpg" \
  -F 'landmarkData=@landmarks.json;type=application/json'
```

**Example landmarkData JSON:**
```json
{
  "poseId": 1,
  "landmarks": [
    {"type": "nose", "x": 320.5, "y": 180.2, "z": -0.15},
    {"type": "leftEyeInner", "x": 310.3, "y": 170.5, "z": -0.12},
    {"type": "leftEye", "x": 308.1, "y": 170.8, "z": -0.13},
    {"type": "leftEyeOuter", "x": 305.2, "y": 171.2, "z": -0.14},
    {"type": "rightEyeInner", "x": 330.7, "y": 170.3, "z": -0.11},
    ... (33 landmarks total)
  ],
  "timestamp": 1698765432000
}
```

**Response:**
```json
{
  "code": 200,
  "message": "success",
  "timestamp": 1698765432000,
  "data": {
    "id": "attempt-uuid-123",
    "poseCode": "11111111-1111-1111-1111-111111111111",
    "poseName": "Mountain Pose",
    "imageUrl": "https://res.cloudinary.com/xxx/yoga_poses/pose_xxx.jpg",
    "score": 82.5,
    "feedback": "Tư thế của bạn khá tốt! Điểm mạnh: Lưng thẳng, vai cân bằng. Cần cải thiện: Hãy căng chân đều hơn và giữ đầu gối thẳng. Mẹo: Tập trung vào việc phân bổ trọng lượng đều trên cả hai chân.",
    "createdAt": "2025-10-26T10:30:00Z"
  }
}
```

---

### 2. Lấy Danh Sách Attempts Của User
**GET** `/api/pose-attempts?page=0&pageSize=10`

**Headers:**
```
Authorization: Bearer <JWT_TOKEN>
```

**Response:**
```json
{
  "code": 200,
  "message": "success",
  "timestamp": 1698765432000,
  "data": {
    "items": [
      {
        "id": "attempt-uuid-123",
        "poseCode": "11111111-1111-1111-1111-111111111111",
        "poseName": "Mountain Pose",
        "imageUrl": "https://res.cloudinary.com/xxx/yoga_poses/pose_xxx.jpg",
        "score": 85.5,
        "feedback": "Tư thế rất tốt! Lưng thẳng, vai thư giãn, trọng tâm ổn định.",
        "createdAt": "2025-10-26T10:30:00Z"
      }
    ],
    "page": 0,
    "pageSize": 10,
    "totalElements": 50,
    "totalPages": 5,
    "hasNext": true,
    "hasPrevious": false
  }
}
```

---

### 3. Lấy Attempts Theo Pose Cụ Thể
**GET** `/api/pose-attempts/by-pose/{poseCode}?page=0&pageSize=10`

**Parameters:**
- `poseCode` (path): Mã tư thế
- `page` (query): Số trang (default: 0)
- `pageSize` (query): Kích thước trang (default: 10)

**Example:**
```
GET /api/pose-attempts/by-pose/11111111-1111-1111-1111-111111111111?page=0&pageSize=10
```

**Response:** Tương tự endpoint #2

---

### 4. Lấy Attempts Theo Khoảng Thời Gian
**GET** `/api/pose-attempts/by-date?startDate=2025-01-01T00:00:00Z&endDate=2025-12-31T23:59:59Z&page=0&pageSize=10`

**Parameters:**
- `startDate` (query): Ngày bắt đầu (ISO 8601 format)
- `endDate` (query): Ngày kết thúc (ISO 8601 format)
- `page`, `pageSize`: Phân trang

**Example:**
```
GET /api/pose-attempts/by-date?startDate=2025-10-01T00:00:00Z&endDate=2025-10-31T23:59:59Z
```

**Response:** Tương tự endpoint #2

---

### 5. Lấy Chi Tiết Một Attempt
**GET** `/api/pose-attempts/{attemptId}`

**Response:**
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "id": "attempt-uuid-123",
    "poseCode": "11111111-1111-1111-1111-111111111111",
    "poseName": "Mountain Pose",
    "imageUrl": "https://res.cloudinary.com/xxx/yoga_poses/pose_xxx.jpg",
    "score": 85.5,
    "feedback": "Tư thế tốt! Điểm mạnh: Lưng thẳng, vai cân bằng. Cần cải thiện: Căng chân đều hơn.",
    "createdAt": "2025-10-26T10:30:00Z"
  }
}
```

---

### 6. Lấy Thống Kê Tổng Quan
**GET** `/api/pose-attempts/statistics`

**Response:**
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "totalAttempts": 150
  }
}
```

---

### 7. Lấy Thống Kê Theo Pose
**GET** `/api/pose-attempts/statistics/{poseCode}`

**Response:**
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "poseCode": "11111111-1111-1111-1111-111111111111",
    "poseName": null,
    "totalAttempts": 25,
    "averageScore": 82.3,
    "highestScore": 95.5
  }
}
```

---

### 8. Xóa Attempt
**DELETE** `/api/pose-attempts/{attemptId}`

**Response:**
```json
{
  "code": 200,
  "message": "success",
  "data": null
}
```

---

## Luồng Sử Dụng Thực Tế

### Kịch Bản 1: User Thực Hiện Pose và Lưu Kết Quả

1. **Frontend detect pose qua camera:**
   - Sử dụng MediaPipe/TensorFlow để detect 33 landmarks
   - Chụp ảnh tư thế của user (canvas.toBlob())

2. **Upload lên server (KHÔNG cần tính điểm):**
```javascript
const formData = new FormData();
formData.append('poseCode', '11111111-1111-1111-1111-111111111111');
formData.append('image', imageBlob, 'pose.jpg');

// Tạo JSON landmarks từ MediaPipe
const landmarkData = {
  poseId: 1,
  landmarks: detectedLandmarks, // Array của 33 landmarks
  timestamp: Date.now()
};
const landmarkBlob = new Blob([JSON.stringify(landmarkData)], { type: 'application/json' });
formData.append('landmarkData', landmarkBlob, 'landmarks.json');

const response = await fetch('http://localhost:9090/api/pose-attempts', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${jwtToken}`
  },
  body: formData
});

const result = await response.json();
console.log('AI Score:', result.data.score);
console.log('AI Feedback:', result.data.feedback);
```

3. **Server xử lý tự động:**
   - Upload ảnh lên Cloudinary → nhận imageUrl
   - Serialize landmarks thành JSON string
   - **Gọi OpenAI GPT-4 Vision API:**
     - Gửi imageUrl + landmarks + poseCode
     - AI phân tích tư thế dựa trên ảnh và landmarks
     - AI trả về: score (0-100) + feedback (tiếng Việt)
   - Lưu vào database
   - Trả về kết quả cho client

4. **Client nhận kết quả:**
   - Hiển thị điểm số từ AI
   - Hiển thị feedback chi tiết
   - Lưu vào lịch sử

---

### Kịch Bản 2: Xem Lịch Sử Luyện Tập

```javascript
// Lấy tất cả attempts
const history = await fetch(
  'http://localhost:9090/api/pose-attempts?page=0&pageSize=20',
  {
    headers: { 'Authorization': `Bearer ${token}` }
  }
).then(res => res.json());

// Hiển thị list với ảnh, điểm, thời gian
history.data.items.forEach(attempt => {
  console.log(`${attempt.poseName}: ${attempt.score} điểm`);
  console.log(`Ảnh: ${attempt.imageUrl}`);
});
```

---

### Kịch Bản 3: Theo Dõi Tiến Trình Một Pose

```javascript
// Xem lịch sử Mountain Pose
const mountainPoseHistory = await fetch(
  'http://localhost:9090/api/pose-attempts/by-pose/11111111-1111-1111-1111-111111111111',
  { headers: { 'Authorization': `Bearer ${token}` } }
).then(res => res.json());

// Xem thống kê Mountain Pose
const stats = await fetch(
  'http://localhost:9090/api/pose-attempts/statistics/11111111-1111-1111-1111-111111111111',
  { headers: { 'Authorization': `Bearer ${token}` } }
).then(res => res.json());

console.log(`Đã thực hiện ${stats.data.totalAttempts} lần`);
console.log(`Điểm trung bình: ${stats.data.averageScore}`);
console.log(`Điểm cao nhất: ${stats.data.highestScore}`);
```

---

## AI Evaluation Configuration

### OpenAI Setup

Thêm vào `application.properties`:
```properties
# OpenAI API Configuration
openai.api.key=sk-proj-xxxxxxxxxxxxxxxxxxxxx
openai.api.url=https://api.openai.com/v1/chat/completions
```

### Cách AI Đánh Giá

1. **Input cho AI:**
   - Image URL (ảnh từ Cloudinary)
   - 33 Landmarks data (tọa độ x, y, z)
   - Pose code (để biết tư thế nào)
   - Pose description (mô tả tư thế chuẩn)

2. **AI Processing:**
   - Model: GPT-4o hoặc gpt-4-vision-preview
   - AI phân tích ảnh và landmarks
   - So sánh với tư thế chuẩn
   - Tính điểm dựa trên: độ thẳng lưng, cân bằng, góc khớp, v.v.

3. **Output từ AI:**
   - Score: 0-100 (100 = hoàn hảo)
   - Feedback: Chi tiết bằng tiếng Việt
     - Điểm mạnh
     - Điểm cần cải thiện
     - Gợi ý cụ thể

### Fallback Mechanism

Nếu OpenAI API không khả dụng (API key rỗng hoặc lỗi):
- Score mặc định: 75.0
- Feedback mặc định: "Tư thế của bạn khá tốt! Hãy chú ý giữ lưng thẳng hơn..."

---

## Cloudinary Configuration

Đảm bảo có config trong `application.properties`:
```properties
cloudinary.cloud_name=your_cloud_name
cloudinary.api_key=your_api_key
cloudinary.api_secret=your_api_secret
```

Ảnh sẽ được upload vào folder `yoga_poses` trên Cloudinary.

---

## Security Notes

- Tất cả endpoints (trừ `/api/yoga-poses/**`) đều yêu cầu JWT authentication
- User chỉ có thể xem/xóa attempts của chính mình
- Validation tự động qua `@AuthenticationPrincipal User`

---

## Tips Tối Ưu

1. **Upload ảnh chất lượng cao:**
   - Ảnh rõ nét, đủ sáng
   - Chụp toàn thân, không bị che khuất
   - Nền đơn giản để AI dễ phân tích
   - Kích thước khuyến nghị: 800x600 - 1920x1080
   - Format: JPG hoặc PNG

2. **Landmarks accuracy:**
   - Đảm bảo MediaPipe detect đầy đủ 33 điểm
   - Visibility score > 0.5 cho các điểm quan trọng
   - Gửi đầy đủ tọa độ x, y, z

3. **Real-time tracking:**
   - Kết hợp với WebSocket `/ws/pose` để detect real-time
   - Sau khi user giữ tư thế ổn định, chụp ảnh
   - Gọi POST `/api/pose-attempts` để lưu và chấm điểm

4. **Batch operations:**
   - Dùng pageSize phù hợp (10-20 items)
   - Cache statistics trên frontend

5. **Error handling:**
   - Kiểm tra file size trước upload (< 5MB)
   - Validate landmarks format trước khi gửi
   - Xử lý trường hợp AI timeout (retry hoặc fallback)

6. **AI Response Time:**
   - Thời gian chờ trung bình: 2-5 giây
   - Hiển thị loading indicator cho user
   - Timeout recommendation: 30 seconds
