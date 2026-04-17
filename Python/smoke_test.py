from __future__ import annotations

from pathlib import Path
import pickle

import numpy as np
import pandas as pd
import tensorflow as tf

APP_DIR = Path(__file__).resolve().parent
MODEL_PATH = APP_DIR / "yoga_pose_model.keras"
LEGACY_MODEL_PATH = APP_DIR / "yoga_pose_model.h5"
PREPROCESS_PATH = APP_DIR / "pose_preprocessing.pkl"
CSV_PATH = APP_DIR / "yoga_keypoints.csv"

DEFAULT_ANGLE_TRIPLETS = [
    (11, 13, 15),
    (12, 14, 16),
    (13, 11, 23),
    (14, 12, 24),
    (11, 23, 25),
    (12, 24, 26),
    (23, 25, 27),
    (24, 26, 28),
    (25, 27, 31),
    (26, 28, 32),
]


def calc_angle(a: np.ndarray, b: np.ndarray, c: np.ndarray) -> float:
    ba = a - b
    bc = c - b
    denom = (np.linalg.norm(ba) * np.linalg.norm(bc)) + 1e-8
    cosine = np.dot(ba, bc) / denom
    cosine = np.clip(cosine, -1.0, 1.0)
    return float(np.degrees(np.arccos(cosine)) / 180.0)


def safe_ratio(num: float, den: float) -> float:
    return float(num / (den + 1e-8))


def normalize_pose(landmarks_33x4: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    xyz = landmarks_33x4[:, :3]
    visibility = landmarks_33x4[:, 3]

    hip_center = (xyz[23] + xyz[24]) / 2.0
    shoulder_center = (xyz[11] + xyz[12]) / 2.0
    torso_scale = np.linalg.norm(shoulder_center - hip_center)
    if torso_scale < 1e-6:
        torso_scale = 1.0

    xyz_norm = (xyz - hip_center) / torso_scale
    return xyz_norm.astype(np.float32), visibility.astype(np.float32)


def build_feature_row(raw132: np.ndarray, angle_triplets: list[tuple[int, int, int]]) -> np.ndarray:
    lm = raw132.reshape(33, 4)
    xyz_norm, visibility = normalize_pose(lm)

    angles = [calc_angle(xyz_norm[a], xyz_norm[b], xyz_norm[c]) for a, b, c in angle_triplets]

    l_upper_arm = np.linalg.norm(xyz_norm[11] - xyz_norm[13])
    l_fore_arm = np.linalg.norm(xyz_norm[13] - xyz_norm[15])
    r_upper_arm = np.linalg.norm(xyz_norm[12] - xyz_norm[14])
    r_fore_arm = np.linalg.norm(xyz_norm[14] - xyz_norm[16])
    l_upper_leg = np.linalg.norm(xyz_norm[23] - xyz_norm[25])
    l_lower_leg = np.linalg.norm(xyz_norm[25] - xyz_norm[27])
    r_upper_leg = np.linalg.norm(xyz_norm[24] - xyz_norm[26])
    r_lower_leg = np.linalg.norm(xyz_norm[26] - xyz_norm[28])

    ratios = [
        safe_ratio(l_fore_arm, l_upper_arm),
        safe_ratio(r_fore_arm, r_upper_arm),
        safe_ratio(l_lower_leg, l_upper_leg),
        safe_ratio(r_lower_leg, r_upper_leg),
    ]

    return np.concatenate(
        [
            xyz_norm.flatten(),
            visibility,
            np.array(angles, dtype=np.float32),
            np.array(ratios, dtype=np.float32),
        ]
    ).astype(np.float32)


def main() -> None:
    model_path = MODEL_PATH if MODEL_PATH.exists() else LEGACY_MODEL_PATH
    if not model_path.exists():
        raise SystemExit(f"Model not found: {MODEL_PATH} or {LEGACY_MODEL_PATH}")
    if not CSV_PATH.exists():
        raise SystemExit(f"CSV not found: {CSV_PATH}")

    print("Loading model...")
    model = tf.keras.models.load_model(model_path)
    print("Model input:", model.input_shape, "output:", model.output_shape)

    df = pd.read_csv(CSV_PATH)
    row = df.iloc[0]
    label = row["label"]

    raw132 = row.drop("label").to_numpy(dtype=np.float32)

    labels = sorted(df["label"].dropna().unique().tolist())
    x = raw132.reshape(1, 132)

    if PREPROCESS_PATH.exists():
        with PREPROCESS_PATH.open("rb") as f:
            artifacts = pickle.load(f)

        scaler = artifacts.get("scaler")
        angle_triplets = artifacts.get("angle_triplets") or DEFAULT_ANGLE_TRIPLETS

        if artifacts.get("label_encoder") is not None:
            labels = [str(v) for v in artifacts["label_encoder"].classes_.tolist()]

        feat = build_feature_row(raw132, [tuple(map(int, t)) for t in angle_triplets]).reshape(1, -1)
        x = scaler.transform(feat) if scaler is not None else feat

    probs = model.predict(x, verbose=0)[0]

    pred_i = int(np.argmax(probs))
    pred_label = labels[pred_i] if pred_i < len(labels) else f"class_{pred_i}"

    print("True label:", label)
    print("Predicted:", pred_label, "conf:", float(probs[pred_i]))


if __name__ == "__main__":
    main()
