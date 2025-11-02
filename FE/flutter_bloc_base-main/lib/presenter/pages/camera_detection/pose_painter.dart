part of 'camera_detection.dart';

class PosePainter extends CustomPainter {
  final List<Pose> poses;
  final Size imageSize;
  final bool isFrontCamera;
  final bool showLabels;

  PosePainter({
    required this.poses,
    required this.imageSize,
    required this.isFrontCamera,
    this.showLabels = false,
  });

  // Define proper skeleton connections for human body
  static const List<List<PoseLandmarkType>> _poseConnections = [
    // Face
    [PoseLandmarkType.leftEar, PoseLandmarkType.leftEye],
    [PoseLandmarkType.leftEye, PoseLandmarkType.nose],
    [PoseLandmarkType.nose, PoseLandmarkType.rightEye],
    [PoseLandmarkType.rightEye, PoseLandmarkType.rightEar],

    // Left arm
    [PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow],
    [PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist],
    [PoseLandmarkType.leftWrist, PoseLandmarkType.leftPinky],
    [PoseLandmarkType.leftWrist, PoseLandmarkType.leftIndex],
    [PoseLandmarkType.leftWrist, PoseLandmarkType.leftThumb],
    [PoseLandmarkType.leftPinky, PoseLandmarkType.leftIndex],

    // Right arm
    [PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow],
    [PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist],
    [PoseLandmarkType.rightWrist, PoseLandmarkType.rightPinky],
    [PoseLandmarkType.rightWrist, PoseLandmarkType.rightIndex],
    [PoseLandmarkType.rightWrist, PoseLandmarkType.rightThumb],
    [PoseLandmarkType.rightPinky, PoseLandmarkType.rightIndex],

    // Body
    [PoseLandmarkType.leftShoulder, PoseLandmarkType.rightShoulder],
    [PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip],
    [PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip],
    [PoseLandmarkType.leftHip, PoseLandmarkType.rightHip],

    // Left leg
    [PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee],
    [PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle],
    [PoseLandmarkType.leftAnkle, PoseLandmarkType.leftHeel],
    [PoseLandmarkType.leftAnkle, PoseLandmarkType.leftFootIndex],
    [PoseLandmarkType.leftHeel, PoseLandmarkType.leftFootIndex],

    // Right leg
    [PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee],
    [PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle],
    [PoseLandmarkType.rightAnkle, PoseLandmarkType.rightHeel],
    [PoseLandmarkType.rightAnkle, PoseLandmarkType.rightFootIndex],
    [PoseLandmarkType.rightHeel, PoseLandmarkType.rightFootIndex],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    if (imageSize == Size.zero) return;

    final paintPointCenter = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Calculate scale factors with proper aspect ratio handling
    // Check if image and canvas have different orientations
    final imageIsPortrait = imageSize.height > imageSize.width;
    final canvasIsPortrait = size.height > size.width;

    double scaleX, scaleY, scale, offsetX, offsetY;

    if (imageIsPortrait == canvasIsPortrait) {
      // Same orientation - standard scaling
      scaleX = size.width / imageSize.width;
      scaleY = size.height / imageSize.height;
      scale = scaleX < scaleY ? scaleX : scaleY;
      offsetX = (size.width - imageSize.width * scale) / 2;
      offsetY = (size.height - imageSize.height * scale) / 2;
    } else {
      // Different orientation - swap dimensions for scaling
      scaleX = size.width / imageSize.height;
      scaleY = size.height / imageSize.width;
      scale = scaleX < scaleY ? scaleX : scaleY;
      offsetX = (size.width - imageSize.height * scale) / 2;
      offsetY = (size.height - imageSize.width * scale) / 2;
    }

    Color _colorFor(String label) {
      if (label.startsWith('left')) return Colors.lightBlueAccent;
      if (label.startsWith('right')) return Colors.pinkAccent;
      return Colors.greenAccent;
    }

    Color _lineColorFor(PoseLandmarkType type1, PoseLandmarkType type2) {
      final name1 = type1.toString().split('.').last;
      final name2 = type2.toString().split('.').last;
      if (name1.startsWith('left') || name2.startsWith('left')) {
        return Colors.lightBlueAccent;
      }
      if (name1.startsWith('right') || name2.startsWith('right')) {
        return Colors.pinkAccent;
      }
      return Colors.greenAccent;
    }

    for (final pose in poses) {
      final landmarksMap = pose.landmarks;

      // Draw skeleton connections first (so points appear on top)
      for (final connection in _poseConnections) {
        if (connection.length != 2) continue;
        final type1 = connection[0];
        final type2 = connection[1];

        final lm1 = landmarksMap[type1];
        final lm2 = landmarksMap[type2];

        if (lm1 == null || lm2 == null) continue;

        // Check likelihood/confidence - lowered threshold for better visibility
        if (lm1.likelihood < 0.3 || lm2.likelihood < 0.3) continue;

        double x1 = lm1.x * scale + offsetX;
        double y1 = lm1.y * scale + offsetY;
        double x2 = lm2.x * scale + offsetX;
        double y2 = lm2.y * scale + offsetY;

        if (isFrontCamera) {
          x1 = size.width - x1;
          x2 = size.width - x2;
        }

        final lineColor = _lineColorFor(type1, type2);
        final opacity = ((lm1.likelihood + lm2.likelihood) / 2).clamp(0.3, 1.0);
        canvas.drawLine(
          Offset(x1, y1),
          Offset(x2, y2),
          paintLine..color = lineColor.withOpacity(opacity),
        );
      }

      // Draw points with optional labels
      for (final entry in landmarksMap.entries) {
        final type = entry.key;
        final lm = entry.value;

        // Skip very low confidence landmarks
        if (lm.likelihood < 0.3) continue;

        double dx = lm.x * scale + offsetX;
        double dy = lm.y * scale + offsetY;
        if (isFrontCamera) dx = size.width - dx;

        final label = type.toString().split('.').last;
        final pointColor = _colorFor(label);
        final opacity = lm.likelihood.clamp(0.3, 1.0);

        // Draw outer glow for better visibility
        canvas.drawCircle(
          Offset(dx, dy),
          8.0,
          Paint()
            ..color = pointColor.withOpacity(0.2)
            ..style = PaintingStyle.fill,
        );

        // Draw outer circle for better visibility
        canvas.drawCircle(
          Offset(dx, dy),
          6.0,
          Paint()
            ..color = Colors.black.withOpacity(0.6)
            ..style = PaintingStyle.fill,
        );

        // Draw point
        canvas.drawCircle(
          Offset(dx, dy),
          4.5,
          paintPointCenter..color = pointColor.withOpacity(opacity),
        );

        // Draw label if enabled
        if (showLabels) {
          final textPainter = TextPainter(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(blurRadius: 4, color: Colors.black, offset: Offset(0, 0)),
                  Shadow(blurRadius: 4, color: Colors.black, offset: Offset(1, 1)),
                ],
              ),
            ),
            textDirection: TextDirection.ltr,
            maxLines: 1,
          )..layout();
          textPainter.paint(canvas, Offset(dx + 8, dy - 6));
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) => oldDelegate.poses != poses;
}
