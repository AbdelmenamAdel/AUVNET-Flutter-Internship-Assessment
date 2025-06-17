import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.primary, AppColor.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(48),
          bottomLeft: Radius.circular(48),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivering to',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.dmsans,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 7,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Al Satwa, 81A Street',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFonts.dmsans,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Hi hepa!',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: AppFonts.rubik,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Image.asset(
                    Assets.girl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
