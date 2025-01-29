import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        showCloseIcon: true,
        closeIconColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        margin: const EdgeInsets.all(4),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Text(textDirection: TextDirection.rtl, message)));
  }
}
