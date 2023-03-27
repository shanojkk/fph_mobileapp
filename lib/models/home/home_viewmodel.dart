import 'package:family_pro_health/constants/strings.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  String _biometricType = Strings.bloodPressure;

  String get biometricType => _biometricType;
  String? currentImage;
  String? tagTitle;

  void navigateTo(type) {
    _biometricType = type;
    notifyListeners();
  }

  void updateImageAndTitle(String? image, String? title) {
    currentImage = image;
    tagTitle = title;
    notifyListeners();
  }
}
