import 'package:family_pro_health/helpers/no_animation_page_route.dart';
import 'package:family_pro_health/models/auth/auth_viewmodel.dart';
import 'package:family_pro_health/models/biometric/biometric_view_model.dart';
import 'package:family_pro_health/views/error_page.dart';
import 'package:family_pro_health/views/shared/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget wrapperWidget(Widget child) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AuthViewModel()),
      ChangeNotifierProvider.value(value: ConnectivityViewModel()),
      ChangeNotifierProvider.value(value: BiometricViewModel()),
    ],
    child: MaterialApp(
      home: child,
      onUnknownRoute: (settings) => NoAnimationPageRoute(
        builder: (context) => ErrorPage(
          routeName: settings.name ?? "",
        ),
      ),
    ),
  );
}
