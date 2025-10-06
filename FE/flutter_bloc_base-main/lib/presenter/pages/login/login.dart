import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
// ...existing code...
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/login/login_bloc.dart';
import 'package:flutter_starter/presenter/pages/login/login_event.dart';
import 'package:flutter_starter/presenter/pages/login/login_selector.dart';
import 'package:flutter_starter/presenter/pages/login/login_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';
// ...existing code...

part 'another_login_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (ctx) => provider.get<LoginBloc>(),
      child: this,
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscure = true;

  LoginBloc get _bloc => context.read<LoginBloc>();

  void _onLoginPressed() {
    _bloc.add(const LoginStarted());
  }

  void _onSuccess(BuildContext context, LoginState state) {
    context.router.replaceAll([HomeRoute()]);
  }

  void _loading(BuildContext context, LoginState state) {
    EasyLoading.show(status: 'loading...');
  }

  void _onError(BuildContext context, LoginState state) {
    final errorMessage = state.error?.message;

    if (errorMessage == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage.toString()),
        backgroundColor: context.colors.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocListener(
      listeners: [
        LoginSuccessListener(listener: _onSuccess),
        LoginFailureListener(listener: _onError),
      ],
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 512),
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  Center(
                    child: Image.asset(
                      AppImages.logo,
                      width: 117.w,
                      height: 107.h,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Yoga Detection',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36, color: Colors.black),
                    ),
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.w,
                    ),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                    final emailError = state.emailError;

                    return CustomTextField(
                      controller: _usernameController,
                      hintText: tr("enter_username"),
                      onChanged: (v) => _bloc.add(LoginEmailChanged(v)),
                      errorText: emailError,
                    );
                  }),
                  Text(
                    tr("Password"),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.w,
                    ),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                    final passwordError = state.passwordError;

                    return CustomTextField(
                      isPassword: _isObscure,
                      controller: _passwordController,
                      hintText: tr("enter_password"),
                      onChanged: (v) => _bloc.add(LoginPasswordChanged(v)),
                      errorText: passwordError,
                      suffixIcon: _isObscure ? AppImages.ic_eye_off : AppImages.ic_eye_on,
                      onTapSuffix: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    );
                  }),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          checkColor: AppColors.lightBlue,
                          activeColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            side: BorderSide(color: AppColors.grey600),
                          ),
                        ),
                        Text('Remember me', style: TextStyle(fontSize: 14.w, color: Colors.grey)),
                      ],
                    ),
                    16.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        context.router.pushNamed('/forgot-password');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.w,
                          color: AppColors.lightBlue,
                        ),
                      ),
                    ),
                  ]),
                  CustomButton(
                    text: tr("Log In"),
                    onPressed: _onLoginPressed,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.lightGray, thickness: 1)),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('OR',
                              style:
                                  TextStyle(color: AppColors.gray, fontWeight: FontWeight.w600))),
                      Expanded(child: Divider(color: AppColors.lightGray, thickness: 1)),
                    ],
                  ),
                  AnotherLoginButton(imagePath: AppImages.facebook, text: 'Continue with Facebook'),
                  AnotherLoginButton(imagePath: AppImages.google, text: 'Continue with Google'),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.router.pushNamed('/register');
                      },
                      child: RichText(
                          text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(fontSize: 14.w, color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.w,
                              color: AppColors.lightBlue,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
