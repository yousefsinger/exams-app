import 'package:exam_app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../view_model/bloc/exams_events.dart';
import '../view_model/bloc/exams_states.dart';
import '../view_model/bloc/exams_view_model.dart';
import '../widgets/exam_card.dart';

class ExamsScreen extends StatelessWidget {
  final String subjectId;
  final String subjectName;

  const ExamsScreen({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ExamsViewModel>()..doIntent(GetExamsBySubjectEvent(subjectId)),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            subjectName,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<ExamsViewModel, ExamsStates>(
            builder: (context, state) {
              if (state.examsListState?.isLoading == true) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.examsListState?.errorMessage != null) {
                return Center(
                  child: Text(
                    state.examsListState!.errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              }

              final exams = state.examsListState?.data ?? [];

              if (exams.isEmpty) {
                return const Center(
                    child: Text('No exams available for this subject.'));
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 16),
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  return ExamCard(
                    exam: exams[index],
                    subjectName: subjectName,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
