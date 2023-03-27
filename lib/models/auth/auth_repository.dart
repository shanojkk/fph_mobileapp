import 'package:family_pro_health/models/auth/user.dart';
import 'package:family_pro_health/networking/api_interface.dart';

class AuthRepository {
  AuthRepository._();

  static AuthRepository? _instance;

  static AuthRepository get instance {
   return  _instance ??= AuthRepository._();
  }

  Future<User> fetchUser() async {
    return await ApiInterface().login("username", "password");
  }
}
