import 'package:dio/dio.dart';
import 'package:exam_app/config/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'api/api_client.dart';

var getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<
      FlutterSecureStorage>(() => const FlutterSecureStorage());

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio: getIt()));

  getIt.registerLazySingleton<SecureStorage>(() =>
      SecureStorage(storage: getIt()));
}
