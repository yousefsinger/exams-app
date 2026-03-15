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

import '../../features/login/api/data_sources/login_data_source_impl.dart'
    as _i726;
import '../../features/login/api/login_api_client/login_api_client.dart'
    as _i315;
import '../../features/login/data/data_sources/login_data_source_contract.dart'
    as _i623;
import '../../features/login/data/repository/login_repo_impl.dart' as _i123;
import '../../features/login/domain/repository/login_repo_contract.dart'
    as _i368;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/view_model/bloc/login_view_model.dart'
    as _i1072;
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
    final appModule = _$AppModule();
    gh.singleton<_i157.UserSession>(() => _i157.UserSession());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i315.LoginApiClient>(() => appModule.loginApiClient);
    gh.factory<_i623.LoginDataSourceContract>(
      () =>
          _i726.LoginDataSourceImpl(loginApiClient: gh<_i315.LoginApiClient>()),
    );
    gh.lazySingleton<_i486.SecureStorage>(
      () => _i486.SecureStorage(storage: gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i368.LoginRepoContract>(
      () => _i123.LoginRepoImpl(
        dataSource: gh<_i623.LoginDataSourceContract>(),
        secureStorage: gh<_i486.SecureStorage>(),
        userSession: gh<_i157.UserSession>(),
      ),
    );
    gh.factory<_i191.LoginUseCase>(
      () => _i191.LoginUseCase(gh<_i368.LoginRepoContract>()),
    );
    gh.factory<_i1072.LoginViewModel>(
      () => _i1072.LoginViewModel(gh<_i191.LoginUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
