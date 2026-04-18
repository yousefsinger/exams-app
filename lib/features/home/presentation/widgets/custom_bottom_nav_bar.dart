import 'package:flutter/material.dart';

import '../../../../../core/values/app_colors.dart';
import '../../domain/model/bottom_nav_bar_data.dart';
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
        children: BottomNavigationBarItems.asMap().entries.map((e) {
          final index = e.key;
          final item = e.value;

          return Expanded(
            child: NavBarItem(
              icon: currentIndex == index ? item.activeIcon : item.inActiveIcon,
              name: item.name,
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
