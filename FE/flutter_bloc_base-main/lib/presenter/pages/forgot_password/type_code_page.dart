import 'package:flutter/material.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/change_password.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';

class TypeCodePage extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  TypeCodePage({Key? key}) : super(key: key);

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
                  Text('Forgot\nPassword',
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
                'Type a code',
                style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      hintText: 'Enter code',
                      controller: _codeController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: CustomButton(text: 'Resend')),
                ],
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  // parent style provides line height (spacing) and default font size
                  style: const TextStyle(height: 1.6, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'We texted you a code to verify your email ',
                      style: TextStyle(color: AppColors.gray, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: 'gi****29@cht.edu.vn\n',
                      style: TextStyle(color: AppColors.darkBlue, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text:
                          'This code will expired 10 minutes after this message. If you don\'t get a message.',
                      style: TextStyle(color: AppColors.gray, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Change Password',
                backgroundColor: AppColors.primaryBlue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ChangePasswordPage()),
                  );
                },
              )
            ],
          ),
        ));
  }
}
