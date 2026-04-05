# Yoga Detection – Kiến trúc dự án (FE + BE)

Repo: https://github.com/spad0604/Yoga_detection

## 1) Tổng quan
Dự án gồm 2 phần chính:

- **BE/**: Backend **Spring Boot** cung cấp REST API, xử lý nghiệp vụ (auth, bài tập/routine, pose attempt/session), upload ảnh, chấm điểm tư thế bằng AI, lưu DB và bắn kết quả realtime/notification.
- **FE/**: Ứng dụng **Flutter** (BLoC + DI) chạy trên mobile/web/desktop, lấy camera/ảnh, dựng landmark (ML Kit), gọi API, hiển thị kết quả và nhận thông báo.

## 2) Kiến trúc tổng thể

```
+-------------------+         HTTPS/REST          +-------------------------+
|   Flutter App     |  <----------------------->  |  Spring Boot Backend    |
|  (BLoC + DI)      |                             |  (REST + AI + Realtime) |
|                   |         Socket.IO/WebSocket |                         |
| - Camera/ML Kit   |  <----------------------->  | - Socket.IO Server      |
| - Upload ảnh      |                             | - WebSocket Handler     |
| - Hiển thị score  |                             | - FCM push notification |
+-------------------+                             +------------+------------+
                                                           |
                                                           | JPA/Hibernate
                                                           v
                                                    +-------------+
                                                    | PostgreSQL   |
                                                    +-------------+
                                                           |
                                                           | Media hosting
                                                           v
                                                    +-------------+
                                                    | Cloudinary   |
                                                    +-------------+
```

### Luồng chấm điểm tư thế (điển hình)
1. **FE** lấy ảnh (camera) và/hoặc **landmark 33 điểm** (ML Kit pose detection).
2. **FE** gọi **REST API** lên **BE** kèm ảnh + metadata (poseCode/poseName/landmark).
3. **BE** upload ảnh lên **Cloudinary** → lấy `imageUrl`.
4. **BE** gọi module **AI Pose Evaluation** (Spring AI/OpenAI Vision) để trả về JSON `{score, feedback}`.
5. **BE** lưu kết quả (attempt/session) vào **PostgreSQL**.
6. **BE** gửi kết quả về client:
   - **Realtime** qua **Socket.IO** (event `pose_result`) và/hoặc **WebSocket**
   - **Push notification** qua **Firebase Cloud Messaging (FCM)**

## 3) Backend (Spring Boot) – kiến trúc lớp
Thư mục chính: `BE/yogadetection/src/main/java/com/yogadetection/`

### 3.1 Các layer chính
- `controller/`: REST endpoints (ví dụ: notifications, routines, sessions, attempts, auth…)
- `service/` + `service/impl/`: nghiệp vụ, orchestrate giữa repository, upload ảnh, AI, realtime, notification
- `repository/`: Spring Data JPA repositories
- `entity/`: JPA entities (User, Notification, YogaPoseAttempt, …)
- `dto/`: request/response DTO
- `security/`: JWT/Spring Security
- `socket/` + `config/SocketServer.java`: Socket.IO server, connect/disconnect/ping/send events
- `websocket/`: WebSocket handler (TextWebSocketHandler) cho luồng realtime theo session
- `scheduler/`: job định kỳ (ví dụ: nhắc tập yoga)

### 3.2 Các module nổi bật

#### A) AI Pose Evaluation
- Interface: `service/AIPoseEvaluationService.java`
- Implement: `service/impl/AIPoseEvaluationServiceImpl.java`

Vai trò:
- Nhận `imageUrl` + `landmarkData` + `poseName/poseDescription`
- Tạo prompt theo tiêu chí chấm điểm (0–100) + hướng dẫn output JSON
- Gọi **OpenAI Vision** qua **Spring AI ChatClient**
- Parse JSON và trả `EvaluationResult(score, feedback)`

**Chế độ demo/mocking (dành cho trình diễn khi không có API key):**
- Config: `app.ai.mock.plank.enabled` (mặc định `true`)
- Khi poseName chứa "plank" (ví dụ: "Plank", "Side Plank") → trả kết quả mẫu **xen kẽ** 2 lần (1 lần sai, 1 lần đúng) để demo.

#### B) Pose Attempt + Gửi kết quả realtime/notification
- Implement điển hình: `service/impl/YogaPoseAttemptServiceImpl.java`

Vai trò:
- Lưu attempt
- Gửi kết quả về client qua:
  - `service/SocketIOService.java` (Socket.IO)
  - `service/FcmService.java` (FCM)
  - Đồng thời lưu `Notification` vào DB để user xem lại

#### C) Notifications
- `controller/NotificationController.java`: endpoints lấy danh sách / test gửi notification / nhắc tập
- `service/impl/NotificationServiceImpl.java`: push notification theo user/all, lưu DB

### 3.3 Cấu hình & hạ tầng
- `src/main/resources/application.properties`
  - `server.port=9090`
  - Kết nối DB Postgres (url/user/pass)
  - Cloudinary credentials (upload ảnh)
  - Spring AI OpenAI (`spring.ai.openai.api-key`, model…)

**Lưu ý bảo mật**: Không nên commit secrets (DB password, API keys, mail password, Firebase service account…). Nên chuyển sang biến môi trường hoặc secret manager khi deploy.

## 4) Frontend (Flutter) – kiến trúc lớp
Thư mục chính: `FE/flutter_bloc_base-main/lib/`

### 4.1 Các layer chính
- `presenter/`: UI + routing + themes + localization
- `data/`:
  - `entities/`: model (freezed/json)
  - `repositories/`: repository implementations
  - `sources/`:
    - `network/`: gọi API
    - `local/`: cache/local storage
  - `states/`: BLoC/Cubit cho từng feature (auth, camera_detection, routines, notifications…)
- `core/`: utilities, exceptions, firebase config, helpers
- `services/`: dịch vụ phụ trợ (token manager…)

### 4.2 DI (Dependency Injection)
- `lib/di.dart` + `lib/di.config.dart`: dùng **get_it + injectable**
- Base URL được inject qua `@Named('baseUrl')` (hiện trỏ tới server chạy port 9090).

### 4.3 Firebase (client)
- `core/firebase_config.dart`: init FCM, lấy token, xử lý notification foreground/background.

## 5) Realtime: Socket.IO vs WebSocket
Backend có **2 cơ chế** realtime:

- **Socket.IO (netty-socketio)**: phù hợp cho mobile app nhận event `pose_result` theo `userId` (dựa vào JWT/handshake). Phần này nằm ở `config/SocketServer.java`, `service/SocketIOService.java`, `socket/event/*`.
- **Spring WebSocket (TextWebSocketHandler)**: `websocket/PoseWebSocketHandler.java` quản lý `activeSessions` theo email và có thể gửi kết quả về user nếu đang connected.

Tùy client đang implement theo hướng nào mà BE sẽ ưu tiên/đồng thời bắn kết quả.

## 6) Chạy local (tối thiểu)

### Backend
- Vào `BE/yogadetection`
- Chạy: `./mvnw spring-boot:run`
- Server mặc định: `http://localhost:9090`

### Frontend
- Vào `FE/flutter_bloc_base-main`
- Chạy: `flutter pub get`
- Run: `flutter run`

