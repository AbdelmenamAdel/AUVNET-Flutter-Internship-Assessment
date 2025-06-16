import 'package:auvnet_internship_task/Features/auth/sign_up_view.dart';
import 'package:auvnet_internship_task/Features/generated/app_images.dart';
import 'package:auvnet_internship_task/Features/home/home_view.dart';
import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:auvnet_internship_task/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_internship_task/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    CustomTextField(hintText: 'mail', icon: Icons.mail_outline),
                    CustomTextField(
                      hintText: 'password',
                      icon: Icons.lock_outline,
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                text: 'Login',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                },
              ),
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
        ),
      ),
    );
  }
}
