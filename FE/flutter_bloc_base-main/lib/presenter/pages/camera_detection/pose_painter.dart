part of 'camera_detection.dart';

class _PosePainter extends CustomPainter {
  final List<Pose> poses;
  final Size imageSize;
  final bool isFrontCamera;
  final bool showLabels;

  _PosePainter({
    required this.poses,
    required this.imageSize,
    required this.isFrontCamera,
    this.showLabels = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (imageSize == Size.zero) return;

    final paintPointCenter = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Map landmark coordinates (in image space) to the preview size.
    // Use image width/height directly; CameraPreview handles rotation internally.
    final scaleX = size.width / imageSize.width;
    final scaleY = size.height / imageSize.height;

    Color _colorFor(String label) {
      if (label.startsWith('left')) return Colors.lightBlueAccent;
      if (label.startsWith('right')) return Colors.pinkAccent;
      return Colors.greenAccent;
    }

    for (final pose in poses) {
      final landmarksMap = pose.landmarks; // Map<PoseLandmarkType, PoseLandmark>
      final landmarks = landmarksMap.values.toList();

      // Draw points with optional labels
      for (final entry in landmarksMap.entries) {
        final type = entry.key;
        final lm = entry.value;
        double dx = lm.x * scaleX;
        double dy = lm.y * scaleY;
        if (isFrontCamera) dx = size.width - dx; // mirror horizontally for front camera

        final label = type.toString().split('.').last; // e.g., leftShoulder
        final pointColor = _colorFor(label);

        // draw point
        canvas.drawCircle(Offset(dx, dy), 4.0, paintPointCenter..color = pointColor);

        // draw label if enabled
        if (showLabels) {
          final textPainter = TextPainter(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                shadows: [Shadow(blurRadius: 2, color: Colors.black, offset: Offset(0, 0))],
              ),
            ),
            textDirection: TextDirection.ltr,
            maxLines: 1,
          )..layout();
          textPainter.paint(canvas, Offset(dx + 6, dy + 2));
        }
      }

      // simple connections (adjacent in the list) - replace with real bone pairs if needed
      if (landmarks.length > 1) {
        for (int i = 0; i < landmarks.length - 1; i++) {
          final a = landmarks[i];
          final b = landmarks[i + 1];
          double ax = a.x * scaleX, ay = a.y * scaleY;
          double bx = b.x * scaleX, by = b.y * scaleY;
          if (isFrontCamera) {
            ax = size.width - ax;
            bx = size.width - bx;
          }
          canvas.drawLine(Offset(ax, ay), Offset(bx, by), paintLine);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PosePainter oldDelegate) => oldDelegate.poses != poses;
}
