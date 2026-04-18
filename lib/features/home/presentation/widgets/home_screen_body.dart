import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/values/app_styles.dart';
import '../../domain/model/subject.dart';
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
  @override
  void initState() {
    super.initState();

    context.read<HomeViewModel>().doIntent(GetAllSubjectsEvent());
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
            Text('Survey', style: AppStyles.medium20Primary),
            SizedBox(height: 16.h),
            CustomSearch(
              onChanged: (value) {
                context.read<HomeViewModel>().onSearchChanged(value);
              },
            ),
            SizedBox(height: 40.h),
            Text('Browse by subject', style: AppStyles.medium18Black),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocBuilder<HomeViewModel, HomeStates>(
                builder: (context, state) {
                  if (state.getAllSubjectStats?.isLoading == true) {
                    return Skeletonizer(
                      child: ListViewItems(
                        subjects: List.generate(
                          6,
                          (index) => SubjectEntity(
                            id: index.toString(),
                            name: 'Loading...',
                            icon: '',
                          ),
                        ),
                      ),
                    );
                  } else if (state.getAllSubjectStats?.errorMessage != null &&
                      state.getAllSubjectStats!.errorMessage!.isNotEmpty) {
                    return Center(
                      child: Text(
                        state.getAllSubjectStats!.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state.getAllSubjectStats?.data != null &&
                      state.getAllSubjectStats!.data!.isNotEmpty) {
                    return ListViewItems(
                      subjects: state.getAllSubjectStats!.data!,
                    );
                  } else {
                    return const Center(
                      child: Text("No subjects available"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
