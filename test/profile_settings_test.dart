import 'package:family_pro_health/views/profile_setting/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Profile Settings Screen Test", () {
    testWidgets("Check the Options in Profile Settings screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: ProfileSetting())));
      await tester.pump();

      var editProfile = find.byType(ListTile);
      var image = find.byType(SvgPicture);

      expect(image, findsNWidgets(14));
      expect(editProfile, findsNWidgets(5));
    });
  });
}
