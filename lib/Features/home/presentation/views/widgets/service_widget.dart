import 'package:auvnet_internship_task/Features/home/data/models/home_data_model.dart';
import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key, required this.model});
  final HomeDataModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 80,
          width: MediaQuery.sizeOf(context).width * 0.25,
          decoration: BoxDecoration(
            color: AppColor.containerColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Image.network(model.image)),
        ),
        Container(
          height: 24,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            model.subTitle,
            style: TextStyle(
              fontSize: 12,
              fontFamily: AppFonts.dmsans,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          model.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.dmsans,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
