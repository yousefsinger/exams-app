import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../domain/model/exam.dart';

class ExamInstructionsScreen extends StatelessWidget {
  final Exam exam;
  final String subjectName;

  const ExamInstructionsScreen({
    super.key,
    required this.exam,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> instructions = [
      'Read each question carefully before selecting your final answer.',
      'Ensure you have a stable internet connection throughout the exam.',
      'The timer cannot be paused once the examination has started.',
      'Submit all answers before the time runs out to ensure they are saved.',
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Start exam',
          style: TextStyle(color: AppColors.blackColor, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/exam_icon.png',
                      width: 60.w,
                      height: 60.h,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subjectName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${exam.duration} Minutes',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      exam.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '|',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.darkGrayColor,
                        ),
                      ),
                    ),
                    Text(
                      '${exam.numberOfQuestions} Question',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.darkGrayColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.blue10Color,
            thickness: 0.5,
            height: 0.5,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                ...instructions.map(
                  (instruction) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            instruction,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.blackColor,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 48.h),
                CustomElevatedButton(
                  text: 'Start',
                  onPressed: () {},
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
