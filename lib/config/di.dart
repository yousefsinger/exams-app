import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_client.dart';

var getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio: getIt()));
}
