import 'package:auvnet_internship_task/Features/home/data/models/home_data_model.dart';
import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import 'resturant_widget.dart';

class ResturantSection extends StatelessWidget {
  const ResturantSection({super.key, required this.restaurantsModels});
  final List<HomeDataModel> restaurantsModels;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular restaurants nearby:',
          style: TextStyle(
            fontSize: 16,
            fontFamily: AppFonts.dmsans,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 130,
              child: Row(
                children: List.generate(
                  restaurantsModels.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index != restaurantsModels.length - 1 ? 8 : 0,
                      ),
                      child: ResturantWidget(
                        restaurantsModels: restaurantsModels[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
