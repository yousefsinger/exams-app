import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';
@injectable

class TimeOutDialog extends StatelessWidget {
  final VoidCallback onViewScore;

  const TimeOutDialog({super.key, required this.onViewScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.errorColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('⏳', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 12),
              Text(
                'Time out !!',
                style: AppStyles.medium20Black.copyWith(
                  color: AppColors.errorColor,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onViewScore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('View score', style: AppStyles.medium16White),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}