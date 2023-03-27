import 'package:family_pro_health/views/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group("error_page", () {
    testWidgets("expected route", (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: ErrorPage(routeName: "route name"),
      ));

      expect(find.text("404 Route Not Found"), findsOneWidget);

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  'Please check if you entry of route name in route_config'),
          findsOneWidget);
    });

    testWidgets("error route", (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: ErrorPage(routeName: "route_name"),
      ));

      expect(find.text("404 Route Not Found"), findsOneWidget);

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  'Please check if you entry of route name in route_config'),
          findsNothing);
    });
  });
}