import 'package:family_pro_health/constants/enum.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:family_pro_health/helpers/extension.dart';

abstract class DeviceReadingBase {
  BluetoothDevice? bluetoothDevice;

  late Devices deviceName;
  late Function(BluetoothDeviceState) listener;

  final deviceGuids = {
    "BPL iOxy": Guid("cdeacb80-5235-4c07-8846-93a37ee6b86d"),
  };

  /// Register device connected lister and scan listeners to scan for new devices
  Future<void> init() async {
    await checkIfDeviceIsAlreadyConnected();
    FlutterBlue.instance.isScanning.listen((value) {
      if (!value) {
        attachListener();
      }
    });
  }

  /// Check if the device is already connected then start listening for the readings
  Future<void> checkIfDeviceIsAlreadyConnected() async {
    final devices = await FlutterBlue.instance.connectedDevices;
    for (var device in devices) {
      if (device.name == deviceName.getName) {
        bluetoothDevice = device;
        bluetoothDevice?.state.listen(listener);
      }
    }
  }

  /// If the device is not already connected then scan for the devices
  Future<void> attachListener() async {
    if (bluetoothDevice == null) {
      FlutterBlue.instance.scan(
        withServices: [deviceGuids[deviceName.getName]!],
        allowDuplicates: false,
        timeout: const Duration(seconds: 4),
      ).listen((result) {
        bluetoothDevice = result.device;

        bluetoothDevice?.state.listen(listener);
      });
    }
  }
}
