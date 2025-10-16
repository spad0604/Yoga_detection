import 'dart:convert';

/// Simple POJO-like classes used to serialize pose + landmarks + image
/// to JSON that matches the BE contract (PoseLandmarkRequest).

class PoseLandmark {
  final String type;
  final double x;
  final double y;
  final double z;

  PoseLandmark({required this.type, required this.x, required this.y, required this.z});

  factory PoseLandmark.fromJson(Map<String, dynamic> json) => PoseLandmark(
        type: json['type'] as String,
        x: (json['x'] as num).toDouble(),
        y: (json['y'] as num).toDouble(),
        z: (json['z'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'x': x,
        'y': y,
        'z': z,
      };
}

class PoseLandmarkRequest {
  final int poseId;
  final List<PoseLandmark> landmarks;
  final String? imageBase64;
  final String? deviceId;
  final int? timestamp;

  PoseLandmarkRequest({
    required this.poseId,
    required this.landmarks,
    this.imageBase64,
    this.deviceId,
    this.timestamp,
  });

  factory PoseLandmarkRequest.fromJson(Map<String, dynamic> json) => PoseLandmarkRequest(
        poseId: (json['poseId'] as num).toInt(),
        landmarks: (json['landmarks'] as List)
            .map((e) => PoseLandmark.fromJson(e as Map<String, dynamic>))
            .toList(),
        imageBase64: json['imageBase64'] as String?,
        deviceId: json['deviceId'] as String?,
        timestamp: json['timestamp'] == null ? null : (json['timestamp'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'poseId': poseId,
        'landmarks': landmarks.map((l) => l.toJson()).toList(),
        if (imageBase64 != null) 'imageBase64': imageBase64,
        if (deviceId != null) 'deviceId': deviceId,
        if (timestamp != null) 'timestamp': timestamp,
      };

  String toJsonString() => jsonEncode(toJson());
}
