part of 'routine_practice_session_page.dart';

class PosePainter extends CustomPainter {
  final List<Pose> poses;
  final Size imageSize;

  PosePainter({
    required this.poses,
    required this.imageSize,
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

      // Draw skeleton connections
      for (final connection in _poseConnections) {
        if (connection.length != 2) continue;
        final type1 = connection[0];
        final type2 = connection[1];

        final lm1 = landmarksMap[type1];
        final lm2 = landmarksMap[type2];

        if (lm1 == null || lm2 == null) continue;
        if (lm1.likelihood < 0.3 || lm2.likelihood < 0.3) continue;

        final x1 = lm1.x * scale + offsetX;
        final y1 = lm1.y * scale + offsetY;
        final x2 = lm2.x * scale + offsetX;
        final y2 = lm2.y * scale + offsetY;

        final lineColor = _lineColorFor(type1, type2);
        final opacity = ((lm1.likelihood + lm2.likelihood) / 2).clamp(0.3, 1.0);

        canvas.drawLine(
          Offset(x1, y1),
          Offset(x2, y2),
          paintLine..color = lineColor.withOpacity(opacity),
        );
      }

      // Draw landmark points
      landmarksMap.forEach((type, landmark) {
        if (landmark.likelihood < 0.3) return;

        final x = landmark.x * scale + offsetX;
        final y = landmark.y * scale + offsetY;
        final name = type.toString().split('.').last;

        Color pointColor;
        if (name.startsWith('left')) {
          pointColor = Colors.lightBlueAccent;
        } else if (name.startsWith('right')) {
          pointColor = Colors.pinkAccent;
        } else {
          pointColor = Colors.greenAccent;
        }

        final opacity = landmark.likelihood.clamp(0.3, 1.0);

        // Draw glow effect
        final paintGlow = Paint()
          ..color = pointColor.withOpacity(opacity * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
        canvas.drawCircle(Offset(x, y), 8, paintGlow);

        // Draw outer circle
        final paintOuter = Paint()
          ..color = pointColor.withOpacity(opacity)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(Offset(x, y), 6, paintOuter);

        // Draw inner circle (white center)
        final paintInner = Paint()
          ..color = Colors.white.withOpacity(opacity)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(Offset(x, y), 4.5, paintInner);
      });
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.poses != poses || oldDelegate.imageSize != imageSize;
  }
}
