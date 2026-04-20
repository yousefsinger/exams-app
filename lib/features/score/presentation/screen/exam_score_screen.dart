// lib/features/score/presentation/screen/exam_score_screen.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_routes.dart';
import 'package:exam_app/core/values/app_styles.dart';
import 'package:exam_app/features/home/examscreen/domain/entities/exam_questions_entity.dart';
import 'package:exam_app/features/home/examscreen/presentation/screen/exam_screen.dart';
import 'package:injectable/injectable.dart';

// ─────────────────────────────────────────────
// ARGS
// ─────────────────────────────────────────────
@injectable
class ExamScoreArgs {
  final List<ExamQuestionEntity> questions;
  final Map<String, List<String>> answers;
  final ExamArgs examArgs;

  const ExamScoreArgs({
    required this.questions,
    required this.answers,
    required this.examArgs,
  });

  int get totalQuestions => questions.length;

  int get correctCount {
    int count = 0;
    for (final q in questions) {
      final given = answers[q.id] ?? [];
      final correct = q.correctAnswerIds;
      if (given.length == correct.length &&
          given.toSet().containsAll(correct)) {
        count++;
      }
    }
    return count;
  }

  int get wrongCount => totalQuestions - correctCount;

  double get percentage =>
      totalQuestions == 0 ? 0 : correctCount / totalQuestions;
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

      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor, size: 20),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AppRoutes.login),
        ),
        title: Text('Exam score', style: AppStyles.medium18Black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Your score', style: AppStyles.medium18Black),
            const SizedBox(height: 24),

            // ── Score section — no card, flat on background ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circular donut chart
                _CircularScoreChart(percentage: args.percentage),
                const SizedBox(width: 40),
                // Correct / Incorrect rows
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ScoreRow(
                        label: 'Correct',
                        count: args.correctCount,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 20),
                      _ScoreRow(
                        label: 'Incorrect',
                        count: args.wrongCount,
                        color: AppColors.errorColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Spacer(),

            // ── Buttons ─────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: navigate to results review screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: Text('Show results', style: AppStyles.medium16White),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamScreen(args: args.examArgs),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                  // ✅ Pill shape matching target
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Start again', style: AppStyles.medium16PrimaryColor),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CIRCULAR CHART
// ─────────────────────────────────────────────

class _CircularScoreChart extends StatelessWidget {
  final double percentage;

  const _CircularScoreChart({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(
        painter: _DonutPainter(percentage: percentage),
        child: Center(
          child: Text(
            '${(percentage * 100).round()}%',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  final double percentage;

  const _DonutPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    const strokeWidth = 12.0;
    const startAngle = -pi / 2; // top

    final incorrectPaint = Paint()
      ..color = AppColors.errorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final correctPaint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;


    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * pi,
      false,
      incorrectPaint,
    );


    final correctSweep = percentage * 2 * pi;
    if (correctSweep > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        correctSweep,
        false,
        correctPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_DonutPainter old) => old.percentage != percentage;
}

// ─────────────────────────────────────────────
// SCORE ROW
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
          ),
          child: Center(
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 14,
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