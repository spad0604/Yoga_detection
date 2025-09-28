import 'package:flutter/material.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Change\nPassword',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                Image.asset(
                  AppImages.logo,
                  width: 106,
                  height: 96,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Type your new password',
              style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: 'Enter new password',
              controller: _passwordController,
              isPassword: _showPassword,
              suffixIcon: _showPassword ? AppImages.ic_eye_on : AppImages.ic_eye_off,
              onTapSuffix: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Confirm New Password',
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: 'Enter confirm new password',
              controller: _confirmPasswordController,
              isPassword: _showConfirmPassword,
              suffixIcon: _showConfirmPassword ? AppImages.ic_eye_on : AppImages.ic_eye_off,
              onTapSuffix: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
                });
              },
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Change Password',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            )
          ],
        ),
      ),
    );
  }
}
