import 'package:family_pro_health/database/objectbox.g.dart';
import 'package:family_pro_health/models/auth/user.dart';
import 'package:family_pro_health/models/biometric/biometric_reading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

/// Application database class that will be responsible to instantiate database
/// and to create [Boxes] that will be used to do database transactions
class AppDatabase {
  // AppDatabase._();

  static AppDatabase? _instance;

  static AppDatabase get instance {
    return _instance!;
  }

  late final Store store;
  late final Admin admin;
  late final Box<User> userBox;
  late final Box<BiometricReading> biometricReadingBox;

  /// Instantiate all the [boxes] here
  AppDatabase._create(this.store) {
    if (Admin.isAvailable()) {
      admin = Admin(store);
    }
    userBox = Box(store);
    biometricReadingBox = Box(store);
  }

  /// Get a [Box] object based on [T]
  Box<K> getBox<K extends Object?>() {
    return Box<K>(store);
  }

  /// Instantiating database
  static Future<bool> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, "app_database"));
    _instance = AppDatabase._create(store);
    if (_instance == null) {
      return false;
    }
    return true;
  }
}
