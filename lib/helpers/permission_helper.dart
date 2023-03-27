import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  PermissionHelper._();

  static PermissionHelper? _instance;

  static PermissionHelper get instance {
    return _instance ?? PermissionHelper._();
  }

  Future<bool> requestRequiredPermissions() async {
    final status = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();

    var granted = true;
    status.forEach((key, value) {
      if (value != PermissionStatus.granted) {
        granted = false;
      }
    });
    return granted;
  }
}
