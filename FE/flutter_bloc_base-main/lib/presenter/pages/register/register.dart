import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/app.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/register/register_bloc.dart';
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
  final _fullNameController = TextEditingController();

  RegisterBloc get _bloc => context.read<RegisterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Create an account to continue!',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )
                  ],
                ),
                Image.asset(
                  AppImages.logo,
                  width: 106,
                  height: 96,
                )
              ],
            ),
            CustomTextField(
              controller: _fullNameController,
              hintText: 'Full Name',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _phoneNumberController,
              hintText: 'Phone Number',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _dateOfBirthController,
              hintText: 'Date of Birth',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirm Password',
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Register',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () {
                    context.router.popAndPush(LoginRoute());
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(color: AppColors.lightBlue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
