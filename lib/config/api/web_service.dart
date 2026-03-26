import 'package:dio/dio.dart';
import 'package:exam_app/core/values/strings.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class WebService {
  final Dio dio;

  WebService({required this.dio}) {
    dio.options.baseUrl = baseurl;
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);
  }
}
