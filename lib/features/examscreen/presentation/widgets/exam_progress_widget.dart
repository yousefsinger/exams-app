import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';
@injectable

class ExamProgressWidget extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const ExamProgressWidget({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: totalQuestions == 0
                ? 0
                : (currentIndex + 1) / totalQuestions,
            backgroundColor: AppColors.lightGrayColor,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            minHeight: 4,
            borderRadius: BorderRadius.circular(2),
          ),
          const SizedBox(height: 6),
          Text(
            'Question ${currentIndex + 1} of $totalQuestions',
            style: AppStyles.labelText12DarkGray,
          ),
        ],
      ),
    );
  }
}
