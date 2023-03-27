import "package:family_pro_health/views/splash/splash.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_test/flutter_test.dart";

import "function_test_wrapper.dart";
void main() {
  testWidgetsIgnoringOverflow("splash", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Splash())));

    expect(find.text("Welcome to"), findsOneWidget);

    expect(find.byType(SvgPicture), findsNWidgets(2));
  });
}
