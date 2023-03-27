import 'package:family_pro_health/views/shared/reading_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group("Reading item component test", () {
    testWidgets("check component render expected data", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ReadingItem(
              status: 'normal',
              type: 'Oxygen Saturation',
              unit: '%',
              value: '90',
            ),
          ),
        ),
      );
      // await tester.pump();

      expect(find.text('Oxygen Saturation'.toUpperCase()), findsOneWidget);
    });
  });
}
