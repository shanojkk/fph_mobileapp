import 'package:family_pro_health/main.dart';
import 'package:family_pro_health/views/account_settings/account_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Account Settings Screen Test", () {
    testWidgets("Check the Options in Account Settings screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: const AccountSettings())));
      await tester.pumpAndSettle();
      await tester.pump();

      var profileSettingsOption = find.byKey(const Key("profile"));
      var manageScheduleOption = find.byKey(const Key("schedule"));
      var manageThresholdOption = find.byKey(const Key("threshold"));
      var customerServiceOption = find.byKey(const Key("customer"));
      var helpOption = find.byKey(const Key("help"));
      var logOutButton = find.byKey(const Key("logout-button"));
      var versionText = find.byKey(const Key("version"));

      expect(profileSettingsOption, findsOneWidget);
      expect(manageScheduleOption, findsOneWidget);
      expect(manageThresholdOption, findsOneWidget);
      expect(customerServiceOption, findsOneWidget);
      expect(helpOption, findsOneWidget);
      expect(logOutButton, findsOneWidget);
      expect(versionText, findsOneWidget);
    });
  });
}
