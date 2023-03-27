import "package:family_pro_health/views/edit_profile/edit_profile.dart";
import "package:family_pro_health/views/shared/app_button.dart";
import "package:family_pro_health/views/shared/app_text_form_field.dart";
import "package:family_pro_health/views/shared/gender_radio_buttons.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "function_test_wrapper.dart";

void main() {
  group("Edit Pofile", () {
    testWidgets("visibility testing ", (WidgetTester tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: EditProfile())));

      expect(find.byType(AppTextFormField), findsNWidgets(8));
      expect(find.text("Enter Name"), findsOneWidget);
      expect(find.text("Address"), findsOneWidget);
      expect(find.text("Enter Address"), findsOneWidget);
      expect(find.text("Locality"), findsOneWidget);
      expect(find.text("Enter Locality"), findsOneWidget);
      expect(find.text("Town/City"), findsOneWidget);
      expect(find.text("Enter City"), findsOneWidget);
      expect(find.text("Postal Code"), findsOneWidget);
      expect(find.text("Enter Postal Code"), findsOneWidget);
      expect(find.text("Mobile Number"), findsOneWidget);
      expect(find.text("Enter 10 digit Mobile Number"), findsOneWidget);
      expect(find.text("Email Address"), findsOneWidget);
      expect(find.text("Enter Email Address"), findsOneWidget);
      expect(find.text("Gender"), findsOneWidget);
      expect(find.text("Male"), findsOneWidget);
      expect(find.text("Female"), findsOneWidget);
      expect(find.text("Other"), findsOneWidget);
      expect(find.text("Date of Birth"), findsOneWidget);
      expect(find.text("Enter Date of Birth"), findsOneWidget);
      expect(find.text("Feet"), findsOneWidget);
      expect(find.text("Inches"), findsOneWidget);
      expect(find.text("SAVE"), findsOneWidget);
      // expect(find.text("Home"), findsOneWidget);
      // expect(find.text("View Schedule"), findsOneWidget);
      // expect(find.text("Report"), findsOneWidget);
      // expect(find.text("Account"), findsOneWidget);
      expect(find.byIcon(Icons.cloud_outlined), findsOneWidget);
      expect(find.byType(AppButton), findsOneWidget);
      expect(find.byType(GenderRadioButtons), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("fields testing", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: EditProfile()));

      final name = find.byKey(const Key("name"));
      final address = find.byKey(const Key("address"));
      final locality = find.byKey(const Key("locality"));
      final city = find.byKey(const Key("city"));
      final postalCode = find.byKey(const Key("postalCode"));
      final mobileNumber = find.byKey(const Key("mobileNumber"));
      // final height = find.byKey(const Key("height"));
      final emailAddress = find.byKey(const Key("emailAddress"));
      //final dateOfBirth = find.byKey(const Key("dateOfBirth"));
      // final mobile = find.byKey(const Key("mobileNumber"));
      final save = find.byKey(const Key("save"));

      await tester.enterText(name, 'Rahul gupta');
      await tester.enterText(address, 'Noida');
      await tester.enterText(locality, 'Gaur');
      await tester.enterText(city, 'abcd');
      await tester.enterText(postalCode, '201002');
      //  await tester.enterText(dateOfBirth, '01/06/2001');
      // await tester.enterText(height, '10');
      await tester.enterText(mobileNumber, '9999999999');
      await tester.enterText(emailAddress, 'Rahul@g.com');

      await tester.tap(save);
      // await tester.pumpAndSettle();

      expect(find.text('Rahul gupta'), findsOneWidget);
      expect(find.text('Noida'), findsOneWidget);
      expect(find.text('Gaur'), findsOneWidget);
      expect(find.text('abcd'), findsOneWidget);
      expect(find.text('201002'), findsOneWidget);
      // expect(find.text('01/06/2001'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
      expect(find.text('9999999999'), findsOneWidget);
      expect(find.text('Rahul@g.com'), findsOneWidget);
    });
  });
}
