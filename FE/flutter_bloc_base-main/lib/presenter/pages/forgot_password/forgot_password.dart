import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_state.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_event.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/type_code_page.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toastification/toastification.dart';
import 'package:easy_localization/easy_localization.dart';

// TODO: Add the page to the router
@RoutePage()
class ForgotPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ForgotPasswordPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      create: (ctx) => provider.get<ForgotPasswordBloc>(),
      child: this,
    );
  }

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  ForgotPasswordBloc get _bloc => context.read<ForgotPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: MultiBlocListener(
          listeners: [
            BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
              listenWhen: (prev, curr) => prev.status != curr.status,
              listener: (context, state) {
                if (state.status == ForgotPasswordStatus.loading) {
                  EasyLoading.show(status: 'loading...');
                  return;
                }

                EasyLoading.dismiss();

                if (state.status == ForgotPasswordStatus.otpSendSuccess) {
                  toastification.show(
                    autoCloseDuration: Duration(seconds: 1),
                    context: context,
                    type: ToastificationType.success,
                    title: const Text('OTP sent successfully'),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: _bloc,
                        child: TypeCodePage(),
                      ),
                    ),
                  );
                } else if (state.status == ForgotPasswordStatus.failure) {
                  final raw = state.error?.message;
                  if (raw != null) {
                    final display = raw.startsWith('Errors.') ? tr(raw) : raw.toString();
                    toastification.show(
                      autoCloseDuration: Duration(seconds: 1),
                      context: context,
                      type: ToastificationType.error,
                      title: Text(display),
                    );
                  }
                }
              },
            ),
          ],
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
                    )
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'Type your registered email',
                  style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Enter your email',
                  controller: _emailController,
                  isPassword: false,
                  suffixIcon: AppImages.ic_mail,
                ),
                const SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '* ',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'We texted you a code to verify your email',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Send',
                  backgroundColor: AppColors.primaryBlue,
                  textColor: Colors.white,
                  onPressed: () {
                    _bloc.add(SetEmailEvent(_emailController.text));
                    _bloc.add(SendOtpRequested(_emailController.text));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
