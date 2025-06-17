import 'package:auvnet_internship_task/Features/home/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'widgets/resturant_sectioin.dart';
import 'widgets/services_section.dart';
import 'widgets/shourtcut_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ! AppBar
          CustomAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: Column(
              spacing: 16,
              children: [
                ServicesSection(),
                ShortCutSection(),
                ResturantSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
