import '../../../../config/api/base_response.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/repository/signup_repo_contract.dart';
import '../signup_data_source_contract.dart';

class SignUpRepoImpl implements SignUpRepoContract {
  final SignUpDataSourceContract _dataSource;

  SignUpRepoImpl(this._dataSource);

  @override
  Future<BaseResponse> signUp(SignUpEntity entity) {
    return _dataSource.signUp(entity);
  }
}
