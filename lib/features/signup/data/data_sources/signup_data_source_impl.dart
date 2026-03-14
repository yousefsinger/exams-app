import 'package:exam_app/config/api/api_client.dart';
import 'package:exam_app/config/api/base_states.dart';
import '../../domain/entities/signup_entity.dart';
import '../models/signup_request_model.dart';
import '../signup_data_source_contract.dart';


class SignUpDataSourceImpl implements SignUpDataSourceContract {
  final ApiClient _apiClient;

  SignUpDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse> signUp(SignUpEntity entity) async {
    try {
      final model = SignUpRequestModel.fromEntity(entity);
      final response = await _apiClient.dio.post(
        'https://exam.elevateegy.com/api/v1/auth/signup',
        data: model.toJson(),
      );
      return SuccessBaseResponse(data: response.data);
    } catch (e) {
      return ErrorBaseResponse(errorMsg: e.toString());
    }
  }
}// TODO Implement this library.