part of 'camera_detection.dart';

Widget cameraDetectionButton(
  String iconPath,
  Color backgroundColor,
  Color iconColor,
  VoidCallback onPressed,
) {
  return Container(
    width: 60,
    height: 50,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: IconButton(
        icon: Image.asset(
          iconPath,
          color: iconColor,
          width: 20,
          height: 20,
        ),
        onPressed: onPressed,
      ),
    ),
  );
}
