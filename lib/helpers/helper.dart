import 'package:flutter/services.dart';

class Helper {
  Helper._();

  static Helper? _helper;

  static Helper get instance {
   return  _helper ??= Helper._();
  }

  /// Method to hide keyboard
  void hideSoftKeyBoard() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }
}
