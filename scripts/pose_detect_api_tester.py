#!/usr/bin/env python3
"""
Standalone tester for Yoga pose detection API.

What it does:
1) Runs pose landmark detection on a local image using MediaPipe Pose.
2) Builds the same multipart/form-data payload style as mobile.
3) Sends request to backend POST /api/pose-attempts with Bearer token.
4) Prints full API response so you can evaluate model output.

Install deps:
  pip install requests mediapipe opencv-python

Example:
  python scripts/pose_detect_api_tester.py \
    --base-url http://localhost:9090 \
    --pose-code 014a0de7-d311-441b-b689-1c8acb156e39 \
    --image-path D:/images/tree_pose.jpg \
    --access-token "PASTE_TOKEN_HERE"
"""

from __future__ import annotations

import argparse
import json
import mimetypes
import os
import sys
from pathlib import Path
from typing import Any, Dict, List

import requests

try:
    import cv2
    import mediapipe as mp
except ImportError as exc:
    print("Missing dependency:", exc)
    print("Install with: pip install requests mediapipe opencv-python")
    sys.exit(1)


ACCESS_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoiYWNjZXNzIiwidXNlcm5hbWUiOiJnaWFwYmFjdmFuQGdtYWlsLmNvbSIsImp0aSI6ImMxZjAzNDEyLTZhZmEtNDcwNS05M2FlLWQ4YzhmZjk5NTg2ZSIsInN1YiI6ImdpYXBiYWN2YW5AZ21haWwuY29tIiwiaWF0IjoxNzc1NTcwMTcyLCJleHAiOjE3NzU2NTY1NzJ9.Gj1hhzXZwu7IbpUsQmVYJYkr7kBeYgUcDiHNQgm_IBA"

# ==== Quick config: edit these values at the top ====
BASE_URL = "http://127.0.0.1:9090"
POSE_CODE = "06d9a6c8-fc25-4991-a1f5-191e9ecc4d59"
IMAGE_PATH = "D:/Code lung tung/Yoga Detection/scripts/image.png"


def upper_snake_to_lower_camel(name: str) -> str:
    parts = name.lower().split("_")
    return parts[0] + "".join(p.title() for p in parts[1:])


def detect_landmarks(image_path: Path) -> List[Dict[str, float]]:
    image = cv2.imread(str(image_path))
    if image is None:
        raise ValueError(f"Cannot read image: {image_path}")

    image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    mp_pose = mp.solutions.pose
    with mp_pose.Pose(
        static_image_mode=True,
        model_complexity=2,
        enable_segmentation=False,
        min_detection_confidence=0.5,
    ) as pose:
        results = pose.process(image_rgb)

    if not results.pose_landmarks:
        raise ValueError("No pose detected in image. Try a clearer full-body photo.")

    landmarks: List[Dict[str, float]] = []
    all_points = results.pose_landmarks.landmark

    for idx, point in enumerate(all_points):
        mp_type = mp_pose.PoseLandmark(idx).name  # e.g. LEFT_SHOULDER
        mobile_like_type = upper_snake_to_lower_camel(mp_type)  # e.g. leftShoulder
        landmarks.append(
            {
                "type": mobile_like_type,
                "x": float(point.x),
                "y": float(point.y),
                "z": float(point.z),
            }
        )

    return landmarks


def build_landmark_payload(landmarks: List[Dict[str, float]]) -> Dict[str, Any]:
    # Keep the same shape mobile uses for pose-attempts upload.
    return {"landmarks": landmarks}


def post_pose_attempt(
    base_url: str,
    token: str,
    pose_code: str,
    image_path: Path,
    landmark_payload: Dict[str, Any],
    timeout_seconds: int,
) -> requests.Response:
    url = f"{base_url.rstrip('/')}/api/pose-attempts"

    mime = mimetypes.guess_type(str(image_path))[0] or "image/jpeg"
    landmark_json = json.dumps(landmark_payload, ensure_ascii=True)

    headers = {
        "Authorization": f"Bearer {token}",
    }

    data = {
        "poseCode": pose_code,
    }

    with image_path.open("rb") as f:
        files = {
            "image": (image_path.name, f, mime),
            "landmarkData": ("landmarkData.json", landmark_json, "application/json"),
        }
        return requests.post(
            url,
            headers=headers,
            data=data,
            files=files,
            timeout=timeout_seconds,
        )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Test Yoga detection API like mobile client")
    parser.add_argument("--base-url", default=BASE_URL, help="Backend base URL")
    parser.add_argument(
        "--pose-code",
        default=POSE_CODE,
        help="Expected pose code (UUID/code in DB)",
    )
    parser.add_argument(
        "--image-path",
        default=IMAGE_PATH,
        help="Path to input image",
    )
    parser.add_argument(
        "--access-token",
        default=None,
        help="Bearer access token. If omitted, use ACCESS_TOKEN env or ACCESS_TOKEN constant.",
    )
    parser.add_argument("--timeout", type=int, default=60, help="HTTP timeout in seconds")
    parser.add_argument(
        "--save-landmarks-json",
        default=None,
        help="Optional file path to save extracted landmark JSON for inspection",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Only detect landmarks and print payload summary, do not call API",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()

    if not args.pose_code or args.pose_code == "PASTE_POSE_CODE_HERE":
        print("Pose code is missing.")
        print("Edit POSE_CODE at top of file or pass --pose-code.")
        return 1

    image_path = Path(args.image_path)
    if not image_path.exists():
        print(f"Image not found: {image_path}")
        print("Edit IMAGE_PATH at top of file or pass --image-path.")
        return 1

    token = args.access_token or os.getenv("ACCESS_TOKEN") or ACCESS_TOKEN
    if not token or token == "PASTE_ACCESS_TOKEN_HERE":
        print("Access token is missing.")
        print("Provide --access-token or set ACCESS_TOKEN env or edit ACCESS_TOKEN constant.")
        return 1

    try:
        landmarks = detect_landmarks(image_path)
    except Exception as exc:
        print(f"Landmark detection failed: {exc}")
        return 1

    payload = build_landmark_payload(landmarks)
    print(f"Detected {len(landmarks)} landmarks from image: {image_path}")

    if args.save_landmarks_json:
        out_file = Path(args.save_landmarks_json)
        out_file.parent.mkdir(parents=True, exist_ok=True)
        out_file.write_text(json.dumps(payload, ensure_ascii=True, indent=2), encoding="utf-8")
        print(f"Saved landmarks JSON: {out_file}")

    if args.dry_run:
        preview = json.dumps(payload, ensure_ascii=True)
        print("Dry-run mode. landmarkData preview:")
        print(preview[:600] + ("..." if len(preview) > 600 else ""))
        return 0

    try:
        response = post_pose_attempt(
            base_url=args.base_url,
            token=token,
            pose_code=args.pose_code,
            image_path=image_path,
            landmark_payload=payload,
            timeout_seconds=args.timeout,
        )
    except requests.RequestException as exc:
        print(f"HTTP request failed: {exc}")
        return 1

    print(f"Status: {response.status_code}")
    content_type = response.headers.get("content-type", "")

    if "application/json" in content_type.lower():
        try:
            print(json.dumps(response.json(), ensure_ascii=False, indent=2))
        except ValueError:
            print(response.text)
    else:
        print(response.text)

    return 0 if response.ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
