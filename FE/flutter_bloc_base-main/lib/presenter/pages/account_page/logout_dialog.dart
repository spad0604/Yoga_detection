import 'package:flutter/material.dart';
// navigation import removed; dialog now returns a boolean and the caller handles navigation
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Logout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  text: 'Cancel',
                  backgroundColor: AppColors.cyan,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  textColor: AppColors.primaryBlue,
                  fullWidth: false,
                ),
                const SizedBox(width: 8),
                CustomButton(
                  text: 'Logout',
                  backgroundColor: Colors.red,
                  onPressed: () {
                    // Return true to indicate the user confirmed logout.
                    Navigator.of(context).pop(true);
                  },
                  textColor: Colors.white,
                  fullWidth: false,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
