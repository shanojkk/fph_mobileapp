import "package:family_pro_health/constants/strings.dart";
import "package:family_pro_health/views/shared/app_button.dart";
import "package:family_pro_health/views/shared/app_text_form_field.dart";
import "package:family_pro_health/views/welcome/welcome.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_test/flutter_test.dart";

import 'function_test_wrapper.dart';
import "wrapper.dart";

void main() {
  group("Welcome", () {
    testWidgetsIgnoringOverflow("visibility testing ", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const Welcome()));

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text("Hi, "), findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() == "Welcome to familyprohealth"),
          findsOneWidget);
      expect(find.text(Strings.verifyPhoneWelcomeText), findsOneWidget);
      expect(find.byType(DropdownButtonFormField<Map<String, String>>), findsOneWidget);

      expect(find.byType(TextFormField), findsOneWidget);

      expect(find.byType(AppButton), findsOneWidget);

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  "By clicking on submit, I agree to the Terms & Conditions"),
          findsOneWidget);

      expect(find.text("Exit"), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("empty text field test", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const Welcome()));

      await tester.enterText(find.byType(AppTextFormField), '');
      await tester.tap(find.byType(AppButton));

      await tester.pumpAndSettle();

      expect(find.text("Please enter a valid mobile number"), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("invalid mobile number test",
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const Welcome()));

      await tester.enterText(find.byType(AppTextFormField), '1234567890');
      await tester.tap(find.byType(AppButton));

      await tester.pumpAndSettle();

      expect(find.text("Please enter a valid mobile number"), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("valid mobile number test", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(const Welcome()));

      await tester.enterText(find.byType(AppTextFormField), '9876543210');
      await tester.tap(find.byType(AppButton));

      await tester.pumpAndSettle();

      expect(find.text("Please enter a valid mobile number"), findsNothing);
    });
  });
}
