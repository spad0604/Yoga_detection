import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/change_password.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_event.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';
import 'package:toastification/toastification.dart';
import 'package:easy_localization/easy_localization.dart';

class TypeCodePage extends StatefulWidget {
  const TypeCodePage({Key? key}) : super(key: key);

  @override
  State<TypeCodePage> createState() => _TypeCodePageState();
}

class _TypeCodePageState extends State<TypeCodePage> {
  final TextEditingController _codeController = TextEditingController();

  ForgotPasswordBloc get _bloc => context.read<ForgotPasswordBloc>();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == ForgotPasswordStatus.loading) {
            EasyLoading.show(status: 'loading...');
            return;
          }
          EasyLoading.dismiss();

          if (state.status == ForgotPasswordStatus.otpVerifySuccess) {
            toastification.show(
              context: context,
              type: ToastificationType.success,
              title: const Text('OTP verified successfully'),
            );
            context.router.push(const ChangePasswordRoute());
          } else if (state.status == ForgotPasswordStatus.failure) {
            final raw = state.error?.message;
            if (raw != null) {
              final display = raw.startsWith('Errors.') ? tr(raw) : raw.toString();
              toastification.show(
                context: context,
                type: ToastificationType.error,
                title: Text(display),
              );
            }
          }
        },
        child: Padding(
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
                  Expanded(
                    child: CustomButton(
                      text: 'Resend',
                      onPressed: () {
                        final email = _bloc.state.email;
                        if (email != null && email.isNotEmpty) {
                          _bloc.add(SendOtpRequested(email));
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: const TextStyle(height: 1.6, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'We texted you a code to verify your email ',
                      style: TextStyle(color: AppColors.gray, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: (_bloc.state.email ?? '') + '\n',
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
                text: 'Verify',
                backgroundColor: AppColors.primaryBlue,
                textColor: Colors.white,
                onPressed: () {
                  final email = _bloc.state.email;
                  final otp = _codeController.text.trim();
                  if (email != null && otp.isNotEmpty) {
                    _bloc.add(VerifyOtpRequested(email: email, otp: otp));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
