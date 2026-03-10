import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isValid;
  final bool transparent;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isValid = true,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      child: ElevatedButton(
        onPressed: isValid ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (transparent) return AppColors.transparentColor;

            if (states.contains(WidgetState.disabled)) {
              return AppColors.grayColor;
            }

            return AppColors.primaryColor;
          }),
        ),
        child: Text(text, style: AppStyles.medium16White),
      ),
    );
  }
}
