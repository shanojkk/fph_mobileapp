import 'dart:io';

import 'package:dio/dio.dart';
import 'package:family_pro_health/models/auth/user.dart';
import 'package:family_pro_health/models/base_response.dart';
import 'package:family_pro_health/networking/dio_client.dart';
import 'package:family_pro_health/networking/endpoints.dart';
import 'package:retrofit/http.dart';

part 'api_interface.g.dart';

@RestApi(baseUrl: "")
abstract class ApiInterface {
  factory ApiInterface({String? baseUrl}) {
    final dio = DioClient.instance.initConfig();
    return _ApiInterface(dio, baseUrl: baseUrl ?? EndPoints.baseUrl);
  }

  /// These are only placeholders methods to show how
  /// API's will be written here (these methods are for reference)
  @POST("/login")
  Future<User> login(String username, String password);

  @MultiPart()
  @POST("/upload-log")
  Future<BaseResponse> uploadLogToServer(File logFile);
}
