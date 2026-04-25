// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i264;

import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forget_password/api/api_client/forget_password_api_client.dart'
    as _i478;
import '../../features/auth/forget_password/api/data_sources/forget_password_data_source_impl.dart'
    as _i1058;
import '../../features/auth/forget_password/data/data_sources/forget_password_data_source_contract.dart'
    as _i236;
import '../../features/auth/forget_password/data/repository/forget_password_repo_impl.dart'
    as _i1026;
import '../../features/auth/forget_password/domain/repository/forget_password_repo_contract.dart'
    as _i649;
import '../../features/auth/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i913;
import '../../features/auth/forget_password/domain/use_cases/reset_password_use_case.dart'
    as _i22;
import '../../features/auth/forget_password/domain/use_cases/verify_reset_password_use_case.dart'
    as _i195;
import '../../features/auth/forget_password/presentation/view_model/bloc/forget_password_view_model.dart'
    as _i776;
import '../../features/auth/login/api/data_sources/login_data_source_impl.dart'
    as _i466;
import '../../features/auth/login/api/login_api_client/login_api_client.dart'
    as _i251;
import '../../features/auth/login/data/data_sources/login_data_source_contract.dart'
    as _i15;
import '../../features/auth/login/data/repository/login_repo_impl.dart'
    as _i321;
import '../../features/auth/login/domain/repository/login_repo_contract.dart'
    as _i359;
import '../../features/auth/login/domain/use_cases/login_use_case.dart' as _i50;
import '../../features/auth/login/presentation/view_model/bloc/login_view_model.dart'
    as _i947;
import '../../features/auth/signup/api/signup_api_client/signup_api_client.dart'
    as _i877;
import '../../features/auth/signup/data/data_sources/signup_data_source_impl.dart'
    as _i997;
import '../../features/auth/signup/data/repository/signup_repo_impl.dart'
    as _i858;
import '../../features/auth/signup/data/signup_data_source_contract.dart'
    as _i378;
import '../../features/auth/signup/domain/repository/signup_repo_contract.dart'
    as _i106;
import '../../features/auth/signup/domain/use_cases/signup_use_case.dart'
    as _i410;
import '../../features/auth/signup/presentation/cubit/signup_cubit.dart'
    as _i842;
import '../../features/exams/api/data_sources/exams_data_source_contract.dart'
    as _i91;
import '../../features/exams/api/exams_api_client/exams_api_client.dart'
    as _i598;
import '../../features/exams/data/data_sources/exams_data_source_impl.dart'
    as _i225;
import '../../features/exams/data/repository/exams_repo_impl.dart' as _i47;
import '../../features/exams/domain/repository/exams_repo_contract.dart'
    as _i286;
import '../../features/exams/domain/use_cases/get_exams_by_subject_use_case.dart'
    as _i952;
import '../../features/exams/presentation/view_model/bloc/exams_view_model.dart'
    as _i329;
import '../../features/examscreen/api/exam_api_client.dart' as _i315;
import '../../features/examscreen/data/datasources/exam_datasource.dart'
    as _i716;
import '../../features/examscreen/data/datasources/exam_remote_datasource.dart'
    as _i864;
import '../../features/examscreen/data/models/models.dart' as _i616;
import '../../features/examscreen/data/reprosatories/exam_repository_impl.dart'
    as _i512;
import '../../features/examscreen/domain/entities/exam_questions_entity.dart'
    as _i857;
import '../../features/examscreen/domain/reprosatories/exam_repository.dart'
    as _i117;
import '../../features/examscreen/domain/usecase/get_exam_questions.dart'
    as _i477;
import '../../features/examscreen/presentation/cubit/exam_cubit.dart' as _i538;
import '../../features/examscreen/presentation/widgets/answer_option_widget.dart'
    as _i962;
import '../../features/examscreen/presentation/widgets/exam_progress_widget.dart'
    as _i925;
import '../../features/examscreen/presentation/widgets/exam_timer_widget.dart'
    as _i914;
import '../../features/examscreen/presentation/widgets/time_out_dialog.dart'
    as _i173;
import '../../features/home/api/data_sources/home_remote_data_source_impl.dart'
    as _i1033;
import '../../features/home/api/home_api_client/home_api_client.dart' as _i866;
import '../../features/home/data/data_sources/home_remote_data_source_contract.dart'
    as _i582;
import '../../features/home/data/repository/home_repo_impl.dart' as _i1013;
import '../../features/home/domain/repository/home_repo_contract.dart' as _i968;
import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
import '../../features/home/presentation/view_model/bloc/home_view_model.dart'
    as _i48;
import '../../features/profile/api/api_client/profile_api_client.dart' as _i699;
import '../../features/profile/api/data_sources/profile_data_source_impl.dart'
    as _i921;
import '../../features/profile/data/data_sources/profile_remote_data_source_contract.dart'
    as _i427;
import '../../features/profile/data/repository/profile_repo_impl.dart' as _i265;
import '../../features/profile/domain/repository/profile_repo_contract.dart'
    as _i722;
import '../../features/profile/domain/use_cases/change_password_use_case.dart'
    as _i266;
import '../../features/profile/domain/use_cases/get_user_use_case.dart'
    as _i468;
import '../../features/profile/domain/use_cases/update_profile_use_case.dart'
    as _i186;
import '../../features/profile/presentation/view_model/change_password/change_password_view_model.dart'
    as _i967;
import '../../features/profile/presentation/view_model/profile/profile_view_model.dart'
    as _i597;
import '../api/dio_module.dart' as _i784;
import '../cashe/secure_storage.dart' as _i486;
import '../cashe/user_session.dart' as _i157;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final dioModule = _$DioModule();
    gh.singleton<_i157.UserSession>(() => _i157.UserSession());
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.factory<_i616.AnswerOptionModel>(() => _i616.AnswerOptionModel(
          id: gh<String>(),
          text: gh<String>(),
        ));
    gh.factory<_i925.ExamProgressWidget>(() => _i925.ExamProgressWidget(
          key: gh<_i409.Key>(),
          currentIndex: gh<int>(),
          totalQuestions: gh<int>(),
        ));
    gh.lazySingleton<_i486.SecureStorage>(
        () => _i486.SecureStorage(storage: gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i173.TimeOutDialog>(() => _i173.TimeOutDialog(
          key: gh<_i409.Key>(),
          onViewScore: gh<_i264.VoidCallback>(),
        ));
    gh.factory<_i962.AnswerOptionWidget>(() => _i962.AnswerOptionWidget(
          key: gh<_i409.Key>(),
          option: gh<_i857.AnswerOptionEntity>(),
          questionType: gh<_i857.QuestionType>(),
          isSelected: gh<bool>(),
          onTap: gh<_i264.VoidCallback>(),
        ));
    gh.factory<_i914.ExamTimerWidget>(() => _i914.ExamTimerWidget(
          key: gh<_i409.Key>(),
          remainingSeconds: gh<int>(),
          totalSeconds: gh<int>(),
        ));
    gh.lazySingleton<_i361.Dio>(
        () => appModule.provideDio(gh<_i157.UserSession>()));
    gh.lazySingleton<_i251.LoginApiClient>(
        () => dioModule.loginApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i877.SignupApiClient>(
        () => dioModule.signupApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i315.ExamApiClient>(
        () => dioModule.provideExamApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i478.ForgetPasswordApiClient>(
        () => _i478.ForgetPasswordApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i866.HomeApiClient>(
        () => _i866.HomeApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i699.ProfileApiClient>(
        () => _i699.ProfileApiClient(gh<_i361.Dio>()));
    gh.factory<_i598.ExamsApiClient>(
        () => _i598.ExamsApiClient(gh<_i361.Dio>()));
    gh.factory<_i582.HomeRemoteDatasourceContract>(
        () => _i1033.HomeRemoteDatasourceImpe(gh<_i866.HomeApiClient>()));
    gh.factory<_i968.HomeRepoContract>(
        () => _i1013.HomeRepoImple(gh<_i582.HomeRemoteDatasourceContract>()));
    gh.factory<_i15.LoginDataSourceContract>(() =>
        _i466.LoginDataSourceImpl(loginApiClient: gh<_i251.LoginApiClient>()));
    gh.factory<_i91.ExamsDataSourceContract>(
        () => _i225.ExamsDataSourceImpl(gh<_i598.ExamsApiClient>()));
    gh.factory<_i378.SignUpDataSourceContract>(
        () => _i997.SignUpDataSourceImpl(gh<_i877.SignupApiClient>()));
    gh.lazySingleton<_i716.ExamRemoteDataSource>(
        () => _i864.ExamRemoteDataSourceImpl(
              gh<_i315.ExamApiClient>(),
              gh<_i486.SecureStorage>(),
            ));
    gh.factory<_i236.ForgetPasswordRemoteDataSourceContract>(() =>
        _i1058.ForgetPasswordRemoteDatasourceImple(
            gh<_i478.ForgetPasswordApiClient>()));
    gh.factory<_i933.HomeUseCase>(
        () => _i933.HomeUseCase(gh<_i968.HomeRepoContract>()));
    gh.factory<_i286.ExamsRepoContract>(
        () => _i47.ExamsRepoImpl(gh<_i91.ExamsDataSourceContract>()));
    gh.factory<_i649.ForgetPasswordRepoContract>(() =>
        _i1026.ForgetPasswordRepoImple(
            gh<_i236.ForgetPasswordRemoteDataSourceContract>()));
    gh.factory<_i427.ProfileRemoteDataSource>(
        () => _i921.ProfileRemoteDataSourceImpl(gh<_i699.ProfileApiClient>()));
    gh.factory<_i48.HomeViewModel>(
        () => _i48.HomeViewModel(gh<_i933.HomeUseCase>()));
    gh.factory<_i106.SignUpRepoContract>(
        () => _i858.SignUpRepoImpl(gh<_i378.SignUpDataSourceContract>()));
    gh.factory<_i952.GetExamsBySubjectUseCase>(
        () => _i952.GetExamsBySubjectUseCase(gh<_i286.ExamsRepoContract>()));
    gh.factory<_i359.LoginRepoContract>(() => _i321.LoginRepoImpl(
          dataSource: gh<_i15.LoginDataSourceContract>(),
          secureStorage: gh<_i486.SecureStorage>(),
          userSession: gh<_i157.UserSession>(),
        ));
    gh.factory<_i329.ExamsViewModel>(
        () => _i329.ExamsViewModel(gh<_i952.GetExamsBySubjectUseCase>()));
    gh.factory<_i117.ExamRepository>(
        () => _i512.ExamRepositoryImpl(gh<_i716.ExamRemoteDataSource>()));
    gh.factory<_i913.ForgetPasswordUseCase>(() =>
        _i913.ForgetPasswordUseCase(gh<_i649.ForgetPasswordRepoContract>()));
    gh.factory<_i22.ResetPasswordUseCase>(() =>
        _i22.ResetPasswordUseCase(gh<_i649.ForgetPasswordRepoContract>()));
    gh.factory<_i195.VerifyResetPasswordUseCase>(() =>
        _i195.VerifyResetPasswordUseCase(
            gh<_i649.ForgetPasswordRepoContract>()));
    gh.factory<_i722.ProfileRepoContract>(
        () => _i265.ProfileRepoImpl(gh<_i427.ProfileRemoteDataSource>()));
    gh.factory<_i776.ForgetPasswordViewModel>(
        () => _i776.ForgetPasswordViewModel(
              gh<_i913.ForgetPasswordUseCase>(),
              gh<_i195.VerifyResetPasswordUseCase>(),
              gh<_i22.ResetPasswordUseCase>(),
            ));
    gh.factory<_i50.LoginUseCase>(
        () => _i50.LoginUseCase(gh<_i359.LoginRepoContract>()));
    gh.lazySingleton<_i477.GetExamQuestionsUseCase>(
        () => _i477.GetExamQuestionsUseCase(gh<_i117.ExamRepository>()));
    gh.factory<_i410.SignUpUseCase>(
        () => _i410.SignUpUseCase(gh<_i106.SignUpRepoContract>()));
    gh.factory<_i468.GetUserUseCase>(
        () => _i468.GetUserUseCase(gh<_i722.ProfileRepoContract>()));
    gh.factory<_i186.UpdateProfileUseCase>(
        () => _i186.UpdateProfileUseCase(gh<_i722.ProfileRepoContract>()));
    gh.factory<_i597.ProfileViewModel>(() => _i597.ProfileViewModel(
          gh<_i468.GetUserUseCase>(),
          gh<_i186.UpdateProfileUseCase>(),
        ));
    gh.factory<_i266.ChangePasswordUseCase>(
        () => _i266.ChangePasswordUseCase(gh<_i722.ProfileRepoContract>()));
    gh.factory<_i967.ChangePasswordViewModel>(
        () => _i967.ChangePasswordViewModel(gh<_i266.ChangePasswordUseCase>()));
    gh.factory<_i842.SignUpCubit>(
        () => _i842.SignUpCubit(gh<_i410.SignUpUseCase>()));
    gh.factory<_i947.LoginViewModel>(() => _i947.LoginViewModel(
          gh<_i50.LoginUseCase>(),
          gh<_i157.UserSession>(),
        ));
    gh.factory<_i538.ExamCubit>(
        () => _i538.ExamCubit(gh<_i477.GetExamQuestionsUseCase>()));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}

class _$DioModule extends _i784.DioModule {}
