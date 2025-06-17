import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'shortcut_widget.dart';
import 'dart:async';

class ShortCutSection extends StatefulWidget {
  const ShortCutSection({super.key});

  @override
  State<ShortCutSection> createState() => _ShortCutSectionState();
}

class _ShortCutSectionState extends State<ShortCutSection> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  late Timer _timer;
  final Duration autoScrollDuration = Duration(milliseconds: 200); // 0.1 sec

  final List<Map<String, String>> shortcuts = [
    {'image': Assets.shourtcut1, 'text': 'Past orders'},
    {'image': Assets.shourtcut2, 'text': 'Super Saver'},
    {'image': Assets.shourtcut3, 'text': 'Must-tries'},
    {'image': Assets.shourtcut4, 'text': 'Give Back'},
    {'image': Assets.shourtcut5, 'text': 'Best Sellers'},
  ];

  final List<String> images = [
    Assets.bannar,
    Assets.bannar,
    Assets.bannar,
    Assets.bannar,
    Assets.bannar,
    Assets.bannar,
  ];
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(autoScrollDuration, (_) {
      if (_pageController.hasClients) {
        final nextPage = (_pageController.page!.toInt() + 1) % images.length;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Shortcuts:',
          style: TextStyle(
            fontSize: 20,
            fontFamily: AppFonts.dmsans,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              shortcuts.length,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index != shortcuts.length - 1 ? 8 : 0,
                  ),
                  child: ShortCutWidget(
                    image: shortcuts[index]['image']!,
                    text: shortcuts[index]['text']!,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    // ! make a loop
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: images.length,
              effect: ScaleEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.deepPurple,
                dotColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
