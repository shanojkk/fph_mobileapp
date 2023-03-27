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
  final measurements = ToMany<BiometricMeasurement>();
  final schedule = ToOne<BiometricSchedule>();

  BiometricReading({
    this.userId,
    this.readOn,
    this.mac,
    this.ipAddress,
    this.deviceTypeId,
  });
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
  final biometricReadingMeasurement = ToOne<BiometricReading>();

  BiometricMeasurement({
    this.name,
    this.value,
    this.unit,
    this.adherence,
    this.adherenceRange,
  });
}

@Entity()
class BiometricSchedule {
  @Id()
  int id = 0;
  String? mealInfo;
  String? medicineInfo;
  String? timeOfDay;

  BiometricSchedule({
    this.mealInfo,
    this.medicineInfo,
    this.timeOfDay,
  });
}
