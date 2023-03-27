import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:family_pro_health/helpers/logger.dart';

class DioClient {
  DioClient._();

  Dio? dio;

  static DioClient? _instance;

  static DioClient get instance {
    return _instance ??= DioClient._();
  }

  Dio initConfig({bool consoleLog = true}) {
    dio ??= Dio();

    assert(dio != null);

    if (consoleLog) {
      dio!.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) => log(object.toString()),
      ));
    }

    dio!.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        // logging error and saving it to file
        Logger.instance.logAPIError(e);
      },
    ));

    return dio!;
  }
}
