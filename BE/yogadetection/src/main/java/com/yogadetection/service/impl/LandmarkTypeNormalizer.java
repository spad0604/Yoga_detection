package com.yogadetection.service.impl;

import java.util.Locale;

public class LandmarkTypeNormalizer {

    private LandmarkTypeNormalizer() {
    }

    /**
     * Accepts values like "leftShoulder", "LEFT_SHOULDER", "LeftShoulder" and returns "LEFT_SHOULDER".
     */
    public static String normalize(String raw) {
        if (raw == null) return null;
        String s = raw.trim();
        if (s.isEmpty()) return s;

        // Already snake-like
        if (s.contains("_")) {
            return s.toUpperCase(Locale.ROOT);
        }

        // Convert camelCase/PascalCase -> snake
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.isUpperCase(c) && i > 0) {
                out.append('_');
            }
            out.append(Character.toUpperCase(c));
        }
        return out.toString();
    }
}
