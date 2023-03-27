import 'dart:developer';

import 'package:family_pro_health/database/app_database.dart';
import 'package:family_pro_health/database/objectbox.g.dart';
import 'package:family_pro_health/models/biometric/biometric_reading.dart';

class BiometricReadingDao {
  BiometricReadingDao._();

  static BiometricReadingDao? _instance;

  static BiometricReadingDao get instance {
    return _instance ??= BiometricReadingDao._();
  }

  Box<BiometricReading> box = AppDatabase.instance.biometricReadingBox;

  BiometricReading? getLastReading(userId, biometricTypeId) {
    Query<BiometricReading?> query = box
        .query(BiometricReading_.userId.equals(userId) &
            BiometricReading_.deviceName.equals(biometricTypeId))
        .order(BiometricReading_.id, flags: Order.descending)
        .build();
    BiometricReading? data = query.findFirst();
    return data;
  }

  Future<int> insertReading(BiometricReading biometricReading) async {
    return box.put(biometricReading, mode: PutMode.insert);
  }

  bool delete(int userId) {
    return box.remove(userId);
  }
}


// [log] [BiometricReading{id: 1, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 1, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 2, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 2, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 3, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 4, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 3, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 5, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 6, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 4, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 7, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 8, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 5, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 9, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 10, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 6, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 11, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 12, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 7, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 13, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 14, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 8, userId: 100, readOn: 2023-03-20 10:59:59, mac: 11:111:11:33, ipAddress: 10.0.1.10, deviceTypeId: 10, deviceName: null, measurements: [BiometricMeasurement{id: 15, name: Oxygen Saturation, value: 200, unit: %, adherence: normal, adherenceRange: 65-75}, BiometricMeasurement{id: 16, name: Pulse, value: 80, unit: BPM, adherence: normal, adherenceRange: 65-75}], schedule: Instance of 'ToOne<BiometricSchedule>'}, BiometricReading{id: 9, userId: Developer, readOn: 2023-03-24T17:57:27.368644, mac: mac, ipAddress: null, deviceTypeId: 12:A2:00:2B:D6:32, deviceName: BPL iOxy, measurements: [BiometricMeasurement{id: 17, name: SpO2, value: 100, unit: %, adherence: null, adherenceRange: null}, BiometricMeasurement{id: 18, name: Pulse, value: 83, unit: BPM, adherence: null, adherenceRange: null}], schedule: Instance of 'ToOne<BiometricSchedule>'}]
