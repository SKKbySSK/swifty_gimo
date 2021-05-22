import 'package:flutter/foundation.dart';
import 'package:swifty_gimo/logging/log.dart';

abstract class LogFilter {
  const LogFilter();

  bool shouldPrint(
    LogLevel level,
    Object message,
    String tag,
    Object? error,
    StackTrace? stackTrace,
  );
}

class DefaultLogFilter extends LogFilter {
  DefaultLogFilter();

  static final instance = DefaultLogFilter();

  bool printWhenReleaseMode = false;

  @override
  bool shouldPrint(
    LogLevel level,
    Object message,
    String tag,
    Object? error,
    StackTrace? stackTrace,
  ) {
    if (kReleaseMode) {
      return printWhenReleaseMode;
    }

    return true;
  }
}
