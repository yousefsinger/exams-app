// lib/features/home/examscreen/presentation/widgets/exam_bottom_buttons.dart

import 'package:flutter/material.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';

class ExamBottomButtons extends StatelessWidget {
  final bool isLastQuestion;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onFinish;

  const ExamBottomButtons({
    super.key,
    required this.isLastQuestion,
    required this.onBack,
    required this.onNext,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: AppColors.primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Back', style: AppStyles.medium16PrimaryColor),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(

              onPressed: isLastQuestion ? onFinish : onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                isLastQuestion ? 'Finish' : 'Next',
                style: AppStyles.medium16White,
              ),
            ),
          ),
        ],
      ),
    );
  }
}