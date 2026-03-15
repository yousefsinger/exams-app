import '../../api/responses/login_response.dart';

abstract class LoginDataSourceContract {
  Future<LoginResponse> login(String email, String password);
}