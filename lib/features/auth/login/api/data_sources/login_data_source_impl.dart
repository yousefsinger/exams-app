import 'package:injectable/injectable.dart';

import '../../data/data_sources/login_data_source_contract.dart';
import '../login_api_client/login_api_client.dart';
import '../responses/login_response.dart';

@Injectable(as: LoginDataSourceContract)
class LoginDataSourceImpl implements LoginDataSourceContract {
  final LoginApiClient loginApiClient;

  LoginDataSourceImpl({required this.loginApiClient});

  @override
  Future<LoginResponse> login(String email, String password) async {
    return await loginApiClient.login({"email": email, "password": password});
  }
}
