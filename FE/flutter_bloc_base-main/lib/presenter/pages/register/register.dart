import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/app.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/register/register_bloc.dart';
import 'package:flutter_starter/presenter/pages/register/register_event.dart';
import 'package:flutter_starter/presenter/pages/register/register_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';
import 'package:flutter_starter/presenter/widget/custom_text_field.dart';

// TODO: Add the page to the router
@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (ctx) => provider.get<RegisterBloc>(),
      child: this,
    );
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  RegisterBloc get _bloc => context.read<RegisterBloc>();

  void _onSuccess(BuildContext context, RegisterState state) {
    context.router.replaceAll([const CameraDetectionRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          _onSuccess(context, state);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                AppColors.primaryPurpleLight.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header with gradient
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColors.gradientPurple,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryPurple.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [Colors.white, Colors.white.withOpacity(0.9)],
                                ).createShader(bounds),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Create an account to continue!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset(
                            AppImages.logo,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Name row
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _firstNameController,
                          hintText: 'First name',
                          onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                          suffixIcon: AppImages.ic_indentity,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                          controller: _lastNameController,
                          hintText: 'Last name',
                          onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                          suffixIcon: AppImages.ic_indentity,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Email
                  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                    return CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                      errorText: state.emailError,
                      suffixIcon: AppImages.ic_mail,
                    );
                  }),

                  const SizedBox(height: 16),

                  // Phone
                  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                    return CustomTextField(
                      controller: _phoneNumberController,
                      hintText: 'Phone Number',
                      onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                      errorText: state.phoneError,
                      suffixIcon: AppImages.ic_phone,
                    );
                  }),

                  const SizedBox(height: 16),

                  // Birth date (picker)
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        final formatted =
                            '${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
                        _dateOfBirthController.text = formatted;
                        setState(() {});
                        _bloc.add(const RegisterErrorOccurred(null));
                      }
                    },
                    child: AbsorbPointer(
                      child: BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                        return CustomTextField(
                          controller: _dateOfBirthController,
                          hintText: 'Date of Birth (yyyy-MM-dd)',
                          onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                          errorText: state.birthDateError,
                          suffixIcon: AppImages.ic_calendar,
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Password
                  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                    return CustomTextField(
                      isPassword: !_isPasswordVisible,
                      controller: _passwordController,
                      hintText: 'Password',
                      onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                      errorText: state.passwordError,
                      suffixIcon: _isPasswordVisible ? AppImages.ic_eye_on : AppImages.ic_eye_off,
                      onTapSuffix: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    );
                  }),

                  const SizedBox(height: 16),

                  // Confirm password
                  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                    return CustomTextField(
                      isPassword: !_isConfirmPasswordVisible,
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                      errorText: state.confirmPasswordError,
                      suffixIcon:
                          _isConfirmPasswordVisible ? AppImages.ic_eye_on : AppImages.ic_eye_off,
                      onTapSuffix: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    );
                  }),

                  const SizedBox(height: 28),

                  // Register button
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: AppColors.gradientPurple,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryPurple.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: CustomButton(
                      text: 'Register',
                      textColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        final firstName = _firstNameController.text.trim();
                        final lastName = _lastNameController.text.trim();
                        final email = _emailController.text.trim();
                        final password = _passwordController.text;
                        final confirmPassword = _confirmPasswordController.text;
                        final phone = _phoneNumberController.text.trim();
                        final birthDate = _dateOfBirthController.text;

                        _bloc.add(RegisterStarted(
                          firstName: firstName,
                          lastName: lastName,
                          email: email,
                          password: password,
                          confirmPassword: confirmPassword,
                          phone: phone,
                          birthDate: birthDate,
                        ));
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Footer
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        GestureDetector(
                          onTap: () => context.router.popAndPush(LoginRoute()),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              color: AppColors.primaryPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
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
