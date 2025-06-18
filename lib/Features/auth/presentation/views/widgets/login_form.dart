import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_bloc.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_event.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/views/sign_up_view.dart';
import 'package:auvnet_internship_task/core/widgets/custom_snack.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:auvnet_internship_task/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_internship_task/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

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
              ],
            ),
          ),
          CustomElevatedButton(text: 'Log in', onPressed: _loginValidator),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignUpView()),
              );
            },
            child: Text(
              'Create an account',
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

  void Function()? _loginValidator() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      context.read<AuthBloc>().add(AuthLoginRequested(email, password));
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
