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
        appBar: AppBar(),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Register',
                              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Text('Create an account to continue!',
                              style: TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                      Image.asset(AppImages.logo, width: 106, height: 96),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Name row
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                            controller: _firstNameController,
                            hintText: 'First name',
                            onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null))),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                            controller: _lastNameController,
                            hintText: 'Last name',
                            onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null))),
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
                    );
                  }),

                  const SizedBox(height: 12),

                  // Phone
                  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                    return CustomTextField(
                      controller: _phoneNumberController,
                      hintText: 'Phone Number',
                      onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                      errorText: state.phoneError,
                    );
                  }),

                  const SizedBox(height: 12),

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
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Password
                  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                    return CustomTextField(
                      isPassword: true,
                      controller: _passwordController,
                      hintText: 'Password',
                      onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                      errorText: state.passwordError,
                    );
                  }),

                  const SizedBox(height: 12),

                  // Confirm password
                  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
                    return CustomTextField(
                      isPassword: true,
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      onChanged: (v) => _bloc.add(const RegisterErrorOccurred(null)),
                      errorText: state.confirmPasswordError,
                    );
                  }),

                  const SizedBox(height: 20),

                  // Register button
                  CustomButton(
                    text: 'Register',
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

                  const SizedBox(height: 16),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
                      GestureDetector(
                        onTap: () => context.router.popAndPush(LoginRoute()),
                        child: const Text('Log in',
                            style:
                                TextStyle(color: AppColors.lightBlue, fontWeight: FontWeight.bold)),
                      ),
                    ],
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
