
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';
@injectable

class ExamTimerWidget extends StatelessWidget {
  final int remainingSeconds;
  final int totalSeconds;

  const ExamTimerWidget({
    super.key,
    required this.remainingSeconds,
    required this.totalSeconds,
  });

  Color get _color {
    if (remainingSeconds <= totalSeconds / 2) return AppColors.errorColor;
    return const Color(0xFF43A047); // green
  }

  String get _formatted {
    final m = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (remainingSeconds % 60).toString().padLeft(2, '0');
    return '$m.$s';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.alarm, size: 20, color: _color),
        const SizedBox(width: 4),
        Text(
          _formatted,
          style: AppStyles.medium16PrimaryColor.copyWith(color: _color),
        ),
      ],
    );
  }
}
