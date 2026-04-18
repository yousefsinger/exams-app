import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../../core/values/api_constants.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl,));
}