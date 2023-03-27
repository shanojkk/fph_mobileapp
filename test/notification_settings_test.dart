import "package:family_pro_health/views/notification_settings/notification_settings.dart";
import 'package:family_pro_health/views/shared/item_with_multiple_checkbox.dart';
import "package:family_pro_health/views/shared/app_button.dart";

import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "function_test_wrapper.dart";

void main() {
  group("Notifications", () {
    testWidgets("visibility testing ", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: NotificationSettings()));

      expect(find.text("Whatsapp"), findsOneWidget);
      expect(find.text("Email"), findsOneWidget);
      expect(find.text("Voice Instructions"), findsOneWidget);
      expect(find.text("Schedule Reminder"), findsOneWidget);
      expect(find.text("Exceeds Thresholds"), findsOneWidget);
      expect(find.text("Yes"), findsOneWidget);

      expect(find.byIcon(Icons.cloud_outlined), findsOneWidget);
      expect(find.byType(ItemWithMultipleCheckbox), findsNWidgets(3));
      expect(find.byType(AppButton), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("fields testing", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: NotificationSettings()));

      final save = find.byKey(const Key("save"));

      await tester.tap(save);
      // await tester.pumpAndSettle();
    });
  });
}
