import "package:family_pro_health/constants/strings.dart";
import "package:family_pro_health/helpers/helper.dart";
import "package:family_pro_health/views/choose_passcode/choose_passcode.dart";
import "package:family_pro_health/views/shared/app_button.dart";
import "package:family_pro_health/views/shared/passcode_field.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_test/flutter_test.dart";
import 'package:family_pro_health/helpers/preferences.dart';

import 'function_test_wrapper.dart';
import "wrapper.dart";

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return ".";
    });
    await Preferences.instance.initContainers();
  });

  group("Choose Passcode", () {
    testWidgetsIgnoringOverflow("visibility testing", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const ChoosePasscode()));

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text("Hi,"), findsOneWidget);
      expect(find.text("Your phone number was successfully verified!"), findsOneWidget);
      expect(find.text("Choose Passcode"), findsOneWidget);
      expect(find.byType(PasscodeField), findsNWidgets(2));
      expect(find.text("Confirm Passcode"), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
      expect(find.text("Exit"), findsOneWidget);
    });

    testWidgets("empty passcode test", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const ChoosePasscode()));

      await tester.dragUntilVisible(
        find.byType(AppButton),
        find.byType(Container),
        const Offset(0, 10),
      );

      Helper.instance.hideSoftKeyBoard();

      await tester.tap(find.byType(AppButton), warnIfMissed: false);
      await tester.pump(const Duration(seconds: 1));
      expect(
        find.text("Passcode cannot be empty. Please enter 4 digit passcode"),
        findsOneWidget,
      );
    });

    testWidgets("passcode short length test", (tester) async {
      await tester.pumpWidget(wrapperWidget(const ChoosePasscode()));
      final finder = find.byType(PasscodeField).evaluate().first.widget as PasscodeField;
      finder.controller.text = "123";

      await tester.dragUntilVisible(
        find.byType(AppButton),
        find.byType(Container),
        const Offset(0, 10),
      );

      Helper.instance.hideSoftKeyBoard();

      await tester.tap(find.byType(AppButton), warnIfMissed: false);
      await tester.pump(const Duration(seconds: 1));

      expect(
        find.text("Please enter a valid 4 digit passcode"),
        findsOneWidget,
      );
    });

    testWidgets("passcode mismatch test", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const ChoosePasscode()));

      // This will be choose passcode field
      final finder = find.byType(PasscodeField).evaluate().first.widget as PasscodeField;
      finder.controller.text = "1234";

      final finder2 = find.byType(PasscodeField).evaluate().last.widget as PasscodeField;
      finder2.controller.text = "1235";

      await tester.dragUntilVisible(
        find.byType(AppButton),
        find.byType(Container),
        const Offset(0, 10),
      );

      Helper.instance.hideSoftKeyBoard();

      await tester.tap(find.byType(AppButton), warnIfMissed: false);
      await tester.pump(const Duration(seconds: 1));
      expect(
        find.text(Strings.passcodeMismatch),
        findsOneWidget,
      );
    });

    testWidgets("passcode match test", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const ChoosePasscode()));

      // This will be choose passcode field
      final finder = find.byType(PasscodeField).evaluate().first.widget as PasscodeField;
      finder.controller.text = "1234";

      final finder2 = find.byType(PasscodeField).evaluate().last.widget as PasscodeField;
      finder2.controller.text = "1234";

      await tester.dragUntilVisible(
        find.byType(AppButton),
        find.byType(Container),
        const Offset(0, 10),
      );

      Helper.instance.hideSoftKeyBoard();

      await tester.tap(find.byType(AppButton), warnIfMissed: false);
      await tester.pump(const Duration(seconds: 1));
      expect(
        find.text(Strings.passcodeMismatch),
        findsNothing,
      );
    });
  });
}
