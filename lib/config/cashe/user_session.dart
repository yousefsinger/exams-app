import 'package:injectable/injectable.dart';

import '../../features/login/domain/model/user.dart';

@singleton
class UserSession {
  String? token;

  User? currentUser;

  bool get isLoggedIn => token != null;

  void clearSession() {
    token = null;
    currentUser = null;
  }
}