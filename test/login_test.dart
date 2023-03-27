import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/views/login/login.dart';
import 'package:family_pro_health/views/shared/passcode_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return ".";
    });
    await Preferences.instance.initContainers();
  });

  group('Login', () {
    testWidgets("Visibility test", (widgetTester) async {
      await widgetTester.pumpWidget(
        wrapperWidget(Login()),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text(Strings.welcomeBack), findsOneWidget);
      expect(find.text(Strings.unlockWithPasscode), findsOneWidget);
      expect(find.byType(PasscodeField), findsOneWidget);
      expect(find.text(Strings.forgotPasscode), findsOneWidget);
      expect(find.text(Strings.exit), findsOneWidget);
    });

    testWidgets("error check", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(Login()));

      final finder = find.byType(PasscodeField).evaluate().single.widget as PasscodeField;
      finder.controller.text = "1235";

      await widgetTester.pump();

      expect(find.text("Invalid passcode, please try again !"), findsOneWidget);
    });

    testWidgets("success check", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(Login()));

      final finder = find.byType(PasscodeField).evaluate().single.widget as PasscodeField;
      finder.controller.text = "1234";

      await widgetTester.pump();

      expect(find.text("Invalid passcode, please try again !"), findsNothing);
    });
  });
}
