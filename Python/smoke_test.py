from __future__ import annotations

from pathlib import Path

import numpy as np
import pandas as pd
import tensorflow as tf

APP_DIR = Path(__file__).resolve().parent
MODEL_PATH = APP_DIR / "yoga_pose_model.h5"
CSV_PATH = APP_DIR / "yoga_keypoints.csv"


def main() -> None:
    if not MODEL_PATH.exists():
        raise SystemExit(f"Model not found: {MODEL_PATH}")
    if not CSV_PATH.exists():
        raise SystemExit(f"CSV not found: {CSV_PATH}")

    print("Loading model...")
    model = tf.keras.models.load_model(MODEL_PATH)
    print("Model input:", model.input_shape, "output:", model.output_shape)

    df = pd.read_csv(CSV_PATH)
    row = df.iloc[0]
    label = row["label"]

    x = row.drop("label").to_numpy(dtype=np.float32).reshape(1, 132)
    probs = model.predict(x, verbose=0)[0]

    # sklearn LabelEncoder order is sorted unique labels
    labels = sorted(df["label"].dropna().unique().tolist())
    pred_i = int(np.argmax(probs))
    pred_label = labels[pred_i] if pred_i < len(labels) else f"class_{pred_i}"

    print("True label:", label)
    print("Predicted:", pred_label, "conf:", float(probs[pred_i]))


if __name__ == "__main__":
    main()
