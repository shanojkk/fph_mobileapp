import 'package:family_pro_health/helpers/no_animation_page_route.dart';
import 'package:family_pro_health/views/biometric_data_permission/biometric_data_permission.dart';
import 'package:family_pro_health/views/choose_passcode/choose_passcode.dart';
import 'package:family_pro_health/views/error_page.dart';
import 'package:family_pro_health/views/edit_profile/edit_profile.dart';
import 'package:family_pro_health/views/last_reading/last_reading.dart';
import 'package:family_pro_health/views/login/login.dart';
import 'package:family_pro_health/views/otp/otp.dart';
import 'package:family_pro_health/views/profile_setting/profile_setting.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:family_pro_health/views/notification_settings/notification_settings.dart';
import 'package:family_pro_health/views/splash/splash.dart';
import 'package:family_pro_health/views/take_reading/reading_instructions.dart';
import 'package:family_pro_health/views/take_reading/reading_success.dart';
import 'package:family_pro_health/views/take_reading/screen_reading_radio_button.dart';
import 'package:family_pro_health/views/welcome/welcome.dart';
import 'package:flutter/material.dart';

class RouteConfig {
  /// Routes
  static const splash = "/splash";
  static const login = "/login";
  static const welcome = "/welcome";
  static const choosePasscode = "/choosePasscode";
  static const forgotPin = "/forgotPin";
  static const home = "/home";
  static const lastReading = "/lastReading";
  static const history = "/history";
  static const otp = "/otp";
  static const profileSettings = "/profileSettings";
  static const accountSettings = "/accountSettings";
  static const manageSchedule = "/manageSchedule";
  static const manageThreshold = "/manageThreshold";
  static const editProfile = "/editProfile";
  static const notificationSettings = "/notificationSettings";
  static const termOfUse = "/termOfUse";
  static const dataPrivacyPolicy = "/dataPrivacyPolicy";
  static const biometricDataPermission = "/biometricDataPermission";
  static const customerService = "/customerService";
  static const helpFaqs = "/helpFaqs";
  static const reading = '/reading';
  static const readingWithSelection = '/readingWithSelection';
  static const readingSuccess = '/readingSuccess';

  /// Getter to get all the routes in the application
  /// default route of the application is "/" defined in main.dart
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case reading:
        return NoAnimationPageRoute(
          builder: (context) {
            final data = settings.arguments as Map?;

            return ReadingInstructions(
              image: data?['image'],
            );
          },
        );
      case readingWithSelection:
        return NoAnimationPageRoute(
          builder: (context) {
            final data = settings.arguments as Map?;
            return ScreenReadingWithSelection(
              image: data?['image'],
              tagTitle: data?['tagTitle'],
            );
          },
        );
      case splash:
        return NoAnimationPageRoute(builder: (context) => const Splash());
      case login:
        return NoAnimationPageRoute(builder: (context) => const Login());
      case welcome:
        return NoAnimationPageRoute(builder: (context) => const Welcome());
      case otp:
        return NoAnimationPageRoute(builder: (context) => const OTP());
      case choosePasscode:
        return NoAnimationPageRoute(builder: (context) => const ChoosePasscode());
      case home:
        return NoAnimationPageRoute(builder: (context) => const PageStructure());
      case profileSettings:
        return NoAnimationPageRoute(
          builder: (context) => const ProfileSetting(),
        );
      case editProfile:
        return NoAnimationPageRoute(builder: (context) => const EditProfile());
      case notificationSettings:
        return NoAnimationPageRoute(builder: (context) => const NotificationSettings());
      case biometricDataPermission:
        return NoAnimationPageRoute(
          builder: (context) => const BiometricDataPermission(),
        );
      case lastReading:
        return NoAnimationPageRoute(
          builder: (context) => const LastReading(),
        );
      case readingSuccess:
        return NoAnimationPageRoute(builder: (context) {
          return ReadingSuccess();
        });
      default:

        /// If the name not found of invalid name is entered then it will redirect to this route
        /// i.e 404 route
        return NoAnimationPageRoute(
          builder: (contxt) => ErrorPage(
            routeName: settings.name ?? "",
          ),
        );
    }
  }
}
