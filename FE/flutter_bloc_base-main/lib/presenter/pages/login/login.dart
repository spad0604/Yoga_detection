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
import 'package:flutter_starter/data/states/auth/auth_event.dart';
import 'package:flutter_starter/presenter/pages/login/login_bloc.dart';
import 'package:flutter_starter/presenter/pages/login/login_event.dart';
import 'package:flutter_starter/presenter/pages/login/login_selector.dart';
import 'package:flutter_starter/presenter/pages/login/login_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
// ...existing code...
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';
import 'package:flutter_starter/presenter/widget/social_login_button.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';
import 'package:toastification/toastification.dart';
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
    EasyLoading.dismiss();
    toastification.show(
      autoCloseDuration: Duration(seconds: 5),
      context: context,
      type: ToastificationType.success,
      title: Text(tr('Errors.SUCCESS', args: [], namedArgs: {}),
          maxLines: 2, overflow: TextOverflow.ellipsis),
    );
    if (state.account != null) {
      context.read<AuthBloc>().add(AuthLoggedIn(state.account!));
    }

    context.router.replace(HomeRoute());
  }

  void _loading(BuildContext context, LoginState state) {
    EasyLoading.show(status: 'loading...');
  }

  void _onError(BuildContext context, LoginState state) {
    EasyLoading.dismiss();
    final raw = state.error?.message;
    if (raw == null) return;

    final display = raw.startsWith('Errors.') ? tr(raw) : raw.toString();

    toastification.show(
      autoCloseDuration: Duration(seconds: 1),
      context: context,
      type: ToastificationType.error,
      title: Text(display, maxLines: 2, overflow: TextOverflow.ellipsis),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocListener(
      listeners: [
        LoginSuccessListener(listener: _onSuccess),
        LoginFailureListener(listener: _onError),
        LoginLoadingListener(listener: _loading),
      ],
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryPurpleLight.withOpacity(0.3),
                AppColors.secondaryTealLight.withOpacity(0.2),
                AppColors.white,
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryPurple.withOpacity(0.1),
                          blurRadius: 40,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Logo with subtle animation effect
                        Hero(
                          tag: 'app_logo',
                          child: Container(
                            width: 112,
                            height: 112,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: AppColors.gradientPurple,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryPurple.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Center(
                              child: ClipOval(
                                child: Image.asset(
                                  AppImages.logo,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Title with gradient
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: AppColors.gradientPurple,
                          ).createShader(bounds),
                          child: const Text(
                            'Yoga Detection',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Welcome back! Please login to your account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Email field
                        BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                          final emailError = state.emailError;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                controller: _usernameController,
                                hintText: 'Enter your email',
                                onChanged: (v) => _bloc.add(LoginEmailChanged(v)),
                                errorText: emailError,
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                          );
                        }),
                        const SizedBox(height: 20),

                        // Password field
                        BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                          final passwordError = state.passwordError;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                isPassword: _isObscure,
                                controller: _passwordController,
                                hintText: 'Enter your password',
                                onChanged: (v) => _bloc.add(LoginPasswordChanged(v)),
                                errorText: passwordError,
                                suffixIcon: _isObscure ? AppImages.ic_eye_off : AppImages.ic_eye_on,
                                onTapSuffix: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ],
                          );
                        }),
                        const SizedBox(height: 16),

                        // Remember me & Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    side: const BorderSide(color: AppColors.border, width: 1.5),
                                    activeColor: AppColors.primaryPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => context.router.pushNamed('/forgot-password'),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),

                        // Login button
                        CustomButton(
                          text: 'Login',
                          onPressed: _onLoginPressed,
                          icon: Icons.login_rounded,
                        ),
                        const SizedBox(height: 24),

                        // Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: AppColors.border, thickness: 1)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: AppColors.border, thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Social login buttons
                        SocialLoginButton(
                          imagePath: AppImages.facebook,
                          text: 'Continue with Facebook',
                        ),
                        const SizedBox(height: 12),
                        SocialLoginButton(
                          imagePath: AppImages.google,
                          text: 'Continue with Google',
                        ),
                        const SizedBox(height: 24),

                        // Sign up link
                        Center(
                          child: GestureDetector(
                            onTap: () => context.router.pushNamed('/register'),
                            child: RichText(
                              text: TextSpan(
                                text: 'Don\'t have an account? ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: AppColors.primaryPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
