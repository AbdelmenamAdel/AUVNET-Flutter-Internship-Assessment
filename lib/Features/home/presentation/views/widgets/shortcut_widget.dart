import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShortCutWidget extends StatelessWidget {
  const ShortCutWidget({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Square container
        SizedBox(
          height: 60,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0XFFFFEEE6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SvgPicture.asset(image, width: 32, height: 32),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        // Wrapping Text within container width
        Text(
          text,
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
      ],
    );
  }
}
