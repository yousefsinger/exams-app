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

import '../../features/auth/forget_password/api/api_client/api_client.dart'
    as _i558;
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
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final appModule = _$AppModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i157.UserSession>(() => _i157.UserSession());
    gh.lazySingleton<_i251.LoginApiClient>(() => dioModule.loginApiClient);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i558.ApiClient>(() => _i558.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i486.SecureStorage>(
      () => _i486.SecureStorage(storage: gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i15.LoginDataSourceContract>(
      () =>
          _i466.LoginDataSourceImpl(loginApiClient: gh<_i251.LoginApiClient>()),
    );
    gh.factory<_i236.ForgetPasswordRemoteDataSourceContract>(
      () => _i1058.ForgetPasswordRemoteDatasourceImple(gh<_i558.ApiClient>()),
    );
    gh.factory<_i649.ForgetPasswordRepoContract>(
      () => _i1026.ForgetPasswordRepoImple(
        gh<_i236.ForgetPasswordRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i359.LoginRepoContract>(
      () => _i321.LoginRepoImpl(
        dataSource: gh<_i15.LoginDataSourceContract>(),
        secureStorage: gh<_i486.SecureStorage>(),
        userSession: gh<_i157.UserSession>(),
      ),
    );
    gh.factory<_i913.ForgetPasswordUseCase>(
      () => _i913.ForgetPasswordUseCase(gh<_i649.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i50.LoginUseCase>(
      () => _i50.LoginUseCase(gh<_i359.LoginRepoContract>()),
    );
    gh.factory<_i776.ForgetPasswordViewModel>(
      () => _i776.ForgetPasswordViewModel(gh<_i913.ForgetPasswordUseCase>()),
    );
    gh.factory<_i947.LoginViewModel>(
      () => _i947.LoginViewModel(gh<_i50.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}

class _$AppModule extends _i460.AppModule {}
