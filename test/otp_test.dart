import 'package:family_pro_health/helpers/helper.dart';
import 'package:family_pro_health/views/otp/otp.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/passcode_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'function_test_wrapper.dart';
import 'wrapper.dart';

void main() {
  group('OTP', () {
    testWidgetsIgnoringOverflow("visibility testing", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(const OTP()));

      expect(find.text("Hi, "), findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() == "Welcome to familyprohealth"),
          findsOneWidget);
      expect(find.byType(PasscodeField), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  "By clicking on submit, I agree to the Terms & Conditions"),
          findsOneWidget);
      expect(find.text("Exit"), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("empty OTP field test", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(const OTP()));

      await widgetTester.tap(find.byType(AppButton));
      await widgetTester.pump(const Duration(seconds: 1));

      Helper.instance.hideSoftKeyBoard();

      expect(find.text("Please enter a valid OTP"), findsOneWidget);
    });;

    testWidgetsIgnoringOverflow("OTP field short length test", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(const OTP()));

      final passcodeField =
          find.byType(PasscodeField).evaluate().first.widget as PasscodeField;
      passcodeField.controller.text = "123";

      await widgetTester.tap(find.byType(AppButton));
      await widgetTester.pump(const Duration(seconds: 1));

      Helper.instance.hideSoftKeyBoard();

      expect(find.text("Please enter a valid OTP"), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("OTP field success", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(const OTP()));

      final passcodeField =
          find.byType(PasscodeField).evaluate().first.widget as PasscodeField;
      passcodeField.controller.text = "1234";

      await widgetTester.tap(find.byType(AppButton));
      await widgetTester.pump(const Duration(seconds: 1));

      Helper.instance.hideSoftKeyBoard();

      expect(find.text("Please enter a valid OTP"), findsNothing);
    });
  });
}
