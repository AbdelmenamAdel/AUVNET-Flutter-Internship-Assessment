import 'package:auvnet_internship_task/Features/home/data/models/home_data_model.dart';
import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class ResturantWidget extends StatelessWidget {
  const ResturantWidget({super.key, required this.restaurantsModels});
  final HomeDataModel restaurantsModels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Square container
        SizedBox(
          height: 70,
          child: AspectRatio(
            aspectRatio: 1,

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                  top: BorderSide(color: Colors.grey, width: 0.5),
                  right: BorderSide(color: Colors.grey, width: 0.5),
                  left: BorderSide(width: 0.5, color: Colors.grey),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1), // shadow color
                    blurRadius: 10, // soft blur

                    spreadRadius: 5, // how far the shadow spreads
                    offset: Offset(0, 4), // shadow position: x, y
                  ),
                ],
              ),
              child: Center(
                child: Image.network(
                  restaurantsModels.image,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        // Wrapping Text within container width
        Text(
          restaurantsModels.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontFamily: AppFonts.dmsans,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.watch_later_outlined,
              color: Colors.black.withOpacity(.6),
              size: 16,
            ),
            Text(
              restaurantsModels.subTitle,
              style: TextStyle(
                fontFamily: AppFonts.dmsans,
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Colors.black.withOpacity(.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
