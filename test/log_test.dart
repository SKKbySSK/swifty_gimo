import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swifty_gimo/swifty_gimo.dart';

void main() {
  test('log each level', () {
    final log = Log();
    log.d(
      'Debug Msg',
      tag: 'Debug',
    );
    log.i(
      'Info Msg',
      tag: 'Info',
    );
    log.w(
      'Warning Msg',
      tag: 'Warning',
    );
    log.e(
      'Error Msg',
      tag: 'Error',
    );
  });

  test('log exception with stack trace', () {
    final log = Log();
    log.e(
      'Error Test',
      tag: 'Error',
      error: Exception('Test exception message'),
      stackTrace: StackTrace.current,
    );
  });

  testWidgets('can retrieve log from Loggable widget', (tester) async {
    final childKey = UniqueKey();
    await tester.pumpWidget(
      Loggable(
        log: Log.shared,
        child: Container(
          key: childKey,
        ),
      ),
    );

    final container = tester.element(find.byKey(childKey));
    final log = Loggable.of(container, listen: false);
    expect(log, Log.shared);
  });
}
