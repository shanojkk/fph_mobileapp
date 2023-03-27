import "package:family_pro_health/views/biometric_data_permission/biometric_data_permission.dart";
import "package:family_pro_health/views/shared/app_button.dart";
import "package:family_pro_health/views/shared/item_with_multiple_checkbox.dart";

import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "function_test_wrapper.dart";
import "wrapper.dart";

void main() {
  group("Biometric Data Permission", () {
    testWidgets("visibility testing ", (WidgetTester tester) async {
      await tester.pumpWidget(wrapperWidget(BiometricDataPermission()));

      expect(find.text("Yes"), findsOneWidget);

      expect(find.byType(ItemWithMultipleCheckbox), findsNWidgets(3));
      expect(find.byType(AppButton), findsOneWidget);
    });

    testWidgetsIgnoringOverflow("fields testing", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BiometricDataPermission()));

      final save = find.byKey(const Key("save"));

      await tester.tap(save);
      // await tester.pumpAndSettle();
    });
  });
}
