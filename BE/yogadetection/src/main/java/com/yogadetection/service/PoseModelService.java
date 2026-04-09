package com.yogadetection.service;

import com.yogadetection.dto.request.Landmark;

import java.util.Map;
import java.util.List;
import java.util.Optional;

/**
 * Calls the trained pose classification model (Yoga-82) to detect nearest pose
 * and compute deviation (angle diffs) before invoking LLM feedback.
 */
public interface PoseModelService {

    Optional<PoseModelAnalysis> analyze(List<Landmark> landmarks);

    class PoseModelAnalysis {
        private final String predictedPose;
        private final double confidence;
        private final List<TopK> topK;
        private final MostOff mostOff;
        private final Map<String, Double> actualAngles;
        private final Map<String, Double> referenceAngles;

        public PoseModelAnalysis(
                String predictedPose,
                double confidence,
                List<TopK> topK,
                MostOff mostOff,
                Map<String, Double> actualAngles,
                Map<String, Double> referenceAngles
        ) {
            this.predictedPose = predictedPose;
            this.confidence = confidence;
            this.topK = topK;
            this.mostOff = mostOff;
            this.actualAngles = actualAngles;
            this.referenceAngles = referenceAngles;
        }

        public String getPredictedPose() {
            return predictedPose;
        }

        public double getConfidence() {
            return confidence;
        }

        public List<TopK> getTopK() {
            return topK;
        }

        public MostOff getMostOff() {
            return mostOff;
        }

        public Map<String, Double> getActualAngles() {
            return actualAngles;
        }

        public Map<String, Double> getReferenceAngles() {
            return referenceAngles;
        }

        public static class TopK {
            private final String pose;
            private final double confidence;

            public TopK(String pose, double confidence) {
                this.pose = pose;
                this.confidence = confidence;
            }

            public String getPose() {
                return pose;
            }

            public double getConfidence() {
                return confidence;
            }
        }

        public static class MostOff {
            private final String metric;
            private final double diff;
            private final double actual;
            private final double reference;

            public MostOff(String metric, double diff, double actual, double reference) {
                this.metric = metric;
                this.diff = diff;
                this.actual = actual;
                this.reference = reference;
            }

            public String getMetric() {
                return metric;
            }

            public double getDiff() {
                return diff;
            }

            public double getActual() {
                return actual;
            }

            public double getReference() {
                return reference;
            }
        }
    }
}
