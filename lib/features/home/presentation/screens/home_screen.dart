import 'package:exam_app/core/values/app_colors.dart';
import 'package:exam_app/features/home/presentation/widgets/Explore_screen.dart';
import 'package:exam_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:exam_app/features/home/profile_screen.dart'  ;
import 'package:exam_app/features/home/result_screen.dart'  ;
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    ExploreScreen(),
    ResultScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
