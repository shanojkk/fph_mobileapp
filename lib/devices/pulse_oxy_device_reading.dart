import 'dart:async';

import 'package:family_pro_health/constants/enum.dart';
import 'package:family_pro_health/devices/device_reading_base.dart';
import 'package:family_pro_health/helpers/extension.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/models/biometric/biometric_reading.dart';
import 'package:flutter_blue/flutter_blue.dart';

class PulseOxyDeviceReading extends DeviceReadingBase {
  StreamController<BiometricReading>? subscription;

  PulseOxyDeviceReading(Devices deviceName) {
    this.deviceName = deviceName;
    subscription = StreamController.broadcast();
    listener = _listener;
    init();
  }

  /// Checks if the device is not connected the connect to it and register the listeners for the data
  void _listener(BluetoothDeviceState state) async {
    if (BluetoothDeviceState.connected == state) {
      final services = await bluetoothDevice?.discoverServices();
      for (var service in (services
              ?.where((element) => element.uuid == deviceGuids[deviceName.getName]) ??
          <BluetoothService>[])) {
        if (service.characteristics.isNotEmpty) {
          final characteristcis = service.characteristics.firstWhere(
            (element) => element.uuid == Guid("cdeacb81-5235-4c07-8846-93a37ee6b86d"),
          );

          /// Setting the notify property to be true so that we can get the data that is emitted by the device
          await characteristcis.setNotifyValue(true);

          int cnt = 0;

          /// Listening for the data that is emitted by the device
          characteristcis.value.listen((value) async {
            if (value.isNotEmpty) {
              if (value[0] == 129) {
                final readingData = BiometricReading();
                readingData.deviceName = deviceName.getName;
                readingData.deviceTypeId = bluetoothDevice?.id.id;
                readingData.mac = "mac";
                readingData.readOn = DateTime.now().toIso8601String();
                readingData.userId = Preferences.instance.getName();

                var measurement = BiometricMeasurement();
                measurement.name = "SpO2";
                measurement.unit = "%";
                measurement.value = "${value[2]}";

                readingData.measurements.add(measurement);

                measurement = BiometricMeasurement();
                measurement.name = "Pulse";
                measurement.unit = "BPM";
                measurement.value = "${value[1]}";

                readingData.measurements.add(measurement);

                if (cnt == 3) {
                  subscription?.sink.add(readingData);
                  await characteristcis.setNotifyValue(false);
                  await bluetoothDevice?.disconnect();
                  await subscription?.close();
                }

                cnt++;
              }
            }
          });
        }
      }
    } else if (BluetoothDeviceState.connected != state) {
      bluetoothDevice?.connect();
      FlutterBlue.instance.stopScan();
    }
  }
}
