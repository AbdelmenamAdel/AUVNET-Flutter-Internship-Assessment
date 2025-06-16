import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../widgets/on_boarding_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //! Top gradient
          Positioned(
            top: -20,
            left: -104,
            child: Container(
              alignment: Alignment.topLeft,
              height: 342,
              width: 342,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.secondary],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(500),
              ),
            ),
          ),

          //! Bottom glow
          Positioned(
            bottom: -40,
            right: -50,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Container(
                height: 216,
                width: 216,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0EBE7E).withOpacity(0.2),
                      blurRadius: 60,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ! Main content
          const OnBoardingContent(),
        ],
      ),
    );
  }
}
