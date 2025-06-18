import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:auvnet_internship_task/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.text, this.onPressed});
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50), // Full width button
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: text != null
          ? Text(
              text!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: AppFonts.dmsans,
              ),
            )
          : const CircularProgressIndicator(color: Colors.white),
    );
  }
}
