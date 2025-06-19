import 'package:auvnet_internship_task/Features/home/data/models/home_data_model.dart';
import 'package:auvnet_internship_task/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:auvnet_internship_task/Features/home/presentation/views/widgets/home_data.dart';
import 'package:auvnet_internship_task/core/database/remote/supabase_config.dart';
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
                ServicesSection(servicesModels: HomeData.services),
                ShortCutSection(),
                ResturantSection(restaurantsModels: HomeData.restaurants),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
