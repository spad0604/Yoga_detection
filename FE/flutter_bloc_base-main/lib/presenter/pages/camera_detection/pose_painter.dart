part of 'camera_detection.dart';

class _PosePainter extends CustomPainter {
  final List<Pose> poses;
  final Size imageSize;
  final bool isFrontCamera;

  _PosePainter({
    required this.poses,
    required this.imageSize,
    required this.isFrontCamera,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (imageSize == Size.zero) return;

    final paintPoint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final scaleX = size.width / imageSize.height;
    final scaleY = size.height / imageSize.width;

    for (final pose in poses) {
      final landmarks = pose.landmarks.values.toList();
      for (final lm in landmarks) {
        double x = lm.x;
        double y = lm.y;
        if (isFrontCamera) x = imageSize.width - x;
        final dx = x * scaleX;
        final dy = y * scaleY;
        canvas.drawCircle(Offset(dx, dy), 4.0, paintPoint);
      }

      // simple connections (adjacent in the list) - replace with real bone pairs if needed
      if (landmarks.length > 1) {
        for (int i = 0; i < landmarks.length - 1; i++) {
          var a = landmarks[i];
          var b = landmarks[i + 1];
          double ax = a.x, ay = a.y, bx = b.x, by = b.y;
          if (isFrontCamera) {
            ax = imageSize.width - ax;
            bx = imageSize.width - bx;
          }
          canvas.drawLine(
              Offset(ax * scaleX, ay * scaleY), Offset(bx * scaleX, by * scaleY), paintLine);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PosePainter oldDelegate) => oldDelegate.poses != poses;
}
