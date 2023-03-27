import 'package:family_pro_health/database/biometric_reading.dao.dart';
import 'package:family_pro_health/models/biometric/biometric_reading.dart';
import 'package:flutter/material.dart';

class BiometricViewModel extends ChangeNotifier {
  BiometricReading? _biometricReading;

  BiometricReading? get biometricReading => _biometricReading;

  void getLastReading(String userId, String biometricType) {
    print({userId, biometricReading});
    // BiometricReading biometricReading = BiometricReading(
    //     deviceTypeId: "10",
    //     ipAddress: "10.0.1.10",
    //     mac: "11:111:11:33",
    //     readOn: "2023-03-20 10:59:59",
    //     userId: "100");

    // biometricReading.measurements.add(BiometricMeasurement(
    //     adherence: "normal",
    //     adherenceRange: "65-75",
    //     name: "Oxygen Saturation",
    //     unit: "%",
    //     value: "200"));

    // biometricReading.measurements.add(BiometricMeasurement(
    //     adherence: "normal",
    //     adherenceRange: "65-75",
    //     name: "Pulse",
    //     unit: "BPM",
    //     value: "80"));

    // // set the relation
    // biometricReading.schedule.target = BiometricSchedule(
    //     mealInfo: "Before Breakfast", medicineInfo: "Medication", timeOfDay: "Morning");

    // BiometricReadingDao.instance.insertReading(biometricReading);

    _biometricReading = BiometricReadingDao.instance.getLastReading(
      userId,
      biometricType,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
