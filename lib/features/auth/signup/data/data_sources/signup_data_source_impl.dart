import 'package:exam_app/config/api/web_service.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/api/base_response.dart';
import '../../domain/entities/signup_entity.dart';
import '../models/signup_request_model.dart';
import '../signup_data_source_contract.dart';

@Injectable(as: SignUpDataSourceContract)
class SignUpDataSourceImpl implements SignUpDataSourceContract {
  final WebService _webService;

  SignUpDataSourceImpl(this._webService);

  @override
  Future<BaseResponse> signUp(SignUpEntity entity) async {
    try {
      final model = SignUpRequestModel.fromEntity(entity);
      final response = await _webService.dio.post(
        '/auth/signup',
        data: model.toJson(),
      );
      return SuccessResponse(data: response.data);
    } catch (e) {
      return ErrorResponse(errorMessage: e.toString());
    }
  }
}// TODO Implement this library.