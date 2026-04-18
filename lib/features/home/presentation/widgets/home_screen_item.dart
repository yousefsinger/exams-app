import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';
import '../../../../core/values/app_routes.dart';

class HomeScreenItem extends StatelessWidget {
  const HomeScreenItem({
    super.key,
    required this.iconPath,
    required this.name,
    required this.subjectId,
  });

  final String name;
  final String iconPath;
  final String subjectId;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: SizedBox(
        height: 90.h,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.exams, arguments: {
              'subjectId': subjectId,
              'subjectName': name,
            });
          },
          child: Row(
            children: [
              SizedBox(width: 20.w),
              Image.network(
                iconPath,
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  name,
                  style: AppStyles.regular16Black,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
