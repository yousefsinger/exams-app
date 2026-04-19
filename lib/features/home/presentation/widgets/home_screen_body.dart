import 'package:exam_app/core/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_styles.dart';
import '../view_model/bloc/home_events.dart';
import '../view_model/bloc/home_states.dart';
import '../view_model/bloc/home_view_model.dart';
import 'custom_search.dart';
import 'list_view_item.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
            CustomSearch(
              onChanged: viewModel.onSearchChanged,
            ),
            SizedBox(height: 40.h),
            Text(AppStrings.browseBySubjectText, style: AppStyles.medium18Black),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocBuilder<HomeViewModel, HomeStates>(
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
                    return ListViewItems(subjects: subjects);
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