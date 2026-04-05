package com.yogadetection.service.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Heuristic matcher between DB pose names and Yoga-82 label strings.
 * Works best when DB stores English/Sanskrit names.
 */
public class PoseNameMatcher {

    private PoseNameMatcher() {
    }

    public static boolean isLikelySamePose(String expectedPoseName, String predictedLabel) {
        if (expectedPoseName == null || expectedPoseName.isBlank() || predictedLabel == null || predictedLabel.isBlank()) {
            return false;
        }

        // If expected is likely Vietnamese/unicode while predicted is ASCII label,
        // we can't reliably match without an explicit mapping. Don't claim it's wrong.
        if (containsNonAscii(expectedPoseName) && isAscii(predictedLabel)) {
            return true;
        }

        String expected = normalize(expectedPoseName);
        String predicted = normalize(predictedLabel);

        if (expected.isBlank() || predicted.isBlank()) return false;

        if (predicted.contains(expected) || expected.contains(predicted)) {
            return true;
        }

        Set<String> expectedTokens = tokenSet(expected);
        Set<String> predictedTokens = tokenSet(predicted);

        if (expectedTokens.isEmpty() || predictedTokens.isEmpty()) return false;

        int intersect = 0;
        for (String t : expectedTokens) {
            if (predictedTokens.contains(t)) intersect++;
        }

        double jaccard = intersect / (double) (expectedTokens.size() + predictedTokens.size() - intersect);
        return jaccard >= 0.45;
    }

    private static Set<String> tokenSet(String s) {
        Set<String> out = new HashSet<>();
        Arrays.stream(s.split(" "))
                .map(String::trim)
                .filter(t -> !t.isBlank())
                .filter(t -> t.length() >= 3)
                .filter(t -> !t.equals("pose"))
                .filter(t -> !t.equals("yoga"))
                .filter(t -> !t.equals("the"))
                .filter(t -> !t.equals("and"))
                .filter(t -> !t.equals("or"))
                .forEach(out::add);
        return out;
    }

    private static String normalize(String s) {
        String n = s.toLowerCase(Locale.ROOT)
                .replace('_', ' ')
                .replace('-', ' ')
                .replaceAll("\\(.*?\\)", " ")
                .replaceAll("[^\\p{L}0-9 ]", " ")
                .replaceAll("\\s+", " ")
                .trim();

        // common Yoga-82 suffix/prefix words
        n = n.replaceAll("\\bpose\\b", " ")
                .replaceAll("\\bor\\b", " ")
                .replaceAll("\\s+", " ")
                .trim();

        return n;
    }

    private static boolean containsNonAscii(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) > 127) return true;
        }
        return false;
    }

    private static boolean isAscii(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) > 127) return false;
        }
        return true;
    }
}
