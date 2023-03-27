class Validator {
  static String? mobileNumberValidator(String? value) {
    final regExp = RegExp(r"^[6-9][0-9]{9}$");
    if (regExp.hasMatch(value ?? "")) {
      return null;
    }
    return "Please enter a valid mobile number";
  }

  static String? emailIdValidator(String? value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (regex.hasMatch(value ?? "")) {
      return null;
    }
    return "Please enter a valid Email address";
  }

  static String? isRequired(String? value, String field) {
    if (value?.isEmpty == true) {
      return '$field is required';
    }
    return null;
  }
}
