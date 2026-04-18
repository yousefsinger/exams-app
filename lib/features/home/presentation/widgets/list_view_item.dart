import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/subject.dart';
import 'home_screen_item.dart';

class ListViewItems extends StatelessWidget {
  ListViewItems({super.key, required this.subjects});

  final List<SubjectEntity> subjects;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: HomeScreenItem(
            iconPath: subjects[index].icon,
            name: subjects[index].name,
            subjectId: subjects[index].id,
          ),
        );
      },
    );
  }
}
