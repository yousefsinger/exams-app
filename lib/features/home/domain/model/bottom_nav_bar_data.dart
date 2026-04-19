import 'package:flutter/material.dart';

import '../../../../core/values/app_strings.dart';

class BottomNavigationBarData {
  final IconData inActiveIcon, activeIcon;
  final String name;

  BottomNavigationBarData({
    required this.inActiveIcon,
    required this.activeIcon,
    required this.name,
  });
}

List<BottomNavigationBarData> get BottomNavigationBarItems => [
  BottomNavigationBarData(
    inActiveIcon: Icons.home,
    activeIcon: Icons.home,
    name: AppStrings.explore,
  ),
  BottomNavigationBarData(
    inActiveIcon: Icons.assignment_outlined,
    activeIcon: Icons.assignment_outlined,
    name: AppStrings.result,
  ),
  BottomNavigationBarData(
    inActiveIcon: Icons.person_outline,
    activeIcon: Icons.person_outline,
    name: AppStrings.profile,
  ),
];