import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';
import '../../domain/entities/exam_questions_entity.dart';
@injectable

class AnswerOptionWidget extends StatelessWidget {
  final AnswerOptionEntity option;
  final QuestionType questionType;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOptionWidget({
    super.key,
    required this.option,
    required this.questionType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.1)
              : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: AppColors.primaryColor, width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            questionType == QuestionType.singleChoice
                ? _RadioIndicator(isSelected: isSelected)
                : _CheckboxIndicator(isSelected: isSelected),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                option.text,
                style: isSelected
                    ? AppStyles.medium16PrimaryColor.copyWith(fontSize: 14)
                    : AppStyles.regular14DarkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  final bool isSelected;

  const _RadioIndicator({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.darkGrayColor,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
        ),
      )
          : null,
    );
  }
}

class _CheckboxIndicator extends StatelessWidget {
  final bool isSelected;

  const _CheckboxIndicator({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.darkGrayColor,
          width: 2,
        ),
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
      ),
      child: isSelected
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : null,
    );
  }
}
