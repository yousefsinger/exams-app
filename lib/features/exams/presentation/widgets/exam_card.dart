import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes.dart';
import 'package:flutter/material.dart';

import '../../domain/model/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final String subjectName;

  const ExamCard({
    super.key,
    required this.exam,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.examInstructions,
          arguments: {
            'exam': exam,
            'subjectName': subjectName,
          },
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/exam_icon.png',
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          exam.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${exam.duration} Minutes',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${exam.numberOfQuestions} Question',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGrayColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'From: 1.00  To: 6.00',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
