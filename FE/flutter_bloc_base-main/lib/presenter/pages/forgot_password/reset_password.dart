import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_event.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_state.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_starter/data/entities/request/reset_password_request.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ResetPasswordPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      create: (ctx) => provider.get<ForgotPasswordBloc>(),
      child: this,
    );
  }

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  ForgotPasswordBloc get _bloc => context.read<ForgotPasswordBloc>();

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

  void _changePasswordSuccess() {
    context.router.replaceAll([const LoginRoute()]);
  }

  void _changePasswordFailure(String message) {
    toastification.show(
      autoCloseDuration: Duration(seconds: 1),
      context: context,
      type: ToastificationType.error,
      title: Text(
        message,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          bloc: _bloc,
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            // Ensure loading indicator is dismissed in any terminal state
            if (state.status == ForgotPasswordStatus.loading) {
              EasyLoading.show(status: 'loading...');
              return;
            }

            // Dismiss loading for success/failure
            EasyLoading.dismiss();

            if (state.status == ForgotPasswordStatus.success) {
              toastification.show(
                autoCloseDuration: Duration(seconds: 1),
                context: context,
                type: ToastificationType.success,
                title: Text(
                  tr('Errors.SUCCESS'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
              // Navigate back to the first page (e.g., login) after success
              Navigator.popUntil(context, (route) => route.isFirst);
            } else if (state.status == ForgotPasswordStatus.changePasswordFailure) {
              _changePasswordFailure('Change password failed');
            } else if (state.status == ForgotPasswordStatus.changePasswordSuccess) {
              _changePasswordSuccess();
            }
          },
        ),
      ],
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: _bloc,
        builder: (BuildContext context, ForgotPasswordState state) => Scaffold(
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
                    _bloc.add(ResetPasswordRequested(
                      newPassword: _passwordController.text,
                      confirmNewPassword: _confirmPasswordController.text,
                    ));
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
