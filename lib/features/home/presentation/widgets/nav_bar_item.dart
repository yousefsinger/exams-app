import 'package:exam_app/core/values/app_colors.dart'  ;
import 'package:exam_app/core/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.icon,
    required this.name,
    required this.isActive,
    this.onTap,
  });

  final IconData icon;
  final String name;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 60.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.boxNavBarColor
                  : AppColors.transparentColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              icon,
              color: isActive ? AppColors.primaryColor : AppColors.grayColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            name,
            style: AppStyles.medium20Primary.copyWith(
              fontSize: 12.sp,
              color: isActive ? AppColors.primaryColor : AppColors.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
