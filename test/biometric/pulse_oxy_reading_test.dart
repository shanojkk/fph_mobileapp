import 'package:family_pro_health/views/biometrics/pulse_oxy/pulse_oxy_reading.dart';
import 'package:family_pro_health/views/shared/reading_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../wrapper.dart';

void main() {
  group("Pulse oxy reading", () {
    testWidgets("visibility test", (widgetTester) async {
      await widgetTester.pumpWidget(wrapperWidget(PulseOxyReading()));

      expect(find.byType(ReadingItem), findsNWidgets(2));
    });
  });
}
