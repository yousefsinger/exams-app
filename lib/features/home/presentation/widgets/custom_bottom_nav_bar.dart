import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/core/values/app_strings.dart';
import 'package:flutter/material.dart';

import 'nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        icon: Icons.home_outlined,
        activeIcon: Icons.home_outlined,
        label: AppStrings.explore
      ),
      (
        icon: Icons.assignment_outlined,
        activeIcon: Icons.assignment_outlined,
        label: AppStrings.result
      ),
      (
        icon: Icons.person_outline,
        activeIcon: Icons.person_outline,
        label: AppStrings.profile
      ),
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.navBarColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: items.asMap().entries.map((e) {
          final index = e.key;
          final item = e.value;

          return Expanded(
            child: NavBarItem(
              icon: currentIndex == index ? item.activeIcon : item.icon,
              name: item.label,
              isActive: currentIndex == index,
              onTap: () {
                onTap(index);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
