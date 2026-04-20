import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class CustomTextLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomTextLink({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppColors.primaryColor,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: TextDecoration.underline,
          decorationColor: color,
        ),
      ),
    );
  }
}
