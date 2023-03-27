import 'dart:io';

import 'package:dio/dio.dart';
import 'package:family_pro_health/constants/env.dart';
import 'package:family_pro_health/networking/api_interface.dart';
import 'package:path_provider/path_provider.dart';

class Logger {
  Logger._();

  static Logger? _instance;

  static Logger get instance {
   return  _instance ??= Logger._();
  }

  /// Logs API errors
  void logAPIError(DioError error) {
    StringBuffer fileContent = StringBuffer();

    fileContent.write("START ==> ${DateTime.now().microsecondsSinceEpoch}\n");
    fileContent.write("ERROR TYPE:: API ERROR\n");
    fileContent.write("URI:: ${error.requestOptions.uri}\n");
    fileContent.write("METHOD:: ${error.requestOptions.method}\n");
    fileContent.write("REQUEST BODY:: ${error.requestOptions.data}\n");
    fileContent.write("HEADERS::  ${error.requestOptions.headers}\n");
    fileContent.write("ERROR:: ${error.response?.data}\n");
    fileContent.write("URI:: ${error.requestOptions.uri}\n");
    fileContent.write("END ==> ${DateTime.now().microsecondsSinceEpoch}\n\n");

    saveContentToFile(fileContent.toString());
  }

  void logError(String functionName, String error, LogLevel type) {
    if (type == LogLevel.info) {
      return;
    }
    String errorType = type.name;

    StringBuffer fileContent = StringBuffer();

    fileContent.write("START ==> ${DateTime.now().microsecondsSinceEpoch}\n");
    fileContent.write("ERROR TYPE:: $errorType\n");
    fileContent.write("METHOD NAME:: $functionName\n");
    fileContent.write("ERROR:: $error\n");
    fileContent.write("END ==> ${DateTime.now().microsecondsSinceEpoch}\n\n");

    saveContentToFile(fileContent.toString());
  }

   void logInfo(String functionName, String error, LogLevel type) {
    if (type == LogLevel.error) {
      return;
    }
    String errorType = type.name;

    StringBuffer fileContent = StringBuffer();

    fileContent.write("START ==> ${DateTime.now().microsecondsSinceEpoch}\n");
    fileContent.write("ERROR TYPE:: $errorType\n");
    fileContent.write("METHOD NAME:: $functionName\n");
    fileContent.write("ERROR:: $error\n");
    fileContent.write("END ==> ${DateTime.now().microsecondsSinceEpoch}\n\n");

    saveContentToFile(fileContent.toString());
  }

  void saveContentToFile(String fileContent) async {
    try {
      final dir = await Directory("${(await getExternalStorageDirectory())?.path}/Logs")
          .create(recursive: true);
      final savePath = "${dir.path}/logs.txt";
      final file = File(savePath);

      if (file.existsSync()) {
        final size = file.lengthSync();
        final mbSize = size / (1024 * 1024);
        if (mbSize >= 20) {
          // upload data to cloud and clean file
          uploadLogToServer(file).then((value) {
            if (value == true) {
              file.writeAsStringSync(
                fileContent,
                mode: FileMode.write,
              );
            } else {
              file.writeAsStringSync(
                fileContent,
                mode: FileMode.append,
              );
            }
          });
        } else {
          file.writeAsStringSync(
            fileContent,
            mode: FileMode.append,
          );
        }
      } else {
        // Creates a file and write content to it;
        file.writeAsStringSync(fileContent);
      }
    } catch (e) {
      // ignore
    } finally {
      // ignore
    }
  }

  Future<bool> uploadLogToServer(File logFile) async {
    try {
      await ApiInterface().uploadLogToServer(logFile);
      return true;
    } on DioError catch (e) {
      logError("uploadLogToServer", e.error.toString(), LogLevel.error);
    } catch (e) {
      logError("uploadLogToServer", e.toString(), LogLevel.error);
    }
    return false;
  }
}
