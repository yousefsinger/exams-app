import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../../../../config/cashe/secure_storage.dart';
import '../../../../../config/cashe/user_session.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/login_repo_contract.dart';
import '../data_sources/login_data_source_contract.dart';
import '../model/user_dto.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginDataSourceContract dataSource;
  final SecureStorage secureStorage;
  final UserSession userSession;

  LoginRepoImpl({
    required this.dataSource,
    required this.secureStorage,
    required this.userSession,
  });

  @override
  Future<BaseResponse<User>> login(String email, String password,
      bool isRememberMe) async {
    try {
      final response = await dataSource.login(email, password);

      if (response.token != null) {
        userSession.token = response.token!;

        if (isRememberMe) {
          await secureStorage.saveToken(response.token!);
        }
      }

      if (response.user != null) {
        final userDtoWithToken = UserDto(
          id: response.user!.id,
          username: response.user!.username,
          email: response.user!.email,
          firstName: response.user!.firstName,
          lastName: response.user!.lastName,
          token: response.token,
        );

        return SuccessResponse(data: userDtoWithToken.toDomain());
      } else {
        return ErrorResponse(
            errorMessage: response.message ?? "something went wrong");
      }
    } on DioException catch (e) {
      return ErrorResponse(errorMessage: e.response?.data['message'] ?? "Error");
    } catch (e) {
      return ErrorResponse(errorMessage: e.toString());
    }
  }
}