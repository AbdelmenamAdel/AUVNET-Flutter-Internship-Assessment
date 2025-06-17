import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:flutter/material.dart';

import 'resturant_widget.dart';

class ResturantSection extends StatelessWidget {
  const ResturantSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List images = [
      {"image": Assets.beirut, "text": "Allo Beirut", "time": "32 mins"},
      {"image": Assets.laffah, "text": "Laffah", "time": "38 mins"},
      {
        "image": Assets.flafel,
        "text": "Falafil Al Rabiah Al khaldony",
        "time": "44 mins",
      },
      {"image": Assets.barbar, "text": "Barbar", "time": "34 mins"},
    ];
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
                  images.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index != images.length - 1 ? 8 : 0,
                      ),
                      child: ResturantWidget(
                        image: images[index]['image']!,
                        text: images[index]['text']!,
                        time: images[index]["time"]!,
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
