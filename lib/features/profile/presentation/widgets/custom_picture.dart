import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';

class CustomPicture extends StatelessWidget {
  const CustomPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.grayColor,
      child: Icon(
        Icons.person,
        size: 50,
        color: AppColors.primaryColor,
      ),
    );
  }
}
