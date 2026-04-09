from __future__ import annotations

import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

import logging
import threading

import numpy as np
import pandas as pd
from fastapi import FastAPI
from pydantic import BaseModel, Field

# TensorFlow import is heavy; keep it after fast imports
try:
    import tensorflow as tf
except ModuleNotFoundError as e:
    raise ModuleNotFoundError(
        "TensorFlow chưa được cài trong môi trường Python hiện tại. "
        "Hãy kích hoạt .venv và chạy: python -m pip install -r requirements.txt. "
        "Khuyến nghị dùng Python 3.10/3.11."
    ) from e

APP_DIR = Path(__file__).resolve().parent
MODEL_PATH = APP_DIR / "yoga_pose_model.h5"
CSV_PATH = APP_DIR / "yoga_keypoints.csv"
REFERENCE_CACHE = APP_DIR / "pose_angle_reference.json"

log = logging.getLogger("pose_model_server")


# MediaPipe Pose landmark names in index order (33)
MP_LANDMARKS: List[str] = [
    "NOSE",
    "LEFT_EYE_INNER",
    "LEFT_EYE",
    "LEFT_EYE_OUTER",
    "RIGHT_EYE_INNER",
    "RIGHT_EYE",
    "RIGHT_EYE_OUTER",
    "LEFT_EAR",
    "RIGHT_EAR",
    "MOUTH_LEFT",
    "MOUTH_RIGHT",
    "LEFT_SHOULDER",
    "RIGHT_SHOULDER",
    "LEFT_ELBOW",
    "RIGHT_ELBOW",
    "LEFT_WRIST",
    "RIGHT_WRIST",
    "LEFT_PINKY",
    "RIGHT_PINKY",
    "LEFT_INDEX",
    "RIGHT_INDEX",
    "LEFT_THUMB",
    "RIGHT_THUMB",
    "LEFT_HIP",
    "RIGHT_HIP",
    "LEFT_KNEE",
    "RIGHT_KNEE",
    "LEFT_ANKLE",
    "RIGHT_ANKLE",
    "LEFT_HEEL",
    "RIGHT_HEEL",
    "LEFT_FOOT_INDEX",
    "RIGHT_FOOT_INDEX",
]

NAME_TO_INDEX: Dict[str, int] = {name: i for i, name in enumerate(MP_LANDMARKS)}


def normalize_type(raw: str) -> str:
    raw = (raw or "").strip()
    if not raw:
        return raw
    if "_" in raw:
        return raw.upper()
    # camelCase -> UPPER_SNAKE
    out = []
    for i, c in enumerate(raw):
        if c.isupper() and i > 0:
            out.append("_")
        out.append(c.upper())
    return "".join(out)


class LandmarkIn(BaseModel):
    type: str
    x: float
    y: float
    z: float


class AnalyzeRequest(BaseModel):
    landmarks: List[LandmarkIn]
    topK: int = Field(default=3, ge=1, le=10)


class TopKItem(BaseModel):
    pose: str
    confidence: float


class MostOffItem(BaseModel):
    metric: str
    diff: float
    actual: float
    reference: float


class AnalyzeResponse(BaseModel):
    predictedPose: str
    confidence: float
    topK: List[TopKItem]
    mostOff: Optional[MostOffItem] = None
    actualAngles: Dict[str, float] = Field(default_factory=dict)
    referenceAngles: Optional[Dict[str, float]] = None


@dataclass
class BodyAngles:
    leftElbowAngle: float
    rightElbowAngle: float
    leftShoulderAngle: float
    rightShoulderAngle: float
    leftHipAngle: float
    rightHipAngle: float
    leftKneeAngle: float
    rightKneeAngle: float
    leftAnkleAngle: float
    rightAnkleAngle: float
    spineAngle: float

    def to_dict(self) -> Dict[str, float]:
        return {
            "leftElbowAngle": self.leftElbowAngle,
            "rightElbowAngle": self.rightElbowAngle,
            "leftShoulderAngle": self.leftShoulderAngle,
            "rightShoulderAngle": self.rightShoulderAngle,
            "leftHipAngle": self.leftHipAngle,
            "rightHipAngle": self.rightHipAngle,
            "leftKneeAngle": self.leftKneeAngle,
            "rightKneeAngle": self.rightKneeAngle,
            "leftAnkleAngle": self.leftAnkleAngle,
            "rightAnkleAngle": self.rightAnkleAngle,
            "spineAngle": self.spineAngle,
        }


def _angle(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    ba = a - b
    bc = c - b
    mag_ba = float(np.linalg.norm(ba))
    mag_bc = float(np.linalg.norm(bc))
    if mag_ba == 0.0 or mag_bc == 0.0:
        return 0.0
    cos = float(np.dot(ba, bc) / (mag_ba * mag_bc))
    cos = max(-1.0, min(1.0, cos))
    return float(np.degrees(np.arccos(cos)))


def compute_angles(points_xyz: np.ndarray) -> BodyAngles:
    def p(name: str) -> np.ndarray:
        return points_xyz[NAME_TO_INDEX[name]]

    left_elbow = _angle(p("LEFT_SHOULDER"), p("LEFT_ELBOW"), p("LEFT_WRIST"))
    right_elbow = _angle(p("RIGHT_SHOULDER"), p("RIGHT_ELBOW"), p("RIGHT_WRIST"))

    left_shoulder = _angle(p("LEFT_HIP"), p("LEFT_SHOULDER"), p("LEFT_ELBOW"))
    right_shoulder = _angle(p("RIGHT_HIP"), p("RIGHT_SHOULDER"), p("RIGHT_ELBOW"))

    left_hip = _angle(p("LEFT_SHOULDER"), p("LEFT_HIP"), p("LEFT_KNEE"))
    right_hip = _angle(p("RIGHT_SHOULDER"), p("RIGHT_HIP"), p("RIGHT_KNEE"))

    left_knee = _angle(p("LEFT_HIP"), p("LEFT_KNEE"), p("LEFT_ANKLE"))
    right_knee = _angle(p("RIGHT_HIP"), p("RIGHT_KNEE"), p("RIGHT_ANKLE"))

    left_ankle = _angle(p("LEFT_KNEE"), p("LEFT_ANKLE"), p("LEFT_HEEL"))
    right_ankle = _angle(p("RIGHT_KNEE"), p("RIGHT_ANKLE"), p("RIGHT_HEEL"))

    spine_left = _angle(p("LEFT_SHOULDER"), p("LEFT_HIP"), p("LEFT_KNEE"))
    spine_right = _angle(p("RIGHT_SHOULDER"), p("RIGHT_HIP"), p("RIGHT_KNEE"))
    spine = (spine_left + spine_right) / 2.0

    return BodyAngles(
        leftElbowAngle=left_elbow,
        rightElbowAngle=right_elbow,
        leftShoulderAngle=left_shoulder,
        rightShoulderAngle=right_shoulder,
        leftHipAngle=left_hip,
        rightHipAngle=right_hip,
        leftKneeAngle=left_knee,
        rightKneeAngle=right_knee,
        leftAnkleAngle=left_ankle,
        rightAnkleAngle=right_ankle,
        spineAngle=spine,
    )


def landmarks_to_vector(landmarks: List[LandmarkIn]) -> Tuple[np.ndarray, np.ndarray]:
    # Returns (features132, points33x3)
    by_type: Dict[str, LandmarkIn] = {}
    for lm in landmarks:
        by_type[normalize_type(lm.type)] = lm

    feats: List[float] = []
    points = np.zeros((33, 3), dtype=np.float32)
    for i, name in enumerate(MP_LANDMARKS):
        lm = by_type.get(name)
        if lm is None:
            feats.extend([0.0, 0.0, 0.0, 0.0])
            points[i] = np.array([0.0, 0.0, 0.0], dtype=np.float32)
        else:
            x = float(lm.x) if lm.x >= 0 else 0.0
            y = float(lm.y) if lm.y >= 0 else 0.0
            z = float(lm.z)
            v = 1.0
            feats.extend([x, y, z, v])
            points[i] = np.array([x, y, z], dtype=np.float32)

    return np.array(feats, dtype=np.float32), points


def get_label_list_from_csv(csv_path: Path) -> List[str]:
    # sklearn LabelEncoder sorts labels lexicographically
    df = pd.read_csv(csv_path, usecols=["label"])
    labels = sorted(df["label"].dropna().unique().tolist())
    return labels


def load_reference_angles() -> Dict[str, Dict[str, float]]:
    if REFERENCE_CACHE.exists():
        return json.loads(REFERENCE_CACHE.read_text(encoding="utf-8"))

    if not CSV_PATH.exists():
        return {}

    df = pd.read_csv(CSV_PATH)

    # Speed: sample at most N rows per class
    max_per_class = 200
    sampled = (
        df.groupby("label", group_keys=False)
        .apply(lambda g: g.sample(n=min(len(g), max_per_class), random_state=42))
        .reset_index(drop=True)
    )

    cols = [c for c in sampled.columns if c != "label"]

    sums: Dict[str, Dict[str, float]] = {}
    counts: Dict[str, int] = {}

    for _, row in sampled.iterrows():
        label = row["label"]
        arr = row[cols].to_numpy(dtype=np.float32)
        pts = arr.reshape(33, 4)[:, :3]  # x,y,z
        angles = compute_angles(pts).to_dict()

        if label not in sums:
            sums[label] = {k: 0.0 for k in angles.keys()}
            counts[label] = 0

        for k, v in angles.items():
            sums[label][k] += float(v)
        counts[label] += 1

    refs: Dict[str, Dict[str, float]] = {}
    for label, agg in sums.items():
        n = max(1, counts.get(label, 1))
        refs[label] = {k: (v / n) for k, v in agg.items()}

    REFERENCE_CACHE.write_text(json.dumps(refs, ensure_ascii=False, indent=2), encoding="utf-8")
    return refs


app = FastAPI(title="Yoga Pose Model Service", version="1.0.0")


@app.on_event("startup")
def _startup() -> None:
    global model, labels, reference_angles

    if not MODEL_PATH.exists():
        raise RuntimeError(f"Model not found: {MODEL_PATH}")

    model = tf.keras.models.load_model(MODEL_PATH)

    log.info("Loaded model: input=%s output=%s", getattr(model, "input_shape", None), getattr(model, "output_shape", None))

    if CSV_PATH.exists():
        labels = get_label_list_from_csv(CSV_PATH)
    else:
        # Fallback: labels unknown (still return index)
        labels = []

    # Start quickly: load reference angles in background (can be slow on first run)
    reference_angles = {}
    if REFERENCE_CACHE.exists():
        try:
            reference_angles = json.loads(REFERENCE_CACHE.read_text(encoding="utf-8"))
            log.info("Loaded reference angles cache: %s", REFERENCE_CACHE)
        except Exception as e:
            log.warning("Failed to load reference cache (will recompute): %s", e)
            reference_angles = {}

    if not reference_angles and CSV_PATH.exists():
        def _bg_compute() -> None:
            global reference_angles
            try:
                log.info("Computing reference angles from CSV (first run may take a bit)...")
                reference_angles = load_reference_angles()
                log.info("Reference angles ready: %d poses", len(reference_angles))
            except Exception as e:
                log.warning("Failed to compute reference angles: %s", e)

        threading.Thread(target=_bg_compute, daemon=True).start()


@app.get("/health")
def health() -> Dict[str, Any]:
    return {
        "modelPath": str(MODEL_PATH),
        "labels": len(labels),
        "hasReferenceAngles": bool(reference_angles),
        "inputShape": getattr(model, "input_shape", None),
        "outputShape": getattr(model, "output_shape", None),
    }


@app.post("/analyze", response_model=AnalyzeResponse)
def analyze(req: AnalyzeRequest) -> AnalyzeResponse:
    feats, pts = landmarks_to_vector(req.landmarks)
    x = feats.reshape(1, 132)

    probs = model.predict(x, verbose=0)[0]
    probs = np.asarray(probs, dtype=np.float32)

    topk = int(req.topK)
    idxs = probs.argsort()[::-1][:topk]

    def label_for(i: int) -> str:
        if labels and 0 <= i < len(labels):
            return labels[i]
        return f"class_{i}"

    top_items: List[TopKItem] = [
        TopKItem(pose=label_for(int(i)), confidence=float(probs[int(i)])) for i in idxs
    ]

    best_i = int(idxs[0])
    predicted = label_for(best_i)
    conf = float(probs[best_i])

    most_off: Optional[MostOffItem] = None
    actual_angles = compute_angles(pts).to_dict()
    ref = reference_angles.get(predicted)
    if ref:
        # find metric with max abs diff
        best_metric = None
        best_abs = -1.0
        for metric, actual in actual_angles.items():
            ref_val = float(ref.get(metric, 0.0))
            diff = float(actual) - ref_val
            if abs(diff) > best_abs:
                best_abs = abs(diff)
                best_metric = metric
                most_off = MostOffItem(
                    metric=metric,
                    diff=diff,
                    actual=float(actual),
                    reference=ref_val,
                )

    return AnalyzeResponse(
        predictedPose=predicted,
        confidence=conf,
        topK=top_items,
        mostOff=most_off,
        actualAngles=actual_angles,
        referenceAngles=ref,
    )
