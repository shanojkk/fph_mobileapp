import 'package:family_pro_health/constants/env.dart';

class EndPoints {
  static get baseUrl {
    if (Env.prod) {
      return "prod_baseurl";
    } else {
      return "dev_baseurl";
    }
  }
}
