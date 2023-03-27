import 'package:family_pro_health/constants/enum.dart';
import 'package:family_pro_health/database/biometric_reading.dao.dart';
import 'package:family_pro_health/devices/pulse_oxy_device_reading.dart';
import 'package:family_pro_health/models/biometric/biometric_reading.dart';
import 'package:flutter/material.dart';

class BiometricReadingViewModel extends ChangeNotifier {
  BiometricReading? _biometricReading;

  BiometricReading? get biometricReading => _biometricReading;

  bool navigate = false;

  late PulseOxyDeviceReading pulseOxyDeviceReading;

  void init() {
    pulseOxyDeviceReading = PulseOxyDeviceReading(Devices.pulseOxy);

    pulseOxyDeviceReading.subscription?.stream.listen(_setData);
  }

  void _setData(BiometricReading data) {
    _biometricReading = data;
    BiometricReadingDao.instance.insertReading(data);
    navigate = true;
    notifyListeners();
  }
}
