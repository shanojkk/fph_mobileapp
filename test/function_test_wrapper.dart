import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

testWidgetsIgnoringOverflow(
  String description,
  Future<void> Function(WidgetTester) callback, {
  bool? skip,
  Timeout? timeout,
  Duration? initialTimeout,
  bool semanticsEnabled = true,
  TestVariant<Object?> variant = const DefaultTestVariant(),
  dynamic tags,
}) {
  testWidgets(
    description,
    ((widgetTester) async {
      FlutterError.onError = ignoreOverflowErrors;
      callback(widgetTester);
    }),
    initialTimeout: initialTimeout,
    timeout: timeout,
    skip: skip,
    semanticsEnabled: semanticsEnabled,
    variant: variant,
    tags: tags,
  );
}

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}