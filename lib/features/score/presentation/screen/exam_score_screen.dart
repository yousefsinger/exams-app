// lib/features/score/presentation/screen/exam_score_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_styles.dart';
import 'package:exam_app/core/values/app_routes.dart';
import 'package:exam_app/features/home/examscreen/domain/entities/exam_questions_entity.dart';
import 'package:injectable/injectable.dart';

// ─────────────────────────────────────────────
// ARGS
@injectable
// ─────────────────────────────────────────────

class ExamScoreArgs {
  final List<ExamQuestionEntity> questions;
  final Map<String, List<String>> answers;

  const ExamScoreArgs({
    required this.questions,
    required this.answers,
  });

  int get correct => questions.where((q) {
    final selected = answers[q.id] ?? [];
    final correctIds = q.correctAnswerIds;
    return selected.length == correctIds.length &&
        selected.every(correctIds.contains);
  }).length;

  int get incorrect => questions.length - correct;

  double get percentage =>
      questions.isEmpty ? 0 : correct / questions.length;
}

// ─────────────────────────────────────────────
// SCREEN
// ─────────────────────────────────────────────

class ExamScoreScreen extends StatelessWidget {
  final ExamScoreArgs args;

  const ExamScoreScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Exam score', style: AppStyles.medium18Black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your score',
              style: AppStyles.medium16PrimaryColor.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Circular Score ──
                SizedBox(
                  width: 120.w,
                  height: 120.w,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: args.percentage,
                        strokeWidth: 9,
                        backgroundColor: AppColors.errorColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primaryColor,
                        ),
                        strokeCap: StrokeCap.round,
                      ),
                      Center(
                        child: Text(
                          '${(args.percentage * 100).toInt()}%',
                          style: AppStyles.medium18Black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 40.w),
                // ── Correct / Incorrect ──
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ScoreRow(
                      label: 'Correct',
                      count: args.correct,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(height: 20.h),
                    _ScoreRow(
                      label: 'Incorrect',
                      count: args.incorrect,
                      color: AppColors.errorColor,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            // ── Show Results Button ──
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                onPressed: () {
                  // TODO: navigate to detailed results screen
                },
                child: Text(
                  'Show results',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // ── Start Again Button ──
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.primaryColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(AppRoutes.home),
                  );
                },
                child: Text(
                  'Start again',
                  style: AppStyles.medium16PrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SCORE ROW WIDGET
// ─────────────────────────────────────────────

class _ScoreRow extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _ScoreRow({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(width: 16.w),
        Container(
          width: 34.w,
          height: 34.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
          ),
          child: Center(
            child: Text(
              '$count',
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// TODO Implement this library.