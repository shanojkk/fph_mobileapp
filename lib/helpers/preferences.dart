import 'package:get_storage/get_storage.dart';

class Preferences {
  Preferences._();

  static Preferences? _preferences;

  static Preferences get instance {
    return _preferences ??= Preferences._();
  }

  final GetStorage _customerPref = GetStorage("CustomerStorage");

  Future<void> initContainers() async {
    await GetStorage.init("CustomerStorage");
  }

  /// Keys
  String tokenKey = "token";
  String nameKey = "name";
  String passcodeKey = "passcode";
  String loginKey = "login";
  String firstTimeKey = "firstTime";

  /// Setters and getters for token (auth token)
  Future<void> setToken(String token) async {
    await _customerPref.write(tokenKey, token);
  }

  String getToken() {
    return _customerPref.read(tokenKey);
  }

  Future<void> setName(String name) async {
    await _customerPref.write(nameKey, name);
  }

  /// This default name [Developer] is for development purpose only
  /// later it will be removed
  String getName() {
    return _customerPref.read(nameKey) ?? "Developer";
  }

  Future<void> setPasscode(String passcode) async {
    await _customerPref.write(passcodeKey, passcode);
  }

  /// Default passcode is `1234` later it will be removed
  String getPasscode() {
    return _customerPref.read(passcodeKey) ?? "1234";
  }

  Future<void> setLogin(bool loggedIn) async {
    await _customerPref.write(loginKey, loggedIn);
  }

  /// Default state of login in false
  bool isLogin() {
    return _customerPref.read(loginKey) ?? false;
  }

  Future<void> setFirstTime(bool firstTime) async {
    await _customerPref.write(firstTimeKey, firstTime);
  }

  /// Default state of `firstTime` in `true`
  bool isFirstTime() {
    return _customerPref.read(firstTimeKey) ?? true;
  }

  void clearCustomerPref() async {
    await _customerPref.erase();
  }
}
