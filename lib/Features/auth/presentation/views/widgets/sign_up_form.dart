import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_bloc.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_event.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/views/login_view.dart';
import 'package:auvnet_internship_task/core/widgets/custom_snack.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:auvnet_internship_task/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_internship_task/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  void dispose() {
    _formKey.currentState?.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          Image.asset(
            Assets.nawel, // Replace with your image path
            width: 336,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 8,
              children: [
                // Email Field
                CustomTextField(
                  hintText: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: fullNameController,
                  icon: Icons.person,
                ),
                CustomTextField(
                  hintText: 'mail',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailPattern = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailPattern.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  icon: Icons.mail_outline,
                ),
                CustomTextField(
                  hintText: 'password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  controller: passwordController,
                  icon: Icons.lock_outline,
                ),
                CustomTextField(
                  hintText: 'confirm password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  icon: Icons.lock_outline,
                ),
              ],
            ),
          ),
          CustomElevatedButton(text: 'Sign Up', onPressed: _signUpValidator),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
            child: Text(
              'Have an account',
              style: TextStyle(
                color: AppColor.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void Function()? _signUpValidator() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final fullName = fullNameController.text.trim();
      context.read<AuthBloc>().add(
        AuthSignUpRequested(email, password, fullName),
      );
    } else {
      // If the form is invalid, show an error message
      CustomSnackBar.show(
        context,
        'Please fill in all fields correctly',
        isError: true,
      );
    }
    return null;
  }
}
