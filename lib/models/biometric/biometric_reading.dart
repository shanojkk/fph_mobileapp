import 'package:objectbox/objectbox.dart';

@Entity()
class BiometricReading {
  @Id()
  int id = 0;
  String? userId;
  String? readOn;
  String? mac;
  String? ipAddress;
  String? deviceTypeId;
  String? deviceName;
  final measurements = ToMany<BiometricMeasurement>();
  final schedule = ToOne<BiometricSchedule>();

  BiometricReading({
    this.userId,
    this.readOn,
    this.mac,
    this.ipAddress,
    this.deviceTypeId,
    this.deviceName,
  });

  @override
  String toString() {
    return 'BiometricReading{id: $id, userId: $userId, readOn: $readOn, mac: $mac, ipAddress: $ipAddress, deviceTypeId: $deviceTypeId, deviceName: $deviceName, measurements: $measurements, schedule: $schedule}';
  }
}

@Entity()
class BiometricMeasurement {
  @Id()
  int id = 0;
  String? name;
  String? value;
  String? unit;
  String? adherence;
  String? adherenceRange;
  // final biometricReadingMeasurement = ToOne<BiometricReading>();

  BiometricMeasurement({
    this.name,
    this.value,
    this.unit,
    this.adherence,
    this.adherenceRange,
  });

  @override
  String toString() {
    return 'BiometricMeasurement{id: $id, name: $name, value: $value, unit: $unit, adherence: $adherence, adherenceRange: $adherenceRange}';
  }
}

@Entity()
class BiometricSchedule {
  @Id()
  int id = 0;
  String? mealInfo;
  String? medicineInfo;
  String? timeOfDay;

  BiometricSchedule({this.mealInfo, this.medicineInfo, this.timeOfDay});

  @override
  String toString() {
    return 'BiometricSchedule{id: $id, mealInfo: $mealInfo, medicineInfo: $medicineInfo, timeOfDay: $timeOfDay}';
  }
}
