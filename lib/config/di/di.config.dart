// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
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
import '../../features/home/api/data_sources/explore_remote_data_source_impl.dart'
    as _i622;
import '../../features/home/api/explore_api_client/explore_api_client.dart'
    as _i71;
import '../../features/home/data/data_sources/explore_remote_data_source_contract.dart'
    as _i384;
import '../../features/home/data/repository/home_repo_impl.dart' as _i1013;
import '../../features/home/domain/repository/explore_repo_contract.dart'
    as _i1010;
import '../../features/home/domain/use_cases/explore_use_case.dart' as _i900;
import '../../features/home/presentation/view_model/bloc/home_view_model.dart'
    as _i48;
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
    gh.lazySingleton<_i486.SecureStorage>(
        () => _i486.SecureStorage(storage: gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i384.ExploreRemoteDatasourceContract>(
        () => _i622.ExploreRemoteDatasourceImpl(gh<InvalidType>()));
    gh.lazySingleton<_i361.Dio>(
        () => appModule.provideDio(gh<_i157.UserSession>()));
    gh.factory<_i1010.ExploreRepoContract>(() =>
        _i1013.ExploreRepoImpl(gh<_i384.ExploreRemoteDatasourceContract>()));
    gh.lazySingleton<_i251.LoginApiClient>(
        () => dioModule.loginApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i877.SignupApiClient>(
        () => dioModule.signupApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i478.ForgetPasswordApiClient>(
        () => _i478.ForgetPasswordApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i71.ExploreApiClient>(
        () => _i71.ExploreApiClient(gh<_i361.Dio>()));
    gh.factory<_i15.LoginDataSourceContract>(() =>
        _i466.LoginDataSourceImpl(loginApiClient: gh<_i251.LoginApiClient>()));
    gh.factory<_i378.SignUpDataSourceContract>(
        () => _i997.SignUpDataSourceImpl(gh<_i877.SignupApiClient>()));
    gh.factory<_i236.ForgetPasswordRemoteDataSourceContract>(() =>
        _i1058.ForgetPasswordRemoteDatasourceImple(
            gh<_i478.ForgetPasswordApiClient>()));
    gh.factory<_i900.ExploreUseCase>(
        () => _i900.ExploreUseCase(gh<_i1010.ExploreRepoContract>()));
    gh.factory<_i649.ForgetPasswordRepoContract>(() =>
        _i1026.ForgetPasswordRepoImple(
            gh<_i236.ForgetPasswordRemoteDataSourceContract>()));
    gh.factory<_i106.SignUpRepoContract>(
        () => _i858.SignUpRepoImpl(gh<_i378.SignUpDataSourceContract>()));
    gh.factory<_i359.LoginRepoContract>(() => _i321.LoginRepoImpl(
          dataSource: gh<_i15.LoginDataSourceContract>(),
          secureStorage: gh<_i486.SecureStorage>(),
          userSession: gh<_i157.UserSession>(),
        ));
    gh.factory<_i48.HomeViewModel>(
        () => _i48.HomeViewModel(gh<_i900.ExploreUseCase>()));
    gh.factory<_i913.ForgetPasswordUseCase>(() =>
        _i913.ForgetPasswordUseCase(gh<_i649.ForgetPasswordRepoContract>()));
    gh.factory<_i22.ResetPasswordUseCase>(() =>
        _i22.ResetPasswordUseCase(gh<_i649.ForgetPasswordRepoContract>()));
    gh.factory<_i195.VerifyResetPasswordUseCase>(() =>
        _i195.VerifyResetPasswordUseCase(
            gh<_i649.ForgetPasswordRepoContract>()));
    gh.factory<_i776.ForgetPasswordViewModel>(
        () => _i776.ForgetPasswordViewModel(
              gh<_i913.ForgetPasswordUseCase>(),
              gh<_i195.VerifyResetPasswordUseCase>(),
              gh<_i22.ResetPasswordUseCase>(),
            ));
    gh.factory<_i50.LoginUseCase>(
        () => _i50.LoginUseCase(gh<_i359.LoginRepoContract>()));
    gh.factory<_i410.SignUpUseCase>(
        () => _i410.SignUpUseCase(gh<_i106.SignUpRepoContract>()));
    gh.factory<_i842.SignUpCubit>(
        () => _i842.SignUpCubit(gh<_i410.SignUpUseCase>()));
    gh.factory<_i947.LoginViewModel>(() => _i947.LoginViewModel(
          gh<_i50.LoginUseCase>(),
          gh<_i157.UserSession>(),
        ));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}

class _$DioModule extends _i784.DioModule {}
