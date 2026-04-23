import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/app_styles.dart';
import 'package:exam_app/features/home/presentation/view_model/bloc/explore_events.dart';
import 'package:exam_app/features/home/presentation/view_model/bloc/home_states.dart';
import 'package:exam_app/features/home/presentation/view_model/bloc/home_view_model.dart';
import 'package:exam_app/features/home/presentation/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_search_field.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = context.read<HomeViewModel>();
    viewModel.doIntent(GetAllSubjectsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Text(AppStrings.surveyText, style: AppStyles.medium20Primary),
            SizedBox(height: 16.h),
            CustomSearchField(
              onChanged: (query) {
                context.read<HomeViewModel>().doIntent(
                  SearchSubjectsEvent(query),
                );
              }
            ),
            SizedBox(height: 40.h),
            Text(AppStrings.browseBySubjectText, style: AppStyles.medium18Black),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocBuilder<HomeViewModel, ExploreStates>(
                buildWhen: (prev, curr) =>
                    prev.getAllSubjectStats != curr.getAllSubjectStats,
                builder: (context, state) {
                  final subjectState = state.getAllSubjectStats;
                  if (subjectState == null || subjectState.isLoading == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (subjectState.errorMessage?.isNotEmpty == true) {
                    return Center(
                      child: Text(
                        subjectState.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  final subjects = subjectState.data;

                  if (subjects != null && subjects.isNotEmpty) {
                    return  ListView.builder(
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: SubjectCard(
                            iconPath: subjects[index].icon,
                            name: subjects[index].name,
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text(AppStrings.noSubjectsAvailableText),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
