import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/api/base_response.dart';
import '../../api/signup_api_client/signup_api_client.dart';
import '../../domain/entities/signup_entity.dart';
import '../models/signup_request_model.dart';
import '../signup_data_source_contract.dart';

@Injectable(as: SignUpDataSourceContract)
class SignUpDataSourceImpl implements SignUpDataSourceContract {
  final SignupApiClient _signupApiClient;

  SignUpDataSourceImpl(this._signupApiClient);

  @override
  Future<BaseResponse> signUp(SignUpEntity entity) async {
    try {
      final model = SignUpRequestModel.fromEntity(entity);
      final data = await _signupApiClient.signup(model.toJson());
      return SuccessResponse(data: data);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['message']?.toString() ??
          e.response?.data?['error']?.toString() ??
          e.message ??
          'Signup failed';
      return ErrorResponse(errorMessage: errorMsg);
    } catch (e) {
      return ErrorResponse(errorMessage: e.toString());
    }
  }
}
