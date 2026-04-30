import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SizedBox(
        height: 90.h,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            debugPrint('Item tapped: $name');
          },
          child: Row(
            children: [
              SizedBox(width: 20.w),
              SizedBox(
                width: 50.w,
                height: 50.h,
                child: Image.network(
                  iconPath,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.error,
                      size: 30,
                      color: AppColors.grayColor,
                    );
                  },
                ),
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
