import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/views/home/home.dart';
import 'package:family_pro_health/views/shared/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return ".";
    });
    await Preferences.instance.initContainers();
  });

  group("Home", () {
    testWidgets("visibility testing", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(const Home()));

      expect(find.byType(CommonAppBar), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(2));

      expect(find.byType(SvgPicture), findsNWidgets(8));

      expect(find.text("Home"), findsOneWidget);
      expect(find.text("Report"), findsOneWidget);
    });

    testWidgets("bottom nav test", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(const Home()));

      await widgetTester.tap(find.text("View Schedule"));
      await widgetTester.pump(const Duration(seconds: 1));

      expect(find.text("View Schedule"), findsAtLeastNWidgets(2));

      await widgetTester.tap(find.text("Profile"));
      await widgetTester.pump(const Duration(seconds: 1));

      expect(find.text("Account Settings"), findsOneWidget);
    });
  });
}
