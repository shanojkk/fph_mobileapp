import 'package:family_pro_health/database/app_database.dart';
import 'package:family_pro_health/models/auth/user.dart';
import 'package:objectbox/objectbox.dart';

class UserDao {
  UserDao._();

  static UserDao? _instance;

  static UserDao get instance {
   return  _instance ??= UserDao._();
  }

  Box<User> box = AppDatabase.instance.userBox;

  int insertUser(User user) {
    return box.put(user, mode: PutMode.put);
  }

  int updateUser(User user) {
    return box.put(user, mode: PutMode.update);
  }

  List<int> insertMultipleUsers(List<User> users) {
    return box.putMany(users);
  }

  bool deleteUser(int userId) {
    return box.remove(userId);
  }
}
