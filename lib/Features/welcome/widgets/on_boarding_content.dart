import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:auvnet_internship_task/Features/auth/login_view.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:auvnet_internship_task/core/widgets/custom_elevated_button.dart';

import '../model/on_boarding_model.dart';

class OnBoardingContent extends StatefulWidget {
  const OnBoardingContent({super.key});

  @override
  State<OnBoardingContent> createState() => _OnBoardingContentState();
}

class _OnBoardingContentState extends State<OnBoardingContent> {
  final PageController _pageController = PageController();
  final List<OnBoardingModel> _onBoardingScreens = [
    OnBoardingModel(
      title: "all-in-one delivery",
      description:
          "Order groceries, medicines, and meals delivered straight to your door",
    ),
    OnBoardingModel(
      title: "User-to-User Delivery",
      description: "Send or receive items from other users quickly and easily",
    ),
    OnBoardingModel(
      title: "Sales & Discounts",
      description: "Discover exclusive sales and deals every day",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return
    //! Main content
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 70),

          // Image
          Image.asset(Assets.nawel, width: 336),

          const Spacer(),

          //! PageView for title + subtitle
          SizedBox(
            height: 100,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onBoardingScreens.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      _onBoardingScreens[index].title,
                      style: TextStyle(
                        fontFamily: AppFonts.rubik,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _onBoardingScreens[index].description,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.rubik,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),

          const Spacer(),

          // Get Started button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomElevatedButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Page control text or indicator
          GestureDetector(
            onTap: () {
              if (_pageController.page != null &&
                  _pageController.page! < _onBoardingScreens.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                // Navigate to the next screen or perform an action
              }
            },
            child: Text('next', style: TextStyle(color: Colors.grey)),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
