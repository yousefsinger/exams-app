import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/di/di.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_routes.dart';
import '../../../../../core/values/app_styles.dart';
import '../../domain/entities/exam_questions_entity.dart';
import '../cubit/exam_cubit.dart';
import '../cubit/exam_state.dart';
import '../widgets/answer_option_widget.dart';
import '../widgets/exam_bottom_buttons.dart';
import '../widgets/exam_progress_widget.dart';
import '../widgets/exam_timer_widget.dart';
import '../widgets/time_out_dialog.dart';
import 'package:exam_app/features/score/presentation/screen/exam_score_screen.dart';

// ─────────────────────────────────────────────
// ARGS
// ─────────────────────────────────────────────

class ExamArgs {
  final String examId;
  final String examTitle;
  final int durationInSeconds;

  const ExamArgs({
    required this.examId,
    required this.examTitle,
    required this.durationInSeconds,
  });
}

// ─────────────────────────────────────────────
// SCREEN
// ─────────────────────────────────────────────

class ExamScreen extends StatefulWidget {
  final ExamArgs args;

  const ExamScreen({super.key, required this.args});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late final ExamCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<ExamCubit>()
      ..loadExam(
        examId: widget.args.examId,
        durationInSeconds: widget.args.durationInSeconds,
      );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  void _navigateToScore(ExamFinished state) {
    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.examScore,
      arguments: ExamScoreArgs(
        questions: state.questions,
        answers: state.answers,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<ExamCubit, ExamState>(
        listener: (context, state) {
          if (state is ExamFinished) {
            _navigateToScore(state);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: _buildAppBar(context, state),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  // ── AppBar ──────────────────────────────────

  PreferredSizeWidget _buildAppBar(BuildContext context, ExamState state) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
        onPressed: () {
          if (Navigator.canPop(context)) Navigator.pop(context);
        },
      ),
      title: Text(widget.args.examTitle, style: AppStyles.medium18Black),
      actions: [
        if (state is ExamLoaded)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: ExamTimerWidget(
              remainingSeconds: state.remainingSeconds,
              totalSeconds: state.totalSeconds,
            ),
          ),
        if (state is ExamTimeOut)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: ExamTimerWidget(
              remainingSeconds: 0,
              totalSeconds: state.totalSeconds,
            ),
          ),
      ],
    );
  }

  // ── Body ────────────────────────────────────

  Widget _buildBody(BuildContext context, ExamState state) {
    if (state is ExamLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    if (state is ExamError) {
      return Center(
        child: Text(state.message, style: AppStyles.errorText),
      );
    }

    if (state is ExamLoaded) {
      return _ActiveExamBody(state: state);
    }

    if (state is ExamTimeOut) {
      return Stack(
        children: [
          _ActiveExamBody(
            state: ExamLoaded(
              questions: state.questions,
              currentIndex: state.currentIndex,
              remainingSeconds: 0,
              totalSeconds: state.totalSeconds,
              answers: state.answers,
            ),
          ),
          TimeOutDialog(
            onViewScore: () {
              context.read<ExamCubit>().submitAfterTimeout();
            },
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}

// ─────────────────────────────────────────────
// ACTIVE EXAM BODY
// ─────────────────────────────────────────────

class _ActiveExamBody extends StatelessWidget {
  final ExamLoaded state;

  const _ActiveExamBody({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExamProgressWidget(
          currentIndex: state.currentIndex,
          totalQuestions: state.questions.length,
        ),
        Expanded(
          child: _QuestionSection(state: state),
        ),
        ExamBottomButtons(
          isLastQuestion: state.isLastQuestion,
          onBack: () => context.read<ExamCubit>().previousQuestion(),
          onNext: () => context.read<ExamCubit>().nextQuestion(),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// QUESTION SECTION
// ─────────────────────────────────────────────

class _QuestionSection extends StatelessWidget {
  final ExamLoaded state;

  const _QuestionSection({required this.state});

  @override
  Widget build(BuildContext context) {
    final question = state.currentQuestion;
    final selectedAnswers = state.answersFor(question.id);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      children: [
        Text(
          question.text,
          style: AppStyles.medium16PrimaryColor.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(height: 16.h),
        ...question.options.map(
              (option) => AnswerOptionWidget(
            option: option,
            questionType: question.type,
            isSelected: selectedAnswers.contains(option.id),
            onTap: () {
              final cubit = context.read<ExamCubit>();
              question.type == QuestionType.singleChoice
                  ? cubit.selectSingleAnswer(question.id, option.id)
                  : cubit.toggleMultiAnswer(question.id, option.id);
            },
          ),
        ),
      ],
    );
  }
}