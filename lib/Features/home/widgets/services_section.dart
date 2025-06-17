import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'service_widget.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List services = [
      {'image': Assets.food, 'roundedText': 'Up to 50%', 'text': 'Food'},
      {
        'image': Assets.drinks,
        'roundedText': '20 mins',
        'text': 'Health & wellness',
      },
      {
        'image': Assets.groceries,
        'roundedText': '15 mins',
        'text': 'Groceries',
      },
    ];

    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services:',
          style: TextStyle(
            fontSize: 20,
            fontFamily: AppFonts.dmsans,
            fontWeight: FontWeight.bold,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            services.length,
            (index) => ServiceWidget(
              image: services[index]['image'],
              roundedText: services[index]['roundedText'],
              text: services[index]['text'],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // shadow color
                blurRadius: 10, // soft blur
                spreadRadius: 5, // how far the shadow spreads
                offset: Offset(0, 4), // shadow position: x, y
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(Assets.shourtcut2, width: 75, height: 60),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Got a code !',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.dmsans,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Add your code and save on your order',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.dmsans,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
