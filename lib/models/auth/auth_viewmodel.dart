import 'package:dio/dio.dart';
import 'package:family_pro_health/constants/env.dart';
import 'package:family_pro_health/database/generic_dao.dart';
import 'package:family_pro_health/helpers/logger.dart';
import 'package:family_pro_health/models/auth/auth_repository.dart';
import 'package:family_pro_health/models/auth/user.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  User? user;
  bool loading = true, hasError = false;
  String? error;

  late GenericDao<User> userDao;

  void init() {
    userDao = GenericDao();
  }

  Future<void> fetchUser() async {
    loading = true;
    hasError = false;
    notifyListeners();
    try {
      user = await AuthRepository.instance.fetchUser();

      if (user != null) {
        userDao.insertOrUpdateData(user!);
      }
    } on DioError catch (e) {
      hasError = true;
      error = e.message;
      Logger.instance.logAPIError(e);
    } catch (e) {
      hasError = true;
      error = e.toString();
      Logger.instance.logError("fetchUser", e.toString(), LogLevel.error);
    }

    loading = false;
    notifyListeners();
  }
}
