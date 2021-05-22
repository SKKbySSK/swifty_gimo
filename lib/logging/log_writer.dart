import 'package:flutter/foundation.dart';
import 'package:swifty_gimo/logging/log.dart';

abstract class LogWriter {
  const LogWriter();

  void write(
    LogLevel level,
    String message,
    String tag,
    Object? error,
    StackTrace? stackTrace,
  );
}

class DefaultLogWriter extends LogWriter {
  DefaultLogWriter();

  static final instance = DefaultLogWriter();

  String defaultTag = 'Common';

  @override
  void write(
    LogLevel level,
    String message,
    String tag,
    Object? error,
    StackTrace? stackTrace,
  ) {
    String ansiColor = '';
    String prefix = 'd';
    switch (level) {
      case LogLevel.info:
        ansiColor = '\x1B[34m';
        prefix = 'i';
        break;
      case LogLevel.warning:
        ansiColor = '\x1B[33m';
        prefix = 'w';
        break;
      case LogLevel.error:
        ansiColor = '\x1B[31m';
        prefix = 'e';
        break;
      default:
    }

    final wTag = tag.isEmpty ? defaultTag : tag;
    print('$ansiColor[$prefix/$wTag] $message\x1B[0m');

    if (error != null) {
      print('$ansiColor---Error Description---\x1B[0m');
      print(error);
    }

    if (stackTrace != null) {
      print('$ansiColor------Stack Trace------\x1B[0m');
      print(stackTrace);
    }

    if (error != null || stackTrace != null) {
      print('$ansiColor-----------------------\x1B[0m');
    }
  }
}
