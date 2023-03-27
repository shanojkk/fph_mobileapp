import 'package:family_pro_health/database/app_database.dart';
import 'package:objectbox/objectbox.dart';

class GenericDao<T> {
  Box<T> get box {
    return AppDatabase.instance.getBox<T>();
  }

  int? insertOrUpdateData(T data) {
    return box.put(data);
  }

  List<int>? insertMany(List<T> data) {
    return box.putMany(data);
  }

  bool? deleteData(int id) {
    return box.remove(id);
  }

  int? deleteAll() {
    return box.removeAll();
  }
}
