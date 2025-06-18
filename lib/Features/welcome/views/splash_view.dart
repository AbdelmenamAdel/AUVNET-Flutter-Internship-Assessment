import 'dart:developer';

import 'package:auvnet_internship_task/Features/auth/presentation/views/login_view.dart';
import 'package:auvnet_internship_task/Features/main/main_view.dart';
import 'package:auvnet_internship_task/Features/welcome/views/on_boarding.dart';
import 'package:auvnet_internship_task/core/database/local/cache_helper.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate();
    });
  }

  void _navigate() {
    bool isAuthenticated =
        CacheHelper.sharedPreferences.getBool("isAuthenticated") ?? false;
    bool isOnboarding =
        CacheHelper.sharedPreferences.getBool("onboarding") ?? false;
    log("isAuthenticated: $isAuthenticated");
    log("isOnboarding: $isOnboarding");
    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainView()),
      );
      return;
    }
    if (isOnboarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
      return;
    }
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(Assets.nawel, width: 336)),
    );
  }
}
