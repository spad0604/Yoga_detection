# Yoga Pose Model Service (Python)

Dịch vụ FastAPI chạy model `yoga_pose_model.h5` để:
- Dự đoán pose gần nhất (top-k)
- Tính sai lệch lớn nhất theo góc khớp (so với trung bình dataset từ `yoga_keypoints.csv`)

## Run (Windows / PowerShell)

```powershell
cd "d:\Code lung tung\Yoga Detection\Python"
python --version
# Khuyến nghị: Python 3.10/3.11 (TensorFlow thường không hỗ trợ Python 3.12 trên một số bản)
# Nếu bạn đang dùng Python 3.12 (Windows Store), hãy cài Python 3.11 từ python.org rồi dùng lại lệnh dưới.

python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

# Luôn chạy uvicorn bằng python trong .venv để tránh nhầm sang Python global
python -m uvicorn pose_model_server:app --host 0.0.0.0 --port 8001
```

Health check:
- `GET http://localhost:8001/health`

Ghi chú:
- Dòng log oneDNN của TensorFlow là bình thường (không phải lỗi).
- Lần chạy đầu có thể mất thời gian để tạo cache `pose_angle_reference.json`, nhưng server vẫn sẽ lên và `/analyze` vẫn chạy (chỉ thiếu `mostOff` cho tới khi cache sẵn sàng).

Analyze:
- `POST http://localhost:8001/analyze`
