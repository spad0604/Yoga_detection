package com.yogadetection.service.impl;

import com.yogadetection.dto.request.Landmark;

import java.util.ArrayList;
import java.util.List;

/**
 * Normalizes MLKit landmarks (pixel coordinates) into [0..1] similar to MediaPipe.
 * If landmarks already look normalized, keeps values.
 */
public class PoseLandmarkNormalizer {

    private PoseLandmarkNormalizer() {
    }

    public static List<Landmark> normalize(List<Landmark> landmarks, Integer imageWidth, Integer imageHeight) {
        if (landmarks == null || landmarks.isEmpty()) {
            return List.of();
        }

        boolean hasLikelyPixels = landmarks.stream().anyMatch(l -> l != null && (l.getX() > 2 || l.getY() > 2));
        boolean canNormalize = imageWidth != null && imageHeight != null && imageWidth > 0 && imageHeight > 0;

        if (!hasLikelyPixels) {
            return sanitize(landmarks);
        }

        // If looks like pixels but we don't know image size, approximate scaling using observed ranges.
        if (!canNormalize) {
            double maxX = 0.0;
            double maxY = 0.0;
            for (Landmark lm : landmarks) {
                if (lm == null) continue;
                maxX = Math.max(maxX, sanitizeCoordinate(lm.getX()));
                maxY = Math.max(maxY, sanitizeCoordinate(lm.getY()));
            }
            double denomX = maxX > 0 ? maxX : 1.0;
            double denomY = maxY > 0 ? maxY : 1.0;

            List<Landmark> out = new ArrayList<>(landmarks.size());
            for (Landmark lm : landmarks) {
                if (lm == null) continue;
                double x = sanitizeCoordinate(lm.getX()) / denomX;
                double y = sanitizeCoordinate(lm.getY()) / denomY;
                double z = sanitizeCoordinate(lm.getZ()) / denomX;
                out.add(Landmark.builder()
                        .type(LandmarkTypeNormalizer.normalize(lm.getType()))
                        .x(clamp01(x))
                        .y(clamp01(y))
                        .z(z)
                        .build());
            }
            return out;
        }

        List<Landmark> out = new ArrayList<>(landmarks.size());
        for (Landmark lm : landmarks) {
            if (lm == null) continue;

            double x = sanitizeCoordinate(lm.getX());
            double y = sanitizeCoordinate(lm.getY());
            double z = sanitizeCoordinate(lm.getZ());

            // MLKit x/y are in pixels; normalize to [0..1]
            if (x > 0) x = x / imageWidth;
            if (y > 0) y = y / imageHeight;

            // z scale is not well-defined; normalize roughly by image width
            if (z != 0) z = z / imageWidth;

            out.add(Landmark.builder()
                    .type(LandmarkTypeNormalizer.normalize(lm.getType()))
                    .x(clamp01(x))
                    .y(clamp01(y))
                    .z(z)
                    .build());
        }

        return out;
    }

    private static List<Landmark> sanitize(List<Landmark> landmarks) {
        List<Landmark> out = new ArrayList<>(landmarks.size());
        for (Landmark lm : landmarks) {
            if (lm == null) continue;
            out.add(Landmark.builder()
                    .type(LandmarkTypeNormalizer.normalize(lm.getType()))
                    .x(sanitizeCoordinate(lm.getX()))
                    .y(sanitizeCoordinate(lm.getY()))
                    .z(sanitizeCoordinate(lm.getZ()))
                    .build());
        }
        return out;
    }

    private static double sanitizeCoordinate(double v) {
        if (Double.isNaN(v) || Double.isInfinite(v)) return 0.0;
        // Mobile uses -1 when missing
        if (v < 0) return 0.0;
        return v;
    }

    private static double clamp01(double v) {
        if (v < 0) return 0.0;
        if (v > 1) return 1.0;
        return v;
    }
}
