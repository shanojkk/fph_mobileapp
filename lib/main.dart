import 'package:family_pro_health/database/app_database.dart';
import 'package:family_pro_health/helpers/no_animation_page_route.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/models/auth/auth_viewmodel.dart';
import 'package:family_pro_health/viewmodels/biometric_reading_view_model.dart';
import 'package:family_pro_health/views/error_page.dart';
import 'package:family_pro_health/views/shared/connectivity_wrapper.dart';
import 'package:family_pro_health/models/biometric/biometric_view_model.dart';
import 'package:family_pro_health/models/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'database/objectbox.g.dart';

late Store objectBoxStore;
// late final Admin _admin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.instance.initContainers();
  await AppDatabase.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider.value(value: AuthViewModel()),
        ChangeNotifierProvider.value(value: ConnectivityViewModel()),
        ChangeNotifierProvider.value(value: HomeViewModel()),
        ChangeNotifierProvider.value(value: BiometricViewModel()),
        ChangeNotifierProvider.value(value: BiometricReadingViewModel()),
      ],
      child: MaterialApp(
        title: 'FamilyProHealth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteConfig.splash,
        onGenerateRoute: RouteConfig.routes,
        onUnknownRoute: (settings) => NoAnimationPageRoute(
          builder: (context) => ErrorPage(
            routeName: settings.name ?? "",
          ),
        ),
      ),
    );
  }
}
