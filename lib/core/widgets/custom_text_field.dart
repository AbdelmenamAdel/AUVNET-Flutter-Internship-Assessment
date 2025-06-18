import 'package:auvnet_internship_task/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.validator,
  });
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.containerColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon, color: Colors.grey),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
