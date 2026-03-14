// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
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
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i558.ApiClient>(() => _i558.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i236.ForgetPasswordRemoteDataSourceContract>(
      () => _i1058.ForgetPasswordRemoteDatasourceImple(gh<_i558.ApiClient>()),
    );
    gh.factory<_i649.ForgetPasswordRepoContract>(
      () => _i1026.ForgetPasswordRepoImple(
        gh<_i236.ForgetPasswordRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i913.ForgetPasswordUseCase>(
      () => _i913.ForgetPasswordUseCase(gh<_i649.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i776.ForgetPasswordViewModel>(
      () => _i776.ForgetPasswordViewModel(gh<_i913.ForgetPasswordUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
