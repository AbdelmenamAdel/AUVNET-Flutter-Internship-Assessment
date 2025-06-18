import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
