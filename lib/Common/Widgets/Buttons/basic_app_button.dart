import 'package:flutter/material.dart';

///Import Package
/// import 'package:spotify_demo/Core/Configurations/Themes/App_Colors.dart';

class AppButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const AppButtons(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 80),

          /// Style Defined in AppTheme.dart
          /// backgroundColor: AppColors.primary,
          /// shape: RoundedRectangleBorder(
          /// borderRadius: BorderRadius.circular(30),
          /// ),
        ),
        onPressed: onPressed,
        child: Text(
          title,

          /// Style Defined in AppTheme.dart
          /// style: const TextStyle(
          /// fontWeight: FontWeight.bold,
          /// fontSize: 18,
          /// color: Colors.white,
          /// ),
        ));
  }
}
