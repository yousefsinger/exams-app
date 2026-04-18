import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';

class CustomSearch extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomSearch({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'search',
        hintStyle: AppStyles.medium14LightGray,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.grayColor,
          size: 20.sp,
        ),
        contentPadding: EdgeInsets.all(16.r),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: AppColors.darkGrayColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: AppColors.darkGrayColor, width: 2),
        ),
      ),
    );
  }
}
